## Medusa Deployment on AWS with Terraform and ECS/Fargate

### Table of Contents
1. [Overview](#overview)
2. [Project Overview](#project-overview)
3. [Key Points to Highlight](#key-points-to-highlight)
4. [Prerequisites](#prerequisites)
5. [Terraform Configuration](#terraform-configuration)
6. [Continuous Deployment with GitHub Actions](#continuous-deployment-with-github-actions)
7. [Accessing the Medusa Backend](#accessing-the-medusa-backend)
8. [Accessing the Deployed Service](#accessing-the-deployed-service)

### Overview

This repository provides the configuration files and detailed instructions for deploying the Medusa open-source headless commerce platform backend on AWS, utilizing Terraform and ECS/Fargate. Additionally, it includes a GitHub Actions Continuous Deployment (CD) pipeline to automate the deployment process, ensuring seamless updates to your application.

### Project Overview

This project aims to deploy the Medusa headless commerce platform backend on AWS using Infrastructure as Code (IaC) with Terraform. We leverage AWS services like ECS (Elastic Container Service) with Fargate to handle container orchestration, and GitHub Actions to automate the Continuous Deployment (CD) pipeline.

### Key Points to Highlight
- **Scalability**: By using ECS with Fargate, the platform can scale automatically based on traffic and demand.
- **Automation**: The entire setup and deployment process is automated using Terraform and GitHub Actions, reducing manual intervention and the potential for errors.
- **Security**: The use of IAM roles, security groups, and VPC subnets ensures that the infrastructure is secure and access is tightly controlled.

### Prerequisites

Before proceeding, ensure you have the following:

- **AWS Account**: Your AWS account must have the necessary permissions to create and manage resources.
- **GitHub Account**: Required for version control and setting up the CD pipeline.
- **Terraform**: Install Terraform on your local machine to manage infrastructure as code.

### Terraform Configuration

This project employs Terraform to provision and manage the AWS resources essential for deploying the Medusa backend. The configuration is organized into several files, each responsible for a specific aspect of the infrastructure:

- `provider.tf`: Specifies the AWS provider and region.
- `vpc.tf`: Configures the Virtual Private Cloud (VPC), including subnets, internet gateway, and route tables.
- `iam.tf`: Sets up the IAM roles and policies necessary for ECS task execution.
- `ecs.tf`: Manages the ECS cluster, task definitions, and services.
- `security-groups.tf`: Defines security groups to control access to the ECS service.

#### Steps to Apply the Terraform Configuration

1. **Initialize Terraform**: Set up Terraform in your project directory.
2. **Apply the Configuration**: Deploy the resources to AWS.

### Continuous Deployment with GitHub Actions

The CD pipeline is defined in `.github/workflows/cicd.yml` and automates the deployment process. It triggers whenever changes are pushed to the main branch, ensuring that your Medusa backend remains up-to-date.

#### Pipeline Steps

1. **Checkout Code**: Retrieves the latest code from the repository.
2. **Set Up Terraform**: Prepares Terraform for deployment.
3. **Initialize Terraform**: Prepares Terraform to apply the configuration.
4. **Apply Configuration**: Deploys the infrastructure changes.

#### Setting Up GitHub Secrets

To enable the CD pipeline, add your AWS credentials as GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

These credentials allow GitHub Actions to interact with your AWS account securely.

### Accessing the Medusa Backend

After deploying your Medusa backend, you can access it as follows:

1. **Check Public IP Assignment**: Use the AWS CLI to verify if your ECS service has been assigned a public IP. This information can be found in the `networkInterfaces` section.
   
2. **Access Medusa Backend**: Utilize the public IP to connect to your Medusa backend.

### Accessing the Deployed Service

- After deployment, the Medusa backend can be accessed via the load balancer or public IP associated with the ECS service. The specific URL or endpoint will depend on how the load balancer is configured in the Terraform setup.




Citations:
[1] https://github.com/geekcell/terraform-aws-ecs-fargate-codedeploy
[2] https://medusajs.com/blog/aws-elastic-beanstalk/
[3] https://spacelift.io/blog/terraform-ecs
[4] https://medusajs.com/blog/a-step-by-step-tutorial-on-how-to-deploy-a-medusa-server-on-aws/
[5] https://www.youtube.com/watch?v=7S7IEATzn3c
[6] https://github.com/medusajs/medusa/issues/485
