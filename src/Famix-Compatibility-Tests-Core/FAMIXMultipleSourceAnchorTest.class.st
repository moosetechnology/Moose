Class {
	#name : #FAMIXMultipleSourceAnchorTest,
	#superclass : #TestCase,
	#instVars : [
		'multipleFileAnchor'
	],
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #running }
FAMIXMultipleSourceAnchorTest >> setUp [
	super setUp.
	multipleFileAnchor := FAMIXMultipleFileAnchor new mooseModel: MooseModel new.
	(1 to: 2) do: [:each | multipleFileAnchor addFileAnchorWithPath: 'aFileName']
]

{ #category : #tests }
FAMIXMultipleSourceAnchorTest >> testAdditionOfFiles [
	self assert: multipleFileAnchor allFiles size equals: 1.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName1'.
	self assert: multipleFileAnchor allFiles size equals: 2.
	self assert: multipleFileAnchor sourceText lines size equals:2.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName2'.
	self assert: multipleFileAnchor sourceText lines size equals:3.
	
]

{ #category : #tests }
FAMIXMultipleSourceAnchorTest >> testMultipleSourceAnchorEntity [
	| class |
	class := FAMIXClass new mooseModel: MooseModel new; defineMultiSourceAnchorWithPath: 'aClassName'.
	self assert: class sourceAnchor allFiles size equals: 1.
]

{ #category : #tests }
FAMIXMultipleSourceAnchorTest >> testSimilarFileAnchors [
	self assert: multipleFileAnchor allFiles size equals: 1.
]

{ #category : #tests }
FAMIXMultipleSourceAnchorTest >> testSourceText [
	| sourceText |
	sourceText := multipleFileAnchor sourceText.
	self assert: sourceText isNotEmpty.
	self assert: (sourceText includesSubstring: '=============', String lf)
]

{ #category : #tests }
FAMIXMultipleSourceAnchorTest >> testWritingAndReadingInMSE [
	| tempFile importedModel |
	tempFile := (FileSystem memory / 'files-test.mse') ensureCreateFile.
	multipleFileAnchor mooseModel exportToMSEStream: tempFile writeStream.
	importedModel := MooseModel new importFromMSEStream: tempFile readStream.
	self deny: multipleFileAnchor allFiles isEmpty
]
