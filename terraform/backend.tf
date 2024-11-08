terraform {
  backend "s3" {
    bucket         = "one2n-terraform-state-files-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
  }
}
