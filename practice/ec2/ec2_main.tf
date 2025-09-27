resource "aws_instance" "ec2-practice" {
  ami             = "ami-09c813fb71547fc4f"
  instance_type   = "t2.small"
  security_groups = [aws_security_group.allow_tls.id]

  tags = {
    Name = "ec2-practice"
  }
}

#SECURITY GROUPS
resource "aws_security_group" "allow_tls" {

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "practice-SG"
  }
}