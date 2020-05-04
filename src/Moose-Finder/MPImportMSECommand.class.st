Class {
	#name : #MPImportMSECommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportMSECommand >> execute [
	[ | model |
	model := MooseModel new.
	model importFromMSE.
	model isNotEmpty
		ifTrue: [ model install.
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
