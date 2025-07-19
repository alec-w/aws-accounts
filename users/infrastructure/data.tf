data "aws_caller_identity" "current" {}

data "aws_ssoadmin_instances" "this" {}

data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_unit_descendant_accounts" "root" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

locals {
  accounts = {
    for account in data.aws_organizations_organizational_unit_descendant_accounts.root.accounts :
    account.name => account
  }
}
