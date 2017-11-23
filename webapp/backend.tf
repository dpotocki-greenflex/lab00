
terraform {
  backend "s3" {
    bucket = "tfstate-icelab-eu-west-01"
    key    = "david/webapp/terraform.tfstate"
    region = "eu-west-1"
  }
}

