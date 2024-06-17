# Jenkins #

[Jenkins](https://jenkins.iguana-devops.pp.ua:8443/) is running in separate VM using https protocol on port 8443. . It is responsible for managing terraform, ansible, building artifact and pushing it to the [Jfrog](https://jfrog.iguana-devops.pp.ua) artifactory.

In folder [Jenkins](./Jenkins) placed jenkinsfiles:
-  [Jenkinsfile_terraform](./Jenkinsfile_terraform) - manage terraform for building the infrasrutcture
-  [Jenkinsfile_ansible](./Jenkinsfile_ansible) - manage ansible playbook for configuring infrasructure
-  [Jenkinsfile_terraform_destroy](./Jenkinsfile_terraform_destroy) - manage terraform for destroying the infrasrutcture
<<<<<<< ID-30-Create-Jenkins-job-for-Helm
-  [Jenkinsfile_build](./Jenkinsfile_build) - make build of application,change some variables with `env.sh` bash script and push it to the Jfrog Artifactory.
-  [Jenkinsfile_docker](./Jenkinsfile_docker) - make build of "gitea" docker image, and push it to the Jfrog Registry.
-  [Jenkinsfile_helm](./Jenkinsfile_helm) - make deployment of "gitea" application to the Kubernetes cluster.

[env.sh](./env.sh) script used for replacing mutable variables, which is created by Terraform.
=======
-  [Jenkinsfile_build](./Jenkinsfile_build) - make build of application,change some variables with `env.sh` bash script and push it to the Jfrog Artifactory. Create list of atrifacts with bash script `names.sh` for Ansible playbook.

[env.sh](./env.sh) script used for replacing mutable variables, which is created by Terraform.

[names.sh](./names.sh) script used for creating list of Jfrog artifactory artifacts 

