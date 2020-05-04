Class {
	#name : #DirectoryChoosePart,
	#superclass : #ChooseFilePart,
	#category : #'Merlin-Parts'
}

{ #category : #rendering }
DirectoryChoosePart >> merlinRendering [

	^ self renderer merlinDirectoryChooseRenderingFor: self
]
