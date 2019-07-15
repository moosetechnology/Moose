Class {
	#name : #MerlinMorphSaveChooseFileWidget,
	#superclass : #MerlinMorphChooseFileWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphSaveChooseFileWidget >> fileDialog [

	^ fileDialog ifNil: [fileDialog :=  ((self newSaveFileDialogNamed: self wizardPart selectedPathName)).]
]

{ #category : #'accessing - wizard management' }
MerlinMorphSaveChooseFileWidget >> populateWizardPartOutput [ 

	self wizardPart outputValue: self fileDialog saveSelectedFile
]
