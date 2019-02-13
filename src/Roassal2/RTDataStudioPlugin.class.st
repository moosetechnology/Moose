Class {
	#name : #RTDataStudioPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTDataStudioPlugin >> description [
	^ 
'Load extension of GT to support a flexible way to manipulate data.
Currently it is still very early work'
]

{ #category : #hooks }
RTDataStudioPlugin >> execute [
	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'DataStudio';
		configurationOf: 'DataStudio'; 
		loadBleedingEdge.
]

{ #category : #testing }
RTDataStudioPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'DataStudio'
 
]

{ #category : #hooks }
RTDataStudioPlugin >> label [
	^ 'Data Studio'
]
