Class {
	#name : #RTDataTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #tests }
RTDataTest >> testBasic [

	| charter |
	charter := RTGrapher new.
	charter add: (RTData new points: #(#(1 2) #(3 4) #(2 5)); x: #first; y: #second).
	charter build.
]

{ #category : #tests }
RTDataTest >> testBasic02 [

	| b ds |
	b := RTGrapher new.
	ds := RTData new. 
	ds barShape.
	ds points: #(5 1 20 8 5 1 20 8 5 1 20 8).
	ds y: [ :v | v ].
	b add: ds.
	b build


]

{ #category : #tests }
RTDataTest >> testComputeMinAndMax [

	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(1 2 3).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.

	b maxY: 5.
	b build.
	
	self assert: b centralPoint equals: 0 @ 0.
	self assert: ds minX equals: 0.
	self assert: ds maxX equals: 3.
	
	self assert: b maxY equals: 5.
	self assert: ds minY equals: 0.
	self assert: ds maxY equals: 5.
]

{ #category : #tests }
RTDataTest >> testConnectColor [

	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds connectColor: Color blue.
	ds points: #(1 2 3).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.

	b build.
	
	self assert: b view numberOfEdges equals: 4.
	self assert: b view edges last trachelShape color equals: Color blue.
]

{ #category : #tests }
RTDataTest >> testDefault [
	self assert: RTData new points isEmpty.
	self deny: RTData new shouldConnect
]

{ #category : #tests }
RTDataTest >> testDotColor [

	| b ds e |
	b := RTGrapher new.
	ds := RTData new.
	ds interaction popup.
	ds dotShape color: Color blue.
	ds points: #(1 2 3 4).
	ds x: #yourself; y: #yourself.
	b add: ds.

	b build.
	
	e := b view elementFromModel: 1.
	self assert: e trachelShape color equals: Color blue.
]

{ #category : #tests }
RTDataTest >> testGetDictionaryValues [
	| ds |
	ds := RTData new.
	ds
		points:
			(Array with: (Dictionary with: #a -> 12 with: #b -> 7) with: 
			(Dictionary with: #a -> 2 with: #b -> 3)).
	ds x: #a.
	ds y: #b.
	self assert: ds getValuesX asArray equals: #(12 2).
	self assert: ds getValuesY asArray equals: #(7 3)
]

{ #category : #tests }
RTDataTest >> testGetValues01 [
	| ds |
	ds := RTData new.
	ds points: #(3 4 5).

	self assert: ds getValuesX asArray equals: #(1 2 3).
	self assert: ds getValuesY asArray equals: #(3 4 5).	
]

{ #category : #tests }
RTDataTest >> testGetValues02 [
	| ds |
	ds := RTData new.
	ds points: #(3 4 5).
	ds x: [ :v | v + 2 ].
	ds y: [ :v | v + 3 ].

	self assert: ds getValuesX asArray equals: #(5 6 7).
	self assert: ds getValuesY asArray equals: #(6 7 8).	
]

{ #category : #tests }
RTDataTest >> testGetValues03 [
	| ds |
	ds := RTData new.
	ds points: #(3 4 5).
	ds stack.
	
	self assert: ds getValuesX asArray equals: #(1 2 3).
	self assert: ds getValuesY asArray equals: #(3 4 5).	
]

{ #category : #tests }
RTDataTest >> testHorizontal [

	| b ds |
	b := RTGrapher new.
	ds := RTHorizontalData new.
	ds points: #(1 2 3).
	b add: ds.
	b build.
]

{ #category : #tests }
RTDataTest >> testInteraction [

	| ds |
	ds := RTData new.
	self assert: ds interaction class equals: RTDataInteractionBuilder
]

{ #category : #tests }
RTDataTest >> testNoDot [

	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds noDot.
	ds points: #(1 2 3).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.

	b build.
	
	self assert: (b view elementFromModel: 2) trachelShape width equals: 0.
	self assert: (b view elementFromModel: 2) trachelShape height equals: 0.
	
	"Axes"
	self assert: b view numberOfEdges equals: 2
]

{ #category : #'test - sampling' }
RTDataTest >> testNoSample01 [

	| d g |
	d := RTData new.
	d points: (1 to: 1000).
	d y: #yourself.
	g := RTGrapher new.
	g add: d.
	
	self assert: d elements size equals: 1000
]

{ #category : #tests }
RTDataTest >> testNonTrivialGraph [

	| grapher dataSet |
	grapher := RTGrapher new.
	grapher extent: 300 @ 200.
	dataSet := RTData new 
		points: RTObject withAllSubclasses; 
		x: #numberOfLinesOfCode; 
		y: #numberOfMethods.
	dataSet dotShape color: (Color red alpha: 0.3).
	grapher add: dataSet.
	grapher axisX; axisY.
	grapher build
	
]

{ #category : #'test - sampling' }
RTDataTest >> testSample01 [

	| d g elementsThatAreSampled previous |
	d := RTData new.
	d samplingIfMoreThan: 100.
	d points: (1 to: 1000).
	d y: #yourself.
	g := RTGrapher new.
	g add: d.
	
	self assert: d elements size <= 100.
	
	elementsThatAreSampled := d elements collect: #model.
	
	"We assert that the order is still the same"
	previous := -1.
	elementsThatAreSampled do: [ :o | 
		self assert: o > previous.
		previous := o
		 ]
	 
]

{ #category : #tests }
RTDataTest >> testStackedData [
	| data b ds |
	data := (-20 to: 20).
	 
	b := RTGrapher new.
	b extent: 300 @ 200.
	ds := RTData new.
	ds interaction popup.
	ds points: data.
	ds barShape width: 8; 
	      color: (Color green alpha: 0.3);
	     if: [:value | value < 0 ] fillColor: (Color red alpha: 0.3).
	b add: ds.
	b build.
	^ b view
]

{ #category : #tests }
RTDataTest >> testlineShape [

	| ds |
	ds := RTData new.
	self assert: ds lineShape class equals: RTShapeBuilder
]
