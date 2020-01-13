Class {
	#name : #MSEImporter,
	#superclass : #FMImporter,
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MSEImporter class >> isDeprecated [
	"Use FMImporter instead with the option #autorizeDandlingReferencesAtEnd."

	^ true
]

{ #category : #parsing }
MSEImporter >> endDocument [
	"This method overrides the default FMImporter to allow for dangling references"
	
	self assert: [ stack isEmpty ].
	stack := nil.
	model addAll: entities.
]
