terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.0.0"
    }
  }
}

variable do_token {}
variable ssh_fingerprint {}

provider digitalocean {
    token = var.do_token
}