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

{ #category : #building }
MooseLinearDistributionMap >> setElementsColor [
	RSNormalizer color
		shapes: (canvas nodes flatCollect: #children);
		from: self propertyColorScale first value;
		to: self propertyColorScale last value;
		normalize: [ :element | self propertyValueFor: element ]
]

{ #category : #building }
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
