output "resource_grp" {
  value = module.resource_group.resource_grp.name
}

output "lin_avs_name" {
  value = module.linux.lin_avs_name.name
}
output "linux_vm1" {
  value = module.linux.linux_vm1
}

output "lin_private_ip" {
  value = module.linux.lin_private_ip
}
output "lin_pub_ip" {
  value = module.linux.lin_pub_ip
}



output "avs_name" {
  value = module.windows.avs_name.name
}
output "win_vm" {
  value = module.windows.win_vm
}

output "private_ip" {
  value = module.windows.private_ip
}
output "pub_ip" {
  value = module.windows.pub_ip
}

output "virtual_network_address" {
  value = module.network.virtual_network_address.address_space
}
output "virtual_network_name" {
  value = module.network.virtual_network_name.name
}


output "subnet_name1" {
  value = module.network.subnet_name1.name
}
output "subnet_name2" {
  value = module.network.subnet_name2.name
}
output "subnet_address1" {
  value = module.network.subnet_address1.address_prefixes
}
output "subnet_address2" {
  value = module.network.subnet_address2.address_prefixes
}
