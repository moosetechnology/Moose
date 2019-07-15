"
I am a utility class to hepl th layout process in RTTreeMapBuilder
"
Class {
	#name : #RTRectangleTreeMap,
	#superclass : #Rectangle,
	#instVars : [
		'currentSubrectangle',
		'subrectangles',
		'inset'
	],
	#category : #'Roassal2-Builder-TreeMap'
}

{ #category : #'instance initialization' }
RTRectangleTreeMap class >> fromContainerBounds: aRectangle withInset: anInteger [
	| treeRectangle relativeOrigin relativeCorner |
	treeRectangle := self new.
	treeRectangle inset: anInteger.
	relativeOrigin := aRectangle origin-(aRectangle extent/2).
	relativeCorner := aRectangle corner- (aRectangle extent /2).
	((aRectangle width < (anInteger * 2)) or: [ aRectangle height < (anInteger * 2) ])
		ifTrue: [ treeRectangle origin: relativeOrigin; corner: relativeCorner.]
		ifFalse: [ 
			treeRectangle origin: relativeOrigin +anInteger; 
			corner: relativeCorner -anInteger   ].
	^ treeRectangle 
]

{ #category : #accesing }
RTRectangleTreeMap >> addSubrectangle: aTreeRectangle [
	self subrectangles add: aTreeRectangle.
	self currentSubrectangle: aTreeRectangle.
]

{ #category : #utils }
RTRectangleTreeMap >> computeHorizontalRemainingSubrectangleFrom: row [

	| areaToLayout remainingSubrectangle currentRect currentOrigin |
	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e attributes at: #area) ].
	
	remainingSubrectangle := RTRectangleTreeMap new.
	
	currentRect := self currentSubrectangle.
	currentOrigin := currentRect origin.
	
	remainingSubrectangle origin: ((currentOrigin x + (areaToLayout / currentRect height)) @ currentOrigin y).
	remainingSubrectangle corner: currentRect corner.
	
	^ remainingSubrectangle.
	 
]

{ #category : #utils }
RTRectangleTreeMap >> computeRemainingSubrectangleFrom: row [
	(self currentSubrectangle isHorizontal)
		ifTrue: [^ self computeHorizontalRemainingSubrectangleFrom: row ]
		ifFalse: [ ^ self computeVerticalRemainingSubrectangleFrom: row ]
]

{ #category : #utils }
RTRectangleTreeMap >> computeVerticalRemainingSubrectangleFrom: row [

	| areaToLayout remainingSubrectangle currentRect currentOrigin |
	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e attributes at: #area) ].
	
	remainingSubrectangle := RTRectangleTreeMap new.
	
	currentRect := self currentSubrectangle.
	currentOrigin := currentRect origin.
	
	remainingSubrectangle origin: ((currentOrigin x) @ ((currentOrigin y) + (areaToLayout / currentRect width))).
	remainingSubrectangle corner: currentRect corner.
	
	^ remainingSubrectangle.
	 
]

{ #category : #accesing }
RTRectangleTreeMap >> corner: anObject [
	corner := anObject.
]

{ #category : #accesing }
RTRectangleTreeMap >> currentSubrectangle [
	^ currentSubrectangle ifNil: [ currentSubrectangle := self ]
]

{ #category : #accesing }
RTRectangleTreeMap >> currentSubrectangle: anObject [
	currentSubrectangle := anObject
]

{ #category : #initialization }
RTRectangleTreeMap >> initialize [
	super initialize.
	inset := 0.
]

{ #category : #accesing }
RTRectangleTreeMap >> inset [
	^ inset
]

{ #category : #accesing }
RTRectangleTreeMap >> inset: anObject [
	inset := anObject
]

{ #category : #testing }
RTRectangleTreeMap >> isHorizontal [

	^ (self width >= self height)
]

{ #category : #accesing }
RTRectangleTreeMap >> origin: anObject [
	origin := anObject
]

{ #category : #utils }
RTRectangleTreeMap >> shortestSide [

	^ self width min: self height
]

{ #category : #accesing }
RTRectangleTreeMap >> subrectangles [
	^ subrectangles ifNil: [subrectangles := OrderedCollection new].
]
