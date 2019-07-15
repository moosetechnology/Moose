Extension { #name : #Collection }

{ #category : #'*CollectionExtensions' }
Collection >> asCollection [
	^ self
]

{ #category : #'*CollectionExtensions' }
Collection >> collectAsSet: aBlock [
	"Evaluates aBlock for each element of the receiver and collects
	the resulting values into a Set."

	"This is an efficient shorthand for [ (self collect: aBlock) asSet ]."
	"originally developed by a. kuhn and released under MIT."
	
	^self inject: Set new into: [ :set :each | 
		set add: (aBlock value: each); yourself ].
]

{ #category : #'*CollectionExtensions' }
Collection >> copyEmpty: aSize [
	"Answer a copy of the receiver that contains no elements.

	This method should be redefined in subclasses that add
	instance variables, so that the state of those variables
	is preserved"

	^self class new: aSize
]

{ #category : #'*CollectionExtensions' }
Collection >> deepFlatten [

	^ Array streamContents: [ :stream |
			self do: [ :each | each deepFlattenInto: stream ]]
]

{ #category : #'*CollectionExtensions' }
Collection >> deepFlattenInto: stream [

	self do: [ :each | each deepFlattenInto: stream ]
]

{ #category : #'*CollectionExtensions' }
Collection >> detect: aBlock ifOne: presentBlock [
	^ self detect: aBlock ifOne: presentBlock ifNone: [nil] 
]

{ #category : #'*CollectionExtensions' }
Collection >> detect: aBlock ifOne: presentBlock ifNone: noneBlock [
	| result |
	result := self detect: aBlock ifNone: [ ^ noneBlock value ].
	^ presentBlock value: result
]

{ #category : #'*CollectionExtensions' }
Collection >> equalsTo: aCollection [ 
	"Answer true if the reciever contains the same elements as aCollection, and vice versa."

	^(aCollection isCollection) 
		and: [ aCollection size = self size 
			and: [ aCollection allSatisfy: [ :each | 
				(aCollection occurrencesOf: each) = (self occurrencesOf: each) ]]]
]

{ #category : #'*CollectionExtensions' }
Collection >> flatten [
	"Recursively collect each non-collection element of the receiver and its descendant
	collections.  Please note, this implementation assumes that strings are to be treated
	as objects rather than as collection."

	^self gather: [ :each | each ]
]

{ #category : #'*CollectionExtensions' }
Collection >> groupedBy: aBlock affect: anotherBlock [
	"First, evaluate aBlock for each of the receiver's elements and group the
	elements by the resulting values, and second, evaluate anotherBlock for
	each of the resulting groups and return a dictionary with the first pass'
	results as keys and the second pass' results as values."

	"This is a shorthand for [ (self groupedBy: aBlock) collect: anotherBlock ]."

	^(self groupedBy: aBlock) associationsDo: [ :each | each value: (anotherBlock value: each value) ]
]

{ #category : #'*CollectionExtensions' }
Collection >> nilSafeGroupedBy: aBlock [
	^ self groupedBy: [ :each |
		| value |
		value := aBlock value: each.
		value ifNil: [ UndefinedObject ].
	]	
]

{ #category : #'*CollectionExtensions' }
Collection >> selectAsSet: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new set, only those elements for which
	aBlock evaluates to true.  Answer the new collection."

	| newSet |
	newSet := Set new.
	self do: [:each | (aBlock value: each) ifTrue: [newSet add: each]].
	^newSet
]

{ #category : #'*CollectionExtensions' }
Collection >> sortAscending: aBlockWithOneArgument [
	^ self sorted: [ :x :y |
		(aBlockWithOneArgument value: x) < (aBlockWithOneArgument value: y) ]
]

{ #category : #'*CollectionExtensions' }
Collection >> sortDescending: aBlockWithOneArgument [
	^ self sorted: [ :x :y |
		(aBlockWithOneArgument value: x) > (aBlockWithOneArgument value: y) ]
]

{ #category : #'*CollectionExtensions' }
Collection class >> with: anObject withAll: aCollection [
	^ (self new: (aCollection size + 1))
		add: anObject;
		addAll: aCollection;
		yourself
]
