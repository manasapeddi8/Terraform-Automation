resource "null_resource" "windows_provisioner" {
  depends_on = [azurerm_windows_virtual_machine.win_vm1,
  azurerm_network_interface.win_nic]
  for_each = var.windows_name
  triggers = {
    network_interface_ids = join(",", values(azurerm_network_interface.win_nic)[*].id)
  }
  provisioner "remote-exec" {
    inline = [
    "command = cmd /k hostname"]
  }

  connection {
    type     = "winrm"
    user     = var.win_user
    password = var.win_user_pwd
    port     = 5985
    insecure = true
    host     = azurerm_public_ip.public_ip[each.key].ip_address
  }
}

