# Jenkins #

Jenkins is running in separate VM using https protocol on port 8443. It is responsible for managing terraform and ansible.

In folder [Jenkins](./Jenkins) placed three jenkinsfiles:
-  [Jenkinsfile_terraform](./Jenkinsfile_terraform) - manage terraform for building the infrasrutcture
-  [Jenkinsfile_ansible](./Jenkinsfile_ansible) - manage ansible playbook for configuring infrasructure
- [Jenkinsfile_terraform_destroy](./Jenkinsfile_terraform_destroy) - manage terraform for destroying the infrasrutcture
