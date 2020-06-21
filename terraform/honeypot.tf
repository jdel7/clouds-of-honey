provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_droplet" "honeypot" {
    image = data.digitalocean_droplet_snapshot.honeypot_latest.id
    name = "mhn"
    region = "sfo2"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]
}

data "digitalocean_droplet_snapshot" "honeypot_latest" {
    name_regex = "packer-*"
    region = "sfo2"
    most_recent = true
}