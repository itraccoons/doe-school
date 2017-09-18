resource "aws_instance" "raccoon1" {
  ami           = "ami-ab04e4d3"
  instance_type = "t1.micro"
}