Class {
	#name : #DudeMooseFileTest,
	#superclass : #MooseFileStructureImporterTest,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #setUp }
DudeMooseFileTest >> file1 [ 
	 
	^'1 
1 
2 
1 
3 
4 
7 
3 
2 
9 
5 
a 
c 
6 
7 
8'
]

{ #category : #setUp }
DudeMooseFileTest >> file2 [ 
	 
	^'9 
1 
2 
1 
3 
 
8 
3 
2 
9 
5 
v 
b 
6 
7 
8'
]

{ #category : #setUp }
DudeMooseFileTest >> setUp [ 
	 
	| stream file detector |
	self createDirectory: self foldersString. 
	file := self createFile: (self foldersString , 'file1'). 
	stream := file writeStream. 
	stream nextPutAll: self file1. 
	stream close. 
	file := self createFile: (self foldersString , 'file2'). 
	stream := file writeStream. 
	stream nextPutAll: self file2. 
	stream close. 
	model := MooseModel new.
	(MooseFileStructureImporter new) 
		mooseModel: model; 
		completeImport: (OrderedCollection with: 'folders'). 
	detector := DudeDetector 
		new: DudeCStyleFiles 
		from: model allFiles 
		inModel: model. 
	detector getMultiplicationsWith1032
]

{ #category : #testing }
DudeMooseFileTest >> testFiles [
	| dups multis |
	multis := model allMultiplications.
	self assert: multis size equals: 1.
	dups := (multis at: 1) duplications.
	self assert: dups notNil.
	self assert: dups size equals: 1
]
