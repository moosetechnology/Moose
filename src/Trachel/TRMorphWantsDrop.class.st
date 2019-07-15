Class {
	#name : #TRMorphWantsDrop,
	#superclass : #TRMorphDropEvent,
	#instVars : [
		'whenHandledBlock'
	],
	#category : #'Trachel-Events'
}

{ #category : #events }
TRMorphWantsDrop >> handledBy: anElement [
	whenHandledBlock value: anElement
]

{ #category : #events }
TRMorphWantsDrop >> whenHandled: aBlock [
	"For TRMorph internal tracking of who actually handled the morph"
	whenHandledBlock := aBlock
]
