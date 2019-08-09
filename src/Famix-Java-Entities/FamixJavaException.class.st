Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTException',
	#classTraits : 'FamixTException classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<MSEClass: #Exception super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaException >> mooseNameOn: aStream [ 
	aStream nextPutAll: (self class name withoutPrefix: 'FamixJava').
	aStream nextPut: $-.
	self exceptionClass notNil ifTrue: [self exceptionClass mooseNameOn: aStream]
]
