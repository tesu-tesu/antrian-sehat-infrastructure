# Configure DNS
resource "digitalocean_domain" "antrian-sehat-domain" {
  name = "antrian-sehat.me"
  ip_address = digitalocean_droplet.antrian-sehat.ipv4_address
}

# Configure DNS Records (www and api)
resource "digitalocean_record" "www" {
  domain = digitalocean_domain.antrian-sehat-domain.name
  type = "A"
  name = "www"
  value = digitalocean_domain.antrian-sehat-domain.ip_address
}

resource "digitalocean_record" "api" {
  domain = digitalocean_domain.antrian-sehat-domain.name
  type = "A"
  name = "api"
  value = digitalocean_domain.antrian-sehat-domain.ip_address
}