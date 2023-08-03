terraform {
  backend "s3" {
    bucket  = "kunalbucketdev"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}