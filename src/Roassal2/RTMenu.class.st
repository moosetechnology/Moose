Class {
	#name : #RTMenu,
	#superclass : #Object,
	#instVars : [
		'view',
		'items',
		'isOpen',
		'color',
		'labelBackground',
		'label',
		'savedLabelBackgroundColor',
		'menuBackgroundColor',
		'menuBackground',
		'highlightColor',
		'isLocked'
	],
	#category : #'Roassal2-Builder-Menu'
}

{ #category : #adding }
RTMenu >> add: menuitem [
	self items add: menuitem.
]

{ #category : #accessing }
RTMenu >> buttonLabelBackgroundShapeAndColor: aColor [
	| box |
	
	box := TRBoxShape new extent: label encompassingRectangle extent + (10@7).
	self labelBackground: box.
	box color: aColor.
	self saveLabelBackgroundColor.
	box strokePaint: "(Color black)"nil.
	TRConstraint move: box onTheCenterOf: label.

	view canvas addFixedShape: box.
	box pushBack.
]

{ #category : #accessing }
RTMenu >> color [
	^ color
]

{ #category : #accessing }
RTMenu >> color: aColor [
	color:= aColor
]

{ #category : #accessing }
RTMenu >> endHighlight [
	self labelBackgroundColor: self savedLabelBackgroundColor.
	self label color: Color black.
]

{ #category : #accessing }
RTMenu >> executeHighlight [
	self labelBackgroundColor: self highlightColor.
]

{ #category : #accessing }
RTMenu >> executeLockHighlight [
	self labelBackgroundColor: (self highlightColor alpha: ((self highlightColor alpha) + 0.3)).
]

{ #category : #accessing }
RTMenu >> executeTextHighlight [
	self label color: Color blue.
]

{ #category : #'hide entries' }
RTMenu >> hideAll [
	view canvas fixedShapes do: [ :s |
		
		(s element isKindOf: RTMenu) ifTrue: [ s element hideItems ]. ]
]

{ #category : #'hide entries' }
RTMenu >> hideItems [
	self isOpen ifFalse: [ ^ self ].
	self isOpen: false.
	self isLocked: false.
	self items do: [:item |
		item rawmenu remove].
	menuBackground remove.
	self endHighlight.	
]

{ #category : #accessing }
RTMenu >> highlightColor [
	^ highlightColor
]

{ #category : #accessing }
RTMenu >> highlightColor: aColor [
	highlightColor := aColor.
]

{ #category : #initialization }
RTMenu >> initialize [
	super initialize.
	color := Color gray darker alpha: 0.3.
	view := nil.
	isOpen := false.
	isLocked := false.
	savedLabelBackgroundColor := color.

]

{ #category : #accessing }
RTMenu >> isLocked [
	^ isLocked
]

{ #category : #accessing }
RTMenu >> isLocked: abool [
	isLocked := abool
]

{ #category : #accessing }
RTMenu >> isOpen [
	^ isOpen
]

{ #category : #accessing }
RTMenu >> isOpen: abool [
	isOpen := abool
]

{ #category : #accessing }
RTMenu >> items [
	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #adding }
RTMenu >> label [
	^ label
]

{ #category : #adding }
RTMenu >> label: aLabel [
	label := aLabel.
]

{ #category : #accessing }
RTMenu >> labelBackground [
	 ^ labelBackground
]

{ #category : #accessing }
RTMenu >> labelBackground: aShape [
	labelBackground := aShape
]

{ #category : #accessing }
RTMenu >> labelBackgroundColor [
	^ labelBackground color
]

{ #category : #accessing }
RTMenu >> labelBackgroundColor: aColor [
	labelBackground color: aColor.

]

{ #category : #accessing }
RTMenu >> menuBackground [
	^ menuBackground 
]

{ #category : #accessing }
RTMenu >> menuBackground: aShape [
	menuBackground :=  aShape
]

{ #category : #accessing }
RTMenu >> menuBackgroundColor [
	^ menuBackgroundColor 
]

{ #category : #accessing }
RTMenu >> menuBackgroundColor: aColor [
	menuBackgroundColor := aColor 
]

{ #category : #accessing }
RTMenu >> menuLabelBackgroundShapeAndColor: aColor [
	| box form |
	
	box := TRBoxShape new extent: label encompassingRectangle extent + (20@7).
	self labelBackground: box.
	box color: aColor.
	self saveLabelBackgroundColor.
	box strokePaint: "(Color black)"nil.
	TRConstraint move: box onTheCenterOf: label.
	form := TRPolygonShape new color: Color black; vertices: (Array with: 0@0 with: 6@0 with: 3@6).
	form strokePaint: (Color black).
	TRConstraint move: form onTheRightOf: box.
	
	view canvas addFixedShape: form.
	form translateBy: (-12)@(2).
	label translateBy: (-5)@(0).
	view canvas addFixedShape: box.
	form pushBack.
	box pushBack.
]

{ #category : #accessing }
RTMenu >> saveLabelBackgroundColor [
	savedLabelBackgroundColor :=  self labelBackground color. 
]

{ #category : #accessing }
RTMenu >> savedLabelBackgroundColor [
	^ savedLabelBackgroundColor. 
]

{ #category : #accessing }
RTMenu >> update [
|pos1 pos2 maxWidth parentMenu y |
		
	parentMenu := view canvas fixedShapes select: [ :t | t class == TRLabelShape and: [ t text = label text ] ].
	parentMenu := parentMenu first.
	
	y := 0.
	maxWidth := items ifNotEmpty: [(items collect: [ :item | item rawmenu width]) max] ifEmpty: [0].
	pos1:= parentMenu position + ((((parentMenu width)/2 + 5)negated)@((parentMenu height)/2+3.4)).
	items do: [ :item | y := y + (item rawmenu height).].
	pos2:= pos1 + ((maxWidth+20)@(y + 5)).
	self menuBackground: (TRBoxShape new from: pos1 to: pos2; color: (self menuBackgroundColor); strokePaint: nil"(Color gray darker alpha: 0.3)").
	
	view canvas addFixedShape: (self menuBackground).
	(self menuBackground) pushBack.
	^ (self menuBackground). 
]

{ #category : #accessing }
RTMenu >> view: v [
	view := v
]
