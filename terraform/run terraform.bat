terraform init
terraform destroy
terraform validate
pause
terraform apply
pause
awslocal s3api list-buckets
pause
awslocal s3api list-objects --bucket input-bucket
awslocal s3api list-objects --bucket output-bucket
pause
awslocal s3api put-object --bucket input-bucket --key image.png --body image.png
pause
awslocal s3api list-objects --bucket input-bucket
awslocal s3api list-objects --bucket output-bucket