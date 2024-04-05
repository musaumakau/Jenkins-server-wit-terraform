output "ec2-public_ip" {
  value = aws_instance.Jenkins_server.public_ip

}
output "aws_ami" {
  value = data.aws_ami.ubuntu.image_id

}
output "security_groups" {
  value = aws_security_group.jenkins_security_group.id

}