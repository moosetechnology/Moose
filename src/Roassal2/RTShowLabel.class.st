"
A RTShowLabel is an interaction that add a label on a set of elements when the mouse enters a particular element.  RTLabelled is used for the labelling. When the mouse leaves the element, all the labels are removed.

Instance Variables
	labelledInteraction:		<RTLabelled>

labelledInteraction
	- an object which is responsible for creating and removing of a label

"
Class {
	#name : #RTShowLabel,
	#superclass : #RTAbstractHighlightable,
	#instVars : [
		'labelledInteraction'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #visitor }
RTShowLabel >> accept: aVisitor with: args [
	aVisitor visitShowLabelInteraction: self with: args
]

{ #category : #actions }
RTShowLabel >> doHighlightElement: anElement [ 
	anElement @ labelledInteraction.
]

{ #category : #actions }
RTShowLabel >> doUnhighlightElement: anElement [ 
	labelledInteraction removeLabelFrom: anElement.
]

{ #category : #'reflective operations' }
RTShowLabel >> doesNotUnderstand: aMessage [ 
	labelledInteraction 
		perform: aMessage selector 
		withArguments: aMessage arguments
]

{ #category : #initialize }
RTShowLabel >> initialize [
	super initialize.
	labelledInteraction := RTLabeled new.
]

{ #category : #accessing }
RTShowLabel >> labelledInteraction [
	"Return the interaction which is used when an element has to be labelled"
	^ labelledInteraction
]

{ #category : #accessing }
RTShowLabel >> labelledInteraction: aRTLabelled [
	labelledInteraction := aRTLabelled
]
