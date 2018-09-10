Class {
	#name : #FamixJavaAccess,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAccess class >> annotation [

	<MSEClass: #Access super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaAccess class >> generatedSlotNames [
	<generated>
	'FamixJavaAccess class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaAccess class >> generatedTraitNames [
	<generated>
	^ #(FamixTAccess)
]

{ #category : #meta }
FamixJavaAccess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaAccess >> accept: aVisitor [

	aVisitor visitAccess: self
]

{ #category : #'as yet unclassified' }
FamixJavaAccess >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self isWrite: anEntity isWrite.
	self accessor: (aVisitor visit: anEntity accessor).
	self variable: (aVisitor visit: anEntity variable).
]

{ #category : #'as yet unclassified' }
FamixJavaAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
