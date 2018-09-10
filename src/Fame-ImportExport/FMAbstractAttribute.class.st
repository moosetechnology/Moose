Class {
	#name : #FMAbstractAttribute,
	#superclass : #Object,
	#instVars : [
		'name',
		'elements',
		'maxElementCount'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMAbstractAttribute >> addElementCount: aNumber [

	maxElementCount := maxElementCount max: aNumber
]

{ #category : #accessing }
FMAbstractAttribute >> elements [
	^elements
]

{ #category : #inferring }
FMAbstractAttribute >> inferElementType [
	
	| candidates |
	candidates := elements asSet.
	candidates size = 1 ifTrue: [ ^candidates anyOne ].
	^#Object.
]

{ #category : #inferring }
FMAbstractAttribute >> inferMultivalued [
	
	^maxElementCount  > 1 
]

{ #category : #'initialize-release' }
FMAbstractAttribute >> initialize [
	elements := Bag new.
	maxElementCount := 0
]

{ #category : #accessing }
FMAbstractAttribute >> name [
	^ name
]

{ #category : #accessing }
FMAbstractAttribute >> name: anObject [
	name := anObject
]

{ #category : #inferring }
FMAbstractAttribute >> resolveReferences: index [
	| references elem count |
	references := elements asSet select: #isNumber.
	references do:
			[ :ref | 
			elem := index at: ref.
			count := elements occurrencesOf: ref.
			elem notNil should beTrue.
			elements removeAllOccurrencesOf: ref ifAbsent: nil.
			elements add: elem withOccurrences: count ]
]
