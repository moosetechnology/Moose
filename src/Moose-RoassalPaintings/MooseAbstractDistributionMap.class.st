"
DistributionMap is a nice visualization to render container and their elements based on properties. 

See Stéphane Ducasse, Tudor Gîrba and Adrian Kuhn, Distribution Map, Proceedings of 22nd IEEE International Conference on Software Maintenance (ICSM '06), 203–212, IEEE Computer Society, 2006, 28%, PDF, DOI.
"
Class {
	#name : #MooseAbstractDistributionMap,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'containersAndElements',
		'elementsAndPropertyValue',
		'containersDescription',
		'elementsDescription',
		'propertyDescription'
	],
	#category : #'Moose-RoassalPaintings'
}

{ #category : #accessing }
MooseAbstractDistributionMap class >> defaultTitle [
	^ 'Distribution map'
]

{ #category : #accessing }
MooseAbstractDistributionMap class >> icon [
	^ MooseIcons mooseTreeMap
]

{ #category : #building }
MooseAbstractDistributionMap >> build [
	self sortElementsInContainers.
	canvas
		addAll:
			(self orderedContainers
				collect: [ :container | self shapeForContainer: container ]).
	self setElementsColor.
	self setLayout.
	super build
]

{ #category : #building }
MooseAbstractDistributionMap >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend
		text: self containersDescription
		withBoxColor: self containerColor.
	legend text: self elementsDescription.
	self describeColorsInLegend: legend.
	legend build
]

{ #category : #colors }
MooseAbstractDistributionMap >> containerColor [
	^ Color veryLightGray
]

{ #category : #initialization }
MooseAbstractDistributionMap >> containers: aContainerGroup getElements: elementsBlockOrSymbol property: propertyBlockOrSymbol [
	aContainerGroup
		do: [ :container | 
			| elements |
			elements := elementsBlockOrSymbol value: container.
			elements
				do: [ :element | 
					containersAndElements at: container put: elements.
					elementsAndPropertyValue
						at: element
						put: (propertyBlockOrSymbol value: element) ] ]
]

{ #category : #accessing }
MooseAbstractDistributionMap >> containersDescription [
	^ containersDescription
		ifNil: [ containersDescription := self defaultContainersDescription ]
]

{ #category : #accessing }
MooseAbstractDistributionMap >> containersDescription: anObject [
	containersDescription := anObject
]

{ #category : #accessing }
MooseAbstractDistributionMap >> defaultContainersDescription [
	^ 'Containers'
]

{ #category : #accessing }
MooseAbstractDistributionMap >> defaultElementsDescription [
	^ 'Elements'
]

{ #category : #accessing }
MooseAbstractDistributionMap >> defaultPropertyDescription [
	^ 'Property value'
]

{ #category : #building }
MooseAbstractDistributionMap >> describeColorsInLegend: legend [
	self subclassResponsibility
]

{ #category : #initialization }
MooseAbstractDistributionMap >> elements: anElementsGroup getContainers: aContainerBlockOrSymbol property: aPropertyBlockOrSymbol [
	anElementsGroup
		do: [ :element | 
			(self elementsIn: (aContainerBlockOrSymbol value: element))
				add: element.
			elementsAndPropertyValue
				at: element
				put: (aPropertyBlockOrSymbol value: element) ]
]

{ #category : #accessing }
MooseAbstractDistributionMap >> elementsDescription [
	^ elementsDescription
		ifNil: [ elementsDescription := self defaultElementsDescription ]
]

{ #category : #accessing }
MooseAbstractDistributionMap >> elementsDescription: anObject [
	elementsDescription := anObject
]

{ #category : #computing }
MooseAbstractDistributionMap >> elementsIn: aContainer [
	^ containersAndElements
		at: aContainer
		ifAbsentPut: OrderedCollection new
]

{ #category : #initialization }
MooseAbstractDistributionMap >> initialize [
	super initialize.
	containersAndElements := Dictionary new.
	elementsAndPropertyValue := Dictionary new
]

{ #category : #computing }
MooseAbstractDistributionMap >> orderedContainers [
	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractDistributionMap >> propertyDescription [
	^ propertyDescription
		ifNil: [ propertyDescription := self defaultPropertyDescription ]
]

{ #category : #accessing }
MooseAbstractDistributionMap >> propertyDescription: anObject [
	propertyDescription := anObject
]

{ #category : #computing }
MooseAbstractDistributionMap >> propertyValueFor: anElement [
	^ elementsAndPropertyValue at: anElement
]

{ #category : #colors }
MooseAbstractDistributionMap >> setElementsColor [
	self subclassResponsibility
]

{ #category : #building }
MooseAbstractDistributionMap >> setLayout [
	RSFlowLayout new
		gapSize: 20;
		on: canvas nodes
]

{ #category : #shapes }
MooseAbstractDistributionMap >> shapeForContainer: container [
	| containerBox |
	containerBox := RSComposite new
		model: container;
		color: self containerColor;
		draggable;
		@ (RSLabeled text: #mooseName).
	containerBox
		addAll:
			((self elementsIn: container)
				collect: [ :element | self shapeForElement: element ]).
	RSGridLayout new on: containerBox children.
	containerBox padding: 5.
	^ containerBox
]

{ #category : #shapes }
MooseAbstractDistributionMap >> shapeForElement: element [
	^ RSBox new
		model: element;
		popupText: #mooseName;
		yourself
]

{ #category : #computing }
MooseAbstractDistributionMap >> sortElementsInContainers [
	self subclassResponsibility
]
