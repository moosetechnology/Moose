Class {
	#name : #FamixMultipleFileAnchorTest,
	#superclass : #FamixSourceAnchorTest,
	#instVars : [
		'multipleFileAnchor'
	],
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #helpers }
FamixMultipleFileAnchorTest >> actualClass [
	^ FamixTest1MultipleFileAnchor
]

{ #category : #running }
FamixMultipleFileAnchorTest >> setUp [
	super setUp.
	multipleFileAnchor := self actualClass new mooseModel: FamixTest1Model new.
	1 to: 2 do: [ :each | multipleFileAnchor addFileAnchorWithPath: 'aFileName' ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testAdditionOfFiles [
	self assert: multipleFileAnchor allFiles size equals: 1.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName1'.
	self assert: multipleFileAnchor allFiles size equals: 2.
	self assert: multipleFileAnchor sourceText lines size equals:2.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName2'.
	self assert: multipleFileAnchor sourceText lines size equals:3.
	
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFiles [
	| anchor |
	anchor := self actualClass new
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test';
						yourself);
				yourself);
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test2';
						yourself);
				yourself);
		yourself.
	self assert: anchor containerFiles size equals: 2.
	(anchor containerFiles collect: #name) do: [ :fileName | self assert: (#('test' 'test2') includes: fileName) ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFilesWithoutFileReferenced [
	"This test was added because before if a multiple source anchor does not have the corresponding files we got array of nils"

	| anchor |
	anchor := self actualClass new
		addSourceAnchor: FamixTest1FileAnchor new;
		addSourceAnchor: FamixTest1FileAnchor new;
		yourself.
	self assertEmpty: anchor containerFiles
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testIsMultiple [
	^ self assert: self actualClass new isMultiple
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testMultipleSourceAnchorEntity [
	| class |
	class := FamixTest1Class new
		mooseModel: FamixTest1Model new;
		defineMultiSourceAnchorWithPath: 'aClassName'.
	self assert: class sourceAnchor allFiles size equals: 1
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testSimilarFileAnchors [
	self assert: multipleFileAnchor allFiles size equals: 1.
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testSourceText [
	| sourceText |
	sourceText := multipleFileAnchor sourceText.
	self assert: sourceText isNotEmpty.
	self assert: (sourceText includesSubstring: '=============', String lf)
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testWritingAndReadingInMSE [
	| tempFile importedModel |
	tempFile := (FileSystem memory / 'files-test.mse')
		ensureCreateFile;
		yourself.
	tempFile writeStreamDo: [ :s | multipleFileAnchor mooseModel exportToMSEStream: s ].
	tempFile readStreamDo: [ :s | importedModel := FamixTest1Model importFromMSEStream: s ].
	self assert: (importedModel allUsing: FamixTMultipleFileAnchor) size equals: 1.
	self assert: (importedModel allUsing: FamixTFileAnchor) size equals: 1
]
