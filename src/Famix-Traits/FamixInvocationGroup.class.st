Class {
	#name : #FamixInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixInvocationGroup class >> annotation [

	<FMClass: #InvocationGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixInvocationGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
