"
I am the most common access strategy defined by a read- and a write-selector. I am mostly used together with standard getters and setters as usually defined by the accessing protocol. If there is only a read-selector specified, the write selector will be deduced automatically by adding a colon to the read-selector.
"
Class {
	#name : #MASelectorAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'readSelector',
		'writeSelector'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MASelectorAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MASelectorAccessor class >> read: aReadSelector write: aWriteSelector [
	^ self new
		readSelector: aReadSelector;
		writeSelector: aWriteSelector;
		yourself
]

{ #category : #'instance creation' }
MASelectorAccessor class >> selector: aSelector [
	^ self new
		selector: aSelector;
		yourself
]

{ #category : #comparing }
MASelectorAccessor >> = anObject [
	^ super = anObject
		and: [ self readSelector = anObject readSelector
		and: [ self writeSelector = anObject writeSelector ] ]
]

{ #category : #testing }
MASelectorAccessor >> canRead: aModel [
	^ self readSelector notNil and: [ aModel respondsTo: self readSelector ]
]

{ #category : #testing }
MASelectorAccessor >> canWrite: aModel [
	^ self writeSelector notNil and: [ aModel respondsTo: self writeSelector ]
]

{ #category : #comparing }
MASelectorAccessor >> hash [
	^  super hash bitXor: (self readSelector hash bitXor: self writeSelector hash)
]

{ #category : #model }
MASelectorAccessor >> read: aModel [
	^ aModel perform: self readSelector
]

{ #category : #accessing }
MASelectorAccessor >> readSelector [
	^ readSelector
]

{ #category : #accessing }
MASelectorAccessor >> readSelector: aSelector [
	readSelector := aSelector
]

{ #category : #'accessing-dynamic' }
MASelectorAccessor >> selector [
	^ self readSelector
]

{ #category : #'accessing-dynamic' }
MASelectorAccessor >> selector: aSelector [ 
	self readSelector: aSelector asSymbol.
	self writeSelector: (aSelector greaseString copyWith: $:) asSymbol
]

{ #category : #printing }
MASelectorAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' read: ';
		store: self readSelector;
		nextPutAll: ' write: ';
		store: self writeSelector;
		nextPut: $)
]

{ #category : #model }
MASelectorAccessor >> write: anObject to: aModel [
	^ aModel perform: self writeSelector with: anObject
]

{ #category : #accessing }
MASelectorAccessor >> writeSelector [
	^ writeSelector
]

{ #category : #accessing }
MASelectorAccessor >> writeSelector: aSelector [
	writeSelector := aSelector
]
