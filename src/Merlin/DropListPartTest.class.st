Class {
	#name : #DropListPartTest,
	#superclass : #WizardPartTest,
	#category : #'Merlin-Tests'
}

{ #category : #'as yet unclassified' }
DropListPartTest >> testSelectedIndex [

	|dropListPart|
	dropListPart := DropListPart new.
	self assert: dropListPart selectionIndex = 0.
	self should: [dropListPart selectionIndex: 'test'] raise: Error.
	self should: [dropListPart selectionIndex: 2] raise: Error.
	dropListPart list: {'a'. 'b'}.
	dropListPart selectionIndex: 2.
	
]
