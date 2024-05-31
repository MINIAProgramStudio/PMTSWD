provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "input-bucket" {
  bucket = "input-bucket"
}

resource "aws_s3_bucket" "output-bucket" {
  bucket = "output-bucket"
}