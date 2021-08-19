variable "win_avs" {

}
variable "subnet_id" {}
variable "rg1" {}
variable "location" {}
variable "win_user" {
  default = "winadm"
}
variable "win_user_pwd" {
  default = "Witor!23"
}
variable "win_vm_count" {

}
variable "winVM_disk_attr" {
  type = map(string)
  default = {
    disk_type  = "StandardSSD_LRS"
    disk_size  = "127"
    disk_cache = "ReadWrite"
  }
}

variable "winVM_OS" {
  type = map(string)
  default = {
    os_pub   = "MicrosoftWindowsServer"
    os_offer = "WindowsServer"
    os_sku   = "2019-DataCenter-core"
    os_ver   = "latest"
  }
}
variable "windows_name" {
  type = map(string)
}
