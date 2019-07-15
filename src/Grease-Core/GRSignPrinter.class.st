Class {
	#name : #GRSignPrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'negativePrinter',
		'positivePrinter'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #initialization }
GRSignPrinter >> initialize [
	super initialize.
	self negativePrinter: $-.
	self positivePrinter: nil
]

{ #category : #accessing }
GRSignPrinter >> negativePrinter: aPrinter [
	"The printer to be used when the number is negative."
	
	negativePrinter := aPrinter
]

{ #category : #accessing }
GRSignPrinter >> positivePrinter: aPrinter [
	"The printer to be used when the number is zero or positive."
	
	positivePrinter := aPrinter
]

{ #category : #printing }
GRSignPrinter >> print: anObject on: aStream [ 
	anObject negative
		ifTrue: [ negativePrinter print: anObject on: aStream ]
		ifFalse: [ positivePrinter print: anObject on: aStream ]
]
