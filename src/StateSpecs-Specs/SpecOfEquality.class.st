"
I describe all objects which are equal to my required value.

	'object' should equal: 'another object'

My instances can be created by 

	SpecOfEquality to: 1.
	
I am supposed to check logical equalence between two objects. 
In case of collections it means that I not check order of elements. I only check that both collection contains equal  elements. To describe ordered equality of collections use SpecOfCollectionOrderedEquality (look at it comment).

I use special message to compared objects:
	eachObject checkStateSpecsEqualityTo: anotherObject
"
Class {
	#name : #SpecOfEquality,
	#superclass : #SpecOfObjectValue,
	#category : 'StateSpecs-Specs'
}

{ #category : #converting }
SpecOfEquality >> asSimpleValue [ 
	^requiredValue
]

{ #category : #testing }
SpecOfEquality >> basicMatches: anObject [ 
	^anObject checkStateSpecsEqualityTo: requiredValue 
]

{ #category : #displaying }
SpecOfEquality >> clauseKeyword [
	^'equal'
]

{ #category : #testing }
SpecOfEquality >> isSimpleValue [ 
	^true
]
