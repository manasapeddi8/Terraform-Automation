module "network" {
  source     = "./modules/network"
  rg1        = "lab04s2"
  location   = "canadacentral"
  subnet_ids = module.network.subnet_name2
}
module "resource_group" {
  source   = "./modules/resource_group"
  rg1      = "lab04s2"
  location = "canadacentral"
}
module "linux" {
  source    = "./modules/linux"
  linuxVM1  = "ansible8214-c-vm"
  avs       = "linux_avs"
  vm_count  = 2
  rg1       = "lab04s2"
  location  = "canadacentral"
  subnet_id = module.network.subnet_name1
}
module "windows" {
  source       = "./modules/windows"
  win_avs      = "windows_avs"
  win_vm_count = 1
  windows_name = {
    ansi8214-w-vm1 = "Standard_B1s"
  }
  rg1       = "lab04s2"
  location  = "canadacentral"
  subnet_id = module.network.subnet_name2
}
data "azurerm_resources" "tags" {
  resource_group_name = "lab04s2"
  required_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "manasa.peddi8x@gmail.com"
  Environment = "Lab" }
}
