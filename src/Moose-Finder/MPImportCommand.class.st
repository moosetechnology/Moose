"
I am the superclass of Moose Import commands.

Simple use: 
`MPImportSTCommand new execute`.

Link to a context (for example a spec presenter):
`(MPImportSTCommand forSpecContext: yourPresenter) execute`.
Your presenter should implement `#updateForNewModel:` to define behavior when a new model is installed successfully
"
Class {
	#name : #MPImportCommand,
	#superclass : #CmCommand,
	#category : #'Moose-Finder-Import'
}

{ #category : #converting }
MPImportCommand class >> asCommandGroup [

	^ CmCommandGroup new
		  register: MPImportMSECommand;
		  register: MPImportSTCommand;
		  yourself
]

{ #category : #converting }
MPImportCommand class >> asSpecCommandGroupIn: aPresenter [

	^ CmCommandGroup forSpec
		  register: (MPImportMSECommand forSpecContext: aPresenter);
		  register: (MPImportSTCommand forSpecContext: aPresenter);
		  yourself
]

{ #category : #testing }
MPImportCommand class >> isAbstract [
	^ self = MPImportCommand
]

{ #category : #hooks }
MPImportCommand >> execute [

	(self importForm on: self context) openModalWithSpec
]

{ #category : #hooks }
MPImportCommand >> importForm [

	self subclassResponsibility
]
