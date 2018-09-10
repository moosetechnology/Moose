"
I am an access strategy defined by two block-closures. The read-block expects the model as its first argument and is used to retrieve a value. The write-block expects the model as its first and the value as its second argument and is used to write a value to the model.
"
Class {
	#name : #MAPluggableAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'readBlock',
		'writeBlock'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MAPluggableAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAPluggableAccessor class >> read: aReadBlock write: aWriteBlock [
	^ self new
		readBlock: aReadBlock;
		writeBlock: aWriteBlock;
		yourself
]

{ #category : #comparing }
MAPluggableAccessor >> = anObject [
	^ super = anObject
		and: [ self readBlock = anObject readBlock
		and: [ self writeBlock = anObject writeBlock ] ]
]

{ #category : #testing }
MAPluggableAccessor >> canRead: aModel [
	^ self readBlock notNil
]

{ #category : #testing }
MAPluggableAccessor >> canWrite: aModel [
	^ self writeBlock notNil
]

{ #category : #comparing }
MAPluggableAccessor >> hash [
	^ super hash bitXor: (self readBlock hash bitXor: self writeBlock hash)
]

{ #category : #model }
MAPluggableAccessor >> read: aModel [
	^ self readBlock value: aModel
]

{ #category : #accessing }
MAPluggableAccessor >> readBlock [
	^ readBlock
]

{ #category : #accessing }
MAPluggableAccessor >> readBlock: aBlock [
	readBlock := aBlock
]

{ #category : #printing }
MAPluggableAccessor >> storeBlock: aBlock on: aStream [ 
	aStream nextPutAll: aBlock decompile greaseString allButFirst allButLast
]

{ #category : #printing }
MAPluggableAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' read: '.
	self storeBlock: self readBlock on: aStream.
	aStream nextPutAll: ' write: '.
	self storeBlock: self writeBlock on: aStream.
	aStream nextPut: $)
]

{ #category : #model }
MAPluggableAccessor >> write: anObject to: aModel [
	self writeBlock value: aModel value: anObject
]

{ #category : #accessing }
MAPluggableAccessor >> writeBlock [
	^ writeBlock
]

{ #category : #accessing }
MAPluggableAccessor >> writeBlock: aBlock [
	writeBlock := aBlock
]
