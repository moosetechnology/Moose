Class {
	#name : #MoosePanelCommand,
	#superclass : #CmCommand,
	#category : #'Moose-Finder'
}

{ #category : #accessing }
MoosePanelCommand class >> allCommands [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #testing }
MoosePanelCommand class >> isAbstract [
	^ self = MoosePanelCommand
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
