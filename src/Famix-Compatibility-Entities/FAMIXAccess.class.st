Class {
	#name : #FAMIXAccess,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAccess class >> annotation [

	<MSEClass: #Access super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> fromMethod [
	^ self lookupSelector: #accessor
]

{ #category : #generator }
FAMIXAccess class >> generatedSlotNames [
	<generated>
	'FAMIXAccess class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAccess class >> generatedTraitNames [
	<generated>
	^ #(FamixTAccess)
]

{ #category : #meta }
FAMIXAccess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> toMethod [
	^ self lookupSelector: #variable
]

{ #category : #'Famix-Extensions' }
FAMIXAccess >> accept: aVisitor [

	aVisitor visitAccess: self
]

{ #category : #'Famix-Extensions' }
FAMIXAccess >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self isWrite: anEntity isWrite.
	self accessor: (aVisitor visit: anEntity accessor).
	self variable: (aVisitor visit: anEntity variable).
]

{ #category : #testing }
FAMIXAccess >> isAccess [
	^true
]

{ #category : #'Famix-Implementation' }
FAMIXAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
