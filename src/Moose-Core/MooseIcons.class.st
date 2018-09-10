Class {
	#name : #MooseIcons,
	#superclass : #Object,
	#classInstVars : [
		'icons'
	],
	#category : #'Moose-Core'
}

{ #category : #utils }
MooseIcons class >> icons [
	^ icons ifNil: [icons := Dictionary new]
]

{ #category : #utils }
MooseIcons class >> resetIcons [
	icons := nil
]
