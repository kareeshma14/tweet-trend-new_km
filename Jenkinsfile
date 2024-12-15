def registry = 'https://kareeshma.jfrog.io'

pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.9/bin:$PATH"
    }

    stages {
        stage("build") {
            steps {
                sh 'mvn clean deploy'
            }
        }
        
        stage("Jar Publish") {
            steps {
                script {
                    echo '<--------------- Jar Publish Started --------------->'
                    def server = Artifactory.server('artifact_cred')
                    def properties = "buildid=${env.BUILD_ID},commitid=${env.GIT_COMMIT}"
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "target/*.jar",
                                "target": "libs-release-local/com/valaxy/demo-workshop/${BUILD_ID}/",
                                "props": "${properties}",
                                "flat": "false"
                            }
                        ]
                    }"""
                    def buildInfo = Artifactory.newBuildInfo()
                    buildInfo.env.collect()
                    server.upload(uploadSpec, buildInfo)
                    server.publishBuildInfo(buildInfo)
                    echo '<--------------- Jar Publish Ended --------------->'
                }
            }
        }
    }
}
