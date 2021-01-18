Class {
	#name : #DropListPartTest,
	#superclass : #WizardPartTest,
	#category : #'Merlin-Tests'
}

{ #category : #tests }
DropListPartTest >> testSelectedIndex [
	| dropListPart |
	dropListPart := DropListPart new.
	self assert: dropListPart selectionIndex equals: 0.
	self should: [ dropListPart selectionIndex: 'test' ] raise: Error.
	self should: [ dropListPart selectionIndex: 2 ] raise: Error.
	dropListPart list: {'a' . 'b'}.
	dropListPart selectionIndex: 2
]
