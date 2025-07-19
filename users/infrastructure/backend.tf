terraform {
  backend "s3" {
    bucket       = "terraform-root-bucket-godsjwk3fmen"
    key          = "users/state.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}
