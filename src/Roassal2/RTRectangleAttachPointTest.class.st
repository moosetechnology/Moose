"
A RTRectangleAttachPointTest is a test class for testing the behavior of RTRectangleAttachPoint
"
Class {
	#name : #RTRectangleAttachPointTest,
	#superclass : #RTTest,
	#instVars : [
		'el',
		'elX',
		'elD',
		'edgeX',
		'edgeD'
	],
	#category : #'Roassal2-AttachPoint-Tests'
}

{ #category : #running }
RTRectangleAttachPointTest >> setUp [
	super setUp.
	"| shape |
	true ifTrue: [ ^ self skip ].
	shape := RTBox new size: 20.
	(el := shape element) translateTo: 0 @ 0.
	(elX := shape element) translateTo: 100 @ 0.
	(elD := shape element) translateTo: -100 @ -100.
	edgeX := RTLine new
		attachPoint: RTRectangleAttachPoint new;
		edgeFrom: el to: elX.
	edgeD := RTLine new
		attachPoint: RTRectangleAttachPoint new;
		edgeFrom: el to: elD"
]

{ #category : #tests }
RTRectangleAttachPointTest >> testInside [
	"| ap |
	el extent: 2000 @ 2000.
	self assert: (edgeX shape startingPointOf: edgeX) = (1000 @ 0).
	self assert: (edgeX shape endingPointOf: edgeX) = (110 @ 0).
	ap := edgeD shape startingPointOf: edgeD.
	self assert: -1000 @ -100 = ap | (-100 @ -1000 = ap).
	ap := edgeD shape endingPointOf: edgeD.
	self assert: -110 @ -100 = ap | (-100 @ -110 = ap)"
]

{ #category : #tests }
RTRectangleAttachPointTest >> testNoCollision [
	"self assert: (edgeX shape startingPointOf: edgeX) = (10 @ 0).
	self assert: (edgeX shape endingPointOf: edgeX) = (90 @ 0).
	self assert: (edgeD shape startingPointOf: edgeD) = (-10 @ -10).
	self assert: (edgeD shape endingPointOf: edgeD) = (-90 @ -90)"
]
