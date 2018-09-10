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

{ #category : #generator }
FamixJavaException class >> generatedSlotNames [
	<generated>
	'FamixJavaException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaException class >> generatedTraitNames [
	<generated>
	^ #(FamixTException)
]

{ #category : #meta }
FamixJavaException class >> requirements [

	<generated>
	^ {  }
]

{ #category : #deprecated }
FamixJavaException >> definingMethod [

	^ self definingEntity
	

]

{ #category : #deprecated }
FamixJavaException >> definingMethod: aMethod [ 

	^ self definingEntity: aMethod 
	

]

{ #category : #accessing }
FamixJavaException >> mooseNameOn: aStream [ 
	aStream nextPutAll: (self class name withoutPrefix: 'FamixJava').
	aStream nextPut: $-.
	self exceptionClass notNil ifTrue: [self exceptionClass mooseNameOn: aStream]
]
