terraform {
  required_version = "~> 1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }
}
provider "aws" {
  region  = "ap-south-1"
  profile = "vaws"

}
