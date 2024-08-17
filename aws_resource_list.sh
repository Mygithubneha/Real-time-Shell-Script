#!/bin/bash

##################################################################################
# This script is used to list all the AWS resources in the account
# You can use this script to list all the resources in the account
# Author: Neha-Avasekar/DevOps-Team
# Date: August 2024
# Version: 1.0
# Usage: ./aws_resource_list.sh
#
# Following are the supported services by this script

# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 ec2
##################################################################################

# Check if the number of arguments is correct
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# Assign the arguments to variables
aws_region=$1
aws_service=$2

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [! -d "$HOME/.aws" ]; then
    echo "AWS CLI is not configured. Please configure it and try again."
    exit 1
fi

# Execute the AWS CLI command based on the service name

case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    s3)
        aws s3 ls --region $1
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    iam)
        aws iam list-users --region $1
        ;;
    route53)
        aws route53 list-hosted-zones --region $1
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $1
        ;;
    cloudformation)
        aws cloudformation list-stacks --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    sqs)
        aws sqs list-queues --region $1
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    ebs)
        aws ec2 describe-volumes --region $1
        ;;
    *)
        echo "Unsupported service: $2"
        exit 1
        ;;
esac