resource "aws_instance" "web" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  tags = {
    Name = "Provisioners"
  }
  provisioner "local-exec" {
    command = "echo server Ip address is ${self.private_ip}" #self is here aws_instance web
  }
}