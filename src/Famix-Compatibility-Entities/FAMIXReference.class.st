Class {
	#name : #FAMIXReference,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXReference class >> annotation [

	<MSEClass: #Reference super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXReference class >> generatedSlotNames [
	<generated>
	'FAMIXReference class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXReference class >> generatedTraitNames [
	<generated>
	^ #(FamixTReference)
]

{ #category : #meta }
FAMIXReference class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXReference >> accept: aVisitor [

	aVisitor visitReference: self
]

{ #category : #'Famix-Extensions' }
FAMIXReference >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self source: (aVisitor visit: anEntity source).
	self target: (aVisitor visit: anEntity target).
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
