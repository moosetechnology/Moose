Class {
	#name : #FamixGlobalVariableGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixGlobalVariableGroup class >> annotation [

	<FMClass: #GlobalVariableGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixGlobalVariableGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
