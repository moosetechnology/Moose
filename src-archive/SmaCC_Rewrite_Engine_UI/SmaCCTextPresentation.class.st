Class {
	#name : #SmaCCTextPresentation,
	#superclass : #GLMRubricTextPresentation,
	#instVars : [
		'morph',
		'highlights'
	],
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #highlighting }
SmaCCTextPresentation >> addHighlight: aColor from: startIndex to: stopIndex [
	highlights isNil
		ifTrue: [ highlights := OrderedCollection new ].
	highlights add: (Array with: aColor with: startIndex with: stopIndex)
]

{ #category : #highlighting }
SmaCCTextPresentation >> buildHighlight: anArray into: aHighlightCollection [
	| paragraph from to |
	paragraph := morph paragraph.
	from := paragraph characterBlockForIndex: (anArray at: 2).
	to := paragraph characterBlockForIndex: anArray last.
	from textLine = to textLine
		ifTrue: [ aHighlightCollection
				add:
					(TextHighlightByBounds new
						color: anArray first;
						bounds: (from topLeft corner: to bottomRight)) ]
		ifFalse: [ aHighlightCollection
				add:
					(TextHighlightByBounds new
						color: anArray first;
						bounds: (from topLeft corner: from textLine bottomRight));
				add:
					(TextHighlightByBounds new
						fillWidth: true;
						color: anArray first;
						bounds: (from bottomLeft corner: to topRight));
				add:
					(TextHighlightByBounds new
						color: anArray first;
						bounds: (to textLine topLeft corner: to bottomRight)) ]
]

{ #category : #highlighting }
SmaCCTextPresentation >> clearHighlights [
	highlights := nil
]

{ #category : #copying }
SmaCCTextPresentation >> copy [
]

{ #category : #rendering }
SmaCCTextPresentation >> renderGlamorouslyOn: aRenderer [
	morph := super renderGlamorouslyOn: aRenderer.
	^ morph
]

{ #category : #highlighting }
SmaCCTextPresentation >> scrollToFirstHighlight [
	| paragraph from |
	(morph isNil or: [ highlights isNil or: [ highlights isEmpty ] ])
		ifTrue: [ ^ self ].
	paragraph := morph paragraph.
	from := paragraph characterBlockForIndex: (highlights first at: 2).
	morph scrollPane vScrollbarValue: (from textLine lineNumber - 1) / paragraph lines size
]

{ #category : #highlighting }
SmaCCTextPresentation >> updateHighlights [
	| hlghts |
	morph isNil
		ifTrue: [ ^ self ].
	(highlights isNil or: [ highlights isEmpty ])
		ifTrue: [ morph highlights: #() ]
		ifFalse: [ hlghts := OrderedCollection new.
			highlights do: [ :each | self buildHighlight: each into: hlghts ].
			morph highlights: hlghts ].
	morph changed
]

{ #category : #highlighting }
SmaCCTextPresentation >> updateHighlightsAndScroll [
	self updateHighlights.
	self scrollToFirstHighlight
]
