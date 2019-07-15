"
A TREllipseShapeTest is a test class for testing the behavior of TREllipseShape
"
Class {
	#name : #TREllipseShapeTest,
	#superclass : #TRTest,
	#category : #'Trachel-Tests'
}

{ #category : #tests }
TREllipseShapeTest >> testStrokeWidth [
	self assert: TREllipseShape new strokeWidth equals: TREllipseShape new defaultStrokeWidth.
]

{ #category : #tests }
TREllipseShapeTest >> testStrokeWidth02 [
	self assert: TREllipseShape new defaultStrokeWidth equals: 1.

]

{ #category : #tests }
TREllipseShapeTest >> testWidth [

	| s |
	s := TREllipseShape new size: 30.
	self assert: s strokeWidth equals: 1.
]
