"
PPPattern is meta-parser that is solely used to match other types of parsers. It cannot be used for actually parsing something. The constructor method determines what can be matched.
"
Class {
	#name : #PPPattern,
	#superclass : #PPParser,
	#instVars : [
		'verificationBlock'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPPattern class >> any [
	"Matches all parsers."

	^ self on: [ :parser :context | true ]
]

{ #category : #'instance creation' }
PPPattern class >> class: aBehavior [
	"Matches parsers that are of the class aBehavior."

	^ self on: [ :parser :context | parser class = aBehavior ]
]

{ #category : #'instance creation' }
PPPattern class >> kind: aBehavior [
	"Matches parsers that are of the class aBehavior or one of its subclasses."

	^ self on: [ :parser :context | parser isKindOf: aBehavior ]
]

{ #category : #'instance creation' }
PPPattern class >> name: aString [
	"Matches parsers with the name aString."

	^ self on: [ :parser :context | parser name = aString ]
]

{ #category : #'instance creation' }
PPPattern class >> new [
	self error: 'Use an explicit constructur on ' , self name
]

{ #category : #'instance creation' }
PPPattern class >> on: aBlock [
	"Matches parsers that satisfy an arbitrary condition in aBlock."

	^ self basicNew initializeOn: aBlock
]

{ #category : #comparing }
PPPattern >> = aParser [
	^ self == aParser or: [ self name notNil and: [ self name = aParser name ] ]
]

{ #category : #matching }
PPPattern >> copyInContext: aDictionary seen: aSeenDictionary [
	^ aDictionary at: self
]

{ #category : #comparing }
PPPattern >> hash [
	^ self identityHash
]

{ #category : #initialization }
PPPattern >> initializeOn: aBlock [
	verificationBlock := aBlock
]

{ #category : #matching }
PPPattern >> match: aParser inContext: aDictionary seen: anIdentitySet [
	(verificationBlock value: aParser value: aDictionary)
		ifFalse: [ ^ false ].
	^ (aDictionary at: self ifAbsentPut: [ aParser ])
		match: aParser inContext: aDictionary seen: anIdentitySet
]

{ #category : #parsing }
PPPattern >> parseOn: aStream [
	"This is just a pattern used for matching. It should not be used in actual grammars."

	self shouldNotImplement
]
