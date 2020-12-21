data "digitalocean_ssh_key" "terraform" {
    name = "antrian-sehat-sshkey"
}

resource "digitalocean_droplet" "web" {
    image = "ubuntu-18-04-x64"
    name = "antrian-sehat"
    region = SGP1
    size = s-1vcpu-1gb
    ssh_keys = [
        data.digitalocean_ssh_key.terraform.id
    ]

    # ensures that we create the new resource before we destroy the old one
    # https://www.terraform.io/docs/configuration/resources.html#lifecycle-lifecycle-customizations
    lifecycle {
        create_before_destroy = true
    }
}

output "server_ip" {
    value = digitalocean_droplet.web.ipv4_address
}
