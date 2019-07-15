"
An interpolator a way to create lines in SVG
"
Class {
	#name : #RTLinePathBuilder,
	#superclass : #RTObject,
	#instVars : [
		'tension'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #testing }
RTLinePathBuilder >> closed [
	^ false.
]

{ #category : #public }
RTLinePathBuilder >> interpolate: points [
	
]

{ #category : #converting }
RTLinePathBuilder >> reverse [
	^ self.
]

{ #category : #'*Roassal2' }
RTLinePathBuilder >> rtValue: anArgument [
	| value |
	value := anArgument.
	(anArgument isKindOf: Association)
		ifTrue: [ 
			self tension: anArgument value.
			value := anArgument key. ].
	
	^ self interpolate: value.
]

{ #category : #public }
RTLinePathBuilder >> tension: aNumber [
	tension := aNumber
]
