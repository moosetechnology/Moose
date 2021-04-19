Class {
	#name : #DistributionMapExampleTest,
	#superclass : #TestCase,
	#instVars : [
		'map'
	],
	#category : #'Moose-DistributionMap-Tests'
}

{ #category : #history }
DistributionMapExampleTest class >> lastStoredRun [
	^ ((Dictionary new) add: (#errors->((Set new))); add: (#passed->((Set new) add: #testSample; yourself)); add: (#failures->((Set new))); add: (#timeStamp->(DateAndTime basicNew instVarAt: 1 put: 623; instVarAt: 2 put: (Duration seconds: 28800 nanoSeconds: 0); instVarAt: 3 put: 2456089; instVarAt: 4 put: 919000001; yourself)); yourself)
]

{ #category : #tests }
DistributionMapExampleTest >> setUp [
	super setUp.
	map := DistributionMapExample new
		containers: Collection withAllSubclasses;
		yourself
]

{ #category : #tests }
DistributionMapExampleTest >> testOpen [
	| window |
	self shouldnt: [ window := map open ] raise: Error.
	self assert: map canvas class identicalTo: RSCanvas.
	self shouldnt: [ window close ] raise: Error
]
