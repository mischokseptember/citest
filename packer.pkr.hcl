packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "commit_id" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  region        = "eu-central-1"
  instance_type = "t2.micro"
  ami_name      = "citest-${var.commit_id}"
  ssh_username  = "ubuntu"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = true
  }

  tags = {
    commit = var.commit_id
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = ["mkdir -p /tmp/website"]
  }

  provisioner "file" {
    source      = "website/"
    destination = "/tmp/website"
  }

  provisioner "shell" {
    inline = [
      "apt-get update -y",
      "apt-get install -y nginx pandoc",
      "for f in /tmp/website/*.md; do name=$(basename \"$f\" .md); pandoc -o /var/www/html/$name.html \"$f\"; done",
      "systemctl enable nginx"
    ]
  }
}
