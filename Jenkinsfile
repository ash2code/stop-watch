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
                    sh "docker build -t ash2code/javascript-stopwatch ."
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
    }
}
