resource "google_service_account" "terraform" {
  account_id   = "terraform"
  display_name = "Terraform SA for VM Instance"
  project      = "project-da762c13-7683-426c-bf0"
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-minimal-2404-lts-amd64"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "instance-01" {
  name         = "instance-01"
  machine_type = "n4-standard-2"
  zone         = "asia-southeast1-a"
  project      = "project-da762c13-7683-426c-bf0"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      size  = 10
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.terraform.email
    scopes = ["cloud-platform"]
  }
}
