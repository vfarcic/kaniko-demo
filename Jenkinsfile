pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  name: kaniko
  namespace: jenkins-system
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    volumeMounts:
      - name: kaniko-secret
        mountPath: /kaniko/.docker
    command:
    - /busybox/cat
    tty: true
    restartPolicy: Never
  volumes:
    - name: kaniko-secret
      secret:
        secretName: docker-credentials
        items:
          - key: .dockerconfigjson
            path: config.json

"""
    }
  }
  stages {
    stage('Checkout'){
      steps{
        git 'https://github.com/podinfo-project/kaniko-demo.git'
      }
    }
    stage('build image') {
      steps {
        container(name: "kaniko", shell: '/busybox/sh'){
          sh 'pwd'
          sh """
          #!/busybox/sh 
            /kaniko/executor --dockerfile Dockerfile --context `pwd`/ --verbosity info --insecure --skip-tls-verify --destination 192.170.200.2:5509/beavershub/devops-toolkit:1.0.0
          """
        }
      }
    }
  }
}
