Class {
	#name : #MooseFileStructureImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'toDelete'
	],
	#category : #'Moose-GenericImporters-Tests'
}

{ #category : #setup }
MooseFileStructureImporterTest >> createDirectory: aString [
	self toDelete addFirst: aString.
	^ (self filesystem ensureCreateDirectory: (self filesystem pathFromString: aString))
]

{ #category : #setup }
MooseFileStructureImporterTest >> createEmptyFileNamed: aString [
	self toDelete addFirst: aString.
	aString asFileReference ensureCreateFile
]

{ #category : #setup }
MooseFileStructureImporterTest >> createFileNamed: aString content: aBlock [
	self toDelete addFirst: aString.
	aString asFileReference writeStreamDo: aBlock
]

{ #category : #setup }
MooseFileStructureImporterTest >> filesystem [
	^ FileSystem disk
]

{ #category : #setup }
MooseFileStructureImporterTest >> foldersString [
	^ 'folders/'
]

{ #category : #running }
MooseFileStructureImporterTest >> setUp [
	super setUp.
	toDelete := OrderedCollection new.
	self createDirectory: self foldersString.
	self createDirectory: self subFolderAString.
	self createDirectory: self subFolderBString.
	self createEmptyFileNamed: self subFolderAString , 'emptyFile'.
	self createEmptyFileNamed: self subFolderBString , 'emptyFile'.
	self createEmptyFileNamed: self foldersString , 'emptyFile'.
	self
		createFileNamed: self foldersString , 'fileWith9Chars2Lines'
		content: [ :stream | 
			stream
				nextPutAll: '123456';
				cr;
				nextPutAll: '789' ].
	self
		createFileNamed: self foldersString , 'fileWith9Chars4Lines2EmptyLines'
		content: [ :stream | 
			stream
				nextPutAll: '123456';
				cr;
				cr;
				cr;
				nextPutAll: '789' ].
	model := FamixTest1Model new.
	MooseFileStructureImporter new
		mooseModel: model;
		completeImport: (OrderedCollection with: 'folders')
]

{ #category : #setup }
MooseFileStructureImporterTest >> subFolderAString [
	^ 'folders/subfolderA/'
]

{ #category : #setup }
MooseFileStructureImporterTest >> subFolderBString [
	^ 'folders/subfolderB/'
]

{ #category : #running }
MooseFileStructureImporterTest >> tearDown [
	toDelete do: [ :each | self filesystem delete: each ].
	super tearDown
]

{ #category : #testing }
MooseFileStructureImporterTest >> testCRLFSupportForFile [
	| file |
	file := FamixTest1File new.
	file
		sourceText:
			(String
				streamContents: [ :s | 
					s << 'Proudly tested by'.
					s crlf.
					s << 'Guillaume'.
					s crlf.
					s << 'Honore'.
					s crlf.
					s << 'Hayatou' ]).
	self assert: file totalNumberOfLinesOfText equals: 4
]

{ #category : #testing }
MooseFileStructureImporterTest >> testCRSupportForFile [
	| file |
	file := FamixTest1File new.
	file
		sourceText:
			(String
				streamContents: [ :s | 
					s << 'Proudly tested by'.
					s cr.
					s << 'Guillaume'.
					s cr.
					s << 'Honore'.
					s cr.
					s << 'Hayatou' ]).
	self assert: file totalNumberOfLinesOfText equals: 4
]

{ #category : #testing }
MooseFileStructureImporterTest >> testFiles [
	| files file |
	files := model allFiles.
	self assert: files size equals: 5.
	self assertEmpty: (files select: #isRoot).
	file := files entityNamed: #'folders/emptyFile'.
	self assert: (file propertyNamed: #totalNumberOfLinesOfText) equals: 1.
	self assert: (file propertyNamed: #numberOfLinesOfText) equals: 1.
	self assert: (file propertyNamed: #numberOfCharacters) equals: 0.
	self assert: (file propertyNamed: #averageNumberOfCharactersPerLine) equals: 0.
	self assert: file numberOfBytes equals: 0.
	self assert: (file propertyNamed: #numberOfBytes) equals: 0.
	self assert: (file propertyNamed: #numberOfKiloBytes) equals: 0.
	file := files entityNamed: #'folders/fileWith9Chars2Lines'.
	self assert: file totalNumberOfLinesOfText equals: 2.
	self assert: (file propertyNamed: #totalNumberOfLinesOfText) equals: 2.
	self assert: (file propertyNamed: #numberOfLinesOfText) equals: 2.
	self assert: (file propertyNamed: #numberOfCharacters) equals: 10.
	self assert: (file propertyNamed: #averageNumberOfCharactersPerLine) equals: 5.0.
	self assert: (file propertyNamed: #numberOfEmptyLinesOfText) equals: 0.
	self assert: (file propertyNamed: #numberOfBytes) < 15.
	file := files entityNamed: #'folders/fileWith9Chars4Lines2EmptyLines'.
	self assert: (file propertyNamed: #totalNumberOfLinesOfText) equals: 4.
	self assert: (file propertyNamed: #numberOfLinesOfText) equals: 2.
	self assert: (file propertyNamed: #numberOfCharacters) equals: 12.
	self assert: (file propertyNamed: #averageNumberOfCharactersPerLine) equals: 6.0.
	self assert: (file propertyNamed: #numberOfEmptyLinesOfText) equals: 2.
	self assert: (file propertyNamed: #numberOfBytes) < 16
]

{ #category : #testing }
MooseFileStructureImporterTest >> testFolders [
	| folders folder |
	folders := model allFolders.
	self assert: folders size equals: 3.
	self assert: (folders entityNamed: #folders) isNil not.
	self assert: (folders entityNamed: #folders) isRoot.
	self assert: (folders select: [ :each | each isRoot ]) size equals: 1.
	folder := folders entityNamed: #folders.
	self assert: folder folders size equals: 2.
	self assert: folder allRecursiveFolders size equals: 2.
	self assert: folder allRecursiveFiles size equals: 5.
	^ model
]

{ #category : #testing }
MooseFileStructureImporterTest >> testLFSupportForFile [
	| file |
	file := FamixTest1File new.
	file
		sourceText:
			(String
				streamContents: [ :s | 
					s << 'Proudly tested by'.
					s lf.
					s << 'Guillaume'.
					s lf.
					s << 'Honore'.
					s lf.
					s << 'Hayatou' ]).
	self assert: file totalNumberOfLinesOfText equals: 4
]

{ #category : #testing }
MooseFileStructureImporterTest >> testMetrics [
	| file |
	file := FamixTest1File new.
	self assert: file numberOfLinesOfText isZero.
	self assert: file numberOfBytes isZero.
	self assert: file numberOfCharacters isZero.
	self assert: file numberOfKiloBytes isZero.
	self assert: file totalNumberOfLinesOfText isZero
]

{ #category : #testing }
MooseFileStructureImporterTest >> testMixedCRLFSupportForFile [
	| file |
	file := FamixTest1File new.
	file
		sourceText:
			(String
				streamContents: [ :s | 
					s << 'Proudly tested by'.
					s cr.
					s << 'Guillaume'.
					s crlf.
					s << 'Honore'.
					s lf.
					s << 'Hayatou' ]).
	self assert: file totalNumberOfLinesOfText equals: 4
]

{ #category : #testing }
MooseFileStructureImporterTest >> testNestedFiles [
	| folders |
	folders := model allFolders.
	self assert: (folders entityNamed: #folders) folders size equals: 2.
	(folders entityNamed: #folders) folders do: [ :each | self assert: each files size equals: 1 ]
]

{ #category : #testing }
MooseFileStructureImporterTest >> testSourceText [
	| files |
	files := model allFiles.
	self assert: (files entityNamed: #'folders/fileWith9Chars2Lines') sourceText notEmpty
]

{ #category : #accessing }
MooseFileStructureImporterTest >> toDelete [
	^ toDelete ifNil: [toDelete := OrderedCollection new]
]
