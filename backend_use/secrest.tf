provider "aws" {
 region = "us-east-1"
}
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "sssssss0001111"
    key            = "global/env/dev/terraform.tfstate"
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "tfstate_ss-locks"
    encrypt        = true
  }
}


data "aws_secretsmanager_secret_version" "creds" {
  # Fill in the name you gave to your secret
  secret_id = "db"
}
locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_db_instance" "example" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "example"
  allocated_storage = 5
  skip_final_snapshot = true
  # Set the secrets from AWS Secrets Manager
  username = local.db_creds.username
  password = local.db_creds.password
}

