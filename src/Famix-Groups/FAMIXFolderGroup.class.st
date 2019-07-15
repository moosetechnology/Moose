Class {
	#name : #FAMIXFolderGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXFolderGroup class >> annotation [
	<MSEClass: #FolderGroup super: #MooseGroup>
	<package: #FAMIX>
]

{ #category : #'accessing-dynamic' }
FAMIXFolderGroup >> allFiles [
	| files |
	
	files := OrderedCollection new.
	self do: [:folder | files addAll: folder files].
	^ files 
]
