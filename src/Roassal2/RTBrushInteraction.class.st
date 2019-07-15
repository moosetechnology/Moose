"
I am a interaction that adds a new elastic box to the view
this box allows you to select a group of elements and highlight them with a color. And define what kind of elements you want to unhighlight.


"
Class {
	#name : #RTBrushInteraction,
	#superclass : #RTAbstractElasticBoxInteraction,
	#instVars : [
		'dragging',
		'groups',
		'condition',
		'domainElements',
		'highlightColor',
		'unhighlightColor'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #util }
RTBrushInteraction >> brush: aGroup [
	| others |
	aGroup ifEmpty: [ ^ self ].
	others := self domainElements.
	others ifNil: [ others := aGroup view elements ].
	others := others select: [ :e | (aGroup includes: e) not ].
	others do: [:e | RTBlink highlight: e 
		color: (self unhighlightColor rtValue: e) ].
	aGroup do: [:e | RTBlink highlight: e 
		color: (self highlightColor rtValue: e) ].
]

{ #category : #util }
RTBrushInteraction >> createShapeForView [
	| s block g |
	s := super createShapeForView.
	s @ RTDraggable.
	s @ RTResizable.
	block := [ g := self getElementsWith: s.
		g removeAllFoundIn: groups.
		self removeSelection: view elements.
		g := condition rtValue: g.
		self brush: g ].
	s addCallback: (TRTranslationCallback new block: block).
	s addCallback: (TRExtentCallback new block: block).
	^ s
]

{ #category : #accessing }
RTBrushInteraction >> domainElements [
	^ domainElements
]

{ #category : #accessing }
RTBrushInteraction >> domainElements: someElements [
	domainElements := someElements.
]

{ #category : #accessing }
RTBrushInteraction >> elementsToBrush: aBlock [
	condition := aBlock
]

{ #category : #util }
RTBrushInteraction >> getElementsWith: s [
	| g r |
	g := RTGroup new. 
	r := s encompassingRectangle.
	view elements do: [ :e | 
		((e ~= s) and: [ e trachelShape encompassingRectangle intersects: r ])
			ifTrue: [ g add: e. ] ].
	^ g
]

{ #category : #accessing }
RTBrushInteraction >> groups: aCollection [
	groups := aCollection 
]

{ #category : #accessing }
RTBrushInteraction >> highlightColor [
	^ highlightColor
]

{ #category : #accessing }
RTBrushInteraction >> highlightColor: aColor [
	highlightColor := aColor.
]

{ #category : #initialization }
RTBrushInteraction >> initialize [
	super initialize.
	self highlightColor: [ :e | e trachelShape color ].
	self unhighlightColor: Color veryVeryLightGray trans.
]

{ #category : #initialization }
RTBrushInteraction >> initializeElement: aView [
	| b |
	super initializeElement: aView.
	b := [ :evt | 
		super removeShape.
		self removeSelection: view elements ].
	
	self when: RTSelectionStart do: b. 
	aView when: TRMouseClick do: b.
]

{ #category : #removing }
RTBrushInteraction >> removeSelection: aGroup [
	aGroup do: [:e | RTBlink unhighlight: e ].

]

{ #category : #removing }
RTBrushInteraction >> removeShape [
	
]

{ #category : #accessing }
RTBrushInteraction >> unhighlightColor [
	^ unhighlightColor
]

{ #category : #accessing }
RTBrushInteraction >> unhighlightColor: aColor [
	unhighlightColor := aColor
]
