Class {
	#name : #RTCursorFollowerTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators-Tests'
}

{ #category : #running }
RTCursorFollowerTest >> setUp [
	| ds |
	super setUp.
	b := RTGrapher new.
	ds := RTData new.
	ds points: #(5 10 6 2 -2.5).
	b add: ds.
	
]

{ #category : #tests }
RTCursorFollowerTest >> testIsPointOverTheBuilder [
	| follower |
	follower := RTCursorFollower new.
	b addDecorator: follower.
	b build.
	
	self assert: (follower convertPointForGraph: 5 @ 4) equals: (5 @ -4).
	self assert: (follower convertPointForGraph: 5 @ -4) equals: (5 @ 4).
	
	self assert: (follower isPointOverTheBuilder: 0 @ 0)
]
