"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalNumberMapping,
	#superclass : #MalMapping,
	#instVars : [
		'back',
		'forth'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalNumberMapping class >> new [
	
	^(super new)
		initialize;
		yourself
]

{ #category : #'instance creation' }
MalNumberMapping class >> new: aSize [
	
	^(super new)
		setSize: aSize;
		yourself
]

{ #category : #adding }
MalNumberMapping >> add: index [
	"Maps an index to the next free key.
	If the index is already mapped, throws an error.
	@post-condition: 
		anIndex <= self indexSize.
		self keyAt: anIndex = self size.
		self indexAt: self size = anIndex.
	"
	
	index > self lastIndex
		ifTrue: [forth changeSizeTo: index]
		ifFalse: [(self includesIndex: index) ifTrue: [Error raiseRequest]].
	back add: index.
	forth
		at: index
		put: back size.
	^index
]

{ #category : #accessing }
MalNumberMapping >> atKey: key ifAbsent: exceptionBlock [
	"Returns index of an ordinal key,
	that is maps backwards from new to old 'indices'."
	
	^[back at: key]
		on: Error
		do: [:ex | exceptionBlock value]
]

{ #category : #enumerating }
MalNumberMapping >> do: aBlock [
	
	back do: aBlock
]

{ #category : #'initialize-release' }
MalNumberMapping >> initialize [
	"Sets up instance variables.
	back -- maps from ordinal keys to indices, ie. its values are indices (old indices).
	forth -- maps from indices to ordinal keys, ie. its values are ordinal keys (new indices) and thus may be nil."
	
	back := OrderedCollection new.
	forth := OrderedCollection new
]

{ #category : #'accessing - name' }
MalNumberMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^name isInteger
		ifTrue: [name]
		ifFalse: [exceptionBlock value]
]

{ #category : #accessing }
MalNumberMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	"Returns ordinal key of a index.
	that is maps forward from old to new indices."
	
	^[(forth at: anIndex) ifNil: [exceptionBlock value]]
		on: Error
		do: [:ex | exceptionBlock value]
]

{ #category : #accessing }
MalNumberMapping >> keys [
	
	^1 to: self size
]

{ #category : #adding }
MalNumberMapping >> lastIndex [
	
	^forth size
]

{ #category : #'accessing - name' }
MalNumberMapping >> nameForKey: key [
	
	self error: 'key not found'
]

{ #category : #removing }
MalNumberMapping >> replaceAll: aCollection [
	
	self initialize.
	self addAll: aCollection
]

{ #category : #'initialize-release' }
MalNumberMapping >> setSize: size [
	
	back := forth := 1 to: size
]

{ #category : #accessing }
MalNumberMapping >> size [
	
	^back size
]
