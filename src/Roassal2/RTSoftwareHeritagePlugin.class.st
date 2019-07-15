Class {
	#name : #RTSoftwareHeritagePlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTSoftwareHeritagePlugin >> description [
	^ 'Load: NeoJSON, SoftwareHeriatage Package and a RoassalScript to explore open projects from software heriatage'
]

{ #category : #hooks }
RTSoftwareHeritagePlugin >> execute [
	Gofer new 
		smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
		package: 'ConfigurationOfNeoJSON'; load.
	(Smalltalk at: #ConfigurationOfNeoJSON) loadBleedingEdge.
	
	Gofer new 
		smalltalkhubUser: 'azazael' project: 'BeyondRoassal';
		package: 'softwareheritage'; load.
]

{ #category : #hooks }
RTSoftwareHeritagePlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'softwareheritage'
]

{ #category : #hooks }
RTSoftwareHeritagePlugin >> label [
	^ 'Software Heritage'
]
