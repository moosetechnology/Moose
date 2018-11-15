Extension { #name : #Collection }

{ #category : #'*PetitParser' }
Collection >> asChoiceParser [
	^ PPChoiceParser withAll: (self collect: [ :each | each asParser ])
]

{ #category : #'*PetitParser' }
Collection >> asParser [    
	"Create a range of characters between start and stop."

	(self allSatisfy: [ :e | e isCharacter ]) ifTrue: [ 
		| charSet |
		charSet := PPCharSetPredicate on: [ :char | self includes: char ] .
     	^ PPPredicateObjectParser on: charSet message: 'One of these charactes expected: ', self printString.
	].


	^ super asParser
	"
		($a to:$f) asParser parse:'a'
		($a to:$f) asParser parse:'g'
	"

]

{ #category : #'*PetitParser' }
Collection >> asSequenceParser [
	^ PPSequenceParser withAll: (self collect: [ :each | each asParser ])
]
