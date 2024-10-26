output "ktb_cruming_public_instance" {
  value = {
    ip = module.instance.public_instance_ips
  }
}

output "ktb_cruming_private_instance" {
  value = {
    ip = module.instance.private_instance_ips
  }
}