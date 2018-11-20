Class {
	#name : #DirectoryChoosePart,
	#superclass : #ChooseFilePart,
	#category : #'Merlin-Parts'
}

{ #category : #'as yet unclassified' }
DirectoryChoosePart >> merlinRendering [

	^ self renderer merlinDirectoryChooseRenderingFor: self
]
