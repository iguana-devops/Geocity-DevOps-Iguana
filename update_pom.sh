#!/bin/bash

POM_FILE="pom.xml"

if [ ! -f "$POM_FILE" ]; then
  echo "File $POM_FILE does not exist."
  exit 1
fi

sed -i 's|<springframework.social.facebook.version>3.0.0.M3</springframework.social.facebook.version>|<springframework.social.facebook.version>2.0.3.RELEASE</springframework.social.facebook.version>|' "$POM_FILE"

sed -i 's|<artifactId>servlet-api</artifactId>|<artifactId>javax.servlet-api</artifactId>|' "$POM_FILE"

if grep -q '<springframework.social.facebook.version>2.0.3.RELEASE</springframework.social.facebook.version>' "$POM_FILE" && grep -q '<artifactId>javax.servlet-api</artifactId>' "$POM_FILE"; then
  echo "Updates applied successfully."
else
  echo "Failed to apply updates."
fi
