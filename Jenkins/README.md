# Jenkins #

[Jenkins](https://jenkins.iguana-devops.pp.ua:8443/) is running in separate VM using https protocol on port 8443. . It is responsible for managing terraform, ansible, building artifact and pushing it to the [Jfrog](https://jfrog.iguana-devops.pp.ua) artifactory.

In folder [Jenkins](./Jenkins) placed four jenkinsfiles:
-  [Jenkinsfile_terraform](./Jenkinsfile_terraform) - manage terraform for building the infrasrutcture
-  [Jenkinsfile_ansible](./Jenkinsfile_ansible) - manage ansible playbook for configuring infrasructure
-  [Jenkinsfile_terraform_destroy](./Jenkinsfile_terraform_destroy) - manage terraform for destroying the infrasrutcture
-  [Jenkinsfile_build](./Jenkinsfile_build) - make build of application an push it to the Jfrog Artifactory

