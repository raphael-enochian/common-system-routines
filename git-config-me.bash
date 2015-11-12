#!/usr/bin/bash
# Modify these two variables to match the username and password you want.
username="Raphael Enochian"
email="raphael.enochian@scryptmail.com"

git config --local user.name "$username"
git config --local user.email "$email"

echo --- Newly set Git info ---
echo Username: `git config --local user.name`
echo Email: `git config --local user.email`

