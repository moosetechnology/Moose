Class {
	#name : #RTNeoPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTNeoPlugin >> description [
	^ 'Neo offers a JSON and CSV parsers. Both parsers are highly stable, fast, and well supported.'
]

{ #category : #hooks }
RTNeoPlugin >> execute [
	Gofer new 
		smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
		package: 'ConfigurationOfNeoJSON'; load.
	(Smalltalk at: #ConfigurationOfNeoJSON) loadBleedingEdge.
	
	Gofer new 
		smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
		package: 'ConfigurationOfNeoCSV'; load.
	(Smalltalk at: #ConfigurationOfNeoCSV) loadBleedingEdge.
]

{ #category : #testing }
RTNeoPlugin >> isLoaded [
	^ (RPackageOrganizer default includesPackageNamed: 'Neo-JSON-Core') and: [ RPackageOrganizer default includesPackageNamed: 'Neo-CSV-Core' ]
 
]

{ #category : #hooks }
RTNeoPlugin >> label [
	^ 'Neo JSON and CSV parser'
]
