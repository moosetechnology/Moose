Class {
	#name : #RTResizeTest,
	#superclass : #RTTest,
	#instVars : [
		'elements',
		'resize'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTResizeTest >> setUp [
	super setUp.
	elements := (RTBox new height: #yourself; width: [ :o | o + 1 ]) elementsOn: (1 to: 3).
	resize := RTResize new.
	resize elements: elements.
]

{ #category : #tests }
RTResizeTest >> testBiggestElement [
	self assert: resize biggestElement equals: elements last.
	resize useBiggestElement.
	self assert: resize fixedElement equals: elements last.
]

{ #category : #tests }
RTResizeTest >> testBiggestExtent [
	self assert: resize biggestExtent equals: 4 @ 3
]

{ #category : #tests }
RTResizeTest >> testHighestElement [
	self assert: resize highestElement equals: elements last.

]

{ #category : #tests }
RTResizeTest >> testSameHeight [
	resize fixedElement: elements second.
	resize sameHeight.
	self assert: (elements collect: #extent) sorted asArray equals: (Array with: (2.0@2.0) with: (3.0@2.0) with: (4.0@2.0))
]

{ #category : #tests }
RTResizeTest >> testSameSize [
	resize fixedElement: elements second.
	resize sameSize.
	self assert: (elements collect: #extent) asSet asArray equals: (Array with: (3.0@2.0))
]

{ #category : #tests }
RTResizeTest >> testSameSizeWithoutFixedElement [
	resize sameSize.
	self assert: (elements collect: #extent) asSet asArray equals: (Array with: (4.0 @ 3.0))
]

{ #category : #tests }
RTResizeTest >> testSameWidth [
	resize fixedElement: elements second.
	resize sameWidth.
	self assert: (elements collect: #extent) sorted asArray equals: (Array with: (3.0@1.0) with:(3.0@2.0) with: (3.0@3.0))
]

{ #category : #tests }
RTResizeTest >> testWidestElement [
	self assert: resize widestElement equals: elements last.

]
