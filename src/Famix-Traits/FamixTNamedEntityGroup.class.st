Class {
	#name : #FamixTNamedEntityGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTNamedEntityGroup class >> annotation [

	<FMClass: #TNamedEntityGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTNamedEntityGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
