variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "paschal-bank-multicloud-tfstate-0001212"
}

variable "dynamodb_table" {
  default = "terraform-locks"
}