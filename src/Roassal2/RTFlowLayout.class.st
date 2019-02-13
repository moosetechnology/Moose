"
A RTFlowLayout arrange elements in a rectangle including space (gapSize) between them, ideally it give you a square if all elements have an equal height and width .

"
Class {
	#name : #RTFlowLayout,
	#superclass : #RTAbstractFlowLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTFlowLayout >> doExecute: elements [ 
	| x y maxLastLineHeight maxNextLineHeight  nextElement |
	
	x := self gapSize.
	y := self gapSize.
	maxLastLineHeight := 0.
	maxNextLineHeight := 0.
	nextElement := elements first.
	
 	elements do:
		[ :anElement | 
		(anElement = elements last) ifFalse:  [nextElement := (elements after: anElement)] ifTrue: [nextElement := anElement].	

		self isAlignBottom ifTrue: [ 
			translator translateBottomLeftOf: anElement to: x @ y.
			x := x + anElement width + (self gapSize).
			((x > (self maxWidth rtValue: elements)) | ((x + nextElement width) > (self maxWidth rtValue: elements) )) ifTrue:
				[ x := self gapSize.
				maxNextLineHeight := self maxNextLineHeightFrom: nextElement for: elements.
				y := y + (self gapSize) + maxNextLineHeight.
				maxNextLineHeight := 0.
				]
			].
		
		self isAlignCenter ifTrue: [ 
			translator translateCenterLeftOf: anElement to: x @ y.
					
			x := x + (anElement width) +(self gapSize).
			maxLastLineHeight := maxLastLineHeight max: (anElement height).
			((x > (self maxWidth rtValue: elements)) | ((x + nextElement width) > (self maxWidth rtValue: elements) )) ifTrue: 
				[ x := self gapSize.
				maxNextLineHeight := self maxNextLineHeightFrom: nextElement for: elements.
				y := y + (self gapSize) + (maxNextLineHeight / 2) + (maxLastLineHeight / 2).
				maxNextLineHeight := 0.
				maxLastLineHeight := 0.
				]
			].
		
		self isAlignTop ifTrue: [ 
			translator translateTopLeftOf: anElement to: (x @ y).
			x := x + anElement width + (self gapSize).
			maxLastLineHeight := maxLastLineHeight max: (anElement height ).
			( (x > (self maxWidth rtValue: elements)) | ((x + nextElement width) > (self maxWidth rtValue: elements) ))ifTrue: 
				[ x := self gapSize.
				y := y + (self gapSize) + maxLastLineHeight.
				maxLastLineHeight := 0. 
				]
		] 
	]
]

{ #category : #'initialize-release' }
RTFlowLayout >> initialize [
	super initialize.
	self alignTop.
]

{ #category : #utility }
RTFlowLayout >> maxNextLineHeightFrom: ele for: elements [
	| nextLineX maxNextLineHeight anElement |
	maxNextLineHeight := 0.
	nextLineX := self gapSize.
	anElement := ele.
	[ nextLineX < (self maxWidth rtValue: elements) ] whileTrue: [
		nextLineX := nextLineX + (self gapSize) + (anElement width).
		maxNextLineHeight := maxNextLineHeight max: (anElement height).	
		(anElement = elements last) ifFalse:  [anElement := (elements after: anElement) ].
		].
	^ maxNextLineHeight
				
]
