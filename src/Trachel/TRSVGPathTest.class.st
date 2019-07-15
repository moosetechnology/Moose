Class {
	#name : #TRSVGPathTest,
	#superclass : #TRTest,
	#category : #'Trachel-Tests'
}

{ #category : #tests }
TRSVGPathTest >> testColor [
	| path |
	path := TRSVGPath new.
	self assert: path color equals: Color black.
	
	path color: Color blue.
	self assert: path color equals: Color blue.
]

{ #category : #tests }
TRSVGPathTest >> testDefault [
	| path |
	path := TRSVGPath new.
	self assert: path height equals: 0.
	self assert: path width equals: 0.
]

{ #category : #tests }
TRSVGPathTest >> testReaderColombia [
	| path |
	path := TRSVGPath new.
	path path: 'm 578.3,497.2 1.2,-2.1 -1.3,-1.7 -2,-0.4 -2.9,3.1 -2.3,1.4 -4.6,3.2 -4.3,-0.5 -0.5,1.3 -3.6,0.1 -3.3,3 -1.4,5.4 -0.1,2.1 -2.4,0.7 -4.4,4.4 -2.9,-0.2 -0.7,0.9 1.1,3.8 -1.1,1.9 -1.8,-0.5 -0.9,3.1 2.2,3.4 0.6,5.4 -1.2,1.6 1.1,5.9 -1.2,3.7 2,1.5 -2.2,3.3 -2.5,4 -2.8,0.4 -1.4,2.3 0.2,3.2 -2.1,0.5 0.8,2 5.6,3.6 1,-0.1 1.4,2.7 4.7,0.9 1.6,-1 2.8,2.1 2.4,1.5 1.5,-0.6 3.7,3 1.8,3 2.7,1.7 3.4,6.7 4.2,0.8 3,-1.7 2.1,1.1 3.3,-0.6 4.4,3 -3.5,6.5 1.7,0.1 2.9,3.4 2.2,-17.4 0.1,-2.8 -0.9,-3.6 -2.5,-2.4 0,-4.6 3.2,-1 1.1,0.6 0.2,-2.4 -3.3,-0.7 0,-3.9 10.9,0.1 1.9,-2.2 1.6,2 1,3.8 1.1,-0.8 -1.7,-6.4 -1.4,-2.2 -2,-1.4 2.9,-3.1 -0.2,-1.5 -1.5,-1.9 -1,-4.2 0.5,-4.6 1.3,-2.1 1.2,-3.4 -2,-1.1 -3.2,0.7 -4,-0.3 -2.3,0.7 -3.8,-5.5 -3.2,-0.8 -7.2,0.6 -1.3,-2.2 -1.3,-0.6 -0.2,-1.3 0.8,-2.4 -0.4,-2.5 -1.1,-1.4 -0.6,-2.9 -2.9,-0.5 1.8,-3.7 0.9,-4.5 1.8,-2.4 2.2,-1.8 1.6,-3.2 3.7,-1.1 z'.
	self assert: path curves size > 2.
]
