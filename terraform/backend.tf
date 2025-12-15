terraform {
  backend "s3" {
    bucket = "hieuslab-terraform"
    key    = "aws-eks-infrastructure/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "aws-eks-terraform-state"
    encrypt        = true
  }
}
