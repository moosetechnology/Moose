Class {
	#name : #MADirectoryMorph,
	#superclass : #MAFileMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MADirectoryMorph >> choose: titleString in: defaultDirectory [

	^ UIManager default chooseDirectory: titleString from: defaultDirectory.
]
