"
I describe all objects which are identical to my required value.

	1 should be: 1

My instances can be created by 

	SpecOfIdentity to: 1
"
Class {
	#name : #SpecOfIdentity,
	#superclass : #SpecOfObjectValue,
	#category : 'StateSpecs-Specs'
}

{ #category : #accessing }
SpecOfIdentity class >> to: requiredValue [
	^self requiredValue: requiredValue
]

{ #category : #converting }
SpecOfIdentity >> asSimpleValue [ 
	^requiredValue
]

{ #category : #testing }
SpecOfIdentity >> basicMatches: anObject [ 
	^requiredValue == anObject
]

{ #category : #displaying }
SpecOfIdentity >> clauseKeyword [
	^'be'
]

{ #category : #testing }
SpecOfIdentity >> isSimpleValue [
	^true
]
