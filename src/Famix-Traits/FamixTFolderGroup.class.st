Class {
	#name : #FamixTFolderGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTFolderGroup class >> annotation [

	<FMClass: #TFolderGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTFolderGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #'accessing-dynamic' }
FamixTFolderGroup >> allFiles [
	| files |
	
	files := OrderedCollection new.
	self do: [:folder | files addAll: folder files].
	^ files 
]
