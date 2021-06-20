resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    name = "allow_ssh_public"
  }
}

output "sg_id" {
  value = "aws_security_group.allow_ssh.id"
}