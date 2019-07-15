"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FAMIXException is a normal FAMIXClass.
"
Class {
	#name : #FAMIXException,
	#superclass : #FAMIXEntity,
	#instVars : [
		'exceptionClass',
		'definingMethod'
	],
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXException class >> annotation [
	<MSEClass: #Exception super: #FAMIXEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXException >> exceptionClass [
	<MSEProperty: #exceptionClass type: #FAMIXClass opposite: #exceptions> 
	<MSEComment: 'Class to which the exception points. It is specific to Java'>
	^ exceptionClass
]

{ #category : #accessing }
FAMIXException >> exceptionClass: anObject [
	exceptionClass := FMMultivalueLink
		on: self
		update: #exceptions
		from: self exceptionClass
		to: anObject
]

{ #category : #accessing }
FAMIXException >> mooseNameOn: aStream [ 
	aStream nextPutAll: (self class name removePrefix: 'FAMIX').
	aStream nextPut: $-.
	self exceptionClass notNil ifTrue: [self exceptionClass mooseNameOn: aStream]
]
