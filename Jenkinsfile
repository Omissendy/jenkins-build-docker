node {
    def registryProjet = 'registry.gitlab.com/xavki/presentationns-jenkins'
    def IMAGE = "${registryProjet}:version-${env.BUILD_ID}"
    
    stage('Clone') {
        git 'https://github.com/Omissendy/jenkins-build-docker.git'
    }
    
    def img
    stage('Build') {
        img = docker.build(IMAGE, '.')
    }
    
    stage('Run') {
        img.withRun("--name run-${BUILD_ID} -p 8081:80") { c ->
            sh 'sleep 5'
            sh 'curl -f http://localhost:8081 || (echo "Erreur: le conteneur ne répond pas !" && exit 1)'
        }
    }
    
    stage('Push') {
        docker.withRegistry('https://registry.gitlab.com', 'reg1') {
            img.push('latest')
            img.push()
        }
    }
}
