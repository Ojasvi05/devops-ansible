provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0108d6a82a783b352"
  instance_type = "t2.small"
  key_name = "os-import"

  tags = {
    Name = "Ojasvi-devops-server"
    env = "production"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}
