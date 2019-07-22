Class {
	#name : #FAMIXLeafEntity,
	#superclass : #FAMIXNamedEntity,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXLeafEntity class >> annotation [

	<MSEClass: #LeafEntity super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #visiting }
FAMIXLeafEntity >> accept: aVisitor [

	aVisitor visitLeafEntity: self
]
