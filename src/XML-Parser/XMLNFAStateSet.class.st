"
This class is a set of NFA states. It wraps an IdentitySet and keeps track of if any of its states is accepting.
"
Class {
	#name : #XMLNFAStateSet,
	#superclass : #Collection,
	#instVars : [
		'set',
		'isAccepting'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #'instance creation' }
XMLNFAStateSet class >> new [
	^ self new: 5
]

{ #category : #'instance creation' }
XMLNFAStateSet class >> new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{ #category : #'instance creation' }
XMLNFAStateSet class >> newFrom: aCollection [
	"for GS portability"
	^ self withAll: aCollection
]

{ #category : #copying }
XMLNFAStateSet >> , aCollection [
	"GS doesn't define #, for non-Sequenceable collections"
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
XMLNFAStateSet >> = anObject [
	self == anObject
		ifTrue: [^ true].

	(self species == anObject species
		and: [self size = anObject size])
		ifFalse: [^ false].

	"use #do: instead of #allSatisfy: for speed"
	self do: [:each |
		(anObject includes: each)
			ifFalse: [^ false]].

	^ true.
]

{ #category : #adding }
XMLNFAStateSet >> add: aState [
	isAccepting
		ifFalse: [isAccepting := aState isAccepting].

	^ set add: aState.
]

{ #category : #converting }
XMLNFAStateSet >> asDFAState [
	^ self asDFAStateWithStateCache: nil
]

{ #category : #converting }
XMLNFAStateSet >> asDFAStateWithStateCache: aDFAStateCache [
	^ XMLDFAState
		nfaStates: self
		dfaStateCache: aDFAStateCache
]

{ #category : #accessing }
XMLNFAStateSet >> capacity [
	^ set capacity
]

{ #category : #enumerating }
XMLNFAStateSet >> do: aBlock [
	set do: aBlock
]

{ #category : #comparing }
XMLNFAStateSet >> hash [
	| hash |

	hash := self species hash.
	self size > 5
		ifFalse: [
			self do: [:each |
				hash := hash bitXor: each hash]].
	^ hash bitXor: self size hash.
]

{ #category : #testing }
XMLNFAStateSet >> includes: aState [
	^ set includes: aState
]

{ #category : #initialization }
XMLNFAStateSet >> initialize: aCapacity [
	set := IdentitySet new: aCapacity.
	isAccepting := false.
]

{ #category : #testing }
XMLNFAStateSet >> isAccepting [
	^ isAccepting
]

{ #category : #testing }
XMLNFAStateSet >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #copying }
XMLNFAStateSet >> postCopy [
	set := set copy
]

{ #category : #removing }
XMLNFAStateSet >> remove: aState ifAbsent: aBlock [
	set
		remove: aState
		ifAbsent: [^ aBlock value].

	isAccepting
		ifTrue: [isAccepting := set anySatisfy: [:each | each isAccepting]].

	^ aState.
]

{ #category : #removing }
XMLNFAStateSet >> removeAll [
	"Redefined because Collection>>#removeAll assumes the collection can
	be safely modified while iterating it with #do:, and 'set removeAll'
	is not used because GS's Set/IdentitySet don't implement it"

	self initialize: self capacity
]

{ #category : #private }
XMLNFAStateSet >> set [
	^ set
]

{ #category : #accessing }
XMLNFAStateSet >> size [
	^ set size
]
