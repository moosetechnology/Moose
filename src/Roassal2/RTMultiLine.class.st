"
A RTMultiLine represents 

Instance Variables
	blockProducingPath:		<Block>   a two arg block that produces the path. The block has to return the collection of points

blockProducingPath
	- xxxxx

"
Class {
	#name : #RTMultiLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'blockProducingPath'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTMultiLine >> block: aTwoArgBlock [

	blockProducingPath := aTwoArgBlock 
]

{ #category : #initialization }
RTMultiLine >> initialize [
	super initialize.
	self straight
]

{ #category : #'public - configuration' }
RTMultiLine >> orthoHorizontal [
	self orthoHorizontalBalanceTo: 0.5
]

{ #category : #'public - configuration' }
RTMultiLine >> orthoHorizontalBalanceTo: balance [
	"0 = level of fromPoint
	 0.5 = middle
	 1 = level of toPoint"

	self
		block: [ :fromPoint :toPoint | 
			| midx |
			midx := toPoint x * balance + (fromPoint x * (1 - balance)).
			Array
				with: fromPoint
				with: midx @ fromPoint y
				with: midx @ toPoint y
				with: toPoint ]
]

{ #category : #'public - configuration' }
RTMultiLine >> orthoVertical [
	self orthoVerticalBalanceTo: 0.5
]

{ #category : #'public - configuration' }
RTMultiLine >> orthoVerticalBalanceTo: balance [
	"0 = level of fromPoint
	 0.5 = middle
	 1 = level of toPoint"

	self
		block: [ :fromPoint :toPoint | 
			| midy |
			midy := toPoint y * balance + (fromPoint y * (1 - balance)).
			Array
				with: fromPoint
				with: fromPoint x @ midy
				with: toPoint x @ midy
				with: toPoint ]
]

{ #category : #'public - configuration' }
RTMultiLine >> straight [
	"A straight line"
	self block: [ :fromPoint :toPoint | Array with: fromPoint with: toPoint ]
]

{ #category : #public }
RTMultiLine >> trachelShapeFor: anEdge [
	| shape multiShape col fromPoint toPoint path |
	col := self colorFor: anEdge.
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	path := blockProducingPath value: fromPoint value: toPoint.
	
	multiShape := TRCompositeShape new.
	2 to: path size do: [ :i |
		shape := TRLineShape new.
		shape width: (self widthFor: anEdge).
		shape from: (path at: i - 1) to: (path at: i).
		shape color: col.

		multiShape addShape: shape.
	].
	^ multiShape
]

{ #category : #public }
RTMultiLine >> updateFor: anEdge trachelShape: trachelShape [

	| shape col fromPoint toPoint path |
	col := self colorFor: anEdge.
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	path := blockProducingPath value: fromPoint value: toPoint.
	
	2 to: path size do: [ :i |
		shape := trachelShape shapes at: i - 1.
		shape width: (self widthFor: anEdge).
		shape from: (path at: i - 1) to: (path at: i).
		shape color: col.
	].
	^ trachelShape
]
