Class {
	#name : #RTGrapherBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #running }
RTGrapherBuilderTest >> setUp [
	super setUp.
	b := RTGrapher new
]

{ #category : #tests }
RTGrapherBuilderTest >> testCentralPoint [

	| ds  |
	b := RTGrapher new.

	ds := RTData new.
	ds interaction popupText.
	ds points: #(1 2 3).
	ds x: #yourself.
	ds y: #yourself.
	b add: ds.


	b minY: -2.
	
	b build.
	
	self assert: b centralPoint equals: 0 @ -80.
	self assert: b getAxisX fromPoint equals: 0 @ -80

]

{ #category : #tests }
RTGrapherBuilderTest >> testDefault [
	self deny: b isXAxisDefined.
	self deny: b isYAxisDefined.
]

{ #category : #tests }
RTGrapherBuilderTest >> testGetMaxNumberOfPoints [
	| ds |
	self assert: b getMaxNumberOfPoints equals: 0.
	
	ds := RTData new.
	ds points: (1 to: 5).
	b add: ds.
	
	self assert: b getMaxNumberOfPoints equals: 5.
	
	ds := RTData new.
	ds points: (1 to: 10).
	b add: ds.

	self assert: b getMaxNumberOfPoints equals: 10.
]

{ #category : #tests }
RTGrapherBuilderTest >> testIgnoringEmptyDataSets [

	| ds |
	self assert: b numberOfDataSets equals: 0.
	
	ds := RTData new.
	b add: ds.
	self assert: b numberOfDataSets equals: 0.
	
	ds := RTData new.
	ds points: #(1).
	b add: ds.
	self assert: b numberOfDataSets equals: 1.

]

{ #category : #tests }
RTGrapherBuilderTest >> testIsAxisDefined [

	b := RTGrapher new.
	b add: (RTData new points: #(1 2 3); x: #yourself; y: #yourself).
	
	self deny: b isXAxisDefined.
	self deny: b isYAxisDefined.
	
	b axisXWithNumberOfTicks: 2.
	self assert: b isXAxisDefined.
	self deny: b isYAxisDefined.

	b axisY.
	self assert: b isXAxisDefined.
	self assert: b isYAxisDefined.

	b build.
	self assert: b getAxisX step equals: 3 / 2.
]

{ #category : #tests }
RTGrapherBuilderTest >> testStepOnXAxis [

	b := RTGrapher new.
	b add: (RTData new points: #(1 2 3); yourself).
	b axisXWithNumberOfTicks: 2.
	b build.
	self assert: b getAxisX step equals: 3 / 2.
]

{ #category : #tests }
RTGrapherBuilderTest >> testTickOnXAxis [

	| ds1 result expected |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	b add: ds1.
	b axisY noLabel; noTick.
	b axisX noLabel.
	b build.
	
	result := (b view elements collect: #position) asArray collect: #asIntegerPoint.
	expected := ((Array new: 19) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((0@0)); at: 4 put: ((300@0)); at: 5 put: ((0@2)); at: 6 put: ((75@2)); at: 7 put: ((150@2)); at: 8 put: ((225@2)); at: 9 put: ((300@2)); at: 10 put: ((30@ -20)); at: 11 put: ((60@ -40)); at: 12 put: ((90@ -60)); at: 13 put: ((120@ -80)); at: 14 put: ((150@ -100)); at: 15 put: ((180@ -120)); at: 16 put: ((210@ -140)); at: 17 put: ((240@ -160)); at: 18 put: ((270@ -180)); at: 19 put: ((300@ -200)); yourself).
	self assert: result equals: expected.

]

{ #category : #tests }
RTGrapherBuilderTest >> testTickOnXAxisWithLog [

	| ds1 result expected |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 xLog.
	b add: ds1.
	b axisY noLabel; noTick.
	b axisX noLabel.
	b build.
	
	result := (b view elements collect: #position) asArray collect: #asIntegerPoint.
	expected := ((Array new: 19) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((0@0)); at: 4 put: ((300@0)); at: 5 put: ((0@2)); at: 6 put: ((129@2)); at: 7 put: ((204@2)); at: 8 put: ((258@2)); at: 9 put: ((300@2)); at: 10 put: ((86@ -20)); at: 11 put: ((137@ -40)); at: 12 put: ((173@ -60)); at: 13 put: ((201@ -80)); at: 14 put: ((224@ -100)); at: 15 put: ((243@ -120)); at: 16 put: ((260@ -140)); at: 17 put: ((274@ -160)); at: 18 put: ((288@ -180)); at: 19 put: ((300@ -200)); yourself).
	self assert: result equals: expected.

]

{ #category : #tests }
RTGrapherBuilderTest >> testTickOnYAxis [

	| ds1 result expected |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: (1 to: 10).
	ds1 yLog.
	b add: ds1.
	b axisY noLabel; numberOfTicks: 10.
	b axisX noLabel; noTick.
	b build.
	
	result := (b view elements collect: #position) asArray collect: #asIntegerPoint.
	expected := ((Array new: 25) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((-2@0)); at: 4 put: ((-2@ -57)); at: 5 put: ((-2@ -91)); at: 6 put: ((-2@ -115)); at: 7 put: ((-2@ -134)); at: 8 put: ((-2@ -149)); at: 9 put: ((-2@ -162)); at: 10 put: ((-2@ -173)); at: 11 put: ((-2@ -183)); at: 12 put: ((-2@ -192)); at: 13 put: ((-2@ -200)); at: 14 put: ((0@0)); at: 15 put: ((300@0)); at: 16 put: ((30@ -57)); at: 17 put: ((60@ -91)); at: 18 put: ((90@ -115)); at: 19 put: ((120@ -134)); at: 20 put: ((150@ -149)); at: 21 put: ((180@ -162)); at: 22 put: ((210@ -173)); at: 23 put: ((240@ -183)); at: 24 put: ((270@ -192)); at: 25 put: ((300@ -200)); yourself).
	self assert: result equals: expected.

]

{ #category : #tests }
RTGrapherBuilderTest >> testWithStrangeValues [

	| graphBuilder ds |
	graphBuilder := RTGrapher new.
	graphBuilder extent: 300 @ 200.

	ds := RTData new.
	ds dotShape rectangle size: 0.
	ds points: #(1 3 7 0 6).

	ds y: [ :c | c asInteger ].
	ds barShape rectangle 
	   width: 10;
	   color: Color blue.

	graphBuilder add: ds.
	graphBuilder axisX noLabel; noTick.
	graphBuilder axisY noLabel; noTick.
	graphBuilder build.

	self assert: (graphBuilder view elements collect: #position) asArray equals: ((Array new: 9) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((0@0)); at: 4 put: ((300@0)); at: 5 put: ((60@ -12.5)); at: 6 put: ((120@ -37.5)); at: 7 put: ((180@ -87.5)); at: 8 put: ((240@0.0)); at: 9 put: ((300@ -75.0)); yourself)
]

{ #category : #tests }
RTGrapherBuilderTest >> testWithStrangeValues02 [

	| graphBuilder ds |
	graphBuilder := RTGrapher new.
	graphBuilder extent: 300 @ 200.

	ds := RTData new.
	ds dotShape rectangle size: 0.
	ds points: #(1 3 7 0 6).

	ds y: [ :c | c asInteger ].
	ds barShape rectangle 
	   width: 10;
	   color: Color blue.

	graphBuilder add: ds.
	graphBuilder axisX noLabel; noTick.
	graphBuilder axisY noLabel; noTick.
	graphBuilder build.
	
	self assert: (graphBuilder view elements collect: #position) asArray equals:  ((Array new: 9) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((0@0)); at: 4 put: ((300@0)); at: 5 put: ((60@ -12.5)); at: 6 put: ((120@ -37.5)); at: 7 put: ((180@ -87.5)); at: 8 put: ((240@0.0)); at: 9 put: ((300@ -75.0)); yourself).
	
	"This was true when there was no offset for the bars. "
"	self assert: (graphBuilder view elements collect: #position) asArray equals: ((Array new: 9) at: 1 put: ((0@0)); at: 2 put: ((0@ -200)); at: 3 put: ((0@0)); at: 4 put: ((300@0)); at: 5 put: ((50@ -12.5)); at: 6 put: ((100@ -37.5)); at: 7 put: ((150@ -87.5)); at: 8 put: ((200@0.0)); at: 9 put: ((250@ -75.0)); yourself)"
]
