import boto3

INPUT_BUCKET_NAME = "input-bucket"
OUTPUT_BUCKET_NAME = "output-bucket"


def lambda_handler(event, context):
    aws_s3 = boto3.resource("s3")

    if 'Records' not in event:
        print("Event does not contain records.")
        return

    for record in event['Records']:
        object_key = record['s3']['object']['key']

        source = {
            "Bucket": INPUT_BUCKET_NAME,
            "Key": object_key
        }

        try:
            aws_s3.meta.client.copy(source, OUTPUT_BUCKET_NAME, object_key)
            print(f"Copied {object_key} to {OUTPUT_BUCKET_NAME}")
        except Exception as e:
            print(f"Error copying {object_key}: {str(e)}")
