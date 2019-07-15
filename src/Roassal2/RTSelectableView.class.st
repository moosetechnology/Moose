"
I am an iteraction for a RTView to select elements
the default RTSelectableView provides a box shape to select the shapes in a view.

b := RTMondrian new.
b nodes: (1 to: 1000).
b edges connectFrom: [ :v | v // 2 ].
b layout grid.
b build.
b view @ RTSelectableView.
b view
"
Class {
	#name : #RTSelectableView,
	#superclass : #RTAbstractElasticBoxInteraction,
	#instVars : [
		'color'
	],
	#category : #'Roassal2-Selection'
}

{ #category : #accessing }
RTSelectableView >> color [
	^ color
]

{ #category : #accessing }
RTSelectableView >> color: anObject [
	color := anObject
]

{ #category : #util }
RTSelectableView >> getSelectedElementsWith: s [
	| g r |
	g := RTGroup new. 
	r := s encompassingRectangle.
	view elements do: [ :e | 
		((e ~= s) and: [ e trachelShape encompassingRectangle intersects: r ])
			ifTrue: [ g add: e. ] ].
	^ g
]

{ #category : #util }
RTSelectableView >> highlight: aGroup [
	aGroup do: [:e | RTBlink highlight: e color: (self color rtValue: e) ].
]

{ #category : #initialization }
RTSelectableView >> initialize [
	super initialize.
	self color: Color red.
	self when: RTSelectionStart do: [ self removeSelection: view elements ].
	self
		when: RTSelectionChange
		do: [ :e | self highlight: (e group select: [ :each | each model isNotNil ]) ]
]

{ #category : #util }
RTSelectableView >> removeSelection: aGroup [
	aGroup do: [:e | RTBlink unhighlight: e ].

]
