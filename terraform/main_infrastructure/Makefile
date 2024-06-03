GEO_ENV ?= dev-01-us-central1-geo

init:
	terraform init
	terraform workspace select ${GEO_ENV} || terraform workspace new ${GEO_ENV}

plan: init
	terraform plan -var-file ../workspace_vars/$(GEO_ENV).json

apply:
	terraform apply -var-file ../workspace_vars/$(GEO_ENV).json --auto-approve

destroy:
	terraform destroy -var-file ../workspace_vars/$(GEO_ENV).json --auto-approve