"
This class is a SAX2ElementHandler that handles #characters: events. Sending #characters returns the complete character data of the element as a string.
"
Class {
	#name : #SAX2ElementCharacterHandler,
	#superclass : #SAX2ElementHandler,
	#instVars : [
		'characters'
	],
	#category : #'XML-Parser'
}

{ #category : #accessing }
SAX2ElementCharacterHandler >> characters [
	"This returns the combined #characters: events handled by the receiver
	as a string."

	^ characters ifNil: [characters := '']
]

{ #category : #'handling - content' }
SAX2ElementCharacterHandler >> characters: aString [
	"building the string this way is simpler and performs as well in tests
	as using a write stream"
	characters :=
		characters
			ifNil: [aString]
			ifNotNil: [characters, aString]
]
