Class {
	#name : #FamixTypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTypeGroup class >> annotation [

	<FMClass: #TypeGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTypeGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
