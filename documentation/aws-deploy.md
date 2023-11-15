# Deploy CSR Steps for AWS

This is documenation related to razroo.com/razroo/deploy-angular-using-aws/add-deploy-github-action/add-deploy-github-action

AWS intentionally does not allow for the automation of IAM users. In addition, there
are secrets and variables which for the sake of security Razroo does not hold onto. 
(We take security very seriously these parts.)

## Sign Up for AWS Account(can skip if already have AWS account)

1. Go to portal.aws.amazon.com/billing/signup and sign up for a free account

![AWS Signup Screenshot](cdn.razroo.com/aws-csr-walkthrough/aws-signup-screenshot.png)

2. Add billing information

AWS will ask for your billing information. Even though there is a free tier and what we are doing 
here will not cause you to be charged.

![AWS Billing Information Screenshot](cdn.razroo.com/aws-csr-walkthrough/aws-billing-information.png)

3. Confirm Identity

AWS will ask you to confirm your identity. Once identity confirmed you are in the AWS system.

![AWS Confirm Identity Screenshot](cdn.razroo.com/aws-csr-walkthrough/confirm-identity-screenshot.png)

## Create an IAM User 

Next we will create an IAM User 

https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-2#/users/create

For the IAM User name we will put in `Github-CI`.

![AWS Billing Information Screenshot](https://razroo.b-cdn.net/aws-csr-walkthrough/aws-billing-information.png)

### Attach Policies Directly

Choose the `AdministratorAccess` policy and click next

## Create Access key

Next we are going to create an access key. Once we create this access key, we are also going to have a secret key we 
can use to put within our github action secrets.

Go to https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-2#/users/details/Github-CI/create-access-key

This will ask you to create an access key. Once created AWS will give you an Access Key and a Secret Access Key.

![AWS Create Access Key](https://cdn.razroo.com/aws-csr-walkthrough/github-create-action-key-button.png)

We will copy and paste keys from AWS to our projects github repo. This will be: 

https://github.com/your-name/test-pronto-scaffold-logic/settings/secrets/actions

It should look something like this: 

![Github Create Action Key](https://razroo.b-cdn.net/aws-csr-walkthrough/github-create-action-key.png)

1. AWS Access Key - `AWS_ACCESS_KEY_ID`
2. AWS Secret Access Key - `AWS_SECRET_ACCESS_KEY`

Congratulations, you now added you aws AWS access keys to Github. This means you can now interact programatically via 
Github CI/CD + Github Actions with AWS.