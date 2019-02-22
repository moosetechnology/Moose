Class {
	#name : #RTCPPAnalysisPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTCPPAnalysisPlugin >> description [
	^ 'Load a simple model for analyzing C and CPP source code application'
]

{ #category : #hooks }
RTCPPAnalysisPlugin >> execute [
	self inform: 'This is obsolete. You need to load DataStudio'
"	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
		package: 'Roassal2-Plugins-CProjectVisualizer'; 
		load."
]

{ #category : #testing }
RTCPPAnalysisPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'Roassal2-Plugins-CProjectVisualizer'
 
]

{ #category : #hooks }
RTCPPAnalysisPlugin >> label [
	^ 'simple C and C++ analyzer [obsolete]'
]
