"
A ROValueLinearNormalizer is xxxxxxxxx.

Instance Variables
	maxScale:		<Object>
	minScale:		<Object>

maxScale
	- xxxxx

minScale
	- xxxxx

"
Class {
	#name : #RTValueLinearNormalizer,
	#superclass : #RTNLinearNormalizer,
	#instVars : [
		'minScale',
		'maxScale'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #'initialize-release' }
RTValueLinearNormalizer >> initialize [

	super initialize.
	minScale := 0.
	maxScale := 1.
]

{ #category : #accessing }
RTValueLinearNormalizer >> maxScale [

	^maxScale.
]

{ #category : #accessing }
RTValueLinearNormalizer >> maxScale: aValue [

	^maxScale := aValue.
]

{ #category : #accessing }
RTValueLinearNormalizer >> minScale [

	^minScale.
]

{ #category : #accessing }
RTValueLinearNormalizer >> minScale: aValue [

	minScale := aValue.
]

{ #category : #accessing }
RTValueLinearNormalizer >> rtValue: anEntity [
	
	"Normalize value based on minimum and maximum value."
	| value slope |
	value := self command rtValue: anEntity.
	slope := self slope: anEntity.
	^ ((value abs * slope) + self maxScale - ((self maximumValue: anEntity) asFloat * slope)) asInteger
]

{ #category : #'as yet unclassified' }
RTValueLinearNormalizer >> slope: anEntity [
	
	^ (maxScale - minScale) / ((self maximumValue: anEntity) asFloat - (self minimumValue: anEntity )asFloat).
]
