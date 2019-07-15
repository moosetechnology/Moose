Class {
	#name : #GRPluggablePrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'block'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #'instance creation' }
GRPluggablePrinter class >> on: aBlock [
	^ self new block: aBlock
]

{ #category : #accessing }
GRPluggablePrinter >> block: aBlock [
	block := aBlock
]

{ #category : #initialization }
GRPluggablePrinter >> initialize [
	super initialize.
	self block: [ :value | String new ]
]

{ #category : #printing }
GRPluggablePrinter >> print: anObject on: aStream [
	aStream nextPutAll: (block value: anObject)
]
