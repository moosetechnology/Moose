Class {
	#name : #MerlinMorphChooseFileWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'fileDialog'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphChooseFileWidget >> fileDialog [

	^ fileDialog ifNil: [ fileDialog := self newFileDialogNamed: self wizardPart selectedPathName ]
]

{ #category : #accessing }
MerlinMorphChooseFileWidget >> fileDialog: aFileDialog [

	fileDialog := aFileDialog 
]

{ #category : #'accessing - wizard management' }
MerlinMorphChooseFileWidget >> populateWizardPartOutput [ 

	self wizardPart outputValue: self fileDialog selectedPathName
]

{ #category : #'accessing - morph contents' }
MerlinMorphChooseFileWidget >> setDefaultSelectedPath [

	self wizardPart selectedPathName ifNotNil: [
		self fileDialog selectPathName: self wizardPart selectedPathName asFileReference parent fullName ]
		
]

{ #category : #'accessing - morph contents' }
MerlinMorphChooseFileWidget >> setValidExtensions [

	self wizardPart validExtensions ifNotNil: [
		self fileDialog validExtensions: self wizardPart validExtensions
		].
		
]

{ #category : #'accessing - morph contents' }
MerlinMorphChooseFileWidget >> specificMorphContents [ 

	|tmpMorph|
	tmpMorph :=  self fileDialog newContentMorph.
	self setValidExtensions.
	self setDefaultSelectedPath.	
	^ tmpMorph
						      

	
]
