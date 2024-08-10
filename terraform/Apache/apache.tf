variable "instance_type" {}
variable "key_name" {}
variable "ami_id" {}
variable "apache_sg" {}
variable "subnet_id" {}
variable "availability_zone" {}


resource "aws_instance" "prp-jenkins" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = var.apache_sg
    subnet_id = var.subnet_id
    availability_zone = var.availability_zone
    user_data = file("Apache/apache.sh")
}

