output "instance_id" {
  description = "Scenario 2 EC2 instance ID"
  value       = aws_instance.scenario2_server.id
}

output "public_ip" {
  description = "Public IP address of Scenario 2 EC2"
  value       = aws_instance.scenario2_server.public_ip
}

output "public_dns" {
  description = "Public DNS of Scenario 2 EC2"
  value       = aws_instance.scenario2_server.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to Scenario 2 EC2"
  value       = "ssh -i ~/.ssh/scenario2-key ubuntu@${aws_instance.scenario2_server.public_ip}"
}
