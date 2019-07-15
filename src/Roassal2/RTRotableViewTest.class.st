Class {
	#name : #RTRotableViewTest,
	#superclass : #RTTest,
	#instVars : [
		'event',
		'v',
		'r'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #running }
RTRotableViewTest >> setUp [
	| e |
	super setUp.
	v := RTView new.
	e := (RTBox new size: 30) element.
	v add: e.
	e translateBy: 50 @ 50.
	
	r := RTRotableView new.
	v @ r.
]

{ #category : #tests }
RTRotableViewTest >> testBasic [

	event := TRMouseDragging new step: 50 @ 50.
	v announce: event.
	
	self assert: event canvas equals: v canvas.
	
	r dragViewWithEvent: event.
	self assert: (v canvas camera position closeTo:  -50 @ -50)
]

{ #category : #tests }
RTRotableViewTest >> testCenter [

	self assert: r center equals: 0 @ 0.
	r center: 5 @ 50.
	self assert: r center equals: 5 @ 50
]

{ #category : #tests }
RTRotableViewTest >> testElement [
	self assert: r elements size equals: 0
]

{ #category : #tests }
RTRotableViewTest >> testMouseDragging [

	| evt |
	evt := TRMouseDragging new step: 50 @ 50.
	self assert: evt position equals: 0 @ 0
]
