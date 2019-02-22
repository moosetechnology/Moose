"
A RTHorizontalFlowLayout is a FlowLayout horizontaly arranged,  right queued at default.

"
Class {
	#name : #RTHorizontalFlowLayout,
	#superclass : #RTAbstractFlowLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTHorizontalFlowLayout >> doExecute: elements [ 
	| x y maxLastLineWidth nextElement maxNextLineWidth|
	x := self gapSize.
	y := self gapSize.
	maxLastLineWidth := 0.
	maxNextLineWidth := 0.
	
	elements do:
		[ :anElement | 
		
		(anElement = elements last) ifFalse:  [nextElement := (elements after: anElement)] ifTrue: [nextElement := anElement].
		
		self isAlignBottom ifTrue: [ 
			translator translate: anElement to: ((x @ y) + ((anElement width / -2) @ (anElement height / 2))).	
			y := y + anElement height + (self gapSize).
			((y > (self maxWidth rtValue: elements)) | ((y + nextElement height) > (self maxWidth rtValue: elements) ))ifTrue: 
				[ y := self gapSize.
				maxNextLineWidth := self maxNextLineWidthFrom: nextElement for: elements.
				x := x + (1 * self gapSize) + maxNextLineWidth.
				maxNextLineWidth := 0.
				maxLastLineWidth := 0.
				]
		].
	
	self isAlignCenter ifTrue: [ 
		translator translate: anElement to: ((x @ y) + (0 @ (anElement width / 2))).
			y := y + anElement height + (self gapSize).
			maxLastLineWidth := maxLastLineWidth max: (anElement width).
			((y > (self maxWidth rtValue: elements)) | ((y + nextElement height) > (self maxWidth rtValue: elements) ))ifTrue: 
				[ y := self gapSize.
				maxNextLineWidth := self maxNextLineWidthFrom: nextElement for: elements.
				x := x + (self gapSize) + (maxNextLineWidth /2) + (maxLastLineWidth /2).
				maxNextLineWidth := 0.
				maxLastLineWidth := 0.
				]
			].	
			
		self isAlignTop ifTrue: [ 
			translator translateTopLeftOf: anElement to: x @ y.
			y := y + anElement height + (self gapSize).
			maxLastLineWidth := maxLastLineWidth max: (anElement width ).
			((y > (self maxWidth rtValue: elements)) | ((y + nextElement height) > (self maxWidth rtValue: elements) ))ifTrue: 
				[ y := self gapSize.
				x := x + (self gapSize) + maxLastLineWidth.
				maxLastLineWidth := 0 ] 
			].
		].
]

{ #category : #'initialize-release' }
RTHorizontalFlowLayout >> initialize [
	super initialize.
	self alignTop.
]

{ #category : #utility }
RTHorizontalFlowLayout >> maxNextLineWidthFrom: ele for: elements [
	| nextLineY maxNextLineWidth anElement |
	anElement := ele.
	maxNextLineWidth := 0.
	nextLineY := self gapSize.
	[ nextLineY < (self maxWidth rtValue: elements) ] whileTrue: [
		nextLineY := nextLineY + (self gapSize) + (anElement height).
		maxNextLineWidth := maxNextLineWidth max: (anElement width).	
		(anElement = elements last) ifFalse:  [anElement := (elements after: anElement)]
		].
	^ maxNextLineWidth
]
