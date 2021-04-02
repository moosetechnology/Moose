Class {
	#name : #MooseImportForm,
	#superclass : #MiPresenter,
	#instVars : [
		'callback'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #initialization }
MooseImportForm class >> windowExtent [

	self subclassResponsibility
]

{ #category : #action }
MooseImportForm >> importModel [

	| mooseModel |
	[ mooseModel := self privateImportModel ] onErrorDo: [ :err | 
		UIManager default alert: 'Import error: ' , err messageText.
		^ self ].
	mooseModel install.
	self announcer announce:
		(MPNewModelInstalled new newModel: mooseModel)
]

{ #category : #initialization }
MooseImportForm >> initializeDialogWindow: aDialog [

	aDialog initialExtent: self class windowExtent.
	aDialog addButton: 'Install' do: [ :dialog | 
		dialog close.
		self importModel ].
	aDialog addButton: 'Cancel' do: [ :dialog | dialog close ]
]

{ #category : #action }
MooseImportForm >> privateImportModel [

	self subclassResponsibility
]
