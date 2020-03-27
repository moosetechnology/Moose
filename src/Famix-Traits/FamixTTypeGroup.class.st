Class {
	#name : #FamixTTypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTTypeGroup class >> annotation [

	<FMClass: #TTypeGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTTypeGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
