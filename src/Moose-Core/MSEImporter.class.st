Class {
	#name : #MSEImporter,
	#superclass : #FMImporter,
	#category : #'Moose-Core'
}

{ #category : #'as yet unclassified' }
MSEImporter >> endDocument [
	"This method overrides the default FMImporter to allow for dangling references"
	
	self assert: [ stack isEmpty ].
	stack := nil.
	model addAll: elements.
]
