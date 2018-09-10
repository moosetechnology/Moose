"
A MooseImportingContextPart is the part concerning the context to import in the second 'page' of the moose wizard. 

Instance Variables
	centralCheckbox:		<Object>
	contextFrame:		<Object>
	detailContextButton:		<Object>

centralCheckbox
	- xxxxx

contextFrame
	- xxxxx

detailContextButton
	- xxxxx

"
Class {
	#name : #MooseImportingContextPart,
	#superclass : #WizardPart,
	#instVars : [
		'centralCheckbox',
		'detailContextButton',
		'contextFrame'
	],
	#category : #'Moose-Wizard'
}

{ #category : #actions }
MooseImportingContextPart >> contextFrameOkButtonActions [
	"make all the things that have to be done when the user click on the context frames ok button."
	
	contextFrame allSelected 
		ifTrue: [ 
			centralCheckbox disable.
			centralCheckbox buttonMorph state: #on.
			]
		ifFalse: [
			centralCheckbox enable.
			centralCheckbox buttonMorph state: #off.
			].
		
		contextFrame close.
		detailContextButton enable.

]

{ #category : #actions }
MooseImportingContextPart >> displayContextFrameInsideTheContextBox [
	| contentMorph groupBox |
	contentMorph := contextFrame dialogWindow contentMorph .
	groupBox := self contents submorphs first.
	
	groupBox addContentMorph: contentMorph .
	self wizardPane buildDialogWindow .
	"groupBox addContentMorph: (self newRowWith:{ self newReduceContextButton} )"
]

{ #category : #'initialize-release' }
MooseImportingContextPart >> initialize [

	super initialize.
	contextFrame := MooseContextFrame new.
	self populateContents: {self 
		newGroupboxNamed: 'Context' WithAll: { 
				self newRowWith:{
				(self newCentralCheckbox).
				(self newDetailContextButton)}
			 }.}
]

{ #category : #'morph content setup tools' }
MooseImportingContextPart >> newCentralCheckbox [
	"Return a checkbox telling if all the context or not has to be imported. By default, all the context is imported and this check is selected and disabled.
	It is enabled when you click on the detail button and make change on the selected items."
	centralCheckbox := (self 
		newCheckboxFor: (ValueHolder new contents: true)
		getSelected: #contents
		setSelected: #contents:
		label: 'All') disable.
	"This checkbox has to be update if all contexts are selected : "
	centralCheckbox buttonMorph
		target: self;
		actionSelector: #updateContextCheckbox;
		arguments: {   }.
	^ centralCheckbox
]

{ #category : #'morph content setup tools' }
MooseImportingContextPart >> newDetailContextButton [

	"return a button opening the context frame when clicked"
	
	^ detailContextButton := self 
		newButtonNamed: 'Details'
		withAction: #openContextFrame.
]

{ #category : #actions }
MooseImportingContextPart >> openContextFrame [
	detailContextButton disable.

	"version with context frame outside the pane :"
	"contextFrame open."

	"version with context frame inside the pane"
	self displayContextFrameInsideTheContextBox.
	self wizardPane adaptSize 
]

{ #category : #'accessing - wizard mangement' }
MooseImportingContextPart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	^ contextFrame contextSelected
]

{ #category : #actions }
MooseImportingContextPart >> updateContextCheckbox [
	"make all the things that have to be done when the user click on the context checkbox:"
	"-> make it disabled and on selected"
	centralCheckbox disable.
	centralCheckbox buttonMorph state: #on.
	"-> select all checkboxes in the context Frame"
	^ contextFrame selectAllContext .
]
