"
I describe magnitudes which are less than my required value.

	1 should beLessThan: 10

My instances can be created by 

	SpecOfLesserMagnitude than: 10
"
Class {
	#name : #SpecOfLesserMagnitude,
	#superclass : #SpecOfMagnitudeOrder,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfLesserMagnitude >> basicMatches: anObject [ 
	isStrong ifTrue: [^anObject < requiredValue].
	
	^anObject <= requiredValue 
]

{ #category : #displaying }
SpecOfLesserMagnitude >> clauseKeyword [
	^self isStrong ifTrue: [ '<' ] ifFalse: [ '<=' ]
]
