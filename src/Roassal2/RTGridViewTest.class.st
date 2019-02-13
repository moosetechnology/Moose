"
A RTGridViewTest is a test class for testing the behavior of RTGridView
"
Class {
	#name : #RTGridViewTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTGridViewTest >> testBasic [
	| gridView |
	gridView := RTGridView new.
	self assert: gridView gridSize equals: RTGridView defaultGridSize.
	self assert: gridView color equals: RTGridView defaultColor.
]
