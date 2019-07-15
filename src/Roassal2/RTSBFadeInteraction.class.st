"
A RTFadeInteraction is a roassal2 interaction that allows to an element of sunburst  and its path to stand out, this works with the RTMouseEnter/RTMouseLeave events.

Instance Variables
	action:		a block closure

action
	- When one element of sunburst is pointed, the fade action works over the other elements, when this happen, the action block is called with the element's model as an argument.

"
Class {
	#name : #RTSBFadeInteraction,
	#superclass : #RTInteraction,
	#instVars : [
		'action',
		'stillInSunburst'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #'initialize-release' }
RTSBFadeInteraction class >> action: ablock [
	| inst |
	inst := self new.
	inst action: ablock.
	^ inst.
]

{ #category : #computing }
RTSBFadeInteraction >> action: ablock [
	action := ablock
]

{ #category : #computing }
RTSBFadeInteraction >> children: element [
	(element attributes includesKey: #children) ifTrue: [ 
		^ element attributes at: #children ]
	ifFalse: [ ^ #() ].
]

{ #category : #computing }
RTSBFadeInteraction >> fade: element [
	| color |
	(element attributes includesKey: #scolor) 
		ifTrue: [ color := element attributes at: #scolor ]
		ifFalse: [
			color := element color.
			element attributes at: #scolor put: color ].
	element trachelShape color: (color alpha:0.2).


]

{ #category : #computing }
RTSBFadeInteraction >> fade: element element: target [
	"recursive fade the elements"
	
	| res v |
	res := true.
	(element = target) ifTrue: [ res := false. ].
	
	(self children: element) do: [ :node | 
		v := self fade: node element element: target.
		v ifTrue: [ self fade: node element ]
		ifFalse: [ res := false. ].
	].

	^ res.
	
]

{ #category : #computing }
RTSBFadeInteraction >> fadeElements: elements [
	elements do: [ :e | self fade: e ].
]

{ #category : #computing }
RTSBFadeInteraction >> focus: element [
	| oldPath |
	oldPath := self sbpath: element.
	oldPath ifNil: [ self fadeElements: element view elements ]
	ifNotNil: [
		self fadeElements: oldPath ].
	oldPath := self path: element.
	self sbpath: element put: oldPath.
	self restoreElements: oldPath.
	
	
]

{ #category : #hooks }
RTSBFadeInteraction >> initializeElement: element [
	
	element when: TRMouseEnter do: [ :event | 
		stillInSunburst := true.
		self focus: element. 
		self updateCanvas: element.
		action ifNotNil: [ action value: element model ].
		 ].
	
	element when: TRMouseLeave do: [ :event | | anim |
		stillInSunburst := false.
		anim := RTNopAnimation new
			waitFor: 1 after: [
				stillInSunburst ifFalse: [self restore: element. self updateCanvas: element.].
				 ].
		
		element view addAnimation: anim.
		anim start.
		action ifNotNil: [ action value: nil ] ].
]

{ #category : #computing }
RTSBFadeInteraction >> parentOf: element [
	
	| e |
	e := element view elements first.
	^ e
]

{ #category : #'as yet unclassified' }
RTSBFadeInteraction >> path: element [
	| e path |
	e := element.
	path := OrderedCollection new.
	path add: e.
	[ e attributes includesKey: #parent ] whileTrue: [ 
		e := e attributes at: #parent.
		(e isNil) ifTrue: [ ^ path ].
		path add: e. ].
	^ path.
]

{ #category : #computing }
RTSBFadeInteraction >> restore: element [
	self sbpath: element put: nil.
	self restoreElements: element view elements.
]

{ #category : #computing }
RTSBFadeInteraction >> restoreElement: el [
	| color |
	(el attributes includesKey: #scolor) ifTrue: [ 
		color := el attributes at: #scolor.
		el trachelShape color: color. ]
	
]

{ #category : #computing }
RTSBFadeInteraction >> restoreElements: elements [
	elements do: [ :e | self restoreElement: e ].
	
]

{ #category : #computing }
RTSBFadeInteraction >> sbpath: element [
	| att |
	att := element view elements first attributes.
	^ (att includesKey: #sbpath) ifTrue: [ att at: #sbpath ] ifFalse: [ nil ]
	
]

{ #category : #computing }
RTSBFadeInteraction >> sbpath: element put: path [
	element view elements first attributes at: #sbpath put: path.
	
]

{ #category : #computing }
RTSBFadeInteraction >> updateCanvas: element [
	element trachelShape canvas signalUpdate.
]
