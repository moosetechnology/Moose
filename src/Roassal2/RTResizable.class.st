"
I provide element resizing in all eight directions. 

Resizing handles are displayed after clicking on an associated element, and are automatically removed when clicked on a view or another element.

!! Assumptions

You must provide this class with aView instance or the initialized element must be already added to the view.

!! Collaborators

RTResizableRectangle
RTResizeCanceled

!! Example

see my class side

"
Class {
	#name : #RTResizable,
	#superclass : #RTInteraction,
	#instVars : [
		'element',
		'handles',
		'enabled',
		'view',
		'minSize'
	],
	#category : #'Roassal2-Interactions-Resize'
}

{ #category : #example }
RTResizable class >> example [
	| v g el edge |
	v := RTView new.
	g := RTGroup new
		add: (RTBox new
			size: 100;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (RTRoundedBox new
			size: 50;
			borderRadius: 20;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (RTEllipse new
			width: 100;
			height: 30;
			borderColor: Color black;
			element);
		yourself.

	el := RTBox new
		size: 50;
		color: Color black;
		element.

	edge := RTLine new
		color: Color black;
		attachPoint: RTBorderAttachPoint new;
		edgeFrom: g first to: el.

	v addAll: g.
	v
		add: el;
		add: edge.

	"add empty event to prevent event propagation to the view (and thus test event overseer)"
	el when: TRMouseLeftClick do: [ :evt |  ].
	edge when: TRMouseLeftClick do: [ :evt |  ].

	RTGridLayout new
		gapSize: 50;
		on: v elements.

	v elements @ RTDraggable.
	g @ RTResizable.

	v @ RTZoomableView.

	^ v
]

{ #category : #hooks }
RTResizable >> addCursorEventsOn: anElement corner: aCorner [
	anElement when: TRMouseLeave do: [ :evt | TRPlatform current showTemporaryCursor: nil ].
	anElement when: TRMouseEnter do: [ :evt | TRPlatform current showTemporaryCursor: (self cursorForCorner: aCorner) ]
]

{ #category : #hooks }
RTResizable >> attachHandle: aHandle toCorner: aCorner [
	"Make sure constraint is setup BEFORE resize callback is attached, otherwise it triggers very expensive resize updates."

	(RTConstraint on: aHandle background: element)
		perform: aCorner;
		border;
		stick.
	aHandle
		addCallback:
			(TRTranslationCallback
				block: [ :shape :step | self callbackFor: aHandle corner: aCorner ]).
	self addCursorEventsOn: aHandle corner: aCorner
]

{ #category : #hooks }
RTResizable >> basicCallbackFor: aHandle corner: aCorner [
	| newExtent oppositeCornerPosition distance oppositeCorner oldExtent |
	oldExtent := element extent.
	"An absolute distance the handle has moved from it's assigned corner."
	distance := aHandle position
		- ((RTResizableRectangle cornerDirectionFor: aCorner) abs * (element encompassingRectangle perform: aCorner)).
	"Resizing with RTElement>>extent: changes the element in all directions, so we have to move it back in the opposite direction of the movement. (So when resizing by topRight corner, then bottomLeft should be fixed in place."
	distance := self negate: distance forCorner: aCorner.
	newExtent := element extent + distance max: (self minSizeFor: element).
	oppositeCorner := RTResizableRectangle oppositeCornerFor: aCorner.
	oppositeCornerPosition := element encompassingRectangle perform: oppositeCorner.
	element trachelShape
		doWithoutCallbacks: [ 
			element trachelShape extent: newExtent.
			element shape extent: newExtent.
			self translateCorner: oppositeCorner of: element to: oppositeCornerPosition ].
	"This is to trigger repositioning of subelements etc."
	element trachelShape triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent.
	element trachelShape triggerCallbacksForStep: 0
]

{ #category : #hooks }
RTResizable >> callbackFor: aHandle corner: aCorner [
	"The resize is disabled during it's operation to prevent dependent repositioning between the element and its handles."

	self enabled
		ifFalse: [ ^ self ].
	self disable.
	self basicCallbackFor: aHandle corner: aCorner.
	self enable
]

{ #category : #hooks }
RTResizable >> connectAllHandles [
	handles
		withIndexDo: [ :each :i | 
			| to |
			to := handles at: i % handles size + 1.
			element view
				add:
					(RTLine new
						color: ((Color gray) alpha: 0.5);
						edgeFrom: each to: to) ]
]

{ #category : #hooks }
RTResizable >> connectWithView: aView [
	(aView hasAttribute: self className)
		ifFalse: [ self setupView: aView ].

	aView
		when: TRResizeCanceled
		do: [ :event | 
			event shape = element trachelShape
				ifFalse: [ self removeHandles ] ]
]

{ #category : #'instance creation' }
RTResizable >> createHandle [
	| handle |
	handle := RTBox new
		size: 6;
		color: Color black;
		element.
	handle @ RTDraggable.
	^ handle
]

{ #category : #accessing }
RTResizable >> cursorForCorner: aCorner [
	^ Cursor perform: ('resize' , aCorner capitalized) asSymbol
]

{ #category : #accessing }
RTResizable >> disable [
	^ enabled := false
]

{ #category : #accessing }
RTResizable >> enable [
	enabled := true
]

{ #category : #accessing }
RTResizable >> enabled [
	^ enabled
]

{ #category : #initialization }
RTResizable >> initialize [
	super initialize.
	handles := #().
	enabled := false.
	self minSize: 20 @ 20
]

{ #category : #initialization }
RTResizable >> initializeElement: anElement [
	"postpone initialization if the element is not yet added to the view"
	anElement view
		ifNil: [ anElement addCallback: (TRAddedCallback block: [ :evt | self lazyInitializeElement: anElement ]) ]
		ifNotNil: [ self lazyInitializeElement: anElement ]
]

{ #category : #initialization }
RTResizable >> lazyInitializeElement: anElement [
	element := anElement.
	element when: TRMouseLeftClick do: [ :evt | self showHandles ].
	element when: TRMouseDragStart do: [ :evt | self disable ].
	element when: TRMouseDragEnd do: [ :evt | self enable ].
	element addCallback: (TRRemoveCallback block: [ :evt | self removeHandles ]).

	self connectWithView: (view ifNil: [ element view ]).

	self enable
]

{ #category : #accessing }
RTResizable >> minSize: aValueOrAOneArgBlock [
	"The minimal size to which one can resize the shape."

	minSize := [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTResizable >> minSizeFor: anElement [
	"The minimal size to which one can resize the shape."

	^ minSize rtValue: anElement
]

{ #category : #translating }
RTResizable >> negate: aPoint forCorner: aCorner [
	^ aPoint * (RTResizableRectangle cornerDirectionFor: aCorner) negated
]

{ #category : #hooks }
RTResizable >> removeEveryonesHandles [
	element view announce: TRResizeCanceled new
]

{ #category : #hooks }
RTResizable >> removeHandles [
	handles ifEmpty: [ ^ self ].

	handles do: #remove.
	handles := #().

	element view signalUpdate
]

{ #category : #hooks }
RTResizable >> setupView: aView [
	aView canvas eventOverseer ifNil: [ aView canvas eventOverseer: TRAnnouncingOverseer new ].

	aView canvas eventOverseer
		when: TRMouseLeftClick
		do: [ :evt | aView announcer announce: (TRResizeCanceled shape: evt shape) ].
	aView attributeAt: self className put: true
]

{ #category : #hooks }
RTResizable >> showHandles [
	handles ifNotEmpty: [ ^ self ].
	handles := RTResizableRectangle cornersAndSides
		collect: [ :corner | 
			| handle |
			handle := self createHandle.
			self attachHandle: handle toCorner: corner.
			handle ].
	self connectAllHandles.
	element view addAll: handles.
	element view signalUpdate
]

{ #category : #translating }
RTResizable >> translateCorner: aCorner of: anElement to: aPosition [
	| selector |
	selector := ('translate' , aCorner capitalized , 'Of:to:') asSymbol.
	RTDirectLayoutTranslator new perform: selector with: anElement with: aPosition
]

{ #category : #accessing }
RTResizable >> view: aView [
	view := aView
]
