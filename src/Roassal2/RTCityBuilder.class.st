Class {
	#name : #RTCityBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'name',
		'cities',
		'popup',
		'mapBuilder',
		'evolutionPeriod',
		'step'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #initialization }
RTCityBuilder >> addCityNamed: aName location: aPoint [
	"aName is a string and aPoint is a geographical location, longititud @ latitud"
	cities at: aName put: aPoint
]

{ #category : #action }
RTCityBuilder >> buildCities: someCities [
	|elements|
	elements := self elementsOn: someCities.
	elements do: [ :e |
		|geoPosition w h|
		w := e trachelShape encompassingRectangle width.
		h := e trachelShape encompassingRectangle height.
		geoPosition := (cities at: (name rtValue: e model)).
		e translateTo: (mapBuilder translateGeoPositionToPixels: geoPosition) * (mapBuilder scale).
		popup isNotNil ifTrue: [ e @ (RTPopup text: popup) ]].
	^ elements
]

{ #category : #accessing }
RTCityBuilder >> currentStep [
	^ step
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> evolutionPeriod [
	^ evolutionPeriod
]

{ #category : #action }
RTCityBuilder >> evolveAt: index through: timePeriod [
	evolutionPeriod := timePeriod.
	mapBuilder cityObjects do: [ :c |
		|evolver|
		evolver := RTDataEvolver new.
		evolver dataSequence: (c at: index).
		evolver stepGiver: self.
		c at: index put: evolver.
	].
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> getCityName: aCity [
	^ name rtValue: aCity
]

{ #category : #initialization }
RTCityBuilder >> initialize [
	super initialize.
	step := 1.
	evolutionPeriod := OrderedCollection new.
	self initializeCities.
	self shape
		circle;
		color: (Color red alpha: 0.5);
		size: 15.
	name := #yourself.
]

{ #category : #initialization }
RTCityBuilder >> initializeCities [
	cities := Dictionary new.
	cities at: 'Santiago' put: -33.4500 @ -70.66.
	cities at: 'Vina del Mar' put: -33 @ -71.52.
	
	cities at: 'New York City' put: 40.67 @ -73.94 .
	cities at: 'Washington, D.C.' put: 38.89 @ -77.03.
	cities at: 'Paris' put: 48.85 @ 2.35.
	cities at: 'Nice' put: 43.70 @ 7.26.
	cities at: 'Bordeaux' put: 44.84 @ -0.58.

	cities at: 'Bogota' put: 4.5981 @ -74.07.
	cities at: 'Buenos Aires' put: -34.60 @ -58.38.
	cities at: 'Brasilia' put: -15.79 @ -47.86.
	cities at: 'Sao Paulo' put: -23.55 @ -46.63.
	cities at: 'Montevideo' put: -34.88 @ -56.18.
	cities at: 'Lima' put: -12.04 @ -77.03.
	cities at: 'La Paz' put: -16.5 @ -68.15.
	cities at: 'Quito' put: -0.25 @ -78.58.
	cities at: 'Caracas' put: 10.5 @ -66.92.
	
	cities at: 'Shanghai' put: 31.2 @ 121.5.
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> mapBuilder: builder [
	mapBuilder := builder
]

{ #category : #accessing }
RTCityBuilder >> name: aBlockOrString [
	name := aBlockOrString
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> names [
	^ name
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> step [
	^ step
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> stepBack [
	1 < step
		ifTrue: [ step := step - 1 ]
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> stepForward [
	evolutionPeriod size > step
		ifTrue: [ step := step + 1 ]
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> withPopup [
	self withPopup: name
]

{ #category : #'as yet unclassified' }
RTCityBuilder >> withPopup: aBlockOrSymbol [
	popup := aBlockOrSymbol
]
