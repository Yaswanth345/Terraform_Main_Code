resource "null_resource" "null" {
  
    provisioner "file" {
      source = "script.sh"
      destination = "/tmp/script.sh"
      connection {
        type = "ssh"
        user = "ubuntu"
        #password = ""
        private_key = "${file("key_aws.pem")}"
        host = "${aws_instance.public_instance[0].public_ip}"
      }
    }

    provisioner "remote-exec" {
        inline = [
          "chmod +x /tmp/script.sh",
          "sudo bash /tmp/script.sh",
        #  "ping -c 2 www.google.com"
        #   "sudo apt update -y && sudo apt install nginx -y",
        #   "sudo systemctl start nginx"
        ]
        connection {
        type = "ssh"
        user = "ubuntu"
        #password = ""
        private_key = "${file("key_aws.pem")}"
        host = "${aws_instance.public_instance[0].public_ip}"
      }
      
    }

    provisioner "local-exec" {
      command = "echo [${aws_instance.public_instance[0].public_ip}, ${aws_vpc.terraform_vpc.id}] >> details"
      
    }

}