Class {
	#name : #MPImportSTCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportSTCommand >> execute [

	| importForm |
	importForm := MooseImportFromSmalltalkForm new.
	importForm announcer
		when: MPNewModelInstalled
		do: [ :ann | self addModel: ann newModel ].
	importForm openModalWithSpec
]

{ #category : #hooks }
MPImportSTCommand >> icon [
	
	^ MooseIcons mooseImportSmalltalk
]

{ #category : #hooks }
MPImportSTCommand >> label [
	^ 'Import FAMIX Smalltalk model from the current image'
]
