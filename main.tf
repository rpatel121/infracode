provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name = "MyEC2Instance"
  }
}
