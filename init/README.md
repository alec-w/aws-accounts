# Init

## Requirements

- python (3.8+)
- python-venv
- aws CLI
- jq

## Overview

Creates an S3 bucket and DynamoDB table within the management account to use for terraform state storage when creating further AWS accounts.

## Usage

1. Setup your AWS config using the manually created profile (example below, replace sso_start_url and ss_account_id):
```bash
[sso-session myuser]
sso_region = eu-west-2
sso_start_url = https://d-0123456789.awsapps.com/start
sso_registration_scopes = sso:account:access

[profile manual]
sso_session = myuser
sso_account_id = 123456789012
sso_role_name = AdministratorAccessManual
region = eu-west-2
output = json
```

2. Create the stack (S3 bucket and DynamoDB table)
```bash
make deploy
```

3. Output the bucket and table names (these will be used later)
```bash
make outputs
```
