"
I am the abstract superclass to all accessor strategies. Accessors are used to implement different ways of accessing (reading and writing) data from instances using a common protocol: data can be uniformly read and written using ==#readFrom:== respectively ==#write:to:==.
"
Class {
	#name : #MAAccessor,
	#superclass : #MAObject,
	#category : #'Magritte-Model-Accessor'
}

{ #category : #converting }
MAAccessor >> asAccessor [
	^ self
]

{ #category : #testing }
MAAccessor >> canRead: aModel [
	"Test if ==aModel== can be read."

	^ false
]

{ #category : #testing }
MAAccessor >> canWrite: aModel [
	"Test if ==aModel== can be written."

	^ false
]

{ #category : #printing }
MAAccessor >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #model }
MAAccessor >> read: aModel [
	"Read from ==aModel== using the access-strategy of the receiver."

	^ nil
]

{ #category : #printing }
MAAccessor >> storeOn: aStream [
	self class storeOn: aStream.
	aStream nextPutAll: ' new'
]

{ #category : #model }
MAAccessor >> write: anObject to: aModel [
	"Write ==anObject== to ==aModel== using the access-strategy of the receiver."
]
