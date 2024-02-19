#!/bin/bash

#This script will report the aws usage

#Resources going to track
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

#list s3 buckets
echo "Print s3 buckets"
aws s3 ls

# aws ec2 instances
echo "Print list of ec2 instances "
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list lambda
echo "Print Lambda functions"
aws lambda list-functions

# list IAM Users
echo "Print list of IAM users"
aws iam list-users | jq '.Users[].UserName'