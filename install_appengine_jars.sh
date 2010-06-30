#!/bin/bash

echo -e "Appengine version: \c "
read  version


mvn install:install-file -Dfile=$1/lib/impl/appengine-api-labs.jar \
                         -DgroupId=com.google.appengine \
                         -DartifactId=appengine-api-labs \
                         -Dversion=$version \
                         -Dpackaging=jar \
                         -DgeneratePom=true \
                         -DcreateChecksum=true
                         
mvn install:install-file -Dfile=$1/lib/impl/appengine-api.jar \
                         -DgroupId=com.google.appengine \
                         -DartifactId=appengine-api \
                         -Dversion=version \
                         -Dpackaging=jar \
                         -DgeneratePom=true \
                         -DcreateChecksum=true
                        
mvn install:install-file -Dfile=$1/lib/testing/appengine-testing.jar \
                         -DgroupId=com.google.appengine \
                         -DartifactId=appengine-testing \
                         -Dversion=$version \
                         -Dpackaging=jar \
                         -DgeneratePom=true \
                         -DcreateChecksum=true
                         
mvn install:install-file -Dfile=$1/lib/impl/appengine-api-stubs.jar \
                         -DgroupId=com.google.appengine \
                         -DartifactId=appengine-api-stubs \
                         -Dversion=$version \
                         -Dpackaging=jar \
                         -DgeneratePom=true \
                         -DcreateChecksum=true                        
                        
mvn install:install-file -Dfile=$1/lib/shared/appengine-local-runtime-shared.jar \
                         -DgroupId=com.google.appengine \
                         -DartifactId=appengine-local-runtime-shared \
                         -Dversion=$version \
                         -Dpackaging=jar \
                         -DgeneratePom=true \
                         -DcreateChecksum=true 
                         
cp -r ~/.m2/repository/com/google/appengine/* repository/com/google/appengine  

git add .

git commit -m 'Adding/updating appengine $version' .

git push origin master
                      