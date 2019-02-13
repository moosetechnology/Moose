Class {
	#name : #RTRouteBuilder,
	#superclass : #RTShapeBuilder,
	#instVars : [
		'routes',
		'mapBuilder',
		'popup'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #'as yet unclassified' }
RTRouteBuilder >> buildRoutesUsingNames: cityNames [
	|elements routeElems|
	elements := mapBuilder view elements.
	routeElems := OrderedCollection new.
	routes do: [ :r |
		| route c1 c2 |
		c1 := elements detect: [ :e | (cityNames rtValue: e model) = (r key) ] ifNone: [ self cityNotFoundError: r key ].
		c2 := elements detect: [ :e | (cityNames rtValue: e model) = (r value)] ifNone: [ self cityNotFoundError: r value ].
		route := RTRoute from: c1 to: c2.
		route mapBuilder: mapBuilder.
		route edge + (shape copy).
		popup isNil ifFalse: [ route edge @ (RTPopup text: popup) ].
		routeElems add: route edge.
	].
	^ routeElems.
]

{ #category : #'as yet unclassified' }
RTRouteBuilder >> cityNotFoundError: cityName [
	self error: 'Not found: ',cityName.
]

{ #category : #'as yet unclassified' }
RTRouteBuilder >> from: aCityName toAll: cityNames [
	cityNames do: [ :toCityName |
		routes add: aCityName -> toCityName.
	]
]

{ #category : #'as yet unclassified' }
RTRouteBuilder >> ifRoute: aConditionBlock lineColor: aColorBlock [
	^ self ifElement: [ :e | aConditionBlock rtValue: e model ] fillColor: aColorBlock.
]

{ #category : #initialization }
RTRouteBuilder >> initialize [
	super initialize.
	routes := OrderedCollection new.
	self line; color: Color black.
]

{ #category : #accessing }
RTRouteBuilder >> mapBuilder: builder [
	mapBuilder := builder.
]

{ #category : #interactions }
RTRouteBuilder >> withPopup [
	self withPopup: #yourself
]

{ #category : #accessing }
RTRouteBuilder >> withPopup: aBlockOrSymbol [
	popup := aBlockOrSymbol
]
