variable "rg1" {}
variable "location" {}
variable "subnet_ids" {}
variable "vnet" {
  default = "lab02-vnet"
}
variable "vnet-address" {
  default = ["10.0.0.0/16"]
}
variable "subnet1" {
  default = "lab02-subnet1"
}
variable "subnet1-address" {
  default = ["10.0.1.0/24"]
}
variable "subnet2" {
  default = "lab02-subnet2"
}
variable "subnet2-address" {
  default = ["10.0.2.0/24"]
}
variable "nsg1" {
  default = "lab02-nsg1"
}
variable "nsg2" {
  default = "lab02-nsg2"
}

