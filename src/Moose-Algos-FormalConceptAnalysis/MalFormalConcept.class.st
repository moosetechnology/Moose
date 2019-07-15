Class {
	#name : #MalFormalConcept,
	#superclass : #Object,
	#instVars : [
		'context',
		'intent',
		'extent'
	],
	#category : #'Moose-Algos-FormalConceptAnalysis'
}

{ #category : #'instance creation' }
MalFormalConcept class >> on: formalContext extent: objectsMask intent: attributesMask [
	
	^(self new on: formalContext)
		extent: objectsMask;
		intent: attributesMask;
		yourself
]

{ #category : #accessing }
MalFormalConcept >> attributes [
	
	^context attributes selectMask: intent
]

{ #category : #accessing }
MalFormalConcept >> extent [
	
	^extent
]

{ #category : #'initialize-release' }
MalFormalConcept >> extent: anObject [
	
	extent := anObject
]

{ #category : #accessing }
MalFormalConcept >> intent [
	
	^intent
]

{ #category : #'initialize-release' }
MalFormalConcept >> intent: anObject [
	
	intent := anObject
]

{ #category : #accessing }
MalFormalConcept >> numAttributes [
	
	^intent cardinality
]

{ #category : #accessing }
MalFormalConcept >> numObjects [
	
	^extent cardinality
]

{ #category : #accessing }
MalFormalConcept >> objects [
	
	^context objects selectMask: extent
]

{ #category : #'initialize-release' }
MalFormalConcept >> on: formalContext [
	
	context := formalContext
]

{ #category : #printing }
MalFormalConcept >> printOn: stream [
	
	stream
		nextPut: ${;
		nextPut: ${.
	self objects
		do: [:each | stream print: each]
		separatedBy:
			[stream
				nextPut: $,;
				space].
	stream
		nextPut: $};
		nextPut: $,;
		space;
		nextPut: ${.
	self attributes
		do: [:each | stream print: each]
		separatedBy:
			[stream
				nextPut: $,;
				space].
	stream
		nextPut: $};
		nextPut: $}
]
