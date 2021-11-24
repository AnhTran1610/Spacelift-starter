terraform {
  backend "s3" {
    bucket = "ahta-terratest"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
