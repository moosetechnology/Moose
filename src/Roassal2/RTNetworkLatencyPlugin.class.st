Class {
	#name : #RTNetworkLatencyPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTNetworkLatencyPlugin >> description [
	^ 'NetworkLatency shows the network latency of 145 cities, from 70 countries'
]

{ #category : #hooks }
RTNetworkLatencyPlugin >> execute [
	Gofer new
		smalltalkhubUser: 'merino'
			project: 'NetworkLatency';
		package: 'ConfigurationOfNetworkLatency';
		load.
	(Smalltalk at: #ConfigurationOfNetworkLatency)
		loadDefault.
		
	(Smalltalk at: #NLVisualise) new open
]

{ #category : #testing }
RTNetworkLatencyPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'ConfigurationOfNetworkLatency'
 
]

{ #category : #hooks }
RTNetworkLatencyPlugin >> label [
	^ 'Network Latency application'
]
