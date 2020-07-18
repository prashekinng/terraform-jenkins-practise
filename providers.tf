provider "aws" {
    region = var.region
}

terraform {
    backend "s3" {
        bucket = "terraform-jenkins-bucket-606465"
        key = "terraform.tfstate"
        region = "ap-south-1"
    }
}
