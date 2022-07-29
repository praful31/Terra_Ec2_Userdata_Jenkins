##### Instance Variables #####

variable "i_type" {
  type    = string
  default = "t2.micro"
}

variable "avlb_zn" {
  type    = string
  default = "us-east-1a"
}

# variable "key_name" {
#   type = string
#   # default = "northvirginiakey"
# }

variable "vpc_id" {
  type    = string
  default = "vpc-09b0c2db9759696cb"
}

variable "tag" {
  type    = string
  default = "Terraform"
}