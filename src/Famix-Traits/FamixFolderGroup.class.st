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

{ #category : #'accessing - dynamic' }
FamixFolderGroup >> allFiles [
	| files |
	files := OrderedCollection new.
	self do: [ :folder | files addAll: folder files ].
	^ files
]
