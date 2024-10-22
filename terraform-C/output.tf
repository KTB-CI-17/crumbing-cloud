output "ktb-cruming-public-instance" {
  value = {
    ip = module.instance.public_instance_ips
  }
}

output "ktb-cruming-private-instance" {
  value = {
    ip = module.instance.private_instance_ips
  }
}