Class {
	#name : #MoosePanelCommand,
	#superclass : #Object,
	#instVars : [
		'moosePanel'
	],
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MoosePanelCommand class >> allCommands [
	^ self allSubclasses reject: #isAbstractCommand
]

{ #category : #testing }
MoosePanelCommand class >> isAbstractCommand [
	^ self selectors includes: #abstractTag
]

{ #category : #accessing }
MoosePanelCommand >> abstractTag [
	"Say that this class will not taken into consideration when querying command hierarchy"
]

{ #category : #actions }
MoosePanelCommand >> addModel: aMooseModel [
	"Note that MoosePanel has its list refreshed"
	moosePanel ifNotNil: [moosePanel addModel: aMooseModel]
]

{ #category : #hooks }
MoosePanelCommand >> category [

	^ nil
]

{ #category : #hooks }
MoosePanelCommand >> execute [
	self subclassResponsibility
]

{ #category : #hooks }
MoosePanelCommand >> icon [
	^ nil 
]

{ #category : #hooks }
MoosePanelCommand >> label [
	self subclassResponsibility
]

{ #category : #accessing }
MoosePanelCommand >> moosePanel: aMoosePanel [
	moosePanel := aMoosePanel
]

{ #category : #actions }
MoosePanelCommand >> updateModelList [
	"Refresh the list of models in the moose panel. Note that this is not necessary to call this method when adding a model"
	moosePanel ifNotNil: [ moosePanel updateModelList]
]
