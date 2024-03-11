resource "aws_instance" "utc-server" {
  ami = "ami-06a0cd9728546d178"
  instance_type = "t2.micro"
  key_name = "utc-key"
  security_groups = [aws_security_group.webserver.id]
  subnet_id = aws_subnet.public_subnet1.id 
  user_data = file("install.sh")
  associate_public_ip_address = true 
  tags = {
        Name = "utc-dev-inst"
        Team = "Cloud-Transformation"
        Environment = "Dev"
        Created-by = "Eric"
      }
}

resource "aws_ebs_volume" "vol1" {
    availability_zone = aws_instance.utc-server.availability_zone
    size = 20
   
  
}
resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.vol1.id
    instance_id = aws_instance.utc-server.id
  
}