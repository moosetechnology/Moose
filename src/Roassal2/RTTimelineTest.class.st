Class {
	#name : #RTTimelineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Timeline-Tests'
}

{ #category : #tests }
RTTimelineTest >> testBasic [

	| b s |
	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: #(1 2 3 4).
	s end: [ :v | v + 1 ].
	b add: s.
	
	self assert: b numberOfSets equals: 1.
	self assert: b numberOfEvents equals: 4.
	self assert: b numberOfLines equals: 4.
	
	b build.
	
	self assert: b numberOfSets equals: 1.
	self assert: b numberOfEvents equals: 4.
	self assert: b numberOfLines equals: 4.
]

{ #category : #tests }
RTTimelineTest >> testBasicWithDifferentIdentifier02 [

	| b s |
	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: #(1 2 3 4).
	s end: [ :v | v + 1 ].
	b add: s.
	
	s := RTTimelineSet new.
	s objects: #(1 2 3 4 5).
	s end: [ :v | v + 2 ].
	b add: s.
	
	b build.
	
	self assert: b numberOfSets equals: 2.
	self assert: b numberOfEvents equals: 9.
	self assert: b numberOfLines equals: 5.
]

{ #category : #tests }
RTTimelineTest >> testDefault [
	
	self assert: RTTimeline new numberOfSets equals: 0.
	self assert: (RTTimeline new build; numberOfSets) equals: 0
]
