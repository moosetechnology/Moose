Class {
	#name : #GRSequentialPrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'parts'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #operators }
GRSequentialPrinter >> , aConverter [
	parts add: aConverter
]

{ #category : #initialization }
GRSequentialPrinter >> initialize [
	super initialize.
	parts := OrderedCollection new
]

{ #category : #printing }
GRSequentialPrinter >> print: anObject on: aStream [ 
	parts do: [ :each | each print: anObject on: aStream ]
]
