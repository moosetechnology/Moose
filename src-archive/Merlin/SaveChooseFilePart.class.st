Class {
	#name : #SaveChooseFilePart,
	#superclass : #ChooseFilePart,
	#category : #'Merlin-Parts'
}

{ #category : #'*Merlin-Rendering' }
SaveChooseFilePart >> merlinRendering [

	^ self renderer merlinSaveChooseFileRenderingFor: self
]
