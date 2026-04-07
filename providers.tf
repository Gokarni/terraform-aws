terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

/*terraform {
  backend "s3" {
    bucket = "gokz-terraform-state-bucket"  
    key="terraform.tfstate"  
    use_lockfile = true
    #dynamodb_table = "terraform-dynamodb"
    region = "us-east-1"
  }
}*/