Class {
	#name : #FAMIXInheritance,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInheritance class >> annotation [

	<FMClass: #Inheritance super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
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
