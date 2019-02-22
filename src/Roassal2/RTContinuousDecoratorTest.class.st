"
A RTContinuousDecoratorTest is a test class for testing the behavior of RTContinuousDecorator
"
Class {
	#name : #RTContinuousDecoratorTest,
	#superclass : #TestCase,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTContinuousDecoratorTest >> testBasic [
	| b d1 |
	b := RTGrapher new.
	d1 := RTData new.
	d1 points: #(1 2 3 4).
	
	b add: d1.
	b addDecorator: (RTContinuousDecorator new).
	b build.
]

{ #category : #tests }
RTContinuousDecoratorTest >> testCalculatePoint [
	| b d1 deco |
	b := RTGrapher new.
	d1 := RTData new.
	d1 points: #(1 2 3 4).
	
	b add: d1.
	b build.
	deco := RTContinuousDecorator new.
	b addDecorator: deco.
	self assert: (deco calculatePointFor: d1 and: 1.2) equals: 1@1.
	self assert: (deco calculatePointFor: d1 and: 1.7) equals: 2@2.
	self assert: (deco calculatePointFor: d1 and: 3) equals: 3@3.
	self assert: (deco calculatePointFor: d1 and: 4) equals: 4@4.
	
	deco pointFor: [ :ds :x | 100@100 ].
	self assert: (deco calculatePointFor: d1 and: 3) equals: 100@100.
	
	
]

{ #category : #tests }
RTContinuousDecoratorTest >> testCalculatePoint2 [
	| b d1 deco |
	b := RTGrapher new.
	d1 := RTData new.
	d1 points: (Array with: -5@2 with: -3@4 with: 0@1 with: 5@7).
	d1 x: #x.
	d1 y: #y.
	
	b add: d1.
	b build.
	deco := RTContinuousDecorator new.
	b addDecorator: deco.
	
	self assert: (deco calculatePointFor: d1 and: -4.9) equals: -5@2.
	"self halt."
	self assert: (deco calculatePointFor: d1 and: -1) equals: 0@1.
	self assert: (deco calculatePointFor: d1 and: 4.5) equals: 5@7.
	self assert: (deco calculatePointFor: d1 and: 5) equals: 5@7.
	
	deco pointFor: [ :ds :x | 100@100 ].
	self assert: (deco calculatePointFor: d1 and: 3) equals: 100@100.
	
	
]

{ #category : #tests }
RTContinuousDecoratorTest >> testLegendLabel [
	| b d1 deco |
	b := RTGrapher new.
	d1 := RTData new.
	d1 points: #(1 2 3 4).
	
	b add: d1.
	deco := RTContinuousDecorator new.
	deco legendLabel text: 'Test'.
	b addDecorator: deco.
	b build.
]

{ #category : #tests }
RTContinuousDecoratorTest >> testTitle [
	| b d1 |
	b := RTGrapher new.
	d1 := RTData new.
	d1 points: #(1 2 3 4).
	
	b add: d1.
	b addDecorator: (RTContinuousDecorator new
		title: [:x | 'Test', x asString] ).
	b build.
]
