"
A TRBoxShapeTest is a test class for testing the behavior of TRBoxShape
"
Class {
	#name : #TRBoxShapeTest,
	#superclass : #TRTest,
	#instVars : [
		'box'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRBoxShapeTest >> setUp [
	super setUp.
	box := TRBoxShape new height: 30; width: 40.
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testBotomPosition [
	self assert: box bottomPosition equals: 0 @ 15
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testBottomPosition02 [
	box position: -10 @ -10.
	self assert: box bottomPosition equals: -10 @ 5
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testBottomosition03 [
	box bottomPosition: -10 @ -10.
	self assert: box bottomPosition equals: -10 @ -10.
	self assert: box position equals: -10 @ -25.
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testDefaultPosition [
	self assert: box position equals: 0 @ 0
]

{ #category : #'tests - extent' }
TRBoxShapeTest >> testExtent [
	self assert: box extent equals: 40 @ 30
]

{ #category : #'tests - extent' }
TRBoxShapeTest >> testExtent02 [
	box extent: 5 @ 10.
	self assert: box extent equals: 5 @ 10
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testLeftPosition [
	self assert: box leftPosition equals: -20 @ 0
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testLeftPosition02 [
	box position: -10 @ -10.
	self assert: box leftPosition equals: -30 @ -10
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testLeftPosition03 [
	box leftPosition: -10 @ -10.
	self assert: box leftPosition equals: -10 @ -10.
	self assert: box position equals: 10 @ -10.
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testRightPosition [
	self assert: box rightPosition equals: 20 @ 0
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testRightPosition02 [
	box position: -10 @ -10.
	self assert: box rightPosition equals: 10 @ -10
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testRightPosition03 [
	box rightPosition: -10 @ -10.
	self assert: box rightPosition equals: -10 @ -10.
	self assert: box position equals: -30 @ -10.
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testTopPosition [
	self assert: box topPosition equals: 0 @ -15
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testTopPosition02 [
	box position: -10 @ -10.
	self assert: box topPosition equals: -10 @ -25
]

{ #category : #'tests - position' }
TRBoxShapeTest >> testTopPosition03 [
	box topPosition: -10 @ -10.
	self assert: box topPosition equals: -10 @ -10.
	self assert: box position equals: -10 @ 5.
]
