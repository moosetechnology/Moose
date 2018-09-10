Class {
	#name : #TRCallbackTest,
	#superclass : #TRTest,
	#instVars : [
		'canvas',
		'circle1',
		'circle2',
		'rectangle1'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRCallbackTest >> setUp [
	super setUp.
	canvas := TRCanvas new.
	rectangle1 := (20@20) corner: 150@100.
	circle1 := canvas buildCircleFrom: rectangle1 origin 
							to: rectangle1 corner color: (Color green alpha: 0.1).
	circle2 := canvas buildCircleFrom: 200 @ 200 to: 240 @ 230 color: (Color blue alpha: 0.1).	
]

{ #category : #tests }
TRCallbackTest >> testAllCallbacks [
	| counter1 callbacks |
	counter1 := 0.
	callbacks := TRCallback allSubclasses collect: #new.
	callbacks do: [ :eachCallback | 
		eachCallback block: [ counter1 := counter1 + 1 ].
		circle1 addCallback: eachCallback ].
	circle1 
		translateTo: 20 @ 30;
		extent: 10 @ 10.
	self assert: counter1 equals: 2.
	"just to check there is no error."
]

{ #category : #tests }
TRCallbackTest >> testExtentCallback [
	| callback v s newExtent |
	callback := TRExtentCallback 
						block: [ :shape :ratio | 
									v := shape. s := ratio ].
	circle1 addCallback: callback.

	self assert: circle1 extent equals: rectangle1 extent.
	newExtent := 5 @ 5.
	circle1 extent: newExtent.
	self assert: v == circle1.
	self assert: v extent equals: newExtent.
	self assert: s equals: newExtent / rectangle1 extent.

]

{ #category : #tests }
TRCallbackTest >> testExtentCallbackWith0 [

	| s callback |
	s := TRBoxShape new size: 0.
	callback := TRExtentCallback new shape: s newExtent: 5 @ 5 oldExtent: 0 @ 0.
	
]

{ #category : #tests }
TRCallbackTest >> testHasCallBack [

	self deny: TREllipseShape new hasCallback.
	self assert: (TREllipseShape new addCallback: TRTranslationCallback new) hasCallback
]

{ #category : #tests }
TRCallbackTest >> testTranslationCallback [
	| callback v s  |
	callback := TRTranslationCallback 
						block: [ :shape :step | 
									v := shape. s := step ].
	circle1 addCallback: callback.

	self assert: circle1 position = rectangle1 center.
	circle1 translateTo: 20 @ 30.
	self assert: v == circle1.
	self assert: v center = (20 @ 30).
	self assert: s = ((20 @ 30) - rectangle1 center).

	v := nil.
	circle1 translateBy: 5 @ 3.
	self assert: v == circle1.
	self assert: v center = (25 @ 33).
	self assert: s = (5 @ 3).
	
]
