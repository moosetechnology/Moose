"
My access strategy is to delegate to the next accessor. I am not that useful all by myself, but subclasses might override certain methods to intercept access.
"
Class {
	#name : #MADelegatorAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'next'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MADelegatorAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MADelegatorAccessor class >> on: anAccessor [
	^ self new next: anAccessor
]

{ #category : #comparing }
MADelegatorAccessor >> = anObject [
	^ super = anObject and: [ self next = anObject next ]
]

{ #category : #testing }
MADelegatorAccessor >> canRead: aModel [
	^ self next canRead: aModel
]

{ #category : #testing }
MADelegatorAccessor >> canWrite: aModel [
	^ self next canWrite: aModel
]

{ #category : #comparing }
MADelegatorAccessor >> hash [
	^  super hash bitXor: self next hash
]

{ #category : #accessing }
MADelegatorAccessor >> next [
	^ next
]

{ #category : #accessing }
MADelegatorAccessor >> next: anAccessor [ 
	next := anAccessor asAccessor
]

{ #category : #copying }
MADelegatorAccessor >> postCopy [
	super postCopy.
	next := next copy
]

{ #category : #model }
MADelegatorAccessor >> read: aModel [
	^ self next read: aModel
]

{ #category : #printing }
MADelegatorAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' on: ';
		store: self next;
		nextPut: $)
]

{ #category : #model }
MADelegatorAccessor >> write: anObject to: aModel [
	self next write: anObject to: aModel
]
