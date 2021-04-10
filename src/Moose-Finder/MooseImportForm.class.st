Class {
	#name : #MooseImportForm,
	#superclass : #SpPresenter,
	#instVars : [
		'originBrowser'
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
	self updateBrowserWith: mooseModel
]

{ #category : #initialization }
MooseImportForm >> initializeDialogWindow: aDialog [

	aDialog initialExtent: self class windowExtent.
	aDialog addButton: 'Import' do: [ :dialog | 
		dialog close.
		self importModel ].
	aDialog addButton: 'Cancel' do: [ :dialog | dialog close ]
]

{ #category : #action }
MooseImportForm >> privateImportModel [

	self subclassResponsibility
]

{ #category : #'accessing model' }
MooseImportForm >> setModelBeforeInitialization: aBrowserOrMoosePanel [

	originBrowser := aBrowserOrMoosePanel
]

{ #category : #action }
MooseImportForm >> updateBrowserWith: mooseModel [

	originBrowser ifNotNil: [ 
		originBrowser updateForNewModel: mooseModel ]
]
