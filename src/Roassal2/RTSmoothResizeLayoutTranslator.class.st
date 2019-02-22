"
I am a RTSmoothLayoutTranslator that also resizes the elements
"
Class {
	#name : #RTSmoothResizeLayoutTranslator,
	#superclass : #RTSmoothLayoutTranslator,
	#instVars : [
		'resize'
	],
	#category : #'Roassal2-Interactions-MorphingView'
}

{ #category : #testing }
RTSmoothResizeLayoutTranslator >> hasCompleted [
	"Return true if all the translation has completed"
	^ super hasCompleted and: [ resize hasCompleted  ]
]

{ #category : #hook }
RTSmoothResizeLayoutTranslator >> resize: element to: newExtent [

	resize := RTResizeMove new toExtent: newExtent during: nbCycles on: element.

	view ifNil: [ self view: element view ].
	view addAnimation: resize.
]
