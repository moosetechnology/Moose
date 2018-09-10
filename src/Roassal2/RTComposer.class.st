"
I am responsible to compose several visualizations.

For example:
====
compo := RTComposer new.

b := RTMondrian new.
b view: compo view.
b nodes: (1 to: 3).
b build.
compo group: #g1.

b := RTMondrian new.
b view: compo view.
b nodes: (1 to: 4).
b build.

compo group: #g2.

compo layout: RTVerticalLineLayout new alignCenter. 
compo view
====
"
Class {
	#name : #RTComposer,
	#superclass : #RTObject,
	#instVars : [
		'stack',
		'view',
		'gap',
		'mapping',
		'groups',
		'backgrounds',
		'names'
	],
	#category : #'Roassal2-Builder-Composer'
}

{ #category : #accessing }
RTComposer >> allGroupedElements [
	^ mapping values flatCollect: #yourself
]

{ #category : #accessing }
RTComposer >> currentElements [
	^ view elements 
]

{ #category : #accessing }
RTComposer >> currentElementsAsGroup [
	^ RTGroup withAll: self currentElements
]

{ #category : #accessing }
RTComposer >> gap [
	"Return the space between visualizations"
	^ gap
]

{ #category : #accessing }
RTComposer >> gap: anInteger [
	gap := anInteger
]

{ #category : #accessing }
RTComposer >> getGroup: groupId [
	"returns the elements grouped under the given key
	ex:
	
		composer getGroup: id
	"
	^mapping at: groupId.
]

{ #category : #'public-layout' }
RTComposer >> group [
	"Define a new group with the elements added to the view using a computed name"
	^ self group: ('group', (mapping size asString)) asSymbol
]

{ #category : #'public-layout' }
RTComposer >> group: aName [
	"Define a new group with the elements added to the view"
	| group |
	group := self newElementsAsGroup.
	groups add: group.
	mapping at: aName put: group.
]

{ #category : #initialization }
RTComposer >> initialize [
	super initialize.
	view := RTView new.
	view @ RTDraggableView.
	groups := OrderedCollection new.
	mapping := Dictionary new.
	gap := 20.
	backgrounds := OrderedCollection new.
	names := OrderedCollection new.
]

{ #category : #'public-layout' }
RTComposer >> layout: aLayout [
	"Layout all the group of elements"
	aLayout on: groups.

]

{ #category : #'public-layout' }
RTComposer >> move: name1 above: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	TRConstraint move: g1 above: g2.
	g1 translateBy: 0 @ gap negated
]

{ #category : #'public-layout' }
RTComposer >> move: name1 below: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	TRConstraint move: g1 below: g2.
	g1 translateBy: 0 @ gap
]

{ #category : #'public-layout' }
RTComposer >> move: name1 belowAlignFromLeft: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	TRConstraint move: g1 belowAlignFromLeft: g2 gap: gap.
]

{ #category : #'public-layout' }
RTComposer >> move: name1 onTheLeftOf: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	TRConstraint move: g1 onTheLeftOf: g2.
	g1 translateBy: gap negated @ 0
]

{ #category : #'public-layout' }
RTComposer >> move: name1 onTheRightBelowOf: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	TRConstraint move: g1 onTheRightBelowOf: g2.
	g1 translateBy: 0 @ gap
]

{ #category : #'public-layout' }
RTComposer >> move: name1 onTheRightOf: name2 [
	
	| g1 g2 |
	g1 := mapping at: name1. 
	g2 := mapping at: name2.
	RTConstraint move: g1 onTheRightOf: g2.
	g1 translateBy: gap @ 0
]

{ #category : #'public-naming' }
RTComposer >> nameBelowGroup: aName as: title [
	"Give a title to a group.
	
	For example:
	
| compo |
compo := RTComposer new.

b := RTMondrian new.
b view: compo view.
b nodes: (1 to: 30).
b layout grid.
b build.
compo group: #g1.

b := RTMondrian new.
b view: compo view.
b nodes: (1 to: 30).
b layout grid.
b build.
compo group: #g2. 

compo layout: RTVerticalLineLayout new alignCenter.

compo setBackgroundForGroup: #g1 color: Color red trans.
compo nameGroup: #g1 as: 'Goup 1'.
compo view

	"
	| lbl |
	lbl := (RTLabel new text: title) element.
	TRConstraint move: lbl below: (mapping at: aName).
	view add: lbl.
	^ lbl
]

{ #category : #'public-naming' }
RTComposer >> nameGroup: aName as: title [
	| label |
	label := (RTLabel new text: title) element.
	TRConstraint move: label above: (mapping at: aName).
	view add: label.
	
	"store a reference to the created element"
	names add: label.
	
	^ label
]

{ #category : #accessing }
RTComposer >> newElementsAsGroup [
	| es |
	es := view elements select: [ :e | e hasNotAttribute: #AlreadyGrouped ].
	es do: [ :e | e attributeAt: #AlreadyGrouped put: true ].
	^ es 
"	^ RTGroup withAll: (view elements copyWithoutAll: self allGroupedElements)"
]

{ #category : #'public-layout' }
RTComposer >> open [
	^ view open
]

{ #category : #'public-interaction' }
RTComposer >> propagateHighlight [

	self newElementsAsGroup @ RTHighlightable allSibblings.
]

{ #category : #'public-interaction' }
RTComposer >> propagateHighlightToAll [
	"Highlight all the elements that have the same model"
	mapping value do: [ :g | g @ RTHighlightable allSibblings ]
]

{ #category : #'public-interaction' }
RTComposer >> propagateHighlightUsing: aBlock [
	"Highlight all the elements return by aBlock. 
	 The aBlock variable is evaluated for a Roassal element"
	mapping value do: [ :g | g @ (RTHighlightable new highlightElements: aBlock) ]
]

{ #category : #'public-background' }
RTComposer >> removeAllBackgrounds [
	"removes all the backgrounds currently drawn for all the existing groups
	ex:
		composer removeAllBackgrounds
	"
	view canvas removeShapes: backgrounds.
	backgrounds removeAll.
]

{ #category : #'public-naming' }
RTComposer >> removeAllNames [
	"removes all the names present in the current view
	ex:
	
		composer removeAllNames
	"
	view removeElements: names.
	names removeAll.
]

{ #category : #'public-layout' }
RTComposer >> removeGroup: groupId [
	| elements |
	
	elements := self getGroup: groupId.
	view removeElements: elements.
	
	"remove the mapping from the dictionary"
	mapping removeKey: groupId.
	
	"regenerate the groups array"
	groups removeAll.
	mapping do: [ :groupElements | groups add: groupElements. ].

]

{ #category : #'public-background' }
RTComposer >> setBackgroundColor: aColor forGroup: aName [

	| backgroundBox g outterGap |
	outterGap := 5 @ 5.
	
	backgroundBox := TRRoundedBoxShape new.
	backgroundBox color: aColor.
	backgroundBox strokeWidth: 0.
	backgroundBox borderRadius: 5.
	
	g := mapping at: aName.
	backgroundBox translateTo: g center.
	backgroundBox extent: g extent + outterGap.
	
	view canvas addShape: backgroundBox.
	backgroundBox pushBack.
	
	backgrounds add: backgroundBox.
	
	^ backgroundBox
]

{ #category : #'public title' }
RTComposer >> setGeneralTitle: aTitleAsString [
	self setGeneralTitle: aTitleAsString gap: 0 @ -50
]

{ #category : #'public title' }
RTComposer >> setGeneralTitle: aTitleAsString gap: gapAsPoint [
	| title |
	title := (RTLabel new text: aTitleAsString; height: 20) element.
	TRConstraint move: title above: self allGroupedElements asGroup.
	title translateBy: gapAsPoint.
	self view add: title
]

{ #category : #accessing }
RTComposer >> view [
	^ view
]

{ #category : #accessing }
RTComposer >> view: aView [
	view := aView
]
