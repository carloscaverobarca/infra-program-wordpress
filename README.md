# infra-program-wordpress

Automatically provision [Wordpress](https://wordpress.com/) v5.6 in an EC2 instance with Terraform and Ansible

## Prerequisites

- [AWS](https://aws.amazon.com/) account & access tokens. Configure a profile to include in the variables
- [Ansible](https://www.ansible.com/) installed
- [Terraform](https://www.terraform.io/) installed
- [AWS CLI](https://aws.amazon.com/cli/) version 2 installed
- I would recommend to also install a Terraform version manager such as [tfenv](https://github.com/tfutils/tfenv)

## How it works

1) Create the ssh credentials: 
   - `ssh-keygen -y -f mykeytest.pem > mykeytest.pub`
   - Copy them in `~/.ssh/` in your laptop (adapt to your needs)
2) Get the token using AWS CLI
3) `terraform init` to configure the project
4) `terraform plan` to prepare the provisioning
5) `terraform apply` to create the EC2 instance (VPC, SSH Key, Security Group, etc) and run the Ansible Playbook on it to provision Wordpress
6) Access the IP given as a result of terraform execution to configure Wordpress
   - The database configuration is located in `files/install.sh` 
     - Database name: `wordpress`
     - Database user: `wordpress`
     - Database pwd: `wordpress123`
7) `terraform destroy` to remove all the resources from AWS

## Material

- [Install WordPress with Terraform & Ansible on AWS](https://devops-treff.de/2020/03/27/install-wordpress-with-terraform-on-aws/)