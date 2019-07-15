Class {
	#name : #DistributionMapExample,
	#superclass : #Object,
	#instVars : [
		'propertiesMap',
		'propertyBlock',
		'elements'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #public }
DistributionMapExample class >> openOn: classes [

	^ (self new render: classes) open
]

{ #category : #example }
DistributionMapExample class >> sample [

	(self new properties: self sampleProperties;
				propertiesMap: self sampleMap;
				propertyBlock: self sampleBlock;
				elements: self sampleOrderedElements;
				render: Collection withAllSubclasses
				)
				open
]

{ #category : #example }
DistributionMapExample class >> sampleBlock [
	"should extend Dictionary to make a switch control structure"
	
	^ [ :method ||numArgs|
			numArgs := method numArgs.
			(numArgs = 0)  ifTrue: [ #unary ]
								ifFalse: [
									(numArgs = 1) ifTrue: [ #binary ]
													 ifFalse: [ #keywords ]
												]]
]

{ #category : #example }
DistributionMapExample class >> sampleElements [

	^ #methods
]

{ #category : #example }
DistributionMapExample class >> sampleMap [

	^ Dictionary with: (#unary -> Color white) with: (#binary -> Color gray) with: (#keywords -> Color black)
]

{ #category : #example }
DistributionMapExample class >> sampleOrderedElements [

	^ [:class ||dic orderedMethods|
			orderedMethods := OrderedCollection new.
			dic := Dictionary new.
			self sampleProperties do: [:prop | dic at: prop put: OrderedCollection new].
			class methods do: [ :mth|
				(dic at: (self sampleBlock value: mth)) add: mth
				].
			self sampleProperties do: [:prop |
				orderedMethods addAll: (dic at: prop)
				].
			orderedMethods
		]
]

{ #category : #example }
DistributionMapExample class >> sampleProperties [

	^ #(#unary #binary #keywords)
]

{ #category : #accessing }
DistributionMapExample >> colorAtIndex: anInteger [

	^ (anInteger <= Color distinctTenStrongColors size)
		ifTrue: [ Color distinctTenStrongColors at: anInteger ]
		ifFalse: [ Color gray ]
		
]

{ #category : #accessing }
DistributionMapExample >> colorForElement: element [

	^ self propertiesMap at: (self propertyBlock value: element)
]

{ #category : #accessing }
DistributionMapExample >> elements: aSymbolOrBlock [

	elements := aSymbolOrBlock 
]

{ #category : #accessing }
DistributionMapExample >> elementsFor: aContainer [

	^ elements rtValue: aContainer
]

{ #category : #accessing }
DistributionMapExample >> properties: aCollectionOfProperties [

	| map |
	map := self propertiesMap.
	1 to:aCollectionOfProperties size do: [ :i |
		map add: ((aCollectionOfProperties at: i) -> (self colorAtIndex: i + 1))
		].
	^ map
]

{ #category : #accessing }
DistributionMapExample >> propertiesMap [

	^ propertiesMap ifNil: [ propertiesMap := Dictionary new]
]

{ #category : #accessing }
DistributionMapExample >> propertiesMap: aDictionary [

	propertiesMap := aDictionary
]

{ #category : #accessing }
DistributionMapExample >> propertyBlock [

	^ propertyBlock
]

{ #category : #accessing }
DistributionMapExample >> propertyBlock: oneParameterBlock [

	propertyBlock := oneParameterBlock 
]

{ #category : #'public-view rendering' }
DistributionMapExample >> render: classes [
	"(DistributionMapExample new render: Collection withAllSubclasses) open"
	"broken: should call #elements: before calling #render:. See test DistributionMapExampleTest>>testSample."
	| nodes view |
	nodes := classes.

	view := RTMondrian new.
	"view interaction nodraggable."
	view interaction popupText.
	view nodes: nodes forEach: [ :node |
		"view interaction nodraggable."
		view interaction popupText: [:el| el selector].
		view shape rectangle
				size: 10 ;
				fillColor: [:el | self colorForElement: el].
		view nodes: (self elementsFor: node).
		view layout grid gapSize: 1.
	].
	view layout flow.

	^ view
]
