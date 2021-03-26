Class {
	#name : #MPImportMSECommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportMSECommand >> execute [

	(MooseImportFromMSEForm new
		 openDialogWithSpec;
		 mooseModel) ifNotNil: [ :model | self addModel: model ]
]

{ #category : #hooks }
MPImportMSECommand >> icon [
	^ MooseIcons mooseImportMse
]

{ #category : #hooks }
MPImportMSECommand >> label [
	^ 'Import model from MSE file'
]

{ #category : #hooks }
MPImportMSECommand >> modelClass [
	| modelClasses |
	modelClasses := MooseModel withAllSubclasses
		reject: [ :model | model isDeprecated or: [ model isTestModel ] ].
	^ UIManager default
		chooseFrom: (modelClasses collect: [ :model | model name ])
		values: modelClasses
		title: 'Please select a metamodel'
]
