Class {
	#name : #AbstractDistributionMap,
	#superclass : #Object,
	#instVars : [
		'partsAndElements',
		'elementsAndPropertyValue',
		'title',
		'elementTitleBlock'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #'instance creation' }
AbstractDistributionMap class >> onContainers: aGroup elements: aBlockOrSelector properties: blockOrSelector [

	^ self new onContainers: aGroup elements: aBlockOrSelector properties: blockOrSelector
]

{ #category : #'instance creation' }
AbstractDistributionMap class >> onElements: aGroup containers: aBlockOrSelector properties: blockOrSelector [

	^ self new onElements: aGroup containers: aBlockOrSelector properties: blockOrSelector
]

{ #category : #'element-titles' }
AbstractDistributionMap >> defaultElementTitleFormattingBlock [
	^ #yourself
]

{ #category : #rendering }
AbstractDistributionMap >> defaultTitle [
	^ 'Distribution Map'
]

{ #category : #'element-titles' }
AbstractDistributionMap >> elementTitleBlock [
	"by default the title is just the title"

	^ elementTitleBlock ifNil: [ self defaultElementTitleFormattingBlock ]
]

{ #category : #'element-titles' }
AbstractDistributionMap >> elementTitleBlock: anUnaryBlock [
	"Specify the block that will be applied to the default title to generate a displayed title"
	
	elementTitleBlock := anUnaryBlock
]

{ #category : #accessing }
AbstractDistributionMap >> elementsFor: aPart [

	^ partsAndElements at: aPart
]

{ #category : #initialization }
AbstractDistributionMap >> initialize [

	super initialize.
	partsAndElements := Dictionary new.
	elementsAndPropertyValue := Dictionary new.

]

{ #category : #initialization }
AbstractDistributionMap >> onContainers: aGroup elements: elementsBlockOrSelector properties: propertyBlockOrSelector [

	aGroup do: [ :container | 
		| elementsCollection |
		elementsCollection := partsAndElements
			                      at: container
			                      put: OrderedCollection new.
		(elementsBlockOrSelector value: container) do: [ :element | 
			| propertyValue |
			propertyValue := propertyBlockOrSelector value: element.
			elementsCollection add: element.
			elementsAndPropertyValue at: element put: propertyValue ] ]
]

{ #category : #initialization }
AbstractDistributionMap >> onElements: aGroup containers: containersBlockOrSelector properties: propertyBlockOrSelector [

	aGroup do: [ :element | 
		| part propertyValue |
		part := containersBlockOrSelector value: element.
		propertyValue := propertyBlockOrSelector value: element.
		(partsAndElements at: part ifAbsentPut: [ OrderedCollection new ]) 
			add: element.
		elementsAndPropertyValue at: element put: propertyValue ]
]

{ #category : #rendering }
AbstractDistributionMap >> open [
	"Opening the distribution map, and returns the window"
	
	| view |
	view := RTView new.
	view @ RTDraggableView.
	self renderOn: view.
	self renderLegendOn: view.
	^ view openWithToolbarEntitled: self title
]

{ #category : #accessing }
AbstractDistributionMap >> orderParts: aCollection [

	self subclassResponsibility 
]

{ #category : #accessing }
AbstractDistributionMap >> parts [

	^ partsAndElements keys asArray.
]

{ #category : #rendering }
AbstractDistributionMap >> renderElementsFrom: node on: view [

	self subclassResponsibility 
]

{ #category : #rendering }
AbstractDistributionMap >> renderLegendOn: view [

	self subclassResponsibility 
]

{ #category : #rendering }
AbstractDistributionMap >> renderOn: view [
	| parts partElements shape |
	parts := self orderParts: self parts.
	shape := RTCompositeShape new.
	shape
		add:
			(RTLabel new
				text: self elementTitleBlock;
				height: 10;
				color: Color black).
	shape
		add:
			(RTBox new
				color: Color transparent;
				borderColor: Color gray).
	partElements := shape elementsOn: parts.
	partElements
		do: [ :each | 
			| elements |
			view add: each.
			elements := self renderElementsFrom: each model on: view.
			view addAll: elements.
			RTGridLayout on: elements.
			RTNest new on: each inShape: #second nest: elements ].
	RTGridLayout on: partElements.
	partElements @ RTDraggable
]

{ #category : #rendering }
AbstractDistributionMap >> title [

	^ title ifNil: [self defaultTitle]
]

{ #category : #rendering }
AbstractDistributionMap >> title: aString [

	 title := aString
]
