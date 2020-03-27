Class {
	#name : #FamixTNamespaceGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTNamespaceGroup class >> annotation [

	<FMClass: #TNamespaceGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTNamespaceGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
