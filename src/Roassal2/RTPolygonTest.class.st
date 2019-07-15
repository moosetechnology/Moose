Class {
	#name : #RTPolygonTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTPolygonTest >> testBasic [ 
	RTView new add: RTPolygon element.
]

{ #category : #tests }
RTPolygonTest >> testBasic02 [
	RTView new add: (RTPolygon new vertices: (Array with: 0 @ 0 with: 50 @ 50 with: 25 @ 75)) element.
]

{ #category : #tests }
RTPolygonTest >> testBasic03 [
	self assert: (RTPolygon new verticesFor: RTElement new) isEmpty
]
