variable "region" {
    description = "The AWS region to deploy resources in"
    type = string
    default = "us-east-1"
}

variable "availability-zone" {
  description = "List of availability zones to use"
  type = list(string)
  default = [ "us-east-1a", "us-east-1b"]
}

variable "vpc-cidr-block" {
  description = "CIDR Block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc-name" {
  description = "Name tag for the VPC"
  type = string
  default = "three-tier-vpc"
}

variable "igw-name" {
  description = "Name tag for the internet gateway"
  type = string
  default = "three-tier-igw"
}

//Presentation Tier
variable "public-subnet-cidr-blocks" {
  description = "List of CIDR blocks for public subnets"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "public-subnet-names" {
  description = "List of names for public subnets"
  type = list(string)
  default = [ "three-tier-public-subnet-1", "three-tier-public-subnet-2" ]
}

variable "public-rout-table-name" {
  description = "Name tag for the public route table"
  type = string
  default = "three-tier-public-rt"
}

variable "nat-gateway-name" {
  description = "Name tag for the NAT gateway"
  type = string
  default = "three-tier-nat-gateway"
  
}

variable "nat-eip-name" {
  description = "Name tag for the NAT gateway"
  type = list(string)
  default = ["three-tier-nat-eip1", "three-tier-nat-eip2"]
}

variable "alb-name" {
  description = "Name tag for the Application Load Balancer"
  type = string
  default = "three-tier-alb"
}

variable "alb-target-group" {
  description = "Name tag for the target group"
  type = string
  default = "alb-target-group"
}

//Application Tier
variable "private-subnet-cidr-blocks" {
  description = "List of CIDR blocks for private subnets"
  type = list(string)
  default = [ "10.0.3.0/24", "10.0.4.0/24" ]
}

variable "private-subnet-names" {
    description = "List of names for private subnets"
    type = list(string)
    default = [ "three-tier-private-subnet-1", "three-tier-private-subnet-2" ]
}

variable "private-route-table-name" {
  description = "Name tag for the private route table"
  type = string
  default = "three-tier-private-rt"
}

variable "lunch-template-app" {
  description = "Name tag for the lunch template for app tier"
  type = list(string)
  default = ["three-tier-app-lunch-template1", "three-tier-app-lunch-template2"]
}

variable "image-id" {
  description = "AMI ID for web servers"
  type        = string
  default     = "ami-02dfbd4ff395f2a1b"
}

variable "instance-type" {
  description = "Instance type for Application servers"
  type        = string
  default     = "t3.micro"
}

//Database Tier
variable "database-subnet-cidr-blocks" {
  description = "List of CIDR blocks for database subnets"
  type = list(string)
  default = [ "10.0.5.0/24", "10.0.6.0/24" ]
}

variable "database-subnet-names" {
    description = "List of names for database subnets"
    type = list(string)
    default = [ "three-tier-database-subnet-1", "three-tier-database-subnet-2" ]
}

variable "database-group" {
  description = "Name tag for the database group"
  type = string
  default = "three-tier-database-group"
}

variable "database-username" {
  type = string
  sensitive = true
}

variable "database-password" {
  type = string
  sensitive = true
}

variable "database-name" {
  type = string
  
}
//Security Groups
variable "alb-security-group-name" {
  description = "Name tag for the security group for the ALB"
  type = string
  default = "three-tier-alb-sg"
}

variable "app-security-group-name" {
  description = "Name tag for the security group for the application servers"
  type = string
  default = "three-tier-app-sg"
}

variable "ssh-security-group-name" {
  description = "Name of the SSH security group to use for ssh"
  type = string
  default = "three-tier-ssh-sg"
}

variable "ice-security-group-name" {
  description = "Name of the ICE security group to use for Instance Connect"
  type = string
  default = "three-tier-ice-sg"
}

variable "efs-security-group-name" {
  description = "Name of EFS security group to use for EFS file system"
  type = string
  default = "three-tier-efs-sg"
}

variable "database-security-group-name" {
  description = "Name of Database security group to use for Database"
  type = string
  default = "three-tier-database"
}

//Instance Connect Endpoint
variable "instance-connect-endpoint-name" {
  description = "Name tag for the instance connect endpoint"
  type = string
  default = "three-tier-ice"
}

//EFS 
variable "efs-name" {
  description = "Name tag for the EFS file system"
  type = string
  default = "three-tier-efs"
}

//Auto Scaling
variable "wordpress-autoscaling-group" {
  description = "Name tag for the Application Auto Scaling group"
  type = string
  default = "wordpress-three-tier-asg"
}