Class {
	#name : #MerlinMorphDirectoryChooseWidget,
	#superclass : #MerlinMorphChooseFileWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphDirectoryChooseWidget >> fileDialog [

	^ fileDialog ifNil: [fileDialog :=  ((self newDirectoryDialogNamed: self wizardPart selectedPathName)).]
]

{ #category : #'accessing - wizard management' }
MerlinMorphDirectoryChooseWidget >> populateWizardPartOutput [ 

	self wizardPart outputValue: self fileDialog selectedAnyFileDirectory
]
