"
A RTKiviatMetric represent an axis in the view and is used to know where to place an element in the view according to a value.

Instance Variables
	maxSize:		<Object>
	maxValue:		<Object>
	minValue:		<Object>
	modelBlock:		<Object>

maxSize
	- xxxxx

maxValue
	- xxxxx

minValue
	- xxxxx

modelBlock
	- xxxxx

"
Class {
	#name : #RTKiviatMetric,
	#superclass : #RTObject,
	#instVars : [
		'maxSize',
		'modelBlock',
		'minValue',
		'maxValue',
		'named',
		'block',
		'angle'
	],
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #accessing }
RTKiviatMetric >> block [
"This block is about values of metric"
	^ block 
]

{ #category : #accessing }
RTKiviatMetric >> block: aOneArgBlock [
"This block is about values of metric"
	block := aOneArgBlock 
]

{ #category : #private }
RTKiviatMetric >> defaultMaxSize [
	maxSize := 200
]

{ #category : #default }
RTKiviatMetric >> defaultModelBlock [
	self block: [ :v | (v@0) ].
]

{ #category : #initialization }
RTKiviatMetric >> initialize [
	super initialize.
	self defaultModelBlock.
	self defaultMaxSize.
	maxValue := 0.
	minValue := 0.
]

{ #category : #accessing }
RTKiviatMetric >> maxSize [
	^ maxSize
]

{ #category : #accessing }
RTKiviatMetric >> maxSize: aNumber [
	maxSize := aNumber.
]

{ #category : #accessing }
RTKiviatMetric >> maxValue [
	^ maxValue.
]

{ #category : #accessing }
RTKiviatMetric >> maxValue: aNumber [
	maxValue := aNumber.
]

{ #category : #accessing }
RTKiviatMetric >> minValue [
	^ minValue.
]

{ #category : #accessing }
RTKiviatMetric >> minValue: aNumber [
	minValue := aNumber.
]

{ #category : #accessing }
RTKiviatMetric >> modelBlock [
"this block is about axis rotation, size..."
	^ modelBlock 
]

{ #category : #accessing }
RTKiviatMetric >> modelBlock: aBlockOrSymbol [
"this block is about axis rotation, size..."
	modelBlock :=  aBlockOrSymbol
]

{ #category : #accessing }
RTKiviatMetric >> named [ 
	 ^ named 
]

{ #category : #accessing }
RTKiviatMetric >> named: aString [
	named := aString
]
