terraform {
  backend "s3" {
    bucket = "terraform-state-case-18"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "generative_ai"
    encrypt = true
  }
}
