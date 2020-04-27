Class {
	#name : #FamixNamespaceGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixNamespaceGroup class >> annotation [

	<FMClass: #NamespaceGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixNamespaceGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
