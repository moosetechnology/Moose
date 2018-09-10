Class {
	#name : #MPImportJavaSourceFilesWithJdt2FamixCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Wizard'
}

{ #category : #hooks }
MPImportJavaSourceFilesWithJdt2FamixCommand >> execute [
 
	MooseImportFromJdt2FamixWizard  new open.
	self updateModelList .

]

{ #category : #hooks }
MPImportJavaSourceFilesWithJdt2FamixCommand >> label [
	^ 'Import FAMIX Java model from file sources with jdt2famix'
]
