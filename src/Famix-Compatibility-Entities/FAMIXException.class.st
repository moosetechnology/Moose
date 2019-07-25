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

{ #category : #compatibility }
FAMIXException >> definingEntity [
	self subclassResponsibility
]

{ #category : #compatibility }
FAMIXException >> definingEntity: aMethod [
	"I'm here for compatibility purpose. All the children of my class define this method from trait"
	self subclassResponsibility
]

{ #category : #compatibility }
FAMIXException >> definingMethod [

	^ self definingEntity
	

]

{ #category : #compatibility }
FAMIXException >> definingMethod: aMethod [
	<MSEProperty: #definingMethod type: #FAMIXMethod>
	<MSEComment: 'This property is for compatibility purpose. It is used by the old generator of MSE files'>
	^ self definingEntity: aMethod
]

{ #category : #accessing }
FAMIXException >> mooseNameOn: aStream [ 
	aStream nextPutAll: (self class name withoutPrefix: 'FAMIX').
	aStream nextPut: $-.
	self exceptionClass notNil ifTrue: [self exceptionClass mooseNameOn: aStream]
]
