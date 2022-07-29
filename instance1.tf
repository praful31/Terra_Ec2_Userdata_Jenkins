######### Link =  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance    ###########


provider "aws" {
  # profile = "terra"
  region = "us-east-1"

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "demo" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.i_type
  availability_zone      = var.avlb_zn
  key_name               = "key_demo"
  vpc_security_group_ids = [aws_security_group.my_secgp.id]
  #volume_type           = ""
  user_data = local.user_data
  #count = 2


  tags = {
    Name = "${var.tag}_Instance"
  }
}

#### To Attach PublicKey to EC2 Instance Crated By Own On Ubuntu ##### 
resource "aws_key_pair" "key" {
  key_name   = "key_demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAd/+XeqMuurPnVNhbn/IkYHdy90NRS/0OXP1VZFDSe6PO/ddc+sJmTzYW0JStI1FcD/F+7hyLbrVNQLs3jvX97vdsLGHCO1A3TepmON4GfHQHXDKx1m1vowezGLZPOB7cMpcToXFgFWWMytdmUB8uJKJFxMLwXRnEAlEfzi4c5Rx4AYsqRilt/QiYQiKk6NMLDQmY6eBhwffN+9W2zSYsV8uUhUbTKIPQRM3YMMkEJJvXXvpEdbIh+EjgH05D947P5gUiD3rVnST4onlcbOb7xyQNiqyyT4F/r4NLojrQfxcmtlHttVbKqRpSGM1gFEXRIWFtWUYHDt7tZqy7EVhv root@DESKTOP-MHQMU53"
}