"
I am a class to visit all the nodes of one RTView
"
Class {
	#name : #RTJavascriptVisitor,
	#superclass : #RTVisitor,
	#instVars : [
		'view',
		'stream',
		'validInteractions',
		'exportFixedShapes',
		'maxSize'
	],
	#category : #'Roassal2-Exporter-HTML5'
}

{ #category : #helpers }
RTJavascriptVisitor >> addBorderColor: c [
	c ifNil: [ ^ self].
	
	stream nextPutAll: ('bordercolor: {r: <1p>, g: <2p>, b:<3p>' expandMacrosWith: (c red*255) rounded with: (c green*255) rounded with:  (c blue*255) rounded ).
	c alpha = 1 ifTrue: [ stream nextPutAll: '}, ' ]
	ifFalse: [ stream nextPutAll: (', a: <1p>}, ' expandMacrosWith: c alpha) ]
	
]

{ #category : #helpers }
RTJavascriptVisitor >> addBorderWidth: aShape [
	(aShape strokePaint isNil or: [ aShape strokeWidth < 0 ]) ifTrue: [ ^ self ].
	stream 
		nextPutAll: 'sw: ';
		nextPutAll: (self number: aShape strokeWidth);
		nextPutAll: ','.
]

{ #category : #helpers }
RTJavascriptVisitor >> addColor: c [
	stream nextPutAll: 'color: '.
	self addColorBase: c.
	stream nextPutAll: ', '.
	
]

{ #category : #helpers }
RTJavascriptVisitor >> addColorBase: c [
	stream 
		nextPutAll: '{r:';
		nextPutAll: (self number: (c red*255) rounded);
		nextPutAll: ',g:';
		nextPutAll: (self number: (c green*255) rounded);
		nextPutAll: ',b:';
		nextPutAll: (self number: (c blue*255) rounded).
	c alpha = 1 ifTrue: [ stream nextPutAll: '}' ]
	ifFalse: [ stream 
		nextPutAll: ',a:';
		nextPutAll: (self number: c alpha);
		nextPutAll: '}' ]
]

{ #category : #helpers }
RTJavascriptVisitor >> addInteractions: aShape [
	aShape isNil ifTrue: [ ^ self ].
	(aShape isKindOf: RTAnnounceableObject) ifFalse: [ ^ self ].
	stream nextPutAll: 'ints: '.
	self visitInteractions: aShape.
	stream nextPutAll: ', '
]

{ #category : #helpers }
RTJavascriptVisitor >> addMatrix: m [
	stream 
		nextPutAll: 'matrix:{shx: ';
		nextPutAll: (self number: m shx);
		nextPutAll: 	',shy: ';
		nextPutAll: (self number: m shy);
		nextPutAll: 	',sx: ';
		nextPutAll: (self number: m sx);
		nextPutAll: 	',sy: ';
		nextPutAll: (self number: m sy);
		nextPutAll: 	',x: ';
		nextPutAll: (self number: m x);
		nextPutAll: ',y: ';
		nextPutAll: (self number: m y);
		nextPutAll: '}}, '.
	
]

{ #category : #helpers }
RTJavascriptVisitor >> addStringWithFont: aLabel [
	| converter fn |
	converter := RTSVGStringConverter new.
	fn := aLabel fontName.
	fn = 'Source Sans Pro' ifTrue: [ fn := 'Verdana, Geneva, sans-serif' ].
	stream nextPutAll: ' text: "';
		nextPutAll: (converter convertString: (aLabel text truncateTo: maxSize));
		nextPutAll: '", font: {n: "';
		nextPutAll: fn;
		nextPutAll: '", s: ';
		nextPutAll: (self number: aLabel fontSize);
		nextPutAll: '},'
]

{ #category : #accessing }
RTJavascriptVisitor >> exportFixedShapes [
	^ exportFixedShapes
]

{ #category : #accessing }
RTJavascriptVisitor >> exportFixedShapes: aBool [
	exportFixedShapes := aBool
]

{ #category : #initialization }
RTJavascriptVisitor >> initialize [
	names := Dictionary new.
	validInteractions := #(#RTDraggableView #RTDraggable #RTPopup 
	#RTHighlightable #RTLabeled #RTShowEdge #RTShowLabel #RTZoomableView
	#RTFocusElement #RTLinkView).
	self exportFixedShapes: true.
	self stream: (WriteStream on: String new).
	self maxSize: 500.
]

{ #category : #accessing }
RTJavascriptVisitor >> maxSize [
	^ maxSize
]

{ #category : #accessing }
RTJavascriptVisitor >> maxSize: size [
	maxSize := size.
]

{ #category : #helpers }
RTJavascriptVisitor >> pointToString: point [
	^ '{x:', (self number: point x), ',y:', (self number: point y),'}'
]

{ #category : #accessing }
RTJavascriptVisitor >> stream [

	^stream
]

{ #category : #accessing }
RTJavascriptVisitor >> stream: aStream [

	stream := aStream.
]

{ #category : #helpers }
RTJavascriptVisitor >> validInteractions [
	^ validInteractions
]

{ #category : #accessing }
RTJavascriptVisitor >> view [

	^view
]

{ #category : #accessing }
RTJavascriptVisitor >> view: aView [

	view := aView.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitAbstractLine: anAbstractLine [
	"anAbstractLine accept: anAbstractLine
	"
	"TODO"
]

{ #category : #visitor }
RTJavascriptVisitor >> visitArcShape: aShape [
	aShape topLeft ifNil: [ aShape computeRectangle ].
	stream nextPutAll: '
		{type: "arc", id: "';
		nextPutAll: (self nameFor: aShape);
		nextPutAll: '", ir: ';
		nextPutAll: (self number: aShape innerRadius);
		nextPutAll: ', er: ';
		nextPutAll: (self number: aShape externalRadius);
		nextPutAll:', aAngle: ';
		nextPutAll: (self number: aShape alphaAngle);
		nextPutAll: ', bAngle: ';
		nextPutAll: (self number: aShape betaAngle);
		nextPutAll: ', o: {x: ';
		nextPutAll: (self number: aShape topLeft x);
		nextPutAll: ', y: ';
		nextPutAll: (self number: aShape topLeft y);
		nextPutAll: '}, c: {x: ';
		nextPutAll: (self number: aShape bottomRight x);
		nextPutAll: ', y: ';
		nextPutAll: (self number: aShape bottomRight y );
		nextPutAll: '},'.
	self addColor: aShape color.
	self addInteractions: aShape element.
	self addMatrix: aShape matrix.

]

{ #category : #visitor }
RTJavascriptVisitor >> visitArrowHeadShape: arrowShape [
	| e |
	e := arrowShape element.
	stream nextPutAll: '
		{type: "headarrow", id: "';
		nextPutAll: (self nameFor: arrowShape);
		nextPutAll: ('", fromid: <1p>, toid: <2p>,' 
		expandMacrosWith:  (self nameFor: e from trachelShape) with: (self nameFor: e to trachelShape) ).
	self addColor: arrowShape color.
	self addBorderColor: arrowShape strokePaint.
	
	stream 
		nextPutAll: ' width: ';
		nextPutAll: (self number: arrowShape width);
		nextPutAll: ', size: ';
		nextPutAll: (self number: arrowShape mySize).
	self visitAttachPoint: e.
	stream 
		nextPutAll: ', base: ';
		nextPutAll: (self number: arrowShape baseSize);
		nextPutAll: '},'.
	
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitArrowShape: arrowShape [
	| e |
	e := arrowShape element.
	stream nextPutAll: '
		{type: "simplearrow", id: "';
		nextPutAll: (self nameFor: arrowShape);
		nextPutAll: ('", fromid: <1p>, toid: <2p>,' 
		expandMacrosWith:  (self nameFor: e from trachelShape) with: (self nameFor: e to trachelShape) ).
	self addColor: arrowShape strokePaint.
	stream
		nextPutAll: ' width: ';
		nextPutAll: (self number: arrowShape width);
		nextPutAll: ', size: ';
		nextPutAll: (self number: arrowShape mySize).
	self visitAttachPoint: e.
	stream 
		nextPutAll: ', base: ';
	 	nextPutAll: (self number: arrowShape baseSize);
		nextPutAll: '},'.
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitAttachPoint: element [
	| ap |
	element ifNil: [ 
		^ stream nextPutAll: ',ap:RTCenteredAttachPoint' ].
	ap := element shape class = RTCompositeShape 
		ifTrue: [ element shape allShapes first ] 
		ifFalse: [ element shape ].
	stream nextPutAll: ',ap: new ';
		nextPutAll: ap attachPoint class name;
		nextPutAll: '(';
		nextPutAll: ap attachPoint isInverted asString;
		nextPutAll: ')'.
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitBezierShape: aBezierShape [
	| e shape |
	e := aBezierShape element.
	shape := (e shape class = RTCompositeShape) ifTrue: [ shape := e shape allShapes first ] ifFalse: [ e shape ].
	stream nextPutAll: '
		{type: "bezier", id: "';
		nextPutAll: (self nameFor: aBezierShape);
		nextPutAll: ('", fromid: <1p>, toid: <2p>,' 
		expandMacrosWith:  (self nameFor: e from trachelShape) with: (self nameFor: e to trachelShape) ).
	self addColor: aBezierShape strokePaint.
	
	shape class = RTBezierLine ifTrue: [ 
		stream 
			nextPutAll:  'tension: ';
			nextPutAll: (self number: shape tension);
			nextPutAll: ', ides: ['.
		shape follow ifNotNil: [ shape setControllingElementsFromFollowFor: e ].
		(shape controllingElements rtValue: e) do: [ :el | 
			stream 
				nextPutAll: '"';
				nextPutAll: (self nameFor: el trachelShape);
				nextPutAll: '", '] ].
	
	stream nextPutAll: '], width: ';
		nextPutAll: (self number: aBezierShape width).
	self visitAttachPoint: e.
	stream nextPutAll: '},'.
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitBitMapShape: aBitmapShape [
	| s icon64 |
	s := WriteStream on: ByteArray new.
	
	TRPlatform current pngReadWriterClass putForm: (aBitmapShape form) onStream: s.
	
	icon64 := (TRPlatform current mimeEncode: s contents readStream multiLine: false).
	stream nextPutAll: '
		{type: "bitmap", id: "';
		nextPutAll: (self nameFor: aBitmapShape);
		nextPutAll: '", base64: "';
		nextPutAll: icon64;
		nextPutAll: '", w: ';
		nextPutAll: (self number: aBitmapShape width);
		nextPutAll: ', h: ';
		nextPutAll: (self number: aBitmapShape height);
		nextPutAll: ', '.
	self addInteractions: aBitmapShape element.
	self addMatrix: aBitmapShape matrix.
	s close.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitBoxShape: aBox [
	
	| box |
	box := aBox basicEncompassingRectangle.
	stream nextPutAll: '
		{type: "box", id: "';
		nextPutAll: (self nameFor: aBox);
		nextPutAll: '", w: ';
		nextPutAll: (self number: box width);
		nextPutAll: ', h: ';
		nextPutAll: (self number: box height);
		nextPutAll: ', '.
	self addBorderColor: aBox strokePaint.
	self addBorderWidth: aBox.
	self addColor: aBox color.
	self addInteractions: aBox element.
	self addMatrix: aBox matrix.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitCanvas: aCanvas [
	self exportFixedShapes ifFalse: [ ^ self ].
	aCanvas fixedShapes ifEmpty: [ ^ self ].
	stream nextPutAll:'	shapes = ['.
	aCanvas fixedShapes do: [ :s | s accept: self ].
	stream nextPutAll: '
	];
	mamani.addFixedShapes(shapes);
'
	
	

]

{ #category : #visitor }
RTJavascriptVisitor >> visitDiamondShape: diamondShape [
	"TODO"

]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitDraggableInteraction: anInteraction with: anObject [
	| list trachelBlock nest |
	list := OrderedCollection new.
	(anObject attributes includesKey: #RTLabelledLabel) ifTrue: [  
		list add: (anObject attributes at: #RTLabelledLabel).
	].
	nest := nil.
	nest := [ :ob | 
		(ob attributes includesKey: #nestedElements) ifTrue: [ 
			(ob attributes at: #nestedElements) do: [ :e|
				e isCollection 
					ifTrue: [ list addAll: (e collect: [:x | nest value: x. x trachelShape ]) ]
					ifFalse: [ nest value: e. list add: e trachelShape ] ] ].
		].
	nest value: anObject.
	
	trachelBlock := [ :e|	(e isKindOf: TRShape) ifTrue: [ e ] ifFalse: [ e trachelShape ] ].
	list addAll: (anInteraction groupToDrag collect: trachelBlock).
	list isEmpty ifTrue: [ self visitInteraction: anInteraction with: anObject ]
	ifFalse: [
		stream nextPutAll: 'new RTDraggable(['.
		list do: [ :e | 
			stream nextPutAll: '"';
				nextPutAll: (self nameFor:e);
				nextPutAll: '", ' ].
			stream nextPutAll: '])'.
	]
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitEdge: edge [
	edge trachelShape accept: self.
	
]

{ #category : #visitor }
RTJavascriptVisitor >> visitElement: e [
	e trachelShape accept: self
]

{ #category : #visitor }
RTJavascriptVisitor >> visitEllipseShape: anEllipse [	
	| box |
	box := anEllipse basicEncompassingRectangle.
	stream nextPutAll: '
		{type: "ellipse", id: "';
		nextPutAll: (self nameFor: anEllipse);
		nextPutAll: '", rx: ';
		nextPutAll: (self number: box width / 2);
		nextPutAll: ', ry: ';
		nextPutAll: (self number: box height/2);
		nextPutAll: ','.
	self addBorderColor: anEllipse strokePaint.
	self addBorderWidth: anEllipse.
	self addColor: anEllipse color.
	self addInteractions: anEllipse element.
	self addMatrix: anEllipse matrix.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitGroup: aRTGroup [
	aRTGroup accept: self.
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitHightlightableInteraction: anInt with: el [
	stream nextPutAll: 'new RTHighlightable({'.
	self addColor: anInt highlightedColor.
	stream nextPutAll: 'ides: ['.
		((anInt highlightElements) rtValue: el) 
		do: [ :e |
			stream 
				nextPutAll: '"';
				nextPutAll: (self nameFor: e trachelShape);
				nextPutAll: '",' ].
		stream nextPutAll: ']})'.
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitInteraction: interaction with: anObject [
	stream nextPutAll: interaction class name.
	
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitInteractions: anObject [
	TRPlatform current visitInteractionsFor: self and: anObject.

]

{ #category : #visitor }
RTJavascriptVisitor >> visitLabelShape: aLabel [
	| box |
	box := aLabel basicEncompassingRectangle.
	stream nextPutAll: '
		{type: "label", id: "';
		nextPutAll: (self nameFor: aLabel);
		nextPutAll: '",o: {x: ';
		nextPutAll: (self number: box origin x);
		nextPutAll: ', y: ';
		nextPutAll: (self number: box origin y);
		nextPutAll: '},c: {x: ';
		nextPutAll: (self number: box corner x);
		nextPutAll: ', y: ';
		nextPutAll: (self number: box corner y);
		nextPutAll: '},'.
	self addColor: aLabel color.
	self addStringWithFont: aLabel.
	self addInteractions: aLabel element.
	self addMatrix: aLabel matrix.

]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitLabelledInteraction: anInt with: el [
	stream nextPutAll: 'new RTLabelled({'.
		self addColor: anInt color.
		stream nextPutAll: 'low'.
		self addColor: anInt lowColor.
		stream 
			nextPutAll: 'lbl: ';
			nextPutAll: '"';
			nextPutAll: (self nameFor: anInt lbl);
			nextPutAll: '"})'.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitLineShape: aLine [
	
	| e fromTo |
	e := aLine element.
	fromTo := e 
		ifNil: [ '", fromid: ',(self pointToString: aLine from),',toid:',(self pointToString: aLine to),',' ]
		ifNotNil: [ '",fromid:<1p>,toid:<2p>,' 
			expandMacrosWith: (self nameFor: e from trachelShape)
			with: (self nameFor: e to trachelShape) ].
	
	stream nextPutAll: '
		{type: "line", id: "';
		nextPutAll: (self nameFor: aLine);
		nextPutAll: fromTo.
	self addColor: aLine color.
	stream nextPutAll: ' width: ';
		nextPutAll: (self number: aLine width).
	self visitAttachPoint: e.
	stream nextPutAll: '},'.
	
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitLinkView: anInt with: el [
	| eview name st exporter |
	eview := anInt viewFor: el.
	name := anInt nameFor: el.
	name ifNil: [ name := self nameFor: el ].
	
	[ 
	eview ifNotNil: [ 
		exporter := RTHTML5Exporter new 
			fileName: name, '.html';
			shouldCreateJS: false.
		exporter createStream.
		st := exporter stream.
		exporter export: eview toStream: st] 
	] on: Error do: [ :ex |
	st close.
	exporter export: anInt errorView ].
	stream 
		nextPutAll: 'new RTLinkView("';
		nextPutAll: name;
			nextPutAll: '")'.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitMultiCompositeShape: aShape [
	stream nextPutAll: '
		{id: "';
		nextPutAll: (self nameFor: aShape);
		nextPutAll: '", type:"multi", shapes:['.
	aShape shapes do: [ :s| s accept: self].
	stream nextPutAll: '], offsets: ['.
	aShape offsets do: [ :o | 
		stream nextPutAll: '{x: ';
			nextPutAll: (self number: o x);
			nextPutAll: ', y: ';
			nextPutAll: (self number: o y);
			nextPutAll: '},' ].
	
	stream nextPutAll: ']'.

	(aShape element isNil not and: [aShape element shape isKindOf: RTMultiColoredLine]) ifTrue: [ 
		self visitAttachPoint: aShape element. ].
	stream nextPutAll: '},'.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitNoShape: aNoShape [
	"Do nothing"
]

{ #category : #visitor }
RTJavascriptVisitor >> visitPolygonShape: aPolygon [
	| r c |
	r := aPolygon encompassingRectangle.
	c := aPolygon color.
	c ifNil: [ c:= Color transparent ].
	
	stream nextPutAll: '
		{type: "polygon", id: "';
		nextPutAll: (self nameFor: aPolygon);
		nextPutAll: ('", o: {x: ',(self number: r origin x),', y: ',(self number: r origin y),'}');
		nextPutAll: (', c: {x: ',(self number: r corner x),', y: ',(self number: r corner y),'}, p: "').
	
	aPolygon vertices do: [ :p |
		stream nextPutAll: (self number: p x),',',(self number: p y),' '. ].
	stream nextPutAll: '",'.
	self addBorderColor: aPolygon strokePaint.
	self addBorderWidth: aPolygon.
	self addColor: c.
	self addInteractions: aPolygon element.
	self addMatrix: aPolygon matrix.
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitPopupInteraction: anInt with: el [
	| elements |
	[elements := anInt createPopupFor: el] 
		on: Error do: [ ^ self ].
		
	stream nextPutAll: 'new RTPopup(['.
	elements do: [ :e | 
		e trachelShape element: e.
		e trachelShape accept: self ].
	stream nextPutAll: ']) '.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitRotatedLabelShape: aLabel [
	| box matrix |
	box := aLabel basicEncompassingRectangle.
	stream nextPutAll: '
		{type: "label", id: "';
		nextPutAll: (self nameFor: aLabel);
		nextPutAll: ('",o: {x: <1p>, y: <2p>},' expandMacrosWith: box origin x with: box origin y);
		nextPutAll: ('c: {x: <1p>, y: <2p>},' expandMacrosWith: box corner x with: box corner y).
	self addColor: aLabel color.
	self addStringWithFont: aLabel.
	self addInteractions: aLabel element.
	matrix := aLabel matrix copy.
	matrix rotateByDegrees: aLabel angle.
	self addMatrix: matrix.

]

{ #category : #visitor }
RTJavascriptVisitor >> visitSVGPath: aSVGPath [
	| r c |
	r := aSVGPath basicEncompassingRectangle.
	c := aSVGPath color.
	c ifNil: [ c:= Color transparent ].
	stream nextPutAll: '
		{type: "path", id: "';
		nextPutAll: (self nameFor: aSVGPath);
		nextPutAll: '", d:"';
		nextPutAll: aSVGPath pathString;
		nextPutAll: '", o: {x: ',(self number: r origin x),', y: ',(self number: r origin y),'}' ;
		nextPutAll: ', c: {x: ',(self number: r corner x),', y: ',(self number: r corner y),'},'.
	
	self addBorderColor: aSVGPath strokePaint.
	self addBorderWidth: aSVGPath.
	
	self addColor: c.
	self addInteractions: aSVGPath element.
	self addMatrix: aSVGPath matrix.
]

{ #category : #visitor }
RTJavascriptVisitor >> visitShape: aShape [
	aShape accept: self 
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitShowEdgeInteraction: anInt with: el [
	|edges t |
	t := (anInt connectToElements rtValue: el).
	t := t copyWithout: nil.
	edges := (anInt shape rtValue: el) edgesFrom: el toAll: t.
	stream nextPutAll: 'new RTShowEdge(['.
	edges do: [ :e |
		e trachelShape element: e.
		e trachelShape accept: self ].
	stream nextPutAll: ']) '.
]

{ #category : #'visitor-interactions' }
RTJavascriptVisitor >> visitShowLabelInteraction: anInt with: el [
	
	stream nextPutAll: 'new RTShowLabel(['.
	((anInt highlightElements) rtValue: el) do: [:ele |
		(anInt labelledInteraction initializeElement: ele) accept: self.
	].
	stream nextPutAll: ']) '.
	anInt doUnhighlightElement: el
]

{ #category : #visitor }
RTJavascriptVisitor >> visitView: aView [
	| elements |
	stream nextPutAll: 'mamani.color('.
	self addColorBase: aView canvas color.
	stream nextPutAll:(');
	mamani.camera.setScale(<1p>);' 
	expandMacrosWith: aView canvas camera scale).

	aView announcer subscriptions trSubscriptions isEmpty ifFalse: [
		stream nextPutAll: 'mamani.addInteractions('.
		self visitInteractions: aView.
		stream nextPutAll: ');
	'].
	elements := (aView canvas shapes collect: [ :s | 
		s element isNil ifTrue: [ s ] ifFalse: [ s element ] ]) asOrderedCollection removeDuplicates.
	
	stream nextPutAll:'
	var shapes = ['.
	elements do: [ :e | e accept: self ].
	stream nextPutAll:'
	];
	mamani.addShapes(shapes);
'.
	aView canvas accept: self
]
