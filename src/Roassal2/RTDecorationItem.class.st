Class {
	#name : #RTDecorationItem,
	#superclass : #RTObject,
	#instVars : [
		'shape',
		'tooltip',
		'action'
	],
	#category : #'Roassal2-Core'
}

{ #category : #accessing }
RTDecorationItem >> action [
	^ action
]

{ #category : #accessing }
RTDecorationItem >> action: aOneArgBlock [
	action := aOneArgBlock
]

{ #category : #accessing }
RTDecorationItem >> element [
	^ shape element
]

{ #category : #accessing }
RTDecorationItem >> shape: aRTShape [
	shape := aRTShape
]

{ #category : #accessing }
RTDecorationItem >> tooltip [
	^ tooltip
]

{ #category : #accessing }
RTDecorationItem >> tooltip: aString [ 
	tooltip := aString
]
