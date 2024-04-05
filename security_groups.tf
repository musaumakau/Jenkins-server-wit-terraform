#Define security group to be attached to the jenkins server
resource "aws_security_group" "jenkins_security_group" {
  name        = "jenkins-sg"
  description = "Jenkins security group"

  ingress {
    description = "Allow SSH from my computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Expose jenkins port 8080 to the internet"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Make jenkins accesible from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "http"
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "jenkins_sg"
  }
}