Class {
	#name : #FamixMethodGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixMethodGroup class >> annotation [

	<FMClass: #MethodGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixMethodGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
