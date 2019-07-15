Class {
	#name : #SaveChooseFilePart,
	#superclass : #ChooseFilePart,
	#category : #'Merlin-Parts'
}

{ #category : #rendering }
SaveChooseFilePart >> merlinRendering [

	^ self renderer merlinSaveChooseFileRenderingFor: self
]
