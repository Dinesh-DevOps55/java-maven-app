pipeline {
    agent any
    tools {
        maven 'maven-3.9'
    }
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    gv.buildJar()  // Call buildJar method from the loaded script
                }
            }
        }

        stage("build image") {
            steps {
                script {
                    gv.buildImage()  // Call buildImage method from the loaded script
                }
            }
        }

        stage("deploy") {
            steps {
                script {
                    gv.deployApp()  // Call deployApp method from the loaded script
                }
            }
        }
    }
}
