Class {
	#name : #RTMapBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'builder'
	],
	#category : #'Roassal2-Builder-Map-Tests'
}

{ #category : #running }
RTMapBuilderTest >> setUp [
	super setUp.
	builder := RTMapBuilder new.
]

{ #category : #tests }
RTMapBuilderTest >> testCities [
	|stgo brasilia saopaulo|
	stgo := #('Santiago' 6027000).
	brasilia := #('Brasilia' 2481000).
	saopaulo := #('Sao Paulo' 19889559).
	
	builder countries: #('Chile' 'Brazil').
	builder cities: (Array with:stgo with: brasilia with: saopaulo) named: [ :c | c at: 1 ].
	
	builder renderIn: builder view.
	
	self assert: builder view numberOfElements = 5.
	self assert: builder view elements third model = stgo.
	self assert: builder view elements fourth model = brasilia.
	self assert: builder view elements fifth model = saopaulo.
]

{ #category : #tests }
RTMapBuilderTest >> testCityEvolution [
	| myCities santiago |
	myCities := #(
		#('Santiago' #(33 41))
	).
	
	builder cities: myCities named: [ :c | c at: 1 ].
	builder cities evolveAt: 2 through: #(1907 1920).
	self assert: (myCities == builder cityObjects) not.
	self assert: ((myCities at: 1) == (builder cityObjects at: 1)) not.
	
	santiago := builder cityObjects at: 1.
	self assert: (santiago at: 2) currentValue = 33.
	
	builder cities stepBack.
	self assert: (santiago at: 2) currentValue = 33.
	
	builder cities stepForward.
	self assert: (santiago at: 2) currentValue = 41.
	
	builder cities stepForward.
	self assert: (santiago at: 2) currentValue = 41.
	

]

{ #category : #tests }
RTMapBuilderTest >> testCountries [
	| chile france |
	chile := #('Chile').
	france := #('France').

	builder countries: (Array with: chile with: france) named: [ :c | c at: 1 ].
	builder renderIn: builder view.
	self assert: builder view numberOfElements = 2.
	
	self assert: builder view elements first model == chile.
	self assert: builder view elements second model == france.
]

{ #category : #tests }
RTMapBuilderTest >> testGeoLength [
	| santiago paris distance error vdm |
	
	santiago := -33.45 @ -70.66.
	vdm := -33 @ -71.52.
	paris := 48.85 @ 2.35.
	
	distance := builder geoDistanceBetween: santiago and: paris.
	error := distance * 0.003.
	self assert: (distance - error < 11650 and: distance + error > 11650).
	
	distance := builder geoDistanceBetween: santiago and: vdm.
	error := distance * 0.003.
	self assert: (distance - error < 94.35 and: distance + error > 94.35).
	

]

{ #category : #tests }
RTMapBuilderTest >> testPixelsToGeoTransformations [
	|santiago stgoPixels paris parisPixels pixelsToGeo|
	
	santiago := -33.45 @ -70.66.
	paris := 48.85 @ 2.35.
	
	pixelsToGeo := [ :p | (builder translatePixelsToGeoPosition: p) roundTo: 0.01]. 
	
	stgoPixels := builder translateGeoPositionToPixels: santiago.
	self assert: ((pixelsToGeo value: stgoPixels) closeTo: santiago).
	
	parisPixels := builder translateGeoPositionToPixels: paris.
	self assert: ((pixelsToGeo value: parisPixels) closeTo: paris).
	
	
]

{ #category : #tests }
RTMapBuilderTest >> testRoutes [
	builder countries: #('Chile' 'Brazil').
	builder cities: #('Santiago' 'Brasilia' 'Sao Paulo').
	builder routes from: 'Santiago' toAll: #('Brasilia' 'Sao Paulo').
	builder routes from: 'Sao Paulo' toAll: #('Brasilia').
	builder renderIn: builder view.
	
	self assert: builder view numberOfEdges = 3.
	self assert: builder view edges first from model = 'Santiago'.
	self assert: builder view edges last from model = 'Sao Paulo'.
]
