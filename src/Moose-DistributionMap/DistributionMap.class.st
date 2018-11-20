"
DistributionMap is a nice visualization to render container and their elements based on properties. 

See Stéphane Ducasse, Tudor Gîrba and Adrian Kuhn, Distribution Map, Proceedings of 22nd IEEE International Conference on Software Maintenance (ICSM '06), 203–212, IEEE Computer Society, 2006, 28%, PDF, DOI.

The title of a distribution map can be changed as well as the colors used. 
There are different ways to specific the parts and their containers. 

Here we define the containers and how the elements are omputed based on such containers.

	|dm |
	dm := self
			onContainers: Collection withAllSubclasses  
			elements: #allInstVarNames 
			properties: [:element | element size > 5].
	dm title: 'Collection subclasses and their instance variables'.
	dm render. 
	dm open.

The default colors can be changed to. However, the colors: message should be send before the element description.
Here is a non executable illustration. 
	| dm |
	dm := DistributionMap new.
	dm colors: {(Color r: 0.6 g: 0.0 b: 0.0). (Color r: 0.0 g: 0.0 b: 0.6). (Color r: 1.0 g: 0.6 b: 0.0). (Color r: 0.0 g: 1.0 b: 1.0). (Color r: 0.0 g: 1.0 b: 0.0). (Color r: 1.0 g: 0.753 b: 0.796). (Color r: 0.6 g: 0.2 b: 0.0). (Color r: 0.4 g: 0.0 b: 0.6). (Color r: 1.0 g: 1.0 b: 0.0). (Color r: 0.8 g: 0.8 b: 0.8)}.
	dm	onContainers: (model allModelPackages) 
		elements: #classes 
		properties: [ :cl | (cl authors sortedCounts) ifNotEmpty: [ (cl authors sortedCounts) first value name]].
	dm title: 'Authors Map of ', model name.
	dm render.
	dm open.
"
Class {
	#name : #DistributionMap,
	#superclass : #AbstractDistributionMap,
	#instVars : [
		'colorMap',
		'colors',
		'propertyValuesMap',
		'properties',
		'defaultColors'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #examples }
DistributionMap class >> example2 [

	"self example2"
	^ (self 
		onElements: (Collection withAllSubclasses flatCollect: [:class | class methods])
		containers: #methodClass
		properties: [:element | element isAbstract])
			open.
	

]

{ #category : #examples }
DistributionMap class >> example3 [

	"self example3"
	^ (self 
		onContainers: DistributionMap  withAllSubclasses  
		elements: #methods 
		properties: #isAbstract )
			open.
	

]

{ #category : #examples }
DistributionMap class >> exampleShowingAContainerBasedDefinition [
	"self exampleShowingAContainerBasedDefinition"
	
	"Here we define the containers and how the elements are computed based on such containers"
	|dm |
	dm := self
			onContainers: Collection withAllSubclasses  
			elements: #allInstVarNames 
			properties: [:element | element size > 5].
	dm title: 'Collection subclasses and their instance variables'.
	dm open.
	

]

{ #category : #accessing }
DistributionMap >> colors [
	^ colors ifNil: [colors := defaultColors]
]

{ #category : #accessing }
DistributionMap >> colors: aCollection [
	"To specify the color scheme that we want to use in a Distribution map."
	colors := aCollection
]

{ #category : #'initialize-release' }
DistributionMap >> defaultColors [ 
	"The colors that are used when nobody ever mentioned any color scheme."
	^ defaultColors
]

{ #category : #private }
DistributionMap >> elementsWithProperty: aPropertySelector inPart: aPart [

	^ (partsAndElements at: aPart) select: [: element |
			(elementsAndPropertyValue at: element) = aPropertySelector  
		].
]

{ #category : #'initialize-release' }
DistributionMap >> initialize [

	super initialize.
	colorMap := Dictionary new.
	defaultColors := Color distinctTenStrongColors.
	properties := #()
]

{ #category : #private }
DistributionMap >> numberOfElementsWithProperty: aPropertySelector inPart: aPart [

	^ (self elementsWithProperty: aPropertySelector inPart: aPart)  size.
]

{ #category : #'initialize-release' }
DistributionMap >> onContainers: aGroup elements: elementsBlockOrSelector properties: propertyBlockOrSelector [

	super onContainers: aGroup elements: elementsBlockOrSelector properties: propertyBlockOrSelector.		
	self orderColorMap.
]

{ #category : #'initialize-release' }
DistributionMap >> onElements: aGroup containers: containersBlockOrSelector properties: propertyBlockOrSelector [

	super onElements: aGroup containers: containersBlockOrSelector properties: propertyBlockOrSelector.	
	self orderColorMap 
]

{ #category : #'initialize-release' }
DistributionMap >> orderColorMap [

	| propertiesAndNumberOfOccurrences result |
	propertiesAndNumberOfOccurrences := OrderedCollection new.
	result := Dictionary new.
	"We first compute the number of occurrences for each property value"
	elementsAndPropertyValue values do: [ :aPropertyValue |
		|propAndNbOfOcc|
		propAndNbOfOcc := propertiesAndNumberOfOccurrences detect: [:assoc | assoc key = aPropertyValue] ifNone: [propertiesAndNumberOfOccurrences add: (aPropertyValue -> 0)].
		propAndNbOfOcc value: (propAndNbOfOcc value + 1).
		].
	"Once the number of occurences computed for each property value, we sort them in a decroissant order, and we  keep as many property values as their is available colors"
	propertiesAndNumberOfOccurrences  := (propertiesAndNumberOfOccurrences asArray sort: [:a :b | a value > b value]). 
	propertiesAndNumberOfOccurrences size > self colors size ifTrue: [propertiesAndNumberOfOccurrences := propertiesAndNumberOfOccurrences copyFrom: 1 to:self colors size].
	properties := propertiesAndNumberOfOccurrences collect: [:anAssoc | anAssoc key].
	
	"Then we follow the colors order, and set a color to each property value"
	(1 to: propertiesAndNumberOfOccurrences size) do: [:index |
		result at: (propertiesAndNumberOfOccurrences at: index) key put: (self colors at: index).
		].
	
	^ colorMap := result.
	
	
]

{ #category : #'dendrogram clustering' }
DistributionMap >> orderParts: aCollectionOfParts [

	| vectors engine clusters partVectors |
	aCollectionOfParts ifEmpty: [^aCollectionOfParts].
	partVectors :=  aCollectionOfParts  collect: [:eachPart |
		MalSimilarityItem with: eachPart
			andAll: (self properties collect: [:eachProp | self numberOfElementsWithProperty: eachProp inPart: eachPart]) ].
	engine := MalClusterEngine with: partVectors.
	engine hierarchicalClusteringUsing: #averageLinkage.
	partVectors := engine dendrogram orderLeafs collect: [:each | each item].
	^ partVectors
	
]

{ #category : #accessing }
DistributionMap >> properties [

	^ properties

]

{ #category : #accessing }
DistributionMap >> properties: aCollection [

	properties := aCollection

]

{ #category : #accessing }
DistributionMap >> propertyColorMap [ 

	^ colorMap
]

{ #category : #accessing }
DistributionMap >> propertyColorMap: aDictionary [

	colorMap := aDictionary at: #notBetweenBounds put: Color black ; yourself
]

{ #category : #accessing }
DistributionMap >> propertyValuesMap [

	"return a Dictionary, mapping each different property value to a block that compute if an element 'belongs to' this property. For example, if the property you are using is based on distinct values (authors of a file for example), you could have: {#propertyValue1 -> [:val | val = 'cyrille delaunay'] . {#propertyValue2 -> [:val | val = 'stephane ducasse'] } "
	^ propertyValuesMap ifNil: [ propertyValuesMap := Dictionary new]
]

{ #category : #accessing }
DistributionMap >> propertyValuesMap: aDictionary [

	|result|
	result := Dictionary new.
	elementsAndPropertyValue keysAndValuesDo: [:element :propertyValue |
		aDictionary keysAndValuesDo: [:key :value |
			(value rtValue: propertyValue) ifTrue: [result at: element put: key]. 
		].
		"a property value may not be between the bounds defined by the user. In this case, we set a default value"
		(result keys includes: element) ifFalse: [result at: element put: #notBetweenBounds].
	].
	self properties: aDictionary keys asArray.
	elementsAndPropertyValue := result.

	 

]

{ #category : #rendering }
DistributionMap >> renderElementsFrom: node on: view [
	| elements |
	elements := RTGroup new.
	self properties
		do: [ :property | 
			| color borderColor propertyElements |
			color := self propertyColorMap at: property.
			borderColor := color blacker.
			"view interaction menu: [ :element | element mooseMenuMorph ]."
			propertyElements := RTBox new 
				borderColor: borderColor; 
				color: color; 
				elementsOn: (self elementsWithProperty: property inPart: node).
			elements addAll: propertyElements ].
	^ elements
]

{ #category : #rendering }
DistributionMap >> renderLegendOn: view [
	| lb |
	lb := RTLegendBuilder new.
	lb view: view.
	self properties do: [ :each | lb addColor: (self propertyColorMap at: each) text: each mooseName ].
	lb build
]
