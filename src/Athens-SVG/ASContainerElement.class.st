"
An ASContainerElement is ASElement with children.

Instance Variables
	children
"
Class {
	#name : #ASContainerElement,
	#superclass : #ASElement,
	#instVars : [
		'children'
	],
	#category : #'Athens-SVG'
}

{ #category : #rendering }
ASContainerElement >> renderShapeOn: aCanvas [

	"render on Athens canvas"
	children do: [:child | child renderOn: aCanvas ]
]

{ #category : #internal }
ASContainerElement >> resolveIds: idDict [
	self resolveMyIds: idDict.
	children do: [ :each | each resolveIds: idDict ]
]

{ #category : #translate }
ASContainerElement >> translate: node [
	super translate: node.
	children := node nodes asArray
		select: [ :each | each isStringNode not ]
		thenCollect: [ :child | 
			| nodeClass |
			nodeClass := ASVGNodeClasses fromName: child name.
			nodeClass new
				parent: self;
				translate: child;
				yourself ]
]
