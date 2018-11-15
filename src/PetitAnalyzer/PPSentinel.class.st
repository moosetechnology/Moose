Class {
	#name : #PPSentinel,
	#superclass : #PPEpsilonParser,
	#classInstVars : [
		'instance'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPSentinel class >> instance [
	^ instance ifNil: [ instance := self new ]
]
