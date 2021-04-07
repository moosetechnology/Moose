Class {
	#name : #MPImportFileStructureCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder-Import'
}

{ #category : #default }
MPImportFileStructureCommand class >> defaultIcon [

	^ nil
]

{ #category : #default }
MPImportFileStructureCommand class >> defaultName [

	^ 'Import file model from file system'
]

{ #category : #hooks }
MPImportFileStructureCommand >> execute [

	MooseModel new
		importFileStructure;
		ifNotEmpty: [ :model | 
			model install.
			self context updateForNewModel: model ]
]
