Class {
	#name : #MooseFileStructureImporter,
	#superclass : #MooseAbstractImporter,
	#instVars : [
		'mooseModel'
	],
	#category : #'Moose-GenericImporter-Importers'
}

{ #category : #accessing }
MooseFileStructureImporter >> classImplementing: aFamixTrait [
	^ self mooseModel metamodel classes
		detect: [ :e | e implementingClass traits includes: aFamixTrait ]
		ifFound: #implementingClass
		ifNone: [ self error: 'This MM does not includes the full concept of files needed by the MooseFileStructureImporter.' ]
]

{ #category : #importing }
MooseFileStructureImporter >> completeImport: folders [
	folders
		do: [ :each | 
			| folder |
			folder := self folderClass named: each filedIn: nil.
			self importContentsInFolderNamed: (FileSystem disk referenceTo: each) filedInFolder: folder.
			self mooseModel add: folder ].
	self mooseModel sourceLanguage: self unknownSourceLanguageClass new
]

{ #category : #accessing }
MooseFileStructureImporter >> fileClass [
	^ self classImplementing: FamixTFile
]

{ #category : #accessing }
MooseFileStructureImporter >> folderClass [
	^ self classImplementing: FamixTFolder
]

{ #category : #private }
MooseFileStructureImporter >> folderSeparator [
	^ FileSystem disk delimiter asString
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
	file := self fileClass named: aFileName basename filedIn: aContainerFolder.
	file parentFolder: aContainerFolder.
	self mooseModel add: file
]

{ #category : #importing }
MooseFileStructureImporter >> importFolderNamed: aFolderName filedInFolder: aContainerFolder [
	| folder |
	folder := self folderClass named: aFolderName basename filedIn: aContainerFolder.
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

{ #category : #accessing }
MooseFileStructureImporter >> unknownSourceLanguageClass [
	^ self classImplementing: FamixTUnknownSourceLanguage
]
