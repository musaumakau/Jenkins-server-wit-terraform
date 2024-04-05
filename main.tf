
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



#Provision an ubuntu ec2 instance where jenkins will be installed.
resource "aws_instance" "Jenkins_server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.medium"
  key_name        = var.key_name
  security_groups = [aws_security_group.jenkins_security_group.name]
  user_data       = file("${path.module}/user_data.sh")


  tags = {
    Name = "Jenkins"
  }
  lifecycle {
    prevent_destroy       = false
    create_before_destroy = true
  }
}

