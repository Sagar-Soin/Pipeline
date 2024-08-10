vpc_cidr          = "10.2.0.0/16"
vpc_name          = "module-vpc"
public_subnet     = ["10.2.1.0/24", "10.2.2.0/24"]
availability_zone = ["ap-south-1b", "ap-south-1c"]
instance_type     = "t3.medium"
key_name          = "TF_Key-mumbai"
ami_id            = "ami-0ad21ae1d0696ad58"