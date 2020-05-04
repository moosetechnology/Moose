Class {
	#name : #MPImportMSECommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportMSECommand >> execute [
	[ MooseModel new
		importFromMSE;
		ifNotEmpty: [ :model | 
			model install.
			self addModel: model ] ] fork
]

{ #category : #hooks }
MPImportMSECommand >> icon [
	^ MooseIcons mooseImportMse
]

{ #category : #hooks }
MPImportMSECommand >> label [
	^ 'Import model from MSE file'
]
