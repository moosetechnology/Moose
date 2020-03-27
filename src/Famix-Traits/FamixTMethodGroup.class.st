Class {
	#name : #FamixTMethodGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTMethodGroup class >> annotation [

	<FMClass: #TMethodGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTMethodGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
