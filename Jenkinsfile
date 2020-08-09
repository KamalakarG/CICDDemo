pipeline {
    agent any 
    stages {
        stage('Checkout') {
            steps {
                checkout scm 
            }
        }
	
	stage('Running Tests') {
            steps {
                parallel (
          		"Unit Tests": {
            			sh 'echo "Unit Tests"'
            			sh 'fastlane tests'
          		},
          		"UI Automation": {
            			sh 'echo "UI Automation"'
          		}
        	) 
            }
        }

	stage('Publish TestFlight') {
		steps {
			sh 'fastlane beta'
		}
	}
    }
}