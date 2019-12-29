/*
resource "aws_default_vpc" "default" {
    tags={
        Name="Deafult VPC"
    }
    
}*/
/*
resource "aws_security_group" "mysg" {
    name ="Grant ssh"
    description ="Allow SSH inbound traffic"
    tags ={
        Name="Secgroup by tf"
    }
    ingress{
        protocol="tcp"
        from_port ="22"
        to_port="22"
        cidr_blocks =["0.0.0.0/0"]
    }
    egress{
        protocol="-1"
        from_port="0"
        to_port="0"
        cidr_blocks=["0.0.0.0/0"]
        
    }
  
}
*/
