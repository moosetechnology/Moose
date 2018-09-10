"
FAMIXFolderGroup is a MooseGroup containing only FAMIX enities of type FAMIXFolder.
"
Class {
	#name : #FAMIXFolderGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-File'
}

{ #category : #meta }
FAMIXFolderGroup class >> annotation [
	<MSEClass: #FolderGroup super: #MooseGroup>
	<package: #FILE>
]

{ #category : #'accessing computed' }
FAMIXFolderGroup >> allFiles [
	| files |
	
	files := OrderedCollection new.
	self do: [:folder | files addAll: folder files].
	^ files 
]
