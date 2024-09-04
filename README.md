# Medusa Deployment on AWS using Terraform and ECS/Fargate

## Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Terraform Configuration](#terraform-configuration)
4. [GitHub Actions CD Pipeline](#github-actions-cd-pipeline)
5. [Accessing the Backend](#accessing-the-backend)

## Introduction

This repository contains the necessary configuration files and instructions for deploying the Medusa open-source headless commerce platform backend on AWS using Terraform and ECS/Fargate. The setup also includes a GitHub Actions Continuous Deployment (CD) pipeline to automate the deployment process.

## Prerequisites

Before you begin, ensure you have the following:

- **AWS Account**: Ensure your AWS account has the necessary permissions to create and manage the resources.
- **GitHub Account**: Required for version control and setting up the CD pipeline.
- **Terraform**: Install Terraform on your local machine to manage infrastructure as code.
- **Docker**: Install Docker to manage containerized applications.

## Terraform Configuration

This project uses Terraform to provision and manage AWS resources necessary for deploying the Medusa backend. The configuration is split into multiple files, each handling a specific part of the infrastructure:

- `provider.tf`: Defines the AWS provider and sets the region.
- `vpc.tf`: Sets up the Virtual Private Cloud (VPC), subnets, internet gateway, and route tables.
- `iam.tf`: Configures the IAM roles and policies required for ECS task execution.
- `ecs.tf`: Manages the ECS cluster, task definitions, and services.
- `security-groups.tf`: Defines security groups to manage access to the ECS service.

### Steps to Apply the Terraform Configuration

1. **Initialize Terraform**: Set up Terraform in your project directory.
2. **Apply the Configuration**: Deploy the resources to AWS.

## GitHub Actions CD Pipeline

The CD pipeline, defined in `.github/workflows/cicd.yml`, automates the deployment process. It triggers whenever changes are pushed to the main branch, ensuring that your Medusa backend is always up-to-date.

### Pipeline Steps

1. **Checkout Code**: Fetches the latest code from the repository.
2. **Set Up Terraform**: Prepares Terraform for deployment.
3. **Initialize Terraform**: Prepares Terraform to apply the configuration.
4. **Apply Configuration**: Deploys the infrastructure changes.

### Setting Up GitHub Secrets

To enable the CD pipeline, add your AWS credentials as GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

These credentials allow GitHub Actions to interact with your AWS account.

## Accessing the Backend

Once your Medusa backend is deployed, you can access it as follows:

1. **Check Public IP Assignment**: Verify if your ECS service has a public IP using the AWS CLI. This information can be found in the `networkInterfaces` section.

2. **Access Medusa Backend**: Use the public IP to access your Medusa backend.

By following this guide, you’ll be able to deploy the Medusa backend on AWS with Terraform and ECS/Fargate, alongside a fully automated CD pipeline via GitHub Actions.
