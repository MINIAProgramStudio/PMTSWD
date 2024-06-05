import boto3

INPUT_BUCKET_NAME = "input-bucket"
OUTPUT_BUCKET_NAME = "output-bucket"

def lambda_handler(event, context):
    aws_s3 = boto3.resource("s3")

    input_bucket = aws_s3.Bucket(INPUT_BUCKET_NAME)

    for object in input_bucket.objects:
        source = {
            "Bucket": INPUT_BUCKET_NAME,
            "Key": object.key
        }

        aws_s3.meta.client.copy(source, OUTPUT_BUCKET_NAME, object.key)