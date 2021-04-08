"
I am the superclass of Moose Import commands.

Simple use: 
`MPImportSTCommand new execute`.

Link to a context (for example a spec presenter):
`(MPImportSTCommand forSpecContext: yourPresenter) execute`.
You can also use class side method `#asCommandGroupForSpecContext:` to build a Spec command group with both MSE and St import commands.
Your presenter should implement `#updateForNewModel:` to define behavior when a new model is installed successfully
"
Class {
	#name : #MPImportCommand,
	#superclass : #CmCommand,
	#category : #'Moose-Finder-Import'
}

{ #category : #converting }
MPImportCommand class >> addToSpCommandGroup: aSpCommandGroup forSpecContext: aPresenter [

	{ 
		MPImportMSECommand.
		MPImportSTCommand } do: [ :cmd | 
		aSpCommandGroup register: ((cmd forSpecContext: aPresenter)
				 iconName: cmd defaultIconName;
				 yourself) ].
	^ aSpCommandGroup
]

{ #category : #converting }
MPImportCommand class >> asCommandGroupForSpecContext: aPresenter [

	^ self
		  addToSpCommandGroup: CmCommandGroup forSpec
		  forSpecContext: aPresenter
]

{ #category : #accessing }
MPImportCommand class >> importForm [

	self subclassResponsibility
]

{ #category : #testing }
MPImportCommand class >> isAbstract [
	^ self = MPImportCommand
]

{ #category : #hooks }
MPImportCommand >> execute [

	(self class importForm on: self context) openModalWithSpec
]
