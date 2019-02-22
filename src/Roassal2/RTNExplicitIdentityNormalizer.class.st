"
A RONExplicitIdentityNormalizer is xxxxxxxxx.

Instance Variables
	colors:		<Object>
	defaultColor:		<Object>

colors
	- xxxxx

defaultColor
	- xxxxx

"
Class {
	#name : #RTNExplicitIdentityNormalizer,
	#superclass : #RTNIdentityNormalizer,
	#instVars : [
		'colors',
		'defaultColor'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #'instance creation' }
RTNExplicitIdentityNormalizer class >> withCommand: aBlock withColors: aCollection withDefaultColor: aColor [
	
	^(self withCommand: aBlock)
		colors: aCollection;
		defaultColor: aColor;
		yourself
]

{ #category : #accessing }
RTNExplicitIdentityNormalizer >> colors [
	
	^colors
]

{ #category : #accessing }
RTNExplicitIdentityNormalizer >> colors: anObject [
	
	colors := anObject
]

{ #category : #accessing }
RTNExplicitIdentityNormalizer >> defaultColor [
	
	^defaultColor
]

{ #category : #accessing }
RTNExplicitIdentityNormalizer >> defaultColor: anObject [
	
	defaultColor := anObject
]

{ #category : #private }
RTNExplicitIdentityNormalizer >> nextColor [
	
	colorIndex := colorIndex + 1.
	^colorIndex > self colors size
		ifTrue: [ self defaultColor ]
		ifFalse: [ self colors at: colorIndex ]
]
