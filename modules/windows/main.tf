resource "azurerm_network_interface" "win_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg1


  ip_configuration {
    name                          = "${each.key}-internal"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
    subnet_id                     = var.subnet_id.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "w_avaset" {
  name                = var.win_avs
  location            = var.location
  resource_group_name = var.rg1
  depends_on          = [var.rg1]
}


resource "azurerm_public_ip" "public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg1
  location            = var.location
  allocation_method   = "Static"



}

resource "azurerm_windows_virtual_machine" "win_vm1" {

  for_each            = var.windows_name
  name                = each.key
  resource_group_name = var.rg1
  location            = var.location
  size                = each.value
  admin_username      = var.win_user
  admin_password      = var.win_user_pwd
  availability_set_id = azurerm_availability_set.w_avaset.id
  computer_name       = each.key

  depends_on = [azurerm_availability_set.w_avaset]

  network_interface_ids = [
    azurerm_network_interface.win_nic[each.key].id
  ]
  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.winVM_disk_attr["disk_cache"]
    storage_account_type = var.winVM_disk_attr["disk_type"]
    disk_size_gb         = var.winVM_disk_attr["disk_size"]
  }

  source_image_reference {
    publisher = var.winVM_OS["os_pub"]
    offer     = var.winVM_OS["os_offer"]
    sku       = var.winVM_OS["os_sku"]
    version   = var.winVM_OS["os_ver"]
  }

}

