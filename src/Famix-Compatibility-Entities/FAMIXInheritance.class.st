Class {
	#name : #FAMIXInheritance,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTInheritanceGlue + FamixTSubInheritance + FamixTSuperInheritance',
	#classTraits : 'FamixTInheritanceGlue classTrait + FamixTSubInheritance classTrait + FamixTSuperInheritance classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInheritance class >> annotation [

	<MSEClass: #Inheritance super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXInheritance class >> generatedSlotNames [
	<generated>
	'FAMIXInheritance class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXInheritance class >> generatedTraitNames [
	<generated>
	^ #(FamixTInheritanceGlue FamixTSubInheritance FamixTSuperInheritance)
]

{ #category : #meta }
FAMIXInheritance class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXInheritance >> accept: aVisitor [

	aVisitor visitInheritance: self
]

{ #category : #'Famix-Extensions' }
FAMIXInheritance >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self superclass: (aVisitor visit: anEntity superclass).
	self subclass: (aVisitor visit: anEntity subclass).
]

{ #category : #'Moose-Hismo' }
FAMIXInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]

{ #category : #'Famix-Implementation' }
FAMIXInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #'Famix-Implementation' }
FAMIXInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
