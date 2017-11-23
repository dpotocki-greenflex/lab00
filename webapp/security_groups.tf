resource "aws_security_group" "sg_training" {
  name        = "training"
  description = "Allow SSH and HTTP from D2SI"
  vpc_id      = "${data.terraform_remote_state.rs-VPC.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["176.67.91.153/32"]
  }

ingress {
    from_port   = 80
    to_port     = 80   
    protocol    = "tcp"
    cidr_blocks = ["176.67.91.153/32"]
}

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "sg_training"
  }
}

