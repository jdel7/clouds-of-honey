resource "digitalocean_droplet" "web" {
    image = "packer-1588461749"
    name = "mhn"
    region = "sfo2"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]
}

provider "digitalocean" {
    token = var.do_token
}

## ssh fingerprint 00:f5:43:80:1c:81:a2:e6:78:6b:8d:13:d5:2a:3a:25

variable "do_token" {}
#variable "pub_key" {}
#variable "pvt_key" {}
variable "ssh_fingerprint" {}

/*
    variable “do_token”: your DigitalOcean Personal Access Token
    variable “pub_key”: public key location, so it can be installed into new droplets
    variable “pvt_key”: private key location, so Terraform can connect to new droplets
    variable “ssh_fingerprint”: fingerprint of SSH key
*/
