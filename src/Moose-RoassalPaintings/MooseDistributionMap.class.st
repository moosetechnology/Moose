"
Distribution map shows containement.

Containers are shown in gray and their elements are shown in colors.

Users must provide:
- Some expected properties values. Example:  [ :n | n < 5 ],  [ :n | n = 5 ] and  [ :n | n > 5 ]
- A set of colors to associate whith each values

Each element will be shown with the color corresponding to the value of its property.
"
Class {
	#name : #MooseDistributionMap,
	#superclass : #MooseAbstractDistributionMap,
	#instVars : [
		'propertyColorMap',
		'elementsAndPropertyId',
		'propertyValueIDMap'
	],
	#category : #'Moose-RoassalPaintings'
}

{ #category : #building }
MooseDistributionMap >> colorForElement: anElement [
	^ propertyColorMap
		at: (elementsAndPropertyId at: anElement)
		ifAbsent: [ self defaultColor ]
]

{ #category : #building }
MooseDistributionMap >> computePropertyIDFor: anElement [
	^ propertyValueIDMap associations
		detect: [ :propertyValueIDAndBlock | 
			propertyValueIDAndBlock value
				value: (elementsAndPropertyValue at: anElement) ]
		ifFound: [ :propertyValueIDAndBlock | propertyValueIDAndBlock key ]
		ifNone: [ #valueNotInRange ]
]

{ #category : #building }
MooseDistributionMap >> defaultColor [
	^ Color black
]

{ #category : #building }
MooseDistributionMap >> describeColorsInLegend: legend [
	propertyColorMap
		keysAndValuesDo: [ :propertyId :color | legend text: propertyId withBoxColor: color ]
]

{ #category : #initialization }
MooseDistributionMap >> initialize [

	super initialize.
	elementsAndPropertyId := Dictionary new.
	propertyColorMap := Dictionary new.
	propertyValueIDMap := Dictionary new
]

{ #category : #computing }
MooseDistributionMap >> matchElementsToPropertyID [
	elementsAndPropertyValue
		keysAndValuesDo: [ :element :propertyValue | 
			elementsAndPropertyId
				at: element
				put: (self computePropertyIDFor: element) ]
]

{ #category : #computing }
MooseDistributionMap >> orderedContainers [
	| engine partVectors containers |
	containers := containersAndElements keys.
	containers ifEmpty: [ ^ containers ].
	partVectors := containers
		collect: [ :container | 
			MalSimilarityItem
				with: container
				andAll:
					(propertyValueIDMap values
						collect: [ :propertyBlock | 
							((self elementsIn: container)
								select: [ :element | propertyBlock value: (self propertyValueFor: element) ])
								size ]) ].
	engine := MalClusterEngine with: partVectors.
	engine hierarchicalClusteringUsing: #averageLinkage.
	partVectors := engine dendrogram orderLeafs
		collect: [ :each | each item ].
	^ partVectors
]

{ #category : #accessing }
MooseDistributionMap >> propertyColorMap: aDictionary [
	"aDictionary: aPropertyValueID -> aColor
Example: 'High number' -> Color red."

	propertyColorMap := aDictionary
]

{ #category : #accessing }
MooseDistributionMap >> propertyValuesIDMap: aDictionary [
	"aDictionary: propertyValueName -> aBlockReturningABoolean
Example: 'High number' -> [ :propertyValue | propertyValue > 100 ]."

	propertyValueIDMap := aDictionary
]

{ #category : #colors }
MooseDistributionMap >> setElementsColor [
	(canvas nodes flatCollect: #children)
		do: [ :node | node color: (self colorForElement: node model) ]
]

{ #category : #building }
MooseDistributionMap >> sortElementsInContainers [
	| dictWithElementsSorted |
	self matchElementsToPropertyID.
	dictWithElementsSorted := Dictionary new.
	containersAndElements
		keysAndValuesDo: [ :container :elements | 
			dictWithElementsSorted
				at: container
				put:
					(elements
						sortAscending:
							[ :element | propertyValueIDMap keys indexOf: (elementsAndPropertyId at: element) ]) ].
	containersAndElements := dictWithElementsSorted
]
