Class {
	#name : #FamixFolderGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixFolderGroup class >> annotation [

	<FMClass: #FolderGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixFolderGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
