#!/user/bin/env groovy

@Library('jenkins-shared-library')
def gv

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
                    buildJar() // name of the file in REPO jenkins-shared-library > vars
                }
            }
        }
        stage("build image and push image") {
            steps {
                script {
                    buildImage 'dineshdocker55/demo-app:jma-3.0'
                    dockerLogin()
                    dockerPush 'dineshdocker55/demo-app:jma-3.0'
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }
}
