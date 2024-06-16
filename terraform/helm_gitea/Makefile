GEO_ENV ?= dev-01-us-central1-gitea

init:
	terraform init
	terraform workspace select ${GEO_ENV} || terraform workspace new ${GEO_ENV}

plan: init
	terraform plan -var-file ../workspace_vars/$(GEO_ENV).json

apply: plan
	terraform apply -var-file ../workspace_vars/$(GEO_ENV).json --auto-approve

destroy: plan
	terraform destroy -var-file ../workspace_vars/$(GEO_ENV).json --auto-approve