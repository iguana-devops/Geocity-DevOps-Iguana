# Geo citizen Application

## Table of contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Usage](#usage)
- [Setup Instructions](#setup-instructions)
- [Contributing](#contributing)

## Introduction

Welcome to the Geo citizen Application! This application was created to improve our lives. Here you can give reviews, leave feedback, write about a specific problem, or provide useful information about any point on the map. All you need to do is register as a user and start creating valuable content.

## Technologies Used

- **Java 1.8:** A widely-used programming language known for its portability across platforms and extensive libraries.
- **Maven 3.6.3:** A build automation tool primarily used for Java projects to manage dependencies and streamline the build process.
- **Apache Tomcat 9.0.89:** An open-source web server and servlet container used to deploy and serve Java web applications.
- **HTML and JavaScript:** Standard markup and scripting languages used for frontend development, providing interactivity and dynamic behavior.
- **PostgreSQL:** A powerful, open-source relational database management system known for its robustness and performance.
- **VirtualBox:** An open-source virtualization software that allows you to run multiple operating systems simultaneously on a single physical machine.

## Requirements

Geo citizen Application requires VirtualBox ([follow the link to install](https://www.virtualbox.org/wiki/Downloads)), PostgreSQL ([follow to link to install](https://www.postgresql.org/download/)).

## Usage

- Visit the main page.
- Choose **"Login"**.
- If you have an account choose **"Sign in"**, if not choose **"Sign up"**. If you forget your password choose **"Recover the password"** .
- When you sign in - choose any point on map and leave you first review. <br>

![image](https://github.com/Iguana2024/Geocity-DevOps-Iguana/blob/IGD-94-Create-a-common-runbook/resources/img/Home_page.png)
![image](https://github.com/Iguana2024/Geocity-DevOps-Iguana/blob/IGD-94-Create-a-common-runbook/resources/img/sign_in.png)
![image](https://github.com/Iguana2024/Geocity-DevOps-Iguana/blob/IGD-94-Create-a-common-runbook/resources/img/sign_up.png) -->

## Setup Instructions

1. **Clone the repository:**

```
git clone https://github.com/Iguana2024/Geocity-DevOps-Iguana.git
```

2. **Create 'password.txt' file**

- Navigate to the parent directory

```bash
cd ..
```

- **Create the password.txt file** and add your password to it. Replace YourPasswordHere with the actual password you want to use.

```bash
echo "YourPasswordHere" > password.txt
```

3. **Install virtual machines with all necessary software by using Vagrantfile:**

- Navigate to the project's directory containing Vagrantfile:

```bash
cd Geocity-DevOps-Iguana
```

- Initialize the Vagrant environment by running the following command:

```bash
vagrant up
```

[Get the guidelines](https://developer.hashicorp.com/vagrant/docs/cli) if you need some help with Vagrantfile.

4. Access the application in a web browser at (http://192.168.101.20:8080/citizen)

[swagger](http://http://192.168.101.20:8080/citizen/swagger-ui.html)

[heroku](https://geocitizen.herokuapp.com)

## Troubleshooting Guide

This section provides troubleshooting steps for common issues that may arise during setup or usage of the project.

### VirtualBox setup issues

- **Issue:** When launching virtual machines, the necessary software is not being installed.
- **Solution:**

```bash
dos2unix provision_backend.sh
```
```bash
dos2unix provision_database.sh
```

- **Issue:** The virtual machines are not launching, and the logs show the following message: "Create the password.txt file".
- **Solution:** Check if you have created the password.txt file at the parent directory.


## Contributing

1. Fork the repository.
2. Create a new branch:

```bash
git checkout -b new-feature
```
3. Make your changes.
4. Push your branch:

```bash
git push origin new-feature
```
5. Create a pull request.
