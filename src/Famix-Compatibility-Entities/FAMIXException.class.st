Class {
	#name : #FAMIXException,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTException',
	#classTraits : 'FamixTException classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXException class >> annotation [

	<MSEClass: #Exception super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXException class >> generatedSlotNames [
	<generated>
	'FAMIXException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXException class >> generatedTraitNames [
	<generated>
	^ #(FamixTException)
]

{ #category : #meta }
FAMIXException class >> requirements [

	<generated>
	^ {  }
]

{ #category : #compatibility }
FAMIXException >> definingMethod [

	^ self definingEntity
	

]

{ #category : #compatibility }
FAMIXException >> definingMethod: aMethod [ 

	^ self definingEntity: aMethod 
	

]

{ #category : #accessing }
FAMIXException >> mooseNameOn: aStream [ 
	aStream nextPutAll: (self class name withoutPrefix: 'FAMIX').
	aStream nextPut: $-.
	self exceptionClass notNil ifTrue: [self exceptionClass mooseNameOn: aStream]
]
