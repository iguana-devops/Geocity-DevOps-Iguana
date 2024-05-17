# Vagrant Instructions
This guide will walk you through setting up a Vagrant environment.

## 1. Create `password.txt` File
- **Navigate to the parent directory**
```bash
cd ..
```
- **Create the password.txt file** and add your password to it. Replace YourPasswordHere with the actual password you want to use.
```bash
echo "YourPasswordHere" > password.txt
```
## 2. Run Vagrant
- **Navigate to the project's directory** containing Vagrantfile:
```bash
cd Geocity-DevOps-Iguana
```
- **Initialize the Vagrant environment** by running the following command:
```bash
vagrant up
```
### Summary
- **Create `password.txt`** in the parent directory with the desired password.
- **Navigate to the project directory** and run `vagrant up`.