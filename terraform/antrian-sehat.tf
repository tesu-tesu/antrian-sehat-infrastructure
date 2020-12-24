resource "digitalocean_droplet" "antrian-sehat" {
    image = "ubuntu-18-04-x64"
    name = "antrian-sehat"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    ssh_keys = [
        var.ssh_fingerprint
    ]

    lifecycle {
        create_before_destroy = true
    }
}

output "server_ip" {
    value = digitalocean_droplet.antrian-sehat.ipv4_address
}
