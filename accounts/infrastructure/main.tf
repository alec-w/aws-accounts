resource "aws_organizations_account" "account" {
  name              = "Training"
  email             = "alecw1992+awstraining@gmail.com"
  close_on_deletion = true
}

