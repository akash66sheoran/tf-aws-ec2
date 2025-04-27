terraform {
  backend "s3" {
    bucket         = "tod-tf-state-store"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
