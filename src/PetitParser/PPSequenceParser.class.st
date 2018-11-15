"
A parser that parses a sequence of parsers.
"
Class {
	#name : #PPSequenceParser,
	#superclass : #PPListParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #operators }
PPSequenceParser >> , aRule [
	^ self copyWith: aRule
]

{ #category : #'operators-mapping' }
PPSequenceParser >> map: aBlock [
	^ aBlock numArgs = self children size
		ifTrue: [ self ==> [ :nodes | aBlock valueWithArguments: nodes ] ]
		ifFalse: [ self error: aBlock numArgs asString , ' arguments expected.' ]
]

{ #category : #parsing }
PPSequenceParser >> parseOn: aPPContext [
	"This is optimized code that avoids unnecessary block activations, do not change."
	
	| memento elements element |
	memento := aPPContext remember.
	elements := Array new: parsers size.
	1 to: parsers size do: [ :index |
		element := (parsers at: index) 
			parseOn: aPPContext.
		element isPetitFailure ifTrue: [
			aPPContext restore: memento.
			^ element ].
		elements at: index put: element ].
	^ elements
]

{ #category : #'operators-mapping' }
PPSequenceParser >> permutation: anArrayOfIntegers [
	"Answer a permutation of the receivers sequence."
	
	anArrayOfIntegers do: [ :index |
		(index isInteger and: [ index between: 1 and: parsers size ])
			ifFalse: [ self error: 'Invalid permutation index: ' , index printString ] ].
	^ self ==> [ :nodes | anArrayOfIntegers collect: [ :index | nodes at: index ] ]
]
