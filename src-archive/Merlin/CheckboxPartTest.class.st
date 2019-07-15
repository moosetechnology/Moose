Class {
	#name : #CheckboxPartTest,
	#superclass : #WizardPartTest,
	#category : #'Merlin-Tests'
}

{ #category : #'as yet unclassified' }
CheckboxPartTest >> testSelectedAndNotSelected [

	| checkboxPart |
	checkboxPart := CheckboxPart new.
	self assert: checkboxPart contents.
	checkboxPart contents: false.
	self deny: checkboxPart contents.
]
