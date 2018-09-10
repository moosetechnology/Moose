"
I am an access strategy that directly reads from and writes to instance variables. I strongly violate encapsulation and most of the time I should be replaced by an instance of *MASelectorAccessor*.
"
Class {
	#name : #MAVariableAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'name'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MAVariableAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAVariableAccessor class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #comparing }
MAVariableAccessor >> = anObject [
	^ super = anObject and: [ self name = anObject name ]
]

{ #category : #testing }
MAVariableAccessor >> canRead: aModel [
	^ aModel class allInstVarNames includes: self name asSymbol
]

{ #category : #testing }
MAVariableAccessor >> canWrite: aModel [
	^ self canRead: aModel
]

{ #category : #comparing }
MAVariableAccessor >> hash [
	^ super hash bitXor: self name hash
]

{ #category : #accessing }
MAVariableAccessor >> name [
	^ name
]

{ #category : #accessing }
MAVariableAccessor >> name: aString [
	name := aString
]

{ #category : #model }
MAVariableAccessor >> read: aModel [
	^ aModel instVarNamed: self name
]

{ #category : #printing }
MAVariableAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' name: ';
		store: self name;
		nextPut: $)
]

{ #category : #model }
MAVariableAccessor >> write: anObject to: aModel [
	aModel instVarNamed: self name put: anObject
]
