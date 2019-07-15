"
I am a class to describe elastic boxes in view, this means that there is a shape in a view that allow you
* select elements () then you can do something.
* zoom in an zoom out in the view
"
Class {
	#name : #RTAbstractElasticBoxInteraction,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'view',
		'draggingView',
		'events',
		'shapeBuilder',
		'announcer',
		'key',
		'group',
		'allowNegatedBox'
	],
	#category : #'Roassal2-Selection'
}

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> allowNegatedBox [
	^ allowNegatedBox
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> allowNegatedBox: aBool [
	allowNegatedBox := aBool
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> announcer [
	^ announcer
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> announcer: anAnnouncer [
	announcer := anAnnouncer.
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> createShapeForView [
	| s |
	s := shapeBuilder elementOn: self.
	view add: s.
	view attributes at: self key put: s.
	^ s
]

{ #category : #'selection events' }
RTAbstractElasticBoxInteraction >> dragViewWithEvent: e [
	view canvas camera translateBy: e step negated / view canvas camera scale.
	e signalUpdate
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> getOrCreateShapeForView [
	^ (view attributes includesKey: self key) 
		ifTrue: [ view attributes at: self key ]
		ifFalse: [ self createShapeForView ].
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> getSelectedElementsWith: s [
	"override this"
	^ #()
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> group [
	^ group
]

{ #category : #initialization }
RTAbstractElasticBoxInteraction >> initialize [
	| base |
	super initialize.
	self rightLeft.
	shapeBuilder := RTShapeBuilder new.
	base := Color r: 51 g: 153 b: 255 range: 255.
	shapeBuilder rectangle borderColor: base ; color: (base alpha: 0.2).
	self key: #rtSelectorShape.
	self allowNegatedBox: true.
	announcer := Announcer new.
	view := nil.
	group := #().
]

{ #category : #hooks }
RTAbstractElasticBoxInteraction >> initializeElement: anElement [
	view := anElement.
	view removeInteractionIfPresent: RTDraggableView.
	view removeInteractionIfPresent: self class.
	draggingView := false.
	view canvas when: events first do: [ :e | draggingView := true ].
	view canvas
		when: events second
		do: [ :e | 
			draggingView := false.
			self selectionStartFromEvent: e ].

	view canvas
		when: TRMouseDragging
		do:
			[ :e | 
			draggingView
				ifTrue: [ self dragViewWithEvent: e ]
				ifFalse: [ self updateSelectableShapeWithEvent: e ] ].

	view canvas
		when: TRMouseDragEnd
		do:
			[ :e | 
			draggingView
				ifTrue: [ draggingView := false ]
				ifFalse: [ self selectionEndFromEvent: e ] ]
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> key [
	^ key
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> key: anObject [
	key := anObject
]

{ #category : #'public - configuration' }
RTAbstractElasticBoxInteraction >> leftRight [
	events := Array with: TRMouseLeftDragStart with: TRMouseRightDragStart
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> removeSelection: aGroup [
	"nothing but subclasses can override"
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> removeShape [
	| s |
	s := (self getOrCreateShapeForView).
	s remove.
	view attributes removeKey: self key.
	view signalUpdate.
	^ s
]

{ #category : #'public - configuration' }
RTAbstractElasticBoxInteraction >> rightLeft [
	events := Array with: TRMouseRightDragStart with: TRMouseLeftDragStart
]

{ #category : #'selection events' }
RTAbstractElasticBoxInteraction >> selectionEndFromEvent: aTrachelEvent [
	| evt |
	evt := RTSelectionEnd newFrom: aTrachelEvent.
	evt group: group.
	evt shape: self removeShape.
	self announcer announce: evt
]

{ #category : #'selection events' }
RTAbstractElasticBoxInteraction >> selectionStartFromEvent: aTrachelEvent [
	| evt |
	evt := RTSelectionStart newFrom: aTrachelEvent.
	group := RTGroup new.
	evt group: group.
	evt shape: self getOrCreateShapeForView.
	self announcer announce: evt.
]

{ #category : #accessing }
RTAbstractElasticBoxInteraction >> shapeBuilder [
	^ shapeBuilder
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> updateSelectableShapeWithEvent: event [
	| s newgroup |
	s := self getOrCreateShapeForView.
	
	self updateShape: s with: event.
	
	newgroup := self getSelectedElementsWith: s.
	
	group = newgroup ifFalse: [ | evt |
		self removeSelection: group.
		group := newgroup.
		evt := RTSelectionChange newFrom: event.
		evt shape: s.
		evt group: group.
		self announcer announce: evt. ].
	view signalUpdate.
	
]

{ #category : #util }
RTAbstractElasticBoxInteraction >> updateShape: s with: e [
	"Update for box shape"
	| p k o extent | 
	p := e positionFromCamera.
	k := #rtorigin.
	(s attributes includesKey: k) ifTrue: [
		o := s attributes at: k.
		extent :=  p - o.
		(allowNegatedBox and: [ extent x < 0 ])
			ifTrue: [ 
				extent := (extent x negated)@extent y. 
				o := (o x - extent x)@ o y ].
		(allowNegatedBox and: [ extent y < 0 ])
			ifTrue: [ 
				extent := extent x @ (extent y negated). 
				o := o x @ (o y - extent y) ].
		s trachelShape extent: extent.
		s translateTo: o + (extent /2).
		] ifFalse: [
		s translateTo: p.
		s attributes at: k put: p].
]

{ #category : #announce }
RTAbstractElasticBoxInteraction >> when: anEvent do: aBlock [
	self announcer when: anEvent do: aBlock
]
