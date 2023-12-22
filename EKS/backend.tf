terraform {
  backend "s3" {
    bucket = "eks-project-bucket"
    key    = "eks/terraform.tfstate"
    region = "us-west-1"
  }
}