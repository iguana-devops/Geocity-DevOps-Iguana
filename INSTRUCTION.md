


> Startup configuration instruction for backend and frontend(Ubuntu 22).

## Installing required packages
For correct work of the project you need to have following tools.

1. Java 8
    ```
    sudo apt install openjdk-8-jdk
    ```
2. Tomcat 9
    ```
    sudo apt install tomcat9
    ```
3. Maven
    ```
    sudo apt install maven
    ```
4. Nvm
    ```
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    ```
5. Node
    ```
    nvm install node 14
    ```

## Configuring repo
After all tools are installed clone the repo

1. Git
```
git clone https://github.com/Iguana2024/Geocity-DevOps-Iguana.git
```

### Navigate to src/main/resources/application.properties and change URL of the db and frontend to ip of your machine anad your db
### Navigate to front-end/src/main.js and chnge URL of the backend to your machine ip

Navigate into 'front-end' and run:


    npm install
    npm run build

Copy files from the dist dir to /src/main/webapp 

After that navigate to root and run


```
mvn clean install
```

After the build copy /target/citizen.war to /var/lib/tomcat9/webapps

```
sudo cp /target/citizen.war /var/lib/tomcat9/webapps
```
And also copy 'static' dir in 'front-end/dist' to /var/lib/tomcat9/webapps 

After that You should be able to see the page on the http://ip_of_your_machine:8080/citizen









