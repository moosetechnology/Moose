Class {
	#name : #MPImportFileStructureCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportFileStructureCommand >> execute [
	| model |
	model := MooseModel new.
	model importFileStructure.
	model notEmpty
		ifTrue: [ 
			model install.
			self addModel: model ]
]

{ #category : #hooks }
MPImportFileStructureCommand >> label [
	^ 'Import file model from file system'
]
