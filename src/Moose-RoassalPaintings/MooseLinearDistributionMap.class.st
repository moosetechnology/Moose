"
Distribution map shows containement.

Containers are shown in gray and their elements are shown in colors.
The color of an elements depends on the value of its property, according to a gradient.
"
Class {
	#name : #MooseLinearDistributionMap,
	#superclass : #MooseAbstractDistributionMap,
	#category : #'Moose-RoassalPaintings'
}

{ #category : #building }
MooseLinearDistributionMap >> describeColorsInLegend: legend [
	legend
		text: self propertyDescription
		withFadingRamp: self propertyColorScale
]

{ #category : #computing }
MooseLinearDistributionMap >> orderedContainers [
	^ containersAndElements keys
		sortDescending: [ :container | 
			(self elementsIn: container)
				ifEmpty: [ 0 ]
				ifNotEmpty: [ :elements | elements sum: [ :e | elementsAndPropertyValue at: e ] ] ]
]

{ #category : #colors }
MooseLinearDistributionMap >> propertyColorScale [
	^ {(0 -> 'green').
	(1 -> 'red')}
]

{ #category : #computing }
MooseLinearDistributionMap >> propertyValueFor: anElement [

"DEAL WITH BOOLEANS"
	^ super propertyValueFor: anElement
]

{ #category : #colors }
MooseLinearDistributionMap >> setElementsColor [
	RSNormalizer color
		shapes: (canvas nodes flatCollect: #children);
		from: self propertyColorScale first value;
		to: self propertyColorScale last value;
		normalize: [ :element | self propertyValueFor: element ]
]

{ #category : #computing }
MooseLinearDistributionMap >> sortElementsInContainers [
	| dictWithElementsSorted |
	dictWithElementsSorted := Dictionary new.
	containersAndElements
		keysAndValuesDo: [ :container :elements | 
			dictWithElementsSorted
				at: container
				put:
					(elements
						sortDescending: [ :element | self propertyValueFor: element ]) ].
	containersAndElements := dictWithElementsSorted
]
