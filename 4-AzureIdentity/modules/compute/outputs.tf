# Jenkins ip
output "jenkins_private_ip" {
  description = "Jenkins private Ip"
  value       = azurerm_linux_virtual_machine.jenkins.private_ip_address
}
