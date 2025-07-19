resource "aws_identitystore_user" "alecwilson" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  display_name      = "Alec Wilson"
  user_name         = "alecwilson"
  name {
    given_name  = "Alec"
    family_name = "Wilson"
  }
  emails {
    primary = true
    value   = "alecw1992@gmail.com"
  }
}

resource "aws_identitystore_group_membership" "alecwilson_administrators" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  group_id          = aws_identitystore_group.administrators.group_id
  member_id         = aws_identitystore_user.alecwilson.user_id
}
