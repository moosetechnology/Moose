"
A RTKiviatElement is one element in the view. It has a reference on its kiviatNode, the name of the metric, its value and it position.

Instance Variables
	kiviatNode:		<Object>
	metric:		<Object>
	position:		<Object>
	value:		<Object>

kiviatNode
	- xxxxx

metric
	- xxxxx

position
	- xxxxx

value
	- xxxxx

"
Class {
	#name : #RTKiviatElement,
	#superclass : #RTObject,
	#instVars : [
		'kiviatNode',
		'metric',
		'value',
		'position'
	],
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #initialization }
RTKiviatElement >> initialize [
	super initialize.
]

{ #category : #accessing }
RTKiviatElement >> kiviatNode [
	^ kiviatNode
]

{ #category : #accessing }
RTKiviatElement >> kiviatNode: anRTKiviatNode [
	kiviatNode := anRTKiviatNode
]

{ #category : #accessing }
RTKiviatElement >> metric [
 ^ metric
]

{ #category : #accessing }
RTKiviatElement >> metric: aBlockOrSymbol [
 metric:= aBlockOrSymbol
]

{ #category : #accessing }
RTKiviatElement >> position [
	^ position
]

{ #category : #accessing }
RTKiviatElement >> position: aPoint [
	position:= aPoint
]

{ #category : #accessing }
RTKiviatElement >> value [
	^ value
]

{ #category : #accessing }
RTKiviatElement >> value: anObject [
	value := anObject
]
