Class {
	#name : #TRCameraTest,
	#superclass : #TRTest,
	#instVars : [
		'camera',
		'canvas'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRCameraTest >> setUp [
	super setUp. 
	canvas := TRCanvas new.
	camera := canvas camera
]

{ #category : #conversion }
TRCameraTest >> testConversion [
	self assert: ((camera fromSpaceToPixel: 0 @ 0) closeTo: (canvas extent / 2)).
	self assert: ((camera fromSpaceToPixel: 10 @ 10) closeTo: ((canvas extent / 2) + (10 @ 10))).

	self assert: (camera fromPixelToSpace: (canvas extent / 2)) = (0 @ 0).
	self assert: ((camera fromPixelToSpace: ((canvas extent / 2) + (10 @ 10))) closeTo: (10 @ 10)).
	
	camera
		translateTo: 5 @ -15; 
		scale: 2.
	
	self assert: (camera fromSpaceToPixel: 0 @ 0) = (canvas extent / 2 - (10 @ -30)).
	self assert: (camera fromSpaceToPixel: 10 @ 10) = ((canvas extent / 2) + (10 @ 50)).

	self assert: (camera fromPixelToSpace: (canvas extent / 2 - (10 @ -30))) = (0 @ 0).
	self assert: (camera fromPixelToSpace: ((canvas extent / 2) + (10 @ 50))) = (10 @ 10).
	
	camera
		translateTo: 21578 @ -1239;
		scale: 736.
		
	self assert:
		((camera fromPixelToSpace: (camera fromSpaceToPixel: 100 @ 100))
		closeTo: 100 @ 100).
			
	self assert:
		((camera fromSpaceToPixel: (camera fromPixelToSpace: 100 @ 100))
		closeTo: 100 @ 100)
]

{ #category : #focusing }
TRCameraTest >> testFocusingCenter [
	canvas addShape: (TREllipseShape new from: 50 @ 50 to: 100 @ 80).
	canvas camera focusOnCenter.
	self assert: canvas camera position = (75 @ 65)
]

{ #category : #tests }
TRCameraTest >> testInitialization [
	self assert: camera position = (0 @ 0)
]

{ #category : #visibility }
TRCameraTest >> testIsVisible [
	| c s |
	c := TRCanvas new.
	s := TREllipseShape new size: 50.
	c addShape: s.
	
	self assert: c extent equals: 500 @ 500.

	self assert: s position equals: 0 @ 0.
	self assert: s isVisible.
	
	"Outside the canvas"
	s translateTo: 600 @ 600.
	self deny: s isVisible.
	
	"Inside the canvas"
	s translateBy: -400 @ -400.
	self assert: s isVisible.
	
	"Inside the canvas"
	s translateTo: -200 @ -200.
	self assert: s isVisible.
	
	"Outside the canvas"
	s translateTo: -400 @ -400.
	self deny: s isVisible.
]

{ #category : #visibility }
TRCameraTest >> testIsVisibleWithCameraMoving [
	| c s |
	c := TRCanvas new.
	s := TREllipseShape new size: 50.
	c addShape: s.
	
	c camera translateBy: 200 @ 200.

	self assert: s position equals: 0 @ 0.
	self assert: s isVisible.
	
	"Outside the canvas"
	s translateBy: -100 @ -100.
	self deny: s isVisible.
	
]

{ #category : #callbacks }
TRCameraTest >> testScale [
	| callback t |
	callback := TRCameraScaleCallback new.
	t := 0.
	callback block: [ :newScale | t := t + 1 ].
	camera addCallback: callback.
	self assert: t equals: 0.
	
	camera scale: 0.5.
	self assert: t equals: 1.

	camera scale: 10.
	self assert: t equals: 2.
	
	camera scale: 11.
	self assert: t equals: 3.

]

{ #category : #callbacks }
TRCameraTest >> testTranslateBy [
	| callback t |
	callback := TRTranslationCallback new.
	t := 0.
	callback block: [ :o :step | t := t + 1 ].
	camera addCallback: callback.
	self assert: t equals: 0.
	
	camera translateBy: 5 @ 4.
	self assert: t equals: 1.

	camera translateBy: 5 @ 4.
	self assert: t equals: 2.
	
	camera translateTo: 15 @ 4.
	self assert: t equals: 3.

]

{ #category : #tests }
TRCameraTest >> testTranslation [
	camera translateTo: 5 @ 3.
	self assert: camera position = (5 @ 3).
	
	camera translateBy: 2 @ 4.
	self assert: camera position = (7 @ 7).
]
