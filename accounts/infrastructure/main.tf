resource "aws_organizations_account" "training" {
  name              = "Training"
  email             = "alecw1992+awstraining@gmail.com"
  close_on_deletion = true
}

resource "aws_s3_bucket" "training_terraform_state" {
  provider      = aws.training
  bucket_prefix = "terraform-training-bucket-"
}
