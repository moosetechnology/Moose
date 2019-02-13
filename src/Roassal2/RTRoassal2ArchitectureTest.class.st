Class {
	#name : #RTRoassal2ArchitectureTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTRoassal2ArchitectureTest >> testNoInteractionViewAreNotSubclassOfRTAbstractInteractionView [
	| viewInteraction |
	viewInteraction := RTInteraction allSubclasses select: [ :c | c name endsWith: 'View' ].
	self assert: viewInteraction notEmpty.
	
	"Not sure if RTLinkView has the right name"
	viewInteraction := viewInteraction copyWithoutAll: (Array with: RTLinkView with: RTAbstractInteractionView).
	
	"
	For debug, inspect the following line:
	viewInteraction reject: [ :c | c inheritsFrom: RTAbstractInteractionView ]
	"
	self assert: (viewInteraction allSatisfy: [ :c | c inheritsFrom: RTAbstractInteractionView ])
]
