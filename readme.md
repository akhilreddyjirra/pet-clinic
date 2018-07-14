This branch is for deploying war/jar packages to remote nexus arifactory 

Requisites:

##### 1. Nexus 3 artifactory

##### 2. Jenkins with version plugin 

##### 3.  Jenkins shell executor 

    export M2_HOME=/usr/local/src/apache-maven
    export``PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/src/apache-maven/bin
    echo $BUILD_VERISON
    mvn clean versions:set -DnewVersion=$BUILD_VERISON
    mvn package -DskipTests
    cd $WORKSPACE/target 
    mvn -s $MAVEN_SETTINGS \
        deploy:deploy-file -DgroupId=org.springframework.samples \
        -DartifactId=spring-petclinic \
        -Dversion=$BUILD_VERISON \
        -Dpackaging=jar \
        -Dfile=spring-petclinic-$BUILD_VERISON.jar \
        -DgeneratePom=true \
        -DrepositoryId=maven-snapshots \
        -Durl=http://{nexusurl}/nexus/repository/maven-snapshots/ 
