output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.word_press.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.word_press.public_ip
}

# # Generate inventory file
# resource "local_file" "inventory" {
#  filename = "../ansible/hosts.ini"
#  content = <<EOF
# [server]
# ${aws_instance.word_press.public_ip}

# [word_press:children]
# server

# [all:vars]
# ansible_user=ubuntu
# [server:vars]
# ansible_ssh_private_key_file=~/.ssh/aws_ed25519.pem
# EOF
# }