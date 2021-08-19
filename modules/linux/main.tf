resource "azurerm_network_interface" "linux_nic" {
  count               = var.vm_count
  name                = "${var.linuxVM1}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg1


  ip_configuration {
    name                          = "${var.linuxVM1}-internal${format("%1d", count.index + 1)}"
    public_ip_address_id          = element(azurerm_public_ip.public_ip_linux[*].id, count.index + 1)
    subnet_id                     = var.subnet_id.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "avaset" {
  name                = var.avs
  location            = var.location
  resource_group_name = var.rg1
  depends_on          = [var.rg1]
}

resource "azurerm_public_ip" "public_ip_linux" {
  count               = var.vm_count
  name                = "${var.linuxVM1}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg1
  location            = var.location
  allocation_method   = "Static"



}


resource "azurerm_linux_virtual_machine" "vm1" {
  count               = var.vm_count
  name                = "${var.linuxVM1}${format("%1d", count.index + 1)}"
  resource_group_name = var.rg1
  location            = var.location
  size                = var.linuxVM1_size
  admin_username      = var.linuxVM1_user
  availability_set_id = azurerm_availability_set.avaset.id
  computer_name       = "${var.linuxVM1}-${format("%1d", count.index + 1)}"

  depends_on = [azurerm_availability_set.avaset]

  network_interface_ids = [
    element(azurerm_network_interface.linux_nic[*].id, count.index + 1)
  ]

  admin_ssh_key {
    username   = var.linuxVM1_user
    public_key = file("${var.linuxVM1_public_key}")
  }

  os_disk {
    name                 = "${var.linuxVM1}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.linuxVM1_disk_cache
    storage_account_type = var.linuxVM1_disk_type
  }

  source_image_reference {
    publisher = var.linuxVM1_linuxOS_pub
    offer     = var.linuxVM1_linuxOS_offer
    sku       = var.linuxVM1_linuxOS_sku
    version   = var.linuxVM1_linuxOS_ver
  }

}

