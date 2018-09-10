"
I am a read-only access strategy and I answer the model itself when being read.
"
Class {
	#name : #MAIdentityAccessor,
	#superclass : #MAAccessor,
	#category : #'Magritte-Model-Accessor'
}

{ #category : #testing }
MAIdentityAccessor class >> isAbstract [
	^ false
]

{ #category : #testing }
MAIdentityAccessor >> canRead: aModel [
	^ true
]

{ #category : #model }
MAIdentityAccessor >> read: aModel [
	^ aModel
]

{ #category : #model }
MAIdentityAccessor >> write: anObject to: aModel [ 
	MAWriteError signal: 'Not supposed to write to ' , aModel greaseString , '.'
]
