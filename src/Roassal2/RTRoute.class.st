Class {
	#name : #RTRoute,
	#superclass : #RTObject,
	#instVars : [
		'edge',
		'mapBuilder',
		'length'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #public }
RTRoute class >> from: cityElem1 to: cityElem2 [
	|route edge|
	route := RTRoute new.
	edge := RTEdge from: cityElem1 to: cityElem2.
	edge model: route.
	route edge: edge.
	^ route.
]

{ #category : #accessing }
RTRoute >> edge [
	^ edge
]

{ #category : #accessing }
RTRoute >> edge: anEdge [
	edge := anEdge
]

{ #category : #accessing }
RTRoute >> from [
	^ edge from model
]

{ #category : #'as yet unclassified' }
RTRoute >> fromCityName [
	^ mapBuilder cities getCityName: self from
]

{ #category : #'as yet unclassified' }
RTRoute >> length [
	length isNil ifTrue: [
		|coords1 coords2|
		coords1 := mapBuilder translatePixelsToGeoPosition: edge from position / (mapBuilder scale).
		coords2 := mapBuilder translatePixelsToGeoPosition: edge to position / (mapBuilder scale).
		length := (mapBuilder geoDistanceBetween: coords1 and: coords2) asInteger.
	].
	^ length
]

{ #category : #'as yet unclassified' }
RTRoute >> lengthString [
	^ self fromCityName, ' -> ', (self toCityName), ': ',(self length asString), ' km'
]

{ #category : #accessing }
RTRoute >> mapBuilder: builder [
	mapBuilder := builder
]

{ #category : #'as yet unclassified' }
RTRoute >> printString [
	^ self fromCityName, ' -> ', (self toCityName)
]

{ #category : #accessing }
RTRoute >> to [
	^ edge to model
]

{ #category : #'as yet unclassified' }
RTRoute >> toCityName [
	^ mapBuilder cities getCityName: self to
]
