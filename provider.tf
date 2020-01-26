provider "google" {
  credentials = file("account.json")
  project    = "gke-cluster"
  region     = "australia-southeast1"
}

provider "google-beta" {
  credentials = file("account.json")
  project    = "gke-cluster"
  region     = "australia-southeast1"
}

