"
I am a null access strategy and I should be neither read nor written. I am still comparable to other strategies by holding onto a unique-identifier.
"
Class {
	#name : #MANullAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'uuid'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MANullAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MANullAccessor class >> new [
	| random uuid |
	random := GRPlatform current newRandom.
	uuid := Array new: 16.
	1 to: 16 do: [ :i | uuid at: i put: (random nextInt: 256) -1 ].
	^ self uuid: uuid
]

{ #category : #'instance creation' }
MANullAccessor class >> uuid: anObject [
	^ self basicNew
		uuid: anObject;
		yourself
]

{ #category : #comparing }
MANullAccessor >> = anObject [
	^ super = anObject
		and: [ self uuid = anObject uuid ]
]

{ #category : #comparing }
MANullAccessor >> hash [
	^ super hash bitXor: self uuid hash
]

{ #category : #model }
MANullAccessor >> read: aModel [ 
	MAReadError signal: 'This message is not appropriate for this object'
]

{ #category : #printing }
MANullAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' uuid: ';
		store: self uuid;
		nextPut: $)
]

{ #category : #accessing }
MANullAccessor >> uuid [
	^ uuid
]

{ #category : #accessing }
MANullAccessor >> uuid: anObject [
	uuid := anObject
]

{ #category : #model }
MANullAccessor >> write: anObject to: aModel [ 
	MAWriteError signal: 'This message is not appropriate for this object'
]
