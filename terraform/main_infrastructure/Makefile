GEO_ENV ?= dev-01-eu-west3-geo

init:
	terraform init
	terraform workspace select ${GEO_ENV} || terraform workspace new ${GEO_ENV}

plan: init
	terraform plan -var-file ../workspace_vars/$(GEO_ENV).json

apply:
	terraform apply -var-file ../workspace_vars/$(GEO_ENV).json

destroy:
	terraform destroy -var-file ../workspace_vars/$(GEO_ENV).json