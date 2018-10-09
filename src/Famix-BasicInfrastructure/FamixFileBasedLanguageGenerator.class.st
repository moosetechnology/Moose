Class {
	#name : #FamixFileBasedLanguageGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'abstractFile',
		'abstractFileAnchor',
		'file',
		'fileAnchor',
		'folder',
		'indexedFileAnchor',
		'multipleFileAnchor'
	],
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #definition }
FamixFileBasedLanguageGenerator >> defineClasses [

	super defineClasses.
	
	abstractFile := builder newClassNamed: #AbstractFile.
	abstractFileAnchor := builder newClassNamed: #AbstractFileAnchor.
	file := builder newClassNamed: #File.
	fileAnchor := builder newClassNamed: #FileAnchor.
	folder := builder newClassNamed: #Folder.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	multipleFileAnchor := builder newClassNamed: #MultipleFileAnchor.

]

{ #category : #definition }
FamixFileBasedLanguageGenerator >> defineHierarchy [

	super defineHierarchy.
	
	abstractFile --|> namedEntity.
	abstractFile --|> #TFileSystemEntity.
	
	abstractFileAnchor --|> sourceAnchor.
	abstractFileAnchor --|> #TFileAnchor.

	file --|> abstractFile.
	file --|> #TFile.

	fileAnchor --|> abstractFileAnchor.
	fileAnchor --|> #TFileNavigation.

	folder --|> abstractFile.
	folder --|> #TFolder.

	indexedFileAnchor --|> abstractFileAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	multipleFileAnchor --|> sourceAnchor.
	multipleFileAnchor --|> #TMultipleFileAnchor.

	sourcedEntity --|> #TWithFiles.

]
