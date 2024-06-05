provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    lambda = "http://localhost:4566"
    iam    = "http://localhost:4566"
    s3     = "http://s3.localhost.localstack.cloud:4566"
  }
}

resource "aws_s3_bucket" "input-bucket" {
  bucket = "input-bucket"
}

resource "aws_s3_bucket" "output-bucket" {
  bucket = "output-bucket"
}

resource "aws_s3_bucket_lifecycle_configuration" "wipe-input" {
  bucket = aws_s3_bucket.input-bucket.id

  rule {
    id = "3d-wipe"

    expiration {
      days = 3
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "wipe-output" {
  bucket = aws_s3_bucket.output-bucket.id

  rule {
    id = "30d-wipe"

    expiration {
      days = 30
    }

    status = "Enabled"
  }
}

data "aws_iam_policy_document" "assume-role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda-iam" {
  name               = "lambda-iam"
  assume_role_policy = data.aws_iam_policy_document.assume-role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir = "${path.module}/lambda/"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = "${path.module}/lambda.zip"
  function_name = "lambda_func"
  role          = aws_iam_role.lambda-iam.arn
  handler       = "main.lambda_handler"
  runtime       = "python3.12"
}