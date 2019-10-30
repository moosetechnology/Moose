"
A FMMultiMultivalueLink is an implementation for relationships that updates the opposite link
in a many to many way.

LIBPerson>>initialize
	...
	books := FMMultiMultivalueLink on: self opposite: #authors.
	
LIBPerson>>books: aBookCollection
	books value: aBook

will maintain the link when the books collection changes

LIBBook>>initialize
	...
	authors := FMMultiMultivalueLink on: self opposite: #books.
	
LIBBook>>authors: persons
	authors value: persons
"
Class {
	#name : #FMMultiMultivalueLink,
	#superclass : #FMMultivalueLink,
	#category : #'Fame-Core-Utilities'
}

{ #category : #adding }
FMMultiMultivalueLink >> add: anElement [

	(anElement perform: opposite) unsafeAdd: owner.
	(values includes: anElement) not ifTrue: [
		values add: anElement ].
	^anElement
	
]

{ #category : #removing }
FMMultiMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [ 
	
	values remove: anElement ifAbsent: [ ^exceptionBlock value ].
	(anElement perform: opposite) unsafeRemove: owner.
	^anElement
]

{ #category : #removing }
FMMultiMultivalueLink >> removeAll [
	values reversed
		do: [ :anElement | (anElement perform: opposite) remove: owner ]
]

{ #category : #private }
FMMultiMultivalueLink >> with: element opposite: oppositeSelector [
	self assert: oppositeSelector numArgs = 0.
	values := OrderedCollection new.
	owner := element.
	opposite := oppositeSelector
]
