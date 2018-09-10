"
I am an access strategy to be used on dictionaries. I use my ==key== to read from and write to indexed collections. I am mainly used for prototyping as it allows one to treat dictionaries like objects with object-based instance variables.
"
Class {
	#name : #MADictionaryAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'key'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MADictionaryAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MADictionaryAccessor class >> key: aSymbol [
	^ self new
		key: aSymbol;
		yourself
]

{ #category : #comparing }
MADictionaryAccessor >> = anObject [
	^ super = anObject
		and: [ self key = anObject key ]
]

{ #category : #testing }
MADictionaryAccessor >> canRead: aModel [
	^ true
]

{ #category : #testing }
MADictionaryAccessor >> canWrite: aModel [
	^ true
]

{ #category : #comparing }
MADictionaryAccessor >> hash [
	^ super hash bitXor: self key hash
]

{ #category : #accessing }
MADictionaryAccessor >> key [
	^ key
]

{ #category : #accessing }
MADictionaryAccessor >> key: aKey [
	key := aKey
]

{ #category : #model }
MADictionaryAccessor >> read: aModel [
	^ aModel at: self key ifAbsent: [ nil ]
]

{ #category : #printing }
MADictionaryAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' key: ';
		store: self key;
		nextPut: $)
]

{ #category : #model }
MADictionaryAccessor >> write: anObject to: aModel [
	aModel at: self key put: anObject
]
