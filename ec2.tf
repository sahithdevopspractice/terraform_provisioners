resource "aws_instance" "web" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.robhoshop-all.id]
  tags = {
    Name = "Provisioners"
  }
  provisioner "local-exec" {
    command = "echo server Ip address is ${self.private_ip}" #self is here aws_instance web
  }
  connection {
    type = "ssh"
    user = "root"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "echo 'this is form remote-exec' > /tmp/remote.txt ",
        "sudo yum install nginx -y ",
        "sudo systemctl start nginx "
     ]
  }
}

resource "aws_security_group" "robhoshop-all" {
 name = "Provisioner"
 ingress {
    description = "Allow All Ports"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "Allow All Ports"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Provisioner"
  }
  
}