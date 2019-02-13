"
A RTVisitor is a simple visitor.

"
Class {
	#name : #RTVisitor,
	#superclass : #RTObject,
	#instVars : [
		'names'
	],
	#category : #'Roassal2-Core'
}

{ #category : #initialization }
RTVisitor >> initialize [
	super initialize.
	names := Dictionary new.
]

{ #category : #utils }
RTVisitor >> nameFor: anElement [
	"Author: milton mamani
	Date: 12/05/2015
	There are several shapes and edges, to handle the relations between the shapes RTVisitor
	uses a dictionary(names) to asign one unique id to that shape"
	(names includesKey: anElement) 
		ifTrue: [ ^ names at: anElement ] 
		ifFalse: [ 
			| n |
			n := names size printStringHex.
			names at: anElement put: n.
			^ n.]
]

{ #category : #helpers }
RTVisitor >> number: n [
	
	| f |
	^ n isNaN 
		ifTrue: ['NaN']
		ifFalse: [ n isInteger 
			ifTrue: [ n asString ]
			ifFalse: [ f := n asFloat.
				f fractionPart isZero 
					ifTrue: [ f rounded asString ]
					ifFalse: [ f asString ] ]  ]
		
]

{ #category : #visitor }
RTVisitor >> visitCanvas: aCanvas [
]

{ #category : #visitor }
RTVisitor >> visitView: aView [
	aView canvas accept: self
]
