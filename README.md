# AWS Accounts

This repository manages my personal AWS accounts (as an AWS organisation), but is parameterised and split into separate root modules such that anyone can make use of the same setup.

# Initial Setup

1. Sign up for an AWS account and create your root user.
2. Log in with your root user credentials.
3. Choose your home region
4. Create an AWS Organisation
5. Enable IAM Identity Centre
    1. Enable identity aware sessions
    2. Enable attribute access control
    3. Send email OTP for users created with the API
6. Create a user
7. Create an admin permission set
8. Assign the user to the AWS account using the permission set
9. Enable IAM access to billing
10. Logout of root user
11. Login to console with manually created user (follow email link, setup MFA)
12. Configure AWS CLI to use manually created user
