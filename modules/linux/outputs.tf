output "lin_avs_name" {
  value = azurerm_availability_set.avaset
}
output "linux_vm1" {
  value = [azurerm_linux_virtual_machine.vm1[*].name]
}

output "lin_private_ip" {
  value = [azurerm_network_interface.linux_nic[*].private_ip_address]
}
output "lin_pub_ip" {
  value = [azurerm_public_ip.public_ip_linux[*].ip_address]
}

