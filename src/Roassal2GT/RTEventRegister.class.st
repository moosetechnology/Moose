Class {
	#name : #RTEventRegister,
	#superclass : #RTObject,
	#category : #'Roassal2GT-EventCollector'
}

{ #category : #'class initialization' }
RTEventRegister class >> initialize [
	"
	self initialize
	"
	| collector |
	collector := GTEventCollector new.
	collector occupant: self; category: 'roassal2Examples'; register.
	RTAbstractExample announcer when: RTExampleOpeningEvent do: [ :evt |
		collector add: evt
	] 
]
