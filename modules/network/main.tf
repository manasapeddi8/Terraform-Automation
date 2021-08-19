resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = var.vnet-address
  location            = var.location
  resource_group_name = var.rg1

}
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.rg1
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1-address
}


resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = var.location
  resource_group_name = var.rg1

  security_rule {
    name                       = "rule1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "nsg-rule3"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
}

resource "azurerm_subnet_network_security_group_association" "nsg" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = var.rg1
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2-address
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2
  location            = var.location
  resource_group_name = var.rg1

  security_rule {
    name                       = "rule1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "nsg-rule3"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}


