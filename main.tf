// Creating ec2 instance 
resource "aws_instance" "ec2" {
  ami = "${var.image}"
  instance_type = "${var.inst_type}"
  availability_zone = "us-east-1a"
  #vpc_security_group_ids=["${default.aws_security_group.mysg.id}"]
  #security_groups = ["${aws_security_group.mysg.id}"]
  key_name = "exec"
  tags = {
      Name = "Ubuntu"
      Task="Remote Exec Provisioner"
      Tool = "Terraform"
    }
  volume_tags = {
    Name = "myvol_myec2"
  }
  root_block_device {
   volume_size = 10
  }
}
  // Remote Execution

  resource "null_resource" "remote_exec"{
    triggers = {
      public_ip = "${aws_instance.ec2.public_ip}"
     }
    connection {
        type="ssh"
        user="ubuntu"
        private_key = "${file("./exec.pem")}"
        host = "${aws_instance.ec2.public_ip}"
        agent="true"
      }
    provisioner "remote-exec" {
      inline = [
        "sudo apt-get update -y",
        "sudo apt-get install nginx -y",
        "sudo /etc/init.d/nginx start"
    ]
    }
  
  }
