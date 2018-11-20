Class {
	#name : #WizardMessagePane,
	#superclass : #WizardPane,
	#category : #'Merlin-Panes'
}

{ #category : #'private - accessing' }
WizardMessagePane >> displayButtons [
	"add buttons to the dialogWindow. each subclass now which buttons have to be added to their dialogWindow"
	
	self buttons: {self newButtonNamed: 'Ok' withAction: #close}
]
