Class {
	#name : #MPImportSTCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Wizard'
}

{ #category : #hooks }
MPImportSTCommand >> execute [
	(MooseImportFromSmalltalkImageWizard new
		open;
		mooseModel) ifNotNil: [ :model | self addModel: model ]
]

{ #category : #hooks }
MPImportSTCommand >> icon [
	
	^ MooseIcons mooseImportSmalltalk
]

{ #category : #hooks }
MPImportSTCommand >> label [
	^ 'Import FAMIX Smalltalk model from the current image'
]
