terraform {
  backend "s3" {
    bucket         = "paschal-bank-multicloud-tfstate-0001212"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}