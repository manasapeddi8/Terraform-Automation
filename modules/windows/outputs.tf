output "avs_name" {
  value = azurerm_availability_set.w_avaset
}
output "win_vm" {
  value = [values(azurerm_windows_virtual_machine.win_vm1)[*].name]
}

output "private_ip" {
  value = [values(azurerm_network_interface.win_nic)[*].private_ip_address]
}
output "pub_ip" {
  value = [values(azurerm_public_ip.public_ip)[*].ip_address]
}

