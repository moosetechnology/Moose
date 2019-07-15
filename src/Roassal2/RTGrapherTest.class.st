Class {
	#name : #RTGrapherTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #'test labels' }
RTGrapherTest >> testAxesPosition [
	| ds center |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(3 -3).
	b add: ds.
	b build.
	center := b getPixelPositionOf: 0 @ 0.
	self assert: center equals: 0 @ -100.
	self assert: b axisX fromPoint equals: 0 @ -100.
	self assert: b axisX toPoint equals: 300 @ -100.
	self assert: b axisY fromPoint equals: 0 @ 0.
	self assert: b axisY toPoint equals: 0 @ -200
]

{ #category : #'test labels' }
RTGrapherTest >> testAxesWithOFffsetPosition [
	| ds center |
	b := RTGrapher new.
	b yOffset: 30.
	b minX: 1.
	ds := RTData new.
	ds points: #(3 -3).
	b add: ds.
	b build.
	center := b getPixelPositionOf: 0 @ 0.
	self assert: center equals: 0 @ -100.
	self assert: b axisX fromPoint equals: 0 @ -100.
	self assert: b axisX toPoint equals: 300 @ -100.
	self assert: b axisY fromPoint equals: -30 @ 0.
	self assert: b axisY toPoint equals: -30 @ -200
]

{ #category : #tests }
RTGrapherTest >> testAxis [

	| x1 x2 ds |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(1 2).
	b add: ds.
	
	x1 := b axisX numberOfTicks: 4.
	x2 := b axisX numberOfLabels: 5.
	
	self assert: x1 == x2.
	self assert: x1 numberOfTicks equals: 5.
	self assert: x1 numberOfLabels equals: 5.
]

{ #category : #tests }
RTGrapherTest >> testAxis02 [

	| x1 x2 ds |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(1 2).
	b add: ds.
	
	x1 := b axisY numberOfTicks: 4.
	x2 := b axisY numberOfLabels: 5.
	
	self assert: x1 == x2.
	self assert: x1 numberOfTicks equals: 5.
	self assert: x1 numberOfLabels equals: 5.
]

{ #category : #tests }
RTGrapherTest >> testDefault [
	b := RTGrapher new.
	self assert: b minX equals: 0.
	self assert: b maxX equals: 0.
	self assert: b minY equals: 0.
	self assert: b maxY equals: 0.
	
	self assert: b datasets isEmpty.
	self assert: b decorators isEmpty.
]

{ #category : #tests }
RTGrapherTest >> testDefault02 [
	b := RTGrapher new.
	b maxX: 2.
	b minX: -2.
	b maxY: 5.
	b minY: -1.
	self assert: b minX equals: -2.
	self assert: b maxX equals: 2.
	self assert: b minY equals: -1.
	self assert: b maxY equals: 5.

]

{ #category : #tests }
RTGrapherTest >> testError [
	| g d |
	self should: [
		g := RTGrapher new.
		d := RTData new.
		d points: (0.0 to: 5.0 by: 0.1).
		d y: #yourself.
		g add: g.
		g build. ] raise: AssertionFailure
]

{ #category : #tests }
RTGrapherTest >> testExtent [

	b := RTGrapher new.
	b extent: 50 @ 30.
	self assert: b extent equals: 50 @ 30
]

{ #category : #tests }
RTGrapherTest >> testNumberOfPlugins [

	self assert: RTGrapher new numberOfDecorators equals: 0.
	b := RTGrapher new.
	b addDecorator: (RTVerticalLineDecorator new).
	self assert: RTGrapher new numberOfDecorators equals: 0.
]

{ #category : #tests }
RTGrapherTest >> testNumberOfPlugins01 [

	self assert: RTGrapher new numberOfDecorators equals: 0.

]

{ #category : #tests }
RTGrapherTest >> testNumberOfPlugins02 [

	b := RTGrapher new.
	b addDecorator: (RTVerticalLineDecorator new).
	self assert: b numberOfDecorators equals: 1.
]

{ #category : #tests }
RTGrapherTest >> testRender [
	| v ds |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(1 2).
	b add: ds.
	
	v := RTView new.
	b renderIn: v
]

{ #category : #'test - scaling' }
RTGrapherTest >> testScaling01 [

	| ds1 |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 yLog.
	b add: ds1.

	self assert: b yScale equals: ds1 yScale
]

{ #category : #'test - scaling' }
RTGrapherTest >> testScaling02 [

	| ds1 ds2 |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 yLog.
	b add: ds1.

	ds2 := RTData new.
	ds2 points: (1 to: 10).
	ds2 yLog.
	b add: ds2.
	
	self assert: b yScale equals: ds1 yScale
]

{ #category : #'test - scaling' }
RTGrapherTest >> testScaling03 [

	| ds1 ds2 |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 yLog.
	b add: ds1.

	ds2 := RTData new.
	ds2 points: (1 to: 10).
	ds2 yLinear.
	b add: ds2.
	
	self should: [ b yScale ] raise: Error
]

{ #category : #'test - scaling' }
RTGrapherTest >> testScaling04 [

	| ds1 ds2 |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 xLog.
	b add: ds1.

	ds2 := RTData new.
	ds2 points: (1 to: 10).
	ds2 xLinear.
	b add: ds2.
	
	self should: [ b xScale ] raise: Error.
	self shouldnt: [ b yScale ] raise: Error
]

{ #category : #tests }
RTGrapherTest >> testSimple [

	| ds |
	b := RTGrapher new.

	ds := RTData new.
	ds interaction popupText.
	ds points: #(3 4 5 6).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.

	b build.
	
	self assert: ds maxX equals: 6.
	
	self assert: b minX equals: 0.
	self assert: b maxX equals: 6.
	self assert: b minY equals: 0.
	self assert: b maxY equals: 6.
]

{ #category : #tests }
RTGrapherTest >> testSimple02 [

	| ds |
	b := RTGrapher new.

	ds := RTData new.
	ds points: (-100 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * (x + 30)) sin  ].
	ds noDot.
	ds interaction popupText: 'sinus'.
	ds connectColor: Color blue.
	b add: ds.

	b minY: -2.
	b maxY: 2.
	b build.
]

{ #category : #tests }
RTGrapherTest >> testSimple03 [

	| ds |
	b := RTGrapher new.
	ds := RTData new.
	ds interaction popup.
	ds points: RTShape withAllSubclasses.
	ds y: [ :cls | cls rtmethods size ].
	ds barShape rectangle color: Color lightBlue.
	b add: ds.
	b build.
	
	ds renderIn: RTView new.
]

{ #category : #'test labels' }
RTGrapherTest >> testTitleOnAxes [

	| ds labels |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(1 2).
	b add: ds.

	b axisX noTick; title: 'hello'.
	b axisY noLabel; title: 'world'.
	b build.
	
	labels := b view elements elements select: [ :el | el shape class == RTLabel ].
	self assert: (labels anySatisfy: [ :e | e trachelShape text = 'hello' ]).
	self assert: (labels anySatisfy: [ :e | e trachelShape text = 'world' ]).
]

{ #category : #'test labels' }
RTGrapherTest >> testTitleOnAxes02 [

	| ds labels |
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(1 2).
	b add: ds.

	b axisX title: 'hello'.
	b axisY title: 'world'.
	b build.
	
	labels := b view elements elements select: [ :el | el shape class == RTLabel ].
	self assert: (labels anySatisfy: [ :e | e trachelShape text = 'hello' ]).
	self assert: (labels anySatisfy: [ :e | e trachelShape text = 'world' ]).
]
