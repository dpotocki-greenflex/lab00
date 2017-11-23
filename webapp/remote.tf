data "terraform_remote_state" "rs-VPC" {
 backend = "s3"
  config {
    bucket = "tfstate-icelab-eu-west-01"
    key    = "david/terraform.tfstate"
    region = "eu-west-1"
  }
}

