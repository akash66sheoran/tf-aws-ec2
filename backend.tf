terraform {
  backend "s3" {
    bucket         = "tod-tf-state-store"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    workspace_key_prefix = "tf-linux-ec2-workspaces"
#     dynamodb_table = "terraform-state-lock"
   }
 }
