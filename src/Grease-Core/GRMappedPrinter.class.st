Class {
	#name : #GRMappedPrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'next',
		'block'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #'instance creation' }
GRMappedPrinter class >> block: aBlock next: aPrinter [
	^ self new 
		block: aBlock;
		next: aPrinter;
		yourself
]

{ #category : #accessing }
GRMappedPrinter >> block: aBlock [
	block := aBlock
]

{ #category : #initialization }
GRMappedPrinter >> initialize [
	super initialize.
	self block: [ :value | value ]
]

{ #category : #accessing }
GRMappedPrinter >> next: aPrinter [
	next := aPrinter
]

{ #category : #printing }
GRMappedPrinter >> print: anObject on: aStream [
	next print: (block value: anObject) on: aStream
]
