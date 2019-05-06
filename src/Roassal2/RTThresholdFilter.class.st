"
Add to the view a filter.
Here are some examples:

-=-=-=-=
b := RTMondrian new.
b shape box size: [ :cls | cls dependentClasses size ].
b nodes: Collection withAllSubclasses.

b shape line color: Color blue trans; withShorterDistanceAttachPoint .
b edges connectToAll: #dependentClasses.
b layout grid.
b build.

b view @ (RTThresholdFilter new ).

b view
-=-=-=-=


Another simpler example:

-=-=-=-=
b := RTMondrian new.
b shape box size: #yourself.
b nodes: (1 to: 100).
b layout grid.
b build.
b view @ (RTThresholdFilter new ).
b view
-=-=-=-=



"
Class {
	#name : #RTThresholdFilter,
	#superclass : #RTAbstractInteractionView,
	#category : #'Roassal2-Interactions'
}

{ #category : #ui }
RTThresholdFilter >> askWhichFilterToChoose [
	^ TRPlatform current
		dialogChooseFrom: #('Keep small elements' 'Keep large elements' 'Keep most connected elements' 'Keep least connected elements' 'Keep connected elements')
		values: #(#keepSmallElements: #keepLargeElements: #keepMostConnectedElements: #keepLeastConnectedElements: #keepConnectedElements:)
]

{ #category : #'private - utils' }
RTThresholdFilter >> getElementAreasFrom: aView [
	^ aView elements
		collect: [ :el | el trachelShape extent x * el trachelShape extent y ]
]

{ #category : #'private - utils' }
RTThresholdFilter >> getElementConnectionsFrom: aView [
	^ aView elements
		collect: [ :el | el connectedEdges size ]
]

{ #category : #'private - utils' }
RTThresholdFilter >> getGreatestNumberOfConnectionsIn: aView [
	^ ((self getElementConnectionsFrom: aView) reverseSortedAs: #yourself)
		first: (aView elements size * self threshold) asInteger
]

{ #category : #'private - utils' }
RTThresholdFilter >> getLargestElementAreasIn: aView [
	^ ((self getElementAreasFrom: aView) reverseSortedAs: #yourself)
		first: (aView elements size * self threshold) asInteger
]

{ #category : #'private - utils' }
RTThresholdFilter >> getLeastNumberOfConnectionsIn: aView [
	^ ((self getElementConnectionsFrom: aView) sortedAs: #yourself)
		first: (aView elements size * self threshold) asInteger
]

{ #category : #'private - utils' }
RTThresholdFilter >> getSmallestElementAreasIn: aView [
	^ ((self getElementAreasFrom: aView) sortedAs: #yourself)
		first: (aView elements size * self threshold) asInteger
]

{ #category : #hooks }
RTThresholdFilter >> initializeElement: aView [

	| filerSelector |
	aView addMenu: 'Filter' callback: [ 
		filerSelector := self askWhichFilterToChoose.
		filerSelector ifNotNil: [
			self perform: filerSelector with: aView
		] ]

	 
]

{ #category : #'public - filtering' }
RTThresholdFilter >> keepConnectedElements: aView [
	"Remove all the non-connected elements"

	| irrelevantElements |
	irrelevantElements := aView elements select: [ :el | el connectedEdges isEmpty ].
	self removeFrom: aView elements: irrelevantElements
]

{ #category : #'public - filtering' }
RTThresholdFilter >> keepLargeElements: aView [
	"Keep the top 20% of large elements"

	| largestAreas threshold irrelevantElements |
	largestAreas := self getLargestElementAreasIn: aView.
	largestAreas ifEmpty: [ ^ self ].
	threshold := largestAreas last.
	irrelevantElements := aView elements select: [ :el | el trachelShape extent x * el trachelShape extent y <= threshold ].
	self removeFrom: aView elements: irrelevantElements
]

{ #category : #'public - filtering' }
RTThresholdFilter >> keepLeastConnectedElements: aView [
	"Keep the top 20% of most connected elements"

	| leastConnections threshold irrelevantElements |
	leastConnections := self getLeastNumberOfConnectionsIn: aView.
	leastConnections ifEmpty: [ ^ self ].
	threshold := leastConnections last.
	irrelevantElements := aView elements select: [ :el | el connectedEdges size >= threshold ].
	self removeFrom: aView elements: irrelevantElements
]

{ #category : #'public - filtering' }
RTThresholdFilter >> keepMostConnectedElements: aView [
	"Keep the top 20% of most connected elements"

	| mostConnections threshold irrelevantElements |
	mostConnections := self getGreatestNumberOfConnectionsIn: aView.
	mostConnections ifEmpty: [ ^ self ].
	threshold := mostConnections last.
	irrelevantElements := aView elements select: [ :el | el connectedEdges size <= threshold ].
	self removeFrom: aView elements: irrelevantElements
]

{ #category : #'public - filtering' }
RTThresholdFilter >> keepSmallElements: aView [
	"Keep the top 20% of small elements"

	| largestAreas threshold irrelevantElements |
	largestAreas := self getSmallestElementAreasIn: aView.
	largestAreas ifEmpty: [ ^ self ].
	threshold := largestAreas last.
	irrelevantElements := aView elements select: [ :el | el trachelShape extent x * el trachelShape extent y >= threshold ].
	self removeFrom: aView elements: irrelevantElements
]

{ #category : #'private - utils' }
RTThresholdFilter >> removeFrom: aView elements: irrelevantElements [
	irrelevantElements do: #remove.
	aView signalUpdate
]

{ #category : #configuration }
RTThresholdFilter >> threshold [
	^ 0.20
]
