
variable "linuxVM1" {

}
variable "rg1" {
}
variable "subnet_id" {}
variable "location" {}
variable "linuxVM1_size" {
  default = "Standard_B1s"
}
variable "linuxVM1_user" {
  default = "auto"
}
variable "linuxVM1_public_key" {
  default = "/home/auto/.ssh/id_rsa.pub"
}

variable "avs" {

}
variable "vm_count" {

}
variable "linuxVM1_disk_type" {

  default = "Premium_LRS"
}
variable "linuxVM1_disk_size" {
  default = "32"
}
variable "linuxVM1_disk_cache" {
  default = "ReadWrite"
}


variable "linuxVM1_linuxOS_pub" {
  default = "OpenLogic"
}
variable "linuxVM1_linuxOS_offer" {
  default = "CentOS"
}
variable "linuxVM1_linuxOS_sku" {
  default = "7.5"
}
variable "linuxVM1_linuxOS_ver" {
  default = "latest"
}

