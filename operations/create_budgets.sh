#!/bin/bash

# Define the list of services
services=(
  "AWS Amplify"
  "Amazon CloudFront"
  "AWS CloudShell"
  "AWS CloudTrail"
  "AmazonCloudWatch"
  "AWS Config"
  "Amazon DynamoDB"
  "Amazon EC2 Container Registry (ECR)"
  "Amazon Elastic Load Balancing"
  "Amazon Elastic Compute Cloud - Compute"
  "Amazon Elastic Block Store"
  "Amazon Elastic Container Service"
  "Amazon ElastiCache"
  "AWS Glue"
  "AWS Key Management Service"
  "AWS Lambda"
  "Amazon Location Service"
  "AWS Migration Hub Refactor Spaces"
  "Amazon Relational Database Service"
  "Amazon Route 53"
  "Amazon Simple Storage Service"
  "AWS Secrets Manager"
  "AWS Service Catalog"
  "Amazon Simple Email Service"
  "Amazon Simple Notification Service"
  "Amazon Simple Queue Service"
  "AWS Step Functions"
  "Amazon Virtual Private Cloud"
  "AWS WAF"
)

# Define other parameters
parent_alert_stack="alert"
time_unit="MONTHLY"
aws_profile="default" # Replace with your actual AWS profile name
aws_region="us-east-1"   # Replace with your desired AWS region

# Function to sanitize stack names
sanitize_stack_name() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -d '()'
}

# Create a stack for the account
account_stack_name="budget-$(echo $time_unit | tr '[:upper:]' '[:lower:]')-account"

aws cloudformation create-stack \
  --stack-name "$account_stack_name" \
  --template-body file://service-budget.yaml \
  --parameters ParameterKey=ParentAlertStack,ParameterValue=$parent_alert_stack \
               ParameterKey=ServiceName,ParameterValue="Account" \
               ParameterKey=TimeUnit,ParameterValue=$time_unit \
  --capabilities CAPABILITY_NAMED_IAM \
  --tags Key=Name,Value="$account_stack_name" \
  --profile $aws_profile \
  --region $aws_region

echo "Created stack: $account_stack_name for account using profile: $aws_profile in region: $aws_region"

# Loop through each service and create a CloudFormation stack
for service in "${services[@]}"; do
  # Convert service name to lowercase and replace spaces with hyphens for stack name
  stack_name="budget-$(echo $time_unit | tr '[:upper:]' '[:lower:]')-$(sanitize_stack_name "$service")"
  
  # Create the CloudFormation stack
  aws cloudformation create-stack \
    --stack-name "$stack_name" \
    --template-body file://service-budget.yaml \
    --parameters ParameterKey=ParentAlertStack,ParameterValue=$parent_alert_stack \
                 ParameterKey=ServiceName,ParameterValue="$service" \
                 ParameterKey=TimeUnit,ParameterValue=$time_unit \
    --capabilities CAPABILITY_NAMED_IAM \
    --tags Key=Name,Value="$stack_name" \
    --profile $aws_profile \
    --region $aws_region
  
  echo "Created stack: $stack_name for service: $service using profile: $aws_profile in region: $aws_region"
done
