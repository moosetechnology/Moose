Class {
	#name : #MPImportMonticelloCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder'
}

{ #category : #hooks }
MPImportMonticelloCommand >> execute [
	| model importer value fileNames |

	importer := MooseMonticelloCacheImporter new.
	fileNames := importer fileNames asSortedCollection. 

	fileNames ifEmpty: [ self inform: 'No Monticello package is available'. ^ self ].

	"We choose the first package"
	value := UIManager default
		chooseFrom: fileNames values: fileNames title: 'Choose a Monticello package to import'.
	value ifNil: [ ^ self ].

	model := importer importFileNamed: value.
	model name: value.

	model install.
	self addModel: model
]

{ #category : #hooks }
MPImportMonticelloCommand >> label [
	^ 'Import FAMIX Smalltalk model from Monticello repository'
]
