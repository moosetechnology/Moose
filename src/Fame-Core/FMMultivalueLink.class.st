"
A FMMultivalueLink is an implementation for relationships that upate the backlink and
updates the opposite link in a one to many way.

Imagine that we want to have a Book with Sections

Book
    sections

Book>>initialize

	...
	sections := FMMultivalueLink on: self opposite: #book: 

means that sections is a kind of Collection in which when a new element is added
the message book: with self is sent.

This means each time a new element is added the backlink is managed automatically.

Now when the book of a Section is changed, 

Section>>book: aBook
	book := FMMultivalueLink on: self
					update: #sections
					from: self book
					to: aBook
					
This message make sure that if a book is changed, the sections
that refers to it are updated accordingly.


"
Class {
	#name : #FMMultivalueLink,
	#superclass : #Collection,
	#instVars : [
		'values',
		'owner',
		'opposite'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMMultivalueLink class >> on: element opposite: oppositeSelector [

	^self new
		with: element
		opposite: oppositeSelector
]

{ #category : #'instance creation' }
FMMultivalueLink class >> on: element update: selector from: old to: new [
	"refresh the other side of the relations to reflect change in value"
	
	old ~= new ifTrue: [
		old notNil ifTrue: [ (old perform: selector) unsafeRemove: element ].
		new notNil ifTrue: [ (new perform: selector) unsafeAdd: element ]].
	^new
]

{ #category : #copying }
FMMultivalueLink >> , aCollection [
	^ self asOrderedCollection , aCollection
]

{ #category : #comparing }
FMMultivalueLink >> = otherCollection [ 
	"Answer true if the receiver is equivalent to the otherCollection.
	First test for identity, then rule out different species and sizes of
	collections. As a last resort, examine each element of the receiver
	and the otherCollection."

	self == otherCollection ifTrue: [^ true].
	self species == otherCollection species ifFalse: [^ false].
	^ values hasEqualElements: otherCollection asOrderedCollection
]

{ #category : #accessing }
FMMultivalueLink >> add: anElement [
	anElement perform: opposite with: owner.
	self unsafeAdd: anElement.
	^ anElement
]

{ #category : #accessing }
FMMultivalueLink >> at: index [

	^values at: index
]

{ #category : #accessing }
FMMultivalueLink >> byName: name [
	^ self byName: name ifAbsent: [ self errorNotFound: name ]
]

{ #category : #accessing }
FMMultivalueLink >> byName: name ifAbsent: exceptionBlock [

	^values
			detect: [ :each | each name asString = name asString ]
			ifNone: exceptionBlock
	 
]

{ #category : #enumerating }
FMMultivalueLink >> do: aBlock [ 
	
	values do: aBlock
]

{ #category : #'accessing-computed' }
FMMultivalueLink >> first [
	^ self at: 1
]

{ #category : #comparing }
FMMultivalueLink >> hash [
	"From sequenceable collection"
	| hash |
	hash := self species hash.
	1 to: self size do: [ :i | hash := (hash + (self at: i) hash) hashMultiply ].
	^ hash
]

{ #category : #'accessing-computed' }
FMMultivalueLink >> last [
	^ values last
]

{ #category : #copying }
FMMultivalueLink >> postCopy [

	super postCopy.
	values := values copy.
]

{ #category : #printing }
FMMultivalueLink >> printOn: aStream [

	self asArray printOn: aStream
]

{ #category : #removing }
FMMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [ 
	
	values remove: anElement ifAbsent: [ ^exceptionBlock value ].
	anElement perform: opposite with: nil.
	^anElement
]

{ #category : #removing }
FMMultivalueLink >> removeAll [
	values reversed
		do: [ :anElement | anElement perform: opposite with: nil ]
]

{ #category : #'accessing-computed' }
FMMultivalueLink >> second [
	^ self at: 2
]

{ #category : #accessing }
FMMultivalueLink >> size [

	^values size
]

{ #category : #private }
FMMultivalueLink >> species [

	^OrderedCollection
]

{ #category : #'accessing-computed' }
FMMultivalueLink >> third [
	^ self at: 3
]

{ #category : #private }
FMMultivalueLink >> unsafeAdd: element [
	(values includes: element)
		ifFalse: [ values add: element ]
]

{ #category : #private }
FMMultivalueLink >> unsafeRemove: element [

	values remove: element ifAbsent: nil
]

{ #category : #accessing }
FMMultivalueLink >> value [

	^self
]

{ #category : #accessing }
FMMultivalueLink >> value: aCollection [

	^self removeAll: values copy; addAll: aCollection
]

{ #category : #private }
FMMultivalueLink >> with: element opposite: oppositeSelector [
	self assert: oppositeSelector numArgs = 1.
	values := OrderedCollection new.
	owner := element.
	opposite := oppositeSelector
]

{ #category : #enumerating }
FMMultivalueLink >> withIndexDo: aBlock [ 
	
	values withIndexDo: aBlock
]
