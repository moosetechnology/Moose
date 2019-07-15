"
A RTTimeLineSetTest is a test class for testing the behavior of RTTimeLineSet
"
Class {
	#name : #RTTimelineSetTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Timeline-Tests'
}

{ #category : #tests }
RTTimelineSetTest >> testBasic [

	| b f |
	b := RTTimeline new.
	
	f := RTTimelineSet new.
	f shape rectangle color: Color green.
	f start: [ :v | v ].
	f end: [ :v | v + 1 ].
	f lineIdentifier: #yourself.
	f objects: #(1 2 3).
	b add: f.
	
	b build.
	
	self assert: b numberOfEvents equals: 3
]

{ #category : #tests }
RTTimelineSetTest >> testDefault [

	self assert: RTTimelineSet new numberOfObjects equals: 0
]

{ #category : #tests }
RTTimelineSetTest >> testLocalMinAndMax [

	| f |
	f := RTTimelineSet new.
	f shape rectangle color: Color green.
	f start: [ :v | v ].
	f end: [ :v | v + 1 ].
	f lineIdentifier: #yourself.
	f objects: #(1 2 3).
	
	self assert: f localMin equals: 1.
	self assert: f localMax equals: 4.
]
