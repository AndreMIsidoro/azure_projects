#!/bin/bash

echo "Generating .env file from Terraform outputs..."

terraform_output=$(terraform output -json)

client_id=$(echo "$terraform_output" | jq -r '.client_id.value')
tenant_id=$(echo "$terraform_output" | jq -r '.tenant_id.value')
redirect_uri=$(echo "$terraform_output" | jq -r '.redirect_uri.value')

cat <<EOF > ./my-secure-app/.env
REACT_APP_CLIENT_ID=$client_id
REACT_APP_TENANT_ID=$tenant_id
REACT_APP_REDIRECT_URI=$redirect_uri
EOF

echo ".env file created in ./my-secure-app/.env"