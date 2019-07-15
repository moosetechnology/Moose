"
This class is an ordered list that sends notifications to an observer when objects are added to it or removed from it. Subclasses should override the #beforeAdding:, #afterAdding:at:, #afterAddingLast: and #afterRemoving: messages to send custom notifications.
"
Class {
	#name : #XMLObservableList,
	#superclass : #XMLOrderedList,
	#instVars : [
		'observer'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLObservableList class >> observer: anObserver [
	^ self new observer: anObserver
]

{ #category : #'instance creation' }
XMLObservableList class >> ofSize: aSize [
	self shouldNotImplement
]

{ #category : #adding }
XMLObservableList >> add: anObject after: aPreviousObject [
	^ self
		add: anObject
		afterIndex:
			(collection
				indexOf: aPreviousObject
				ifAbsent: [-1])
]

{ #category : #adding }
XMLObservableList >> add: anObject afterIndex: anIndex [
	collection
		add: anObject
		afterIndex: anIndex.
	self
		afterAdding: anObject
		at: anIndex + 1.
	^ anObject.
]

{ #category : #adding }
XMLObservableList >> add: anObject before: aNextObject [
	^ self
		add: anObject
		beforeIndex:
			(collection
				indexOf: aNextObject
				ifAbsent: [-1])
]

{ #category : #adding }
XMLObservableList >> add: anObject beforeIndex: anIndex [
	collection
		add: anObject
		beforeIndex: anIndex.
	self
		afterAdding: anObject
		at: anIndex.
	^ anObject.
]

{ #category : #adding }
XMLObservableList >> addFirst: anObject [
	collection addFirst: anObject.
	self afterAdding: anObject at: 1.
	^ anObject.
]

{ #category : #adding }
XMLObservableList >> addLast: anObject [
	collection addLast: anObject.
	self afterAddingLast: anObject.
	^ anObject.
]

{ #category : #private }
XMLObservableList >> addToCopyLast: anObject [
	collection addLast: anObject.
	self afterAddingToCopyLast: anObject.
	^ anObject.
]

{ #category : #private }
XMLObservableList >> afterAdding: anObject at: anIndex [
	observer
		ifNotNil: [
			observer
				added: anObject
				to: self]
]

{ #category : #private }
XMLObservableList >> afterAddingLast: anObject [
	"can be used to handle appending separately and more efficiently than
	insertion"

	self
		afterAdding: anObject
		at: self size
]

{ #category : #private }
XMLObservableList >> afterAddingToCopyLast: anObject [
	"can be used to handle appending existing elements to a copy separately and
	more efficiently than #afterAddingLast: so not as much checking needs to be
	done (because no new elements are being added to the copy)"

	self afterAddingLast: anObject
]

{ #category : #private }
XMLObservableList >> afterRemoving: anObject [
	observer
		ifNotNil: [
			observer
				removed: anObject
				from: self]
]

{ #category : #accessing }
XMLObservableList >> at: anIndex put: anObject [
	| oldObject |

	"Gemstone's OrderedCollection>>#at:put: allows the index to be
	just after the last, treating it like addLast:, so this is needed
	for compatbility"
	anIndex = (self size + 1)
		ifTrue: [^ self addLast: anObject].

	"this will raise an error if the index is invalid"
	oldObject := collection at: anIndex.

	"remove the old object and notify any observer"
	collection at: anIndex put: nil.
	oldObject
		ifNotNil: [self afterRemoving: oldObject].
	
	"now add the new object and notify any observer"
	collection at: anIndex put: anObject.
	self
		afterAdding: anObject
		at: anIndex.

	^ anObject.
]

{ #category : #private }
XMLObservableList >> duplicateIndexOf: anObject notAt: anIndex [
	"to:do: for speed because some subclasses need this to be fast"
	1 to: anIndex - 1 do: [:i |
		(collection at: i) = anObject
			ifTrue: [^ i]].

	"to:do: for speed because some subclasses need this to be fast"
	anIndex + 1 to: collection size do: [:i |
		(collection at: i) = anObject
			ifTrue: [^ i]].

	^ 0.
]

{ #category : #observing }
XMLObservableList >> observer [
	^ observer
]

{ #category : #observing }
XMLObservableList >> observer: anObserver [
	observer := anObserver
]

{ #category : #removing }
XMLObservableList >> remove: anObject ifAbsent: aBlock [
	collection remove: anObject ifAbsent: [^ aBlock value].
	self afterRemoving: anObject.
	^ anObject.
]

{ #category : #removing }
XMLObservableList >> removeAt: anIndex [
	| removed |

	removed := super removeAt: anIndex.
	self afterRemoving: removed.
	^ removed.
]

{ #category : #private }
XMLObservableList >> removeDuplicateOf: anObject notAt: anIndex [
	"Removes a duplicate of anObject at any index besides anIndex and
	returns the removed duplicate or nil if there isn't one."

	| duplicateIndex |

	(duplicateIndex := 
		self
			duplicateIndexOf: anObject
			notAt: anIndex) > 0
		ifTrue: [| duplicate |
			(duplicate := collection removeAt: duplicateIndex) = anObject
				ifFalse: [
					"subclasses may implement #duplicateIndexOf:notAt: to test
					for duplicates not with #=, so 'duplicate' can be a
					distinct object from 'anObject' that's been removed"
					self afterRemoving: duplicate].
			^ duplicate]
		ifFalse: [^ nil]
]

{ #category : #removing }
XMLObservableList >> reset [
	| removed |

	removed := collection copy.
	collection reset.
	removed reverseDo: [:each |
		self afterRemoving: each].
]
