"
I am a simple builder of interactive view that allows you to inspect and navigate an  object.
"
Class {
	#name : #RTObjectBrowser,
	#superclass : #RTBuilder,
	#instVars : [
		'target',
		'objects',
		'last'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #private }
RTObjectBrowser >> addInteractions: b [
	| obj |
	b interaction menu
		item: 'Inspect' action: [:e | e model inspect];
		item: 'Browse class' action: [ :e | e model class browse ];
		item: 'Close ' action: [:e | 
			obj := self objects at: e model.
			(self objects at: e model) do: #remove.
			self objects removeKey: e model.
			view canvas focusOnCenterScaled.
			view signalUpdate ].
]

{ #category : #private }
RTObjectBrowser >> addNewElement: anElement [
	| pos anime |
	pos := self positionFor: anElement.
	anElement key first translateTo: pos.
	view addAll: anElement key.
	view addAll: anElement value.
	anime := RTAddElementAnimation new.
	anime shape circle color: Color transparent; borderColor: Color blue.
	anime element: anElement key during: 0.75.
	view canvas focusOnCenterScaled.
	view addAnimation: anime.
]

{ #category : #private }
RTObjectBrowser >> addNewObject: anObject [
	| newElement |
	newElement := self createElementsFor: anObject.
	self addNewElement: newElement.
	self objects at: anObject put: newElement key.
]

{ #category : #'adding item' }
RTObjectBrowser >> addObject: anObject [
	| bool |
	
	bool := false.
	anObject ifNil: [ ^ bool ].
	(self contains: anObject) ifFalse: [
		self addNewObject: anObject.
		bool := true ].
	
	self selectObject: anObject.
	^ bool.
	
]

{ #category : #testing }
RTObjectBrowser >> contains: anObject [
	^ self objects includesKey: anObject
]

{ #category : #private }
RTObjectBrowser >> createElementsFor: anObject [
	| b vars edges |
	b := RTMondrian new.
	b shape box color: Color veryLightGray; 
		withTextAbove: [ anObject class name ].
	self addInteractions: b.
	
	b node: anObject forIt: [ 
		b shape label text: #key;
			if: [ :assoc | assoc value isNil ] color: Color red.
		b interaction 
			noInteractions;
			highlight;
			when: TRMouseClick do: [ :evt |
				self openNewObject: evt ];
			popupText: [:ass | ass value asString ].
		vars := anObject class allInstVarNames collect: [ :n |
			n -> (anObject instVarNamed: n)].
		
		b nodes: vars.
		b layout verticalLine ].
	b build.
	edges := vars 
		select: [ :v | self objects includesKey: v value ]
		thenCollect: [ :v | self 
			edgeFrom: (b view elementFromModel: v)
			to: (self objects at: v value) first ].
	^ b view elements->edges.
]

{ #category : #hooks }
RTObjectBrowser >> createView [
	^ super createView @ RTDraggableView @ RTZoomableView.
]

{ #category : #private }
RTObjectBrowser >> edgeFrom: e1 to: e2 [
	^ RTArrowedLine new 
		withShorterDistanceAttachPoint; 
		color: Color blue;
		edgeFrom: e1 to: e2
]

{ #category : #initialization }
RTObjectBrowser >> initialize [
	super initialize.
	objects := IdentityDictionary new.
]

{ #category : #public }
RTObjectBrowser >> object: anObject [
	target := anObject
]

{ #category : #accessing }
RTObjectBrowser >> objects [
	^ objects
]

{ #category : #private }
RTObjectBrowser >> openNewObject: evt [
	| obj temp |
	obj := evt element model value.
	obj ifNil: [ ^ self ].
	self addObject: obj.
	temp := (self objects at: obj) first.
	(view edges select: [ :e | 
		e from = evt element and: [ e to = temp ] ]) ifEmpty: [ 
		view add: (self edgeFrom: evt element to: (self objects at: obj) first) ] 
]

{ #category : #private }
RTObjectBrowser >> positionFor: anElement [
	"something fancy here to find a nice position for this element"
	| rect res |
	rect := view canvas encompassingRectangle.
	(last isNil or: [last > 4]) ifTrue: [ last := 1 ].
	res := rect corners at: last.
	last := last + 1.
	^ res.
	
]

{ #category : #hooks }
RTObjectBrowser >> renderIn: aView [
	view := aView.
	target ifNotNil: [ 
		self addNewObject: target].
]

{ #category : #acctions }
RTObjectBrowser >> selectObject: anObject [
	
]
