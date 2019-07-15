Class {
	#name : #RTAnimatedScatterPlotTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-AnimatedScatterPlot'
}

{ #category : #running }
RTAnimatedScatterPlotTest >> setUp [
	super setUp.
	b := RTAnimatedScatterPlot new.
]

{ #category : #tests }
RTAnimatedScatterPlotTest >> testDefault [
	self assert: b numberOfTables = 0.
	self assert: b frame = 1.
]
