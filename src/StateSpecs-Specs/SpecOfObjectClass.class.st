"
I describe all objects of particular class.

	(10@30) should beInstanceOf: Point
"
Class {
	#name : #SpecOfObjectClass,
	#superclass : #SpecOfObjectRelationship,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfObjectClass >> basicMatches: anObject [ 
	^anObject retriveClassForStateSpecs = requiredClass
]

{ #category : #displaying }
SpecOfObjectClass >> clauseKeyword [
	^'be an instance of'
]
