"
A layout that packs rectangles in as amall space as possible (at least it tries to)

Instance Variables
	padding:	<Number>
	freeSpace:	<Set of Rectamgles>
	bounds:	<Point>

gap
	- gap between elements defined as ""percentage"" of average size. 0.2 means 20%

freeSpace
	- collection of spaces that can be used for next element insertion
	
bounds
	- bounding box of all currently processed elements

"
Class {
	#name : #RTRectanglePackLayout,
	#superclass : #RTLayout,
	#instVars : [
		'freeSpace',
		'gap',
		'padding',
		'bounds'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #'space-calculation' }
RTRectanglePackLayout >> bestSpaceFor: anElement [
	| elementsPadedBox suitableSpaces |
	
	elementsPadedBox := anElement encompassingRectangle extendBy: padding * 2.
	
	suitableSpaces := freeSpace select: [ :space |
		elementsPadedBox width <= space width and:
			[ elementsPadedBox height <= space height ] ].
	
	^ suitableSpaces
		fold: [ :best :current |
			| bestExt currentExt | 
			((currentExt := self extentByInserting: elementsPadedBox into: current) <
			(bestExt := self extentByInserting: elementsPadedBox  into: best) or: [ 
				currentExt = bestExt and: [
					current halfPerimeter < best halfPerimeter ] ])
						ifTrue: [ current ]
						ifFalse: [ best ] ]
]

{ #category : #accessing }
RTRectanglePackLayout >> boundingBox [
	^ bounds
]

{ #category : #hook }
RTRectanglePackLayout >> doExecute: elements [
	| sortedElements maxSpace |
	bounds := 0@0.
	
	maxSpace := elements inject: 0@0 into: [ :sum :el |
			sum + el extent ].
		
	padding := maxSpace / elements size * gap / 2.
	
	maxSpace := 1 + gap * maxSpace.
	
	freeSpace := Set new.
	freeSpace add: (0@0 corner: maxSpace).
	
	sortedElements := SortedCollection sortBlock:  [ :larger :smaller |
		larger  encompassingRectangle halfPerimeter >
		smaller encompassingRectangle halfPerimeter ].
	sortedElements addAll: elements.
	
	sortedElements size <= 2 ifTrue: [ 
		RTHorizontalLineLayout on: sortedElements.
		^ self
	].
	sortedElements
		do: [ :element | self packIn: element ]
		displayingProgress: 'Laying out elements'
]

{ #category : #'space-calculation' }
RTRectanglePackLayout >> extentByInserting: aRectangle into: aSpace [
	| futureCorner |
	futureCorner := aSpace origin + aRectangle extent.
	
	^	(((futureCorner x - bounds x) max: 0) +
		((futureCorner y - bounds y) max: 0))
		* "this is balancing magic"
		(((futureCorner max: bounds) degrees - 45) abs / 45 + 1)

]

{ #category : #accessing }
RTRectanglePackLayout >> gap [
	"gap between elements defined as ''percentage'' of average size. 0.2 means 20%"
	^ gap
]

{ #category : #accessing }
RTRectanglePackLayout >> gap: anObject [
	gap := anObject
]

{ #category : #'initialize-release' }
RTRectanglePackLayout >> initialize [
	super initialize.
	gap := 0.2
]

{ #category : #execution }
RTRectanglePackLayout >> packIn: anElement [
	translator translateTopLeftOf: anElement to: (self bestSpaceFor: anElement) origin + padding.
	bounds := bounds max: anElement encompassingRectangle bottomRight + padding.
	
	self recalculateFreeSpacesWith: anElement
]

{ #category : #deprecated }
RTRectanglePackLayout >> padding [
	self deprecated: 'Use gap instead'.
	^ self gap
]

{ #category : #deprecated }
RTRectanglePackLayout >> padding: anObject [
	self deprecated: 'Use gap: instead'.
	self gap: anObject
]

{ #category : #'space-calculation' }
RTRectanglePackLayout >> recalculateFreeSpacesWith: anElement [
	freeSpace := freeSpace inject: Set new into: [ :set :space |
		 set
			addAll: (space areasOverlapingOutside:
				(anElement encompassingRectangle expandBy: padding)); 
			yourself ].
		
	"remove subspaces"
	freeSpace := freeSpace reject: [ :subspace | 
		freeSpace anySatisfy: [ :space |
			space ~~ subspace and: [ 
				space containsRect: subspace ] ] ]
	
]
