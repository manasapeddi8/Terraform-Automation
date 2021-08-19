resource "null_resource" "linux_provisioner" {
  count      = var.vm_count
  depends_on = [azurerm_linux_virtual_machine.vm1, azurerm_network_interface.linux_nic]
  triggers = {
    network_interface_ids = join(",", azurerm_network_interface.linux_nic[*].id)
  }
  provisioner "local-exec" {
    command = "cat /etc/hostname"
  }
}
