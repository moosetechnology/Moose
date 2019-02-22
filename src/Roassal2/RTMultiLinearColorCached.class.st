Class {
	#name : #RTMultiLinearColorCached,
	#superclass : #RTMultiLinearColor,
	#instVars : [
		'cache',
		'sizeBeforeReset'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #initialization }
RTMultiLinearColorCached >> initialize [
	super initialize.
	self resetCache.
	sizeBeforeReset := 800
]

{ #category : #accessing }
RTMultiLinearColorCached >> level: f [
	cache size >= sizeBeforeReset ifTrue: [ self resetCache ].
	^ cache at: f ifAbsentPut: [ super level: f ]
]

{ #category : #actions }
RTMultiLinearColorCached >> resetCache [
	cache := Dictionary new
]
