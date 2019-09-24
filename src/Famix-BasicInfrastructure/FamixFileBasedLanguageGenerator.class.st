Class {
	#name : #FamixFileBasedLanguageGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'abstractFileAnchor',
		'file',
		'fileAnchor',
		'folder',
		'indexedFileAnchor',
		'multipleFileAnchor'
	],
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #testing }
FamixFileBasedLanguageGenerator class >> isAbstract [
	^ self = FamixFileBasedLanguageGenerator
]

{ #category : #definition }
FamixFileBasedLanguageGenerator >> defineClasses [
	super defineClasses.

	abstractFileAnchor := builder newClassNamed: #AbstractFileAnchor.
	file := builder newClassNamed: #File.
	fileAnchor := builder newClassNamed: #FileAnchor.
	folder := builder newClassNamed: #Folder.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	multipleFileAnchor := builder newClassNamed: #MultipleFileAnchor
]

{ #category : #definition }
FamixFileBasedLanguageGenerator >> defineHierarchy [
	super defineHierarchy.
	abstractFileAnchor --|> sourceAnchor.
	abstractFileAnchor --|> #TFileAnchor.

	file --|> namedEntity.
	file --|> #TFile.

	fileAnchor --|> abstractFileAnchor.
	fileAnchor --|> #TFileNavigation.

	folder --|> namedEntity.
	folder --|> #TFolder.

	indexedFileAnchor --|> abstractFileAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	multipleFileAnchor --|> sourceAnchor.
	multipleFileAnchor --|> #TMultipleFileAnchor.

	sourcedEntity --|> #TWithFiles
]
