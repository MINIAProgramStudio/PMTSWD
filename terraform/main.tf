provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
        lambda     = "http://localhost:4566"
        iam        = "http://localhost:4566"
        s3         = "http://s3.localhost.localstack.cloud:4566"
    }
}

resource "aws_s3_bucket" "input-bucket" {
  bucket = "input-bucket"
}

resource "aws_s3_bucket" "output-bucket" {
  bucket = "output-bucket"
}

resource "aws_s3_bucket_lifecycle_configuration" "wipe_input" {
  bucket = aws_s3_bucket.input-bucket.id

  rule {
    id = "3d-wipe"

    expiration {
        days = 3
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "wipe_output" {
  bucket = aws_s3_bucket.input-bucket.id

  rule {
    id = "30d--wipe"

    expiration {
        days = 30
    }

    status = "Enabled"
  }
}