Class {
	#name : #RTMultiPilesPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTMultiPilesPlugin >> description [
	^ 'MultiPile support'
]

{ #category : #hooks }
RTMultiPilesPlugin >> execute [

	Gofer new 
		smalltalkhubUser: 'abergel' project: 'GitLogExtractor';
		package: 'GitLogExtractor'; 
		load.


	Gofer new 
		smalltalkhubUser: 'AlisonFernandez' project: 'MultiPiles';
		package: 'MultiPiles'; 
		load.

	Gofer new 
		smalltalkhubUser: 'AlisonFernandez' project: 'MMatrix';
		package: 'MultiPileMatrix'; 
		load.

]

{ #category : #testing }
RTMultiPilesPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'MultiPiles'
 
]

{ #category : #hooks }
RTMultiPilesPlugin >> label [
	^ 'Small MultiPiles (Dependency Structure Visualization)'
]
