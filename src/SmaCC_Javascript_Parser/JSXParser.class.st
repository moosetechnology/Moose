Class {
	#name : #JSXParser,
	#superclass : #JSParser,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #'file types' }
JSXParser class >> fileExtension [
	^ '.jsx'
]

{ #category : #private }
JSXParser >> addActionsFor: anInteger to: aCollection [
	super addActionsFor: anInteger to: aCollection.
	anInteger = scanner ltId
		ifTrue: [ super addActionsFor: scanner jsxLTId to: aCollection ]
]
