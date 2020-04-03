Class {
	#name : #FamixFileGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixFileGroup class >> annotation [

	<FMClass: #FileGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixFileGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
