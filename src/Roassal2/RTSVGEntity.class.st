"
A RTSVGEntity represents the SVG entity, in the SVG format.

The id is used to differentiate elements for the interactions.

The type represents the SVG element type, such as ""text"", ""p"", ""circle"", etc..

The label represents the name used in the final SVG to differentiate group of elements. It also refers to the corresponding Roassal entity.
"
Class {
	#name : #RTSVGEntity,
	#superclass : #RTObject,
	#instVars : [
		'id',
		'element',
		'type',
		'fillColor',
		'strokeColor',
		'strokeWidth',
		'label',
		'position',
		'hasAnchor'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'adding-anchor' }
RTSVGEntity >> addAnchorOn: stream [
	| list interaction |
	list := TRPlatform current validInteractionsOf: self element oklist: (Array with: #RTLinkView).
	list isEmpty ifTrue: [ ^ self ].
	hasAnchor := true.
	interaction := list first.
	stream 
		nextPutAll: '<a xmlns="http://www.w3.org/2000/svg" target="_blank" ';
		nextPutAll: interaction href.
	 
]

{ #category : #interactions }
RTSVGEntity >> addContainedInteractions: aSVGVisitor [
	aSVGVisitor addContainedInteractions: (self label , self id) element: self element
]

{ #category : #interactions }
RTSVGEntity >> addEmbeddingInteractions: aSVGVisitor [
	^ aSVGVisitor addEmbeddingInteractions: (self label , self id) element: self element
]

{ #category : #interactions }
RTSVGEntity >> addExternalInteractions: aSVGVisitor [
	| ide |
	ide := 'pop' , self id.
	aSVGVisitor addExternalInteractions: ide element: self element.
	
]

{ #category : #style }
RTSVGEntity >> addFillColor: stream [
	self fillColor = nil
		ifTrue: [
			stream
				nextPutAll: 'fill:none; '
			  ]
		ifFalse: [  
			stream
				nextPutAll:
					('fill:rgb(<1p>,<2p>,<3p>); '
						expandMacrosWith: (self fillColor red * 256) rounded
						with: (self fillColor green * 256) rounded
						with: (self fillColor blue * 256) rounded)]
]

{ #category : #style }
RTSVGEntity >> addFillOpacity: stream [
	stream nextPutAll: ('fill-opacity:<1p>; ' expandMacrosWith: self fillColor alpha)
]

{ #category : #adding }
RTSVGEntity >> addOn: aStream using: aSVGVisitor [
	self subclassResponsibility
]

{ #category : #adding }
RTSVGEntity >> addPosition: stream [
	self subclassResponsibility
]

{ #category : #transform }
RTSVGEntity >> addScale: scale into: stream [
	| s |
	s := scale.
	s isPoint ifFalse: [ s := s @ s ].
	stream 
		nextPutAll: 'scale(';
		nextPutAll: s x asString;
		nextPutAll: ',';
		nextPutAll: s y asString;
		nextPutAll: ')'
]

{ #category : #adding }
RTSVGEntity >> addStringWithFont: aByteString fontSize: aSyze into: stream [
	| converter |
	converter := RTSVGStringConverter new.
	stream
		nextPutAll: '<tspan font-family = "Arial, Helvetica, sans-serif" font-size="', aSyze asString, 'px">';
		nextPutAll: (converter convertString: aByteString);
		nextPutAll: '</tspan>'
]

{ #category : #adding }
RTSVGEntity >> addStringWithFont: aByteString into: stream [
	| converter |
	converter := RTSVGStringConverter new.
	stream
		nextPutAll: '<tspan font-family = "Arial, Helvetica, sans-serif">';
		nextPutAll: (converter convertString: aByteString);
		nextPutAll: '</tspan>'
]

{ #category : #style }
RTSVGEntity >> addStrokeColor: stream [
	stream
		nextPutAll:
			('stroke:rgb(<1p>,<2p>,<3p>); '
				expandMacrosWith: (self strokeColor red * 256) rounded
				with: (self strokeColor green * 256) rounded
				with: (self strokeColor blue * 256) rounded)
]

{ #category : #style }
RTSVGEntity >> addStrokeOpacity: stream [
	stream nextPutAll: ('stroke-opacity:<1p>; ' expandMacrosWith: self strokeColor alpha)
]

{ #category : #style }
RTSVGEntity >> addStrokeWidth: stream [
	stream nextPutAll: ('stroke-width:<1p>; ' expandMacrosWith: self strokeWidth)
]

{ #category : #transform }
RTSVGEntity >> addTranslation: point into: stream [
	stream nextPutAll: ('translate(<1p>,<2p>) ' expandMacrosWith: point x rounded with: point y rounded)
]

{ #category : #adding }
RTSVGEntity >> addWidth: x height: y into: stream [
	stream
		nextPutAll:
				('width="<1p>" height="<2p>" ' expandMacrosWith: x with: y).
]

{ #category : #'adding-anchor' }
RTSVGEntity >> closeAnchorOn: stream [
	hasAnchor ifFalse: [ ^ self ].
	stream 
		nextPutAll: '</a>'.
	 
]

{ #category : #adding }
RTSVGEntity >> closeDef: stream [
	stream nextPutAll: '/>' , String cr
]

{ #category : #adding }
RTSVGEntity >> closeDefWithContent: stream [
	stream nextPutAll: '>' , String cr
]

{ #category : #adding }
RTSVGEntity >> closeFullDef: stream [ 
	stream 
		nextPutAll: '</',self type,'>';
		nextPutAll: String cr
]

{ #category : #adding }
RTSVGEntity >> closeTag: stream [
	stream nextPutAll: '" '
]

{ #category : #accessing }
RTSVGEntity >> element [
	^ element
]

{ #category : #accessing }
RTSVGEntity >> element: anObject [
	element := anObject
]

{ #category : #accessing }
RTSVGEntity >> fillColor [
	^ fillColor
]

{ #category : #accessing }
RTSVGEntity >> fillColor: anObject [
	fillColor := anObject
]

{ #category : #accessing }
RTSVGEntity >> id [
	id ifNil: [ id :=  element identityHash asString].
	^ id
]

{ #category : #accessing }
RTSVGEntity >> id: anObject [
	id := anObject
]

{ #category : #initialization }
RTSVGEntity >> initialize [
	super initialize.
	hasAnchor := false.
]

{ #category : #accessing }
RTSVGEntity >> label [
	^ label
]

{ #category : #accessing }
RTSVGEntity >> label: anObject [
	label := anObject
]

{ #category : #adding }
RTSVGEntity >> openDef: stream [
	stream nextPutAll: '<',self type,' id="',self label , self id , '" '
]

{ #category : #accessing }
RTSVGEntity >> position [
	^ position
]

{ #category : #accessing }
RTSVGEntity >> position: anObject [
	position := anObject
]

{ #category : #adding }
RTSVGEntity >> startClass: stream [
	stream nextPutAll: 'class="'
]

{ #category : #style }
RTSVGEntity >> startStyle: stream [
	stream nextPutAll: 'style="'
]

{ #category : #transform }
RTSVGEntity >> startTransform: stream [
	stream nextPutAll: 'transform="'
]

{ #category : #accessing }
RTSVGEntity >> strokeColor [
	^ strokeColor
]

{ #category : #accessing }
RTSVGEntity >> strokeColor: anObject [
	strokeColor := anObject
]

{ #category : #accessing }
RTSVGEntity >> strokeWidth [
	^ strokeWidth
]

{ #category : #accessing }
RTSVGEntity >> strokeWidth: anObject [
	strokeWidth := anObject
]

{ #category : #accessing }
RTSVGEntity >> type [
	^ type
]

{ #category : #accessing }
RTSVGEntity >> type: anObject [
	type := anObject
]
