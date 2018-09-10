"
I describe magnitudes which are greater than my required value.

	10 should beGreaterThan: 1

My instances can be created by 

	SpecOfGreaterMagnitude than: 1
"
Class {
	#name : #SpecOfGreaterMagnitude,
	#superclass : #SpecOfMagnitudeOrder,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfGreaterMagnitude >> basicMatches: anObject [ 
	isStrong ifTrue: [^anObject > requiredValue].
	
	^anObject >= requiredValue 
]

{ #category : #displaying }
SpecOfGreaterMagnitude >> clauseKeyword [
	^self isStrong ifTrue: [ '>' ] ifFalse: [ '>=' ]
]
