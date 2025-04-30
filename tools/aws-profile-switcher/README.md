Requires:
    - bash
    - fzf

# AWS Profile Switcher

Shell script for switching between AWS profiles.

## Installation

Place `aws-profile-switcher.sh` on your `$PATH` (making sure it is executable) and add the function in `function` to your `.bashrc` or `.zshrc` file.

## Usage

Running `awsp` will then list your AWS profiles based on `~/.aws/config`, select the desired one with the arrow keys and press enter to select.

This will switch your `$AWS_PROFILE` env var to the selected profile.
