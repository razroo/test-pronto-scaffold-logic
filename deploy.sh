#!/bin/bash

STACK_NAME=test-pronto-scaffold-logic-$Environment
DEPLOY_DIST_DIR=dist/apps/test-pronto-scaffold-logic
TEMPLATE=template

. ./config/.env.$Environment

echo Environment: $Environment
echo Stack Name: $STACK_NAME
echo Domain Name: $DomainName

echo "Building..."
npm run build:$Environment

echo "Deploying CF Stack..."
aws cloudformation deploy \
	--stack-name $STACK_NAME \
	--template-file $TEMPLATE.yaml \
	--force-upload \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameter-overrides $(cat ./config/.env.$Environment) > /dev/null

WebsiteUrl=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='WebsiteUrl'].OutputValue" --output text)
WebsiteS3Bucket=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='WebsiteS3Bucket'].OutputValue" --output text)
CloudFrontDistributionId=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='CloudFrontDistributionId'].OutputValue" --output text)

echo "Deploying to $WebsiteS3Bucket"

echo "FrontEnd: Copying to S3..."
aws s3 sync $DEPLOY_DIST_DIR s3://$WebsiteS3Bucket --delete --quiet

echo "FrontEnd: Invalidating cache..."
aws cloudfront create-invalidation --distribution-id $CloudFrontDistributionId --paths "/*" > /dev/null

echo "Deployment finished"
echo ""
echo "********************************************"
echo "Website URL: $WebsiteUrl"
echo "CloudFront Distribution Id: $CloudFrontDistributionId"
echo "Website S3 Bucket: $WebsiteS3Bucket"
echo "********************************************"