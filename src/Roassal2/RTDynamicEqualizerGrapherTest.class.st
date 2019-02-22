"
A RTDynamicEqualizerGrapherTest is a test class for testing the behavior of RTDynamicEqualizerGrapher
"
Class {
	#name : #RTDynamicEqualizerGrapherTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #running }
RTDynamicEqualizerGrapherTest >> setUp [
	super setUp.
	b := RTDynamicEqualizerGrapher new
]

{ #category : #tests }
RTDynamicEqualizerGrapherTest >> testBasic [
	self assert: b numberOfMetrics equals: 0
]
