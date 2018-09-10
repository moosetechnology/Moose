"
A ROConstraintTest is xxxxxxxxx.

Instance Variables
	element1:		<Object>
	element2:		<Object>
	view:		<Object>

element1
	- xxxxx

element2
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #TRConstraintTest,
	#superclass : #TRTest,
	#instVars : [
		'element1',
		'element2',
		'view',
		'canvas',
		'shape1',
		'shape2',
		'originShape',
		'conformingShape'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRConstraintTest >> setUp [
	super setUp.
	canvas := TRCanvas new.
	shape1 := TRBoxShape new size: 50.
	shape2 := TRBoxShape new size: 10.
	canvas addShape: shape1.
	canvas addShape: shape2.
	
	(originShape := TRBoxShape new) extent: 10 @ 10.
	(conformingShape := TRBoxShape new) extent: 20 @ 20
]

{ #category : #aligning }
TRConstraintTest >> testAlignFromBottom [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	"TRConstraint alignFromBottom: (Array with: shape1 with: shape2)."
	RTAlignment new elements: (Array with: shape1 with: shape2); bottom.
	self assert: shape1 position equals: 0 @ -20.
	self assert: shape2 position equals: 0 @ 0.
]

{ #category : #aligning }
TRConstraintTest >> testAlignFromLeft [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	RTAlignment new elements: (Array with: shape1 with: shape2); left.
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: -20 @ 0.
]

{ #category : #aligning }
TRConstraintTest >> testAlignFromRight [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	RTAlignment new elements: (Array with: shape1 with: shape2); right. 
	"TRConstraint alignFromRight: (Array with: shape1 with: shape2)."
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: 20 @ 0.
]

{ #category : #aligning }
TRConstraintTest >> testAlignFromTop [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	self debug: #testAlignFromTop
	"
	"TRConstraint alignFromTop: (Array with: shape1 with: shape2)."
	RTAlignment new elements: (Array with: shape1 with: shape2); top.
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: 0 @ -20.
]

{ #category : #resizing }
TRConstraintTest >> testChangingExtent [
	
	TRConstraint changeExtentOf: conformingShape like: originShape plus: 5 @ -5.
	self assert: conformingShape extent = (15 @ 5).
	self assert: originShape extent = (10 @ 10).
	
	originShape extent: 0 @ 0.
	self assert: conformingShape extent = (15 @ 5).
	
	TRConstraint changeExtentOf: conformingShape like: originShape plus: 0 @ 0.
	self assert: conformingShape extent = (0 @ 0)
]

{ #category : #resizing }
TRConstraintTest >> testKeepingExtent [
	originShape extent: 10 @ 10.
	conformingShape extent: 20 @ 20.
	TRConstraint keepExtentOf: conformingShape like: originShape plus: 5 @ -5.
	self assert: conformingShape extent = (15 @ 5).
	self assert: originShape extent = (10 @ 10).
	originShape extent: 0 @ 5.
	self assert: conformingShape extent = (5 @ 0)
]

{ #category : #resizing }
TRConstraintTest >> testResizingHeight [

	self assert: shape1 height equals: 50.
	self assert: shape2 height equals: 10.
	
	TRConstraint useHeightOf: shape1 for: (Array with: shape2).

	self assert: shape1 height equals: 50.
	self assert: shape2 height equals: 50.

]

{ #category : #resizing }
TRConstraintTest >> testResizingToMaxHeight [

	self assert: shape1 height equals: 50.
	self assert: shape2 height equals: 10.
	
	TRConstraint setAllToMaxHeight: (Array with: shape2 with: shape1).

	self assert: shape1 height equals: 50.
	self assert: shape2 height equals: 50.

]

{ #category : #resizing }
TRConstraintTest >> testResizingToMaxWidth [

	self assert: shape1 width equals: 50.
	self assert: shape2 width equals: 10.
	
	TRConstraint setAllToMaxWidth: (Array with: shape2 with: shape1).

	self assert: shape1 width equals: 50.
	self assert: shape2 width equals: 50.

]

{ #category : #resizing }
TRConstraintTest >> testResizingWidth [

	self assert: shape1 width equals: 50.
	self assert: shape2 width equals: 10.
	
	TRConstraint useWidthOf: shape1 for: (Array with: shape2).

	self assert: shape1 width equals: 50.
	self assert: shape2 width equals: 50.

]

{ #category : #sticking }
TRConstraintTest >> testStickAbove [

	TRConstraint stick: shape2 above: shape1.
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ -30).
	
	shape1 translateBy: 10 @ 10.
	self assert: shape1 center = (10 @ 10).
	self assert: shape2 center = (10 @ -20).

]

{ #category : #sticking }
TRConstraintTest >> testStickBelow [

	TRConstraint stick: shape2 below: shape1.
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ 30).

	shape1 translateBy: 10 @ 10.
	self assert: shape1 center = (10 @ 10).
	self assert: shape2 center = (10 @ 40).

]

{ #category : #sticking }
TRConstraintTest >> testStickToTheCenter [

	TRConstraint 
		stick: shape1 onTheCenterOf: shape2.
		
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ 0).

	shape2 translateBy: 10 @ 15.
	self assert: shape1 center = (10 @ 15).
	self assert: shape2 center = (10 @ 15).

]

{ #category : #aligning }
TRConstraintTest >> testUseAlignFromBottom [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	TRConstraint use: shape1 alignFromBottom: (Array with: shape1 with: shape2).
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: 0 @ 20.
]

{ #category : #aligning }
TRConstraintTest >> testUseAlignFromLeft [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	TRConstraint use: shape1 alignFromLeft: (Array with: shape1 with: shape2).
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: -20 @ 0.
]

{ #category : #aligning }
TRConstraintTest >> testUseAlignFromRight [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	TRConstraint use: shape1 alignFromRight: (Array with: shape1 with: shape2).
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: 20 @ 0.
]

{ #category : #aligning }
TRConstraintTest >> testUseAlignFromTop [
	"
	TRCanvas new addShape: shape1; addShape: shape2; yourself
	"
	TRConstraint use: shape1 alignFromTop: (Array with: shape1 with: shape2).
	self assert: shape1 position equals: 0 @ 0.
	self assert: shape2 position equals: 0 @ -20.
]
