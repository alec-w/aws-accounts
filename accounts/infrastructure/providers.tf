provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "training"
  region = "eu-west-2"
  assume_role {
    role_arn = "arn:aws:iam::447839931732:role/OrganizationAccountAccessRole"
  }
}
