Class {
	#name : #MPImportMSECommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportMSECommand >> execute [

	| importForm |
	importForm := MooseImportFromMSEForm new.
	importForm announcer
		when: MPNewModelInstalled
		do: [ :ann | self addModel: ann newModel ].
	importForm openModalWithSpec
]

{ #category : #hooks }
MPImportMSECommand >> icon [
	^ MooseIcons mooseImportMse
]

{ #category : #hooks }
MPImportMSECommand >> label [
	^ 'Import model from MSE file'
]
