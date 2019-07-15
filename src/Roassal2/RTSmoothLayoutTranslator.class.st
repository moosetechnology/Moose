"
A ROSmoothLayoutTranslator is xxxxxxxxx.

Instance Variables
	move:		<Object>
	nbCycles:		<Object>

move
	- xxxxx

nbCycles
	- xxxxx

"
Class {
	#name : #RTSmoothLayoutTranslator,
	#superclass : #RTLayoutTranslator,
	#instVars : [
		'move',
		'nbCycles'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTSmoothLayoutTranslator >> hasCompleted [
	"Return true if all the translation has completed"
	^ move hasCompleted
]

{ #category : #'initialize-release' }
RTSmoothLayoutTranslator >> initialize [ 
	super initialize.
	
	"The amount of seconds we need to complete the transition"
	nbCycles := 2
]

{ #category : #accessing }
RTSmoothLayoutTranslator >> nbCycles: anInteger [
	"Set the number of cycle we need to complete the transition"
	nbCycles := anInteger 
]

{ #category : #hook }
RTSmoothLayoutTranslator >> translate: element to: newPosition [
	move := RTLinearMove new
					to: newPosition during: nbCycles on: element.

	view ifNil: [ self view: element view ].
	view addAnimation: move.
]
