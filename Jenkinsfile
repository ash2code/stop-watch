pipeline {
    agent any

    stages {
        stage("github clone")
        {
            steps {
                git branch: 'main', url: 'https://github.com/ash2code/stop-watch.git'
            }
        }
        stage("build docker image")
        {
            steps {
                script {
                    sh "docker build -t ash2code/javascriptstopwatch ."
                }   
            }
        }
        stage("docker container run")
        {
            steps {
                script {
                    sh "docker container run -dt -p 8083:80 ash2code/javascript-stopwatch"
                }
            }
        }
        stage("docker login")
        {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'f71a6b5c-de03-4a9d-90bb-6420174f35d2', usernameVariable: ‘DOCKER_USERNAME’, passwordVariable: ‘DOCKER_PASSWORD’)]) 
                    {
                        sh “docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD”
                    } 
                }
            }
        }
    }
}
