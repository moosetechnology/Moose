"
Dialog used to import MSE models
"
Class {
	#name : #MooseImportFromMSEForm,
	#superclass : #MiPresenter,
	#instVars : [
		'mooseModelDroplist'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #specs }
MooseImportFromMSEForm class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #mooseModelDroplist
		  withConstraints: [ :constraints | 
			  constraints height: self toolbarHeight ];
		  yourself
]

{ #category : #specs }
MooseImportFromMSEForm class >> runMe [

	<script>
	^ self new openDialogWithSpec
]

{ #category : #specs }
MooseImportFromMSEForm class >> title [
	^ 'Import model from MSE file'
]

{ #category : #initialization }
MooseImportFromMSEForm >> initializeDialogWindow: aDialog [

	aDialog
		addButton: 'Install' do: [ :presenter | 
			| model |
			model := mooseModelDroplist selectedItem new importFromMSE.
			model name = #noname ifFalse: [ model install ].
			presenter close ];
		addButton: 'Cancel' do: [ :presenter | presenter close ]
]

{ #category : #initialization }
MooseImportFromMSEForm >> initializePresenters [

	super initializePresenters.
	mooseModelDroplist := self newDropList
		                     items:
			                     (MooseModel withAllSubclasses reject: [ :model | 
					                      model isDeprecated or: [ model isTestModel ] ]);
		                     selectItem: MooseModel;
		                     yourself
]

{ #category : #initialization }
MooseImportFromMSEForm >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		initialExtent:
			300 @ (self class toolbarHeight + self class buttonHeight * 2);
		centered
]
