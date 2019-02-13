Class {
	#name : #RTStackBarRow,
	#superclass : #RTObject,
	#instVars : [
		'values',
		'title'
	],
	#category : #'Roassal2-Builder-StackBarPlot'
}

{ #category : #'accessing - computed' }
RTStackBarRow >> numberOfValues [
	^ values size
]

{ #category : #accessing }
RTStackBarRow >> title [
	^ title
]

{ #category : #accessing }
RTStackBarRow >> title: aString [ 
	title := aString
]

{ #category : #'accessing - computed' }
RTStackBarRow >> totalSum [
	^ values sum
]

{ #category : #accessing }
RTStackBarRow >> values [
	^ values
]

{ #category : #accessing }
RTStackBarRow >> values: aCollection [ 
	values := aCollection
]
