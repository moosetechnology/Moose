"
Dialog used to import MSE models
"
Class {
	#name : #MooseImportFromMSEForm,
	#superclass : #MooseImportForm,
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
MooseImportFromMSEForm class >> windowExtent [

	^ 300 @ (self toolbarHeight + self buttonHeight * 2)
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

{ #category : #action }
MooseImportFromMSEForm >> privateImportModel [

	^ mooseModelDroplist selectedItem new importFromMSE
]
