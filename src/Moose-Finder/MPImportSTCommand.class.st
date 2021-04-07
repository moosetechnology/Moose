Class {
	#name : #MPImportSTCommand,
	#superclass : #MPImportCommand,
	#category : #'Moose-Finder-Import'
}

{ #category : #hooks }
MPImportSTCommand class >> defaultDescription [

	^ 'Import Famix Smalltalk model from the current image'
]

{ #category : #hooks }
MPImportSTCommand class >> defaultIcon [
	
	^ MooseIcons mooseImportSmalltalk
]

{ #category : #hooks }
MPImportSTCommand class >> defaultIconName [
	
	^ #mooseImportSmalltalk
]

{ #category : #hooks }
MPImportSTCommand class >> defaultName [

	^ 'Import from Smalltalk'
]

{ #category : #hooks }
MPImportSTCommand >> importForm [

	^ MooseImportFromSmalltalkForm
]
