Class {
	#name : #DistributionMapExample,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'propertiesMap',
		'propertyBlock',
		'elements',
		'containers',
		'elementsDescription',
		'containersDescription'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #default }
DistributionMapExample class >> defaultContainersDescription [
	^ 'Classes'
]

{ #category : #default }
DistributionMapExample class >> defaultElementsDescription [
	^ 'methods'
]

{ #category : #default }
DistributionMapExample class >> defaultOrderedElements [
	^ [ :class | 
	| dic orderedMethods |
	orderedMethods := OrderedCollection new.
	dic := Dictionary new.
	self defaultProperties
		do: [ :prop | dic at: prop put: OrderedCollection new ].
	class methods
		do:
			[ :mth | (dic at: (self defaultPropertiesBlock value: mth)) add: mth ].
	self defaultProperties
		do: [ :prop | orderedMethods addAll: (dic at: prop) ].
	orderedMethods ]
]

{ #category : #default }
DistributionMapExample class >> defaultProperties [
	^ #(#unary #binary #keywords)
]

{ #category : #default }
DistributionMapExample class >> defaultPropertiesBlock [
	"should extend Dictionary to make a switch control structure"

	^ [ :method | 
	| numArgs |
	numArgs := method numArgs.
	numArgs = 0
		ifTrue: [ #unary ]
		ifFalse: [ numArgs = 1
				ifTrue: [ #binary ]
				ifFalse: [ #keywords ] ] ]
]

{ #category : #default }
DistributionMapExample class >> defaultPropertiesMap [
	^ Dictionary
		with: #unary -> Color white
		with: #binary -> Color gray
		with: #keywords -> Color black
]

{ #category : #accessing }
DistributionMapExample class >> defaultTitle [
	^ 'Distribution map'
]

{ #category : #example }
DistributionMapExample class >> example [
	^ self new
		containers: Collection withAllSubclasses;
		open
]

{ #category : #accessing }
DistributionMapExample class >> icon [
	^ MooseIcons mooseTreeMap
]

{ #category : #public }
DistributionMapExample class >> openOn: classes [
	^ (self new containers: classes) open
]

{ #category : #building }
DistributionMapExample >> build [
	canvas
		addAll:
			(containers
				collect: [ :container | self shapeForContainer: container ]).
	RSFlowLayout new on: canvas nodes.
	super build
]

{ #category : #building }
DistributionMapExample >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend
		text: self containersDescription
		withBoxColor: self containersBackgroundColor.
	legend text: 'Inner elements: ' , self elementsDescription.
	self propertiesMap
		keysAndValuesDo:
			[ :property :color | legend text: property asString withBoxColor: color ].
	legend build
]

{ #category : #colors }
DistributionMapExample >> colorAtIndex: anInteger [

	^ (anInteger <= Color distinctTenStrongColors size)
		ifTrue: [ Color distinctTenStrongColors at: anInteger ]
		ifFalse: [ Color gray ]
		
]

{ #category : #colors }
DistributionMapExample >> colorForElement: element [

	^ self propertiesMap at: (self propertyBlock value: element)
]

{ #category : #accessing }
DistributionMapExample >> containers: anObject [
	containers := anObject
]

{ #category : #colors }
DistributionMapExample >> containersBackgroundColor [
	^ Color veryLightGray
]

{ #category : #accessing }
DistributionMapExample >> containersDescription [
	^ containersDescription
		ifNil: [ containersDescription := self class defaultContainersDescription ]
]

{ #category : #accessing }
DistributionMapExample >> containersDescription: aString [
	containersDescription := aString
]

{ #category : #accessing }
DistributionMapExample >> elements [
	^ elements ifNil: [ elements := self class defaultOrderedElements ]
]

{ #category : #accessing }
DistributionMapExample >> elements: aSymbolOrBlock [

	elements := aSymbolOrBlock 
]

{ #category : #accessing }
DistributionMapExample >> elementsDescription [
	^ elementsDescription
		ifNil: [ elementsDescription := self class defaultElementsDescription ]
]

{ #category : #accessing }
DistributionMapExample >> elementsDescription: aString [
	elementsDescription := aString
]

{ #category : #accessing }
DistributionMapExample >> elementsFor: aContainer [
	^ self elements value: aContainer
]

{ #category : #accessing }
DistributionMapExample >> propertiesMap [
	^ propertiesMap
		ifNil: [ propertiesMap := self class defaultPropertiesMap ]
]

{ #category : #accessing }
DistributionMapExample >> propertiesMap: aDictionary [

	propertiesMap := aDictionary
]

{ #category : #accessing }
DistributionMapExample >> propertyBlock [
	^ propertyBlock
		ifNil: [ propertyBlock := self class defaultPropertiesBlock ]
]

{ #category : #accessing }
DistributionMapExample >> propertyBlock: oneParameterBlock [

	propertyBlock := oneParameterBlock 
]

{ #category : #shapes }
DistributionMapExample >> shapeForContainer: container [
	| containerBox |
	containerBox := RSComposite new
		model: container;
		popup;
		color: self containersBackgroundColor;
		popup.
	containerBox
		addAll:
			((self elementsFor: container)
				collect: [ :element | self shapeForElement: element ]).
	RSGridLayout new on: containerBox children.
	containerBox padding: 5.
	^ containerBox
]

{ #category : #shapes }
DistributionMapExample >> shapeForElement: element [
	^ RSBox new
		model: element;
		popupText: #selector;
		size: 10;
		color: (self colorForElement: element);
		yourself
]
