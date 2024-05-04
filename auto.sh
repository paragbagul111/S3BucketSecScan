#!/bin/bash

# Prompt user to enter S3 bucket name
read -p "Enter the S3 bucket name: " bucket_name

# List objects in the specified bucket
echo "Listing objects in bucket $bucket_name:"
aws s3 ls "s3://$bucket_name"

# Copy secret.txt from the bucket
echo "Copying secret.txt from bucket $bucket_name (if exists):"
aws s3 cp "s3://$bucket_name/secret.txt" .

# Move Exploit.txt to the bucket
echo "Moving Exploit.txt to bucket $bucket_name (if exists):"
aws s3 mv Exploit.txt "s3://$bucket_name/"

# List objects in the bucket again
echo "Listing objects in bucket $bucket_name after operations:"
aws s3 ls "s3://$bucket_name" --no-sign-request
