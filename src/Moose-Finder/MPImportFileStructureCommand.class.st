Class {
	#name : #MPImportFileStructureCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportFileStructureCommand >> execute [
	MooseModel new
		importFileStructure;
		ifNotEmpty: [ :model | 
			model install.
			self addModel: model ]
]

{ #category : #hooks }
MPImportFileStructureCommand >> label [
	^ 'Import file model from file system'
]
