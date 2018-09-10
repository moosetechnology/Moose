Class {
	#name : #MooseFileStructureImporter,
	#superclass : #MooseAbstractImporter,
	#instVars : [
		'mooseModel'
	],
	#category : #'Moose-GenericImporter'
}

{ #category : #importing }
MooseFileStructureImporter >> completeImport: folders [ 
	 
	self flag: #toBeFixed.
	folders 
		do: 
			[:each |  
			| folder | 
			folder := FAMIXFolder named: each filedIn: nil. 
			self importContentsInFolderNamed: (FileSystem disk referenceTo: each) filedInFolder: folder. 
			self mooseModel add: folder]. 
	self mooseModel sourceLanguage: FAMIXUnknownSourceLanguage new
]

{ #category : #private }
MooseFileStructureImporter >> folderSeparator [
	^ String with: (FileSystem disk delimiter)
]

{ #category : #importing }
MooseFileStructureImporter >> importContentsInFolderNamed: aFolderName filedInFolder: aContainerFolder [ 
	 
	| entries |
	entries := aFolderName entries.
	(entries select: #isFile)
		do: [:each | self importFileNamed: each filedInFolder: aContainerFolder].
	(entries select: #isDirectory)
		do: [:each | self importFolderNamed: each filedInFolder: aContainerFolder]
]

{ #category : #importing }
MooseFileStructureImporter >> importFileNamed: aFileName filedInFolder: aContainerFolder [ 
	 
	| file | 
		self flag: #toBeFixed.
	file := FAMIXFile 
		named: aFileName basename 
		filedIn: aContainerFolder. 
		file parentFolder:aContainerFolder.
	self mooseModel add: file
]

{ #category : #importing }
MooseFileStructureImporter >> importFolderNamed: aFolderName filedInFolder: aContainerFolder [ 
	 
	| folder | 
		self flag: #toBeFixed.
	folder := FAMIXFolder 
		named: aFolderName basename 
		filedIn: aContainerFolder. 
	 folder parentFolder: aContainerFolder. 
	self importContentsInFolderNamed: aFolderName reference filedInFolder: folder. 
	self mooseModel add: folder
]

{ #category : #accessing }
MooseFileStructureImporter >> mooseModel [ 
	 
	^mooseModel
]

{ #category : #accessing }
MooseFileStructureImporter >> mooseModel: anObject [ 
	 
	mooseModel := anObject
]
