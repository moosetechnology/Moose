Class {
	#name : #ButtonPartTest,
	#superclass : #WizardPartTest,
	#category : #'Merlin-Tests'
}

{ #category : #tests }
ButtonPartTest >> testEnableAndDisable [

	| buttonPart |
	buttonPart := ButtonPart new.
	buttonPart enable.
	self assert: buttonPart buttonEnabled.
	buttonPart disable.
	self deny: buttonPart buttonEnabled.
]

{ #category : #tests }
ButtonPartTest >> testLabel [
	| buttonPart |
	buttonPart := ButtonPart new.
	buttonPart label: 'something'.
	self assert: buttonPart label equals: 'something'
]
