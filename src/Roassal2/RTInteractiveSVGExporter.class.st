"
RTInteractiveSVGExporter exists for the sole porpouse of adding interactions, coming from the RTHTMLExporter, smoothly
"
Class {
	#name : #RTInteractiveSVGExporter,
	#superclass : #RTSVGExporter,
	#instVars : [
		'interactions',
		'marginX',
		'marginY',
		'paddingX',
		'paddingY',
		'functions',
		'globals',
		'buttons',
		'buttonStart'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #svg }
RTInteractiveSVGExporter >> addButtons [
	self interactions
		do: [ :l | 
			l
				do: [ :i | 
					(i type beginsWith: 'button')
						ifTrue: [ 
							(buttons includes: i fixedName)
								ifFalse: [ 
									buttonStart := i addSelf: stream startingPoint: buttonStart.
									buttons add: i fixedName ] ] ] ].
	stream nextPutAll: String cr
]

{ #category : #svg }
RTInteractiveSVGExporter >> addMarginsAndGlobals: bounds [
	| notChecked |
	notChecked := true.
	self interactions
		do: [ :l | 
			l
				do: [ :i | 
					i type = 'popup'
						ifTrue: [ 
							i bounds: bounds.
							marginX := marginX max: i xBound.
							marginY := marginY max: i yBound ].
					((i type beginsWith: 'button') and: [ notChecked ])
						ifTrue: [ 
							| val |
							val := (TRLabelShape new
								text: i getName;
								encompassingRectangle) height.
							paddingY := paddingY max: val.
							notChecked := false ].
					(globals includes: i class)
						ifFalse: [ 
							i addGlobalHandlers: stream.
							globals add: i class ] ] ].
]

{ #category : #adding }
RTInteractiveSVGExporter >> addScript [
	stream
		nextPutAll: '    <script><![CDATA[
		function init(evt){
			if(window.svgDocument == null){
				svgDocument = evt.target.ownerDocument;
			}
		}
		var popup = null;
		function showPopup(evt, id){
			if (popup != null)
				hidePopup(id);
			popup = svgDocument.getElementById(id);
			popup.setAttributeNS(null, "visibility", "visible");
		}
		function hidePopup(id){
			popup = svgDocument.getElementById(id);
			popup.setAttributeNS(null, "visibility", "hidden");
			popup = null;
		}
		 ]]></script>'
]

{ #category : #svg }
RTInteractiveSVGExporter >> addStart: bounds [
	self 
		addVersion;
		addMarginsAndGlobals: bounds;
		addCanvasSize: bounds;
		addCanvasColor;
		addXLinkVersion;
		addScript;
		selfAddHelperElements;
		addButtons;
		addCode.
]

{ #category : #svg }
RTInteractiveSVGExporter >> addVersion [
	stream nextPutAll: '<svg xmlns="http://www.w3.org/2000/svg" onload="init(evt)" '
]

{ #category : #exporting }
RTInteractiveSVGExporter >> exportOnStream: fileStream [
	|bounds|
	bounds := self fixedEncompassingRectangle.
	self stream: fileStream.
	self addStart: bounds.
	self setInteractions.
	RTSVGVisitor visit: view on: stream with: self interactions canvas: bounds center: (marginX+paddingX)@(marginY + paddingY).
	self addEnd.
]

{ #category : #svg }
RTInteractiveSVGExporter >> getFinalBounds: bounds [
	canvasWidth := (bounds width + 1 + marginX + paddingX) rounded.
	canvasHeight := (bounds height + 1 + marginY + paddingY) rounded.
	finalWidth := canvasWidth.
	finalHeight  := canvasHeight.	
	code = nil
		ifFalse: [ | maxW line w h|
			maxW := 0.
			line := ''.
			code lines do: [ :l | 
				maxW := maxW max: l size.
				maxW = l size
					ifTrue: [ line := l ].	
				].
			w := (TRLabelShape new
					text: line;
						width).
			h := (TRLabelShape new
					text: line;
						height).
			finalWidth := canvasWidth  + w.
			finalHeight := canvasHeight max: (h * code lines size) 			
			  ].
	^ Array with: finalWidth with: finalHeight
]

{ #category : #initialization }
RTInteractiveSVGExporter >> initialize [
	super initialize.
	interactions := Dictionary new.
	marginX := 0.
	marginY := 0.
	paddingX := 0.
	paddingY := 0.
	functions := OrderedCollection new.
	globals := OrderedCollection new.
	buttons := OrderedCollection new.
	buttonStart  := 0@0.
]

{ #category : #accessing }
RTInteractiveSVGExporter >> interactions [
	^ interactions
]

{ #category : #accessing }
RTInteractiveSVGExporter >> interactions: anObject [
	interactions := anObject
]

{ #category : #svg }
RTInteractiveSVGExporter >> selfAddHelperElements [
	stream
		nextPutAll: String cr;
		nextPutAll:
				'<rect id="BackDrop" x="-10%" y="-10%" width="110%" height="110%" fill="none" pointer-events="all" />' , String cr;
		nextPutAll: '<svg id="Wrapper"/>' , String cr
]

{ #category : #accessing }
RTInteractiveSVGExporter >> setInteractions [
	view canvas shapes do: [ :s | | list |
		list := TRPlatform current validInteractionsOf: s oklist: (Array with: #RTPopup).
		list do: [:pop | | interaction elements group |
			[
			interaction := RTSVGGroupPopup new.
			elements := pop createPopupFor: s element.
			interaction group: elements.
			group := interactions at: s ifAbsentPut: [ OrderedCollection new ].
			group add: interaction.
			] on: Error do: [ :ex| ] ] ].
]
