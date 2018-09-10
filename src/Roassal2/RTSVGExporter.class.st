"
A RTSVGExporter is an exporter to get SVG files from RTBuilders or RTViews.

For exporting from a RTView, use the ""exportViewAsSVG:"" method.

For exporting a RTBuilder (or any subclasses) use the ""exportBuilderAsSVG:"" method.
"
Class {
	#name : #RTSVGExporter,
	#superclass : #RTObject,
	#instVars : [
		'view',
		'stream',
		'fileName',
		'backgroundColor',
		'code',
		'canvasWidth',
		'canvasHeight',
		'finalWidth',
		'finalHeight'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGExporter class >> exportBuilderAsSVG: aRTBuilder [

	^self exportViewAsSVG: (aRTBuilder view)
]

{ #category : #'as yet unclassified' }
RTSVGExporter class >> exportBuilderAsSVG: aRTBuilder filename: aString [
	^self exportViewAsSVG: (aRTBuilder view) filename: aString
]

{ #category : #'as yet unclassified' }
RTSVGExporter class >> exportViewAsSVG: aRTView [ 

	^ self new view: aRTView; exportToFile
]

{ #category : #'as yet unclassified' }
RTSVGExporter class >> exportViewAsSVG: aRTView filename: aString [

	^ self new view: aRTView; fileName: aString; exportToFile
]

{ #category : #'as yet unclassified' }
RTSVGExporter class >> interactiveExportBuilderAsSVG: aRTBuilder [

	^self interactiveExportViewAsSVG: (aRTBuilder view)
]

{ #category : #'as yet unclassified' }
RTSVGExporter class >> interactiveExportViewAsSVG: aRTView [ 

	^ self new view: aRTView; interactiveExportToFile
]

{ #category : #svg }
RTSVGExporter >> addCanvasColor [
	stream
		nextPutAll:
			('style="background-color: rgba(<1p>,<2p>,<3p>,<4p>);float:left" '
				expandMacrosWith: (backgroundColor red * 256) rounded
				with: (backgroundColor green * 256) rounded
				with: (backgroundColor blue * 256) rounded
				with: backgroundColor alpha)
]

{ #category : #svg }
RTSVGExporter >> addCanvasSize: bounds [
	|pair|
	pair := self getFinalBounds: bounds.
	stream 
		nextPutAll: ('width="<1p>px" height="<2p>px" ' expandMacrosWith: pair first with: pair second).
]

{ #category : #svg }
RTSVGExporter >> addCode [
	| lines hightStart step|
	code ifNil: [ ^self ].
	lines := code lines allButFirst.
	step := (TRLabelShape new
					text: lines first;
						encompassingRectangle) height.
	hightStart := (step / 2) rounded. 
	stream
		nextPutAll:
				'<rect  x="',canvasWidth asString,'" y="',0 asString,'" width="',((3*(finalWidth - canvasWidth)/4) rounded) asString,'" height="',finalHeight asString,'" fill="rgb(192,192,192)" />' , String cr.
	lines do: [ :l |  
		stream
			nextPutAll: String cr,'<text x="',(canvasWidth + 5) asString,'" y="',hightStart asString,'" font-size="12"><tspan font-family = "Arial, Helvetica, sans-serif" xml:space="preserve">',l,'</tspan></text>'.
		hightStart := hightStart + step]
]

{ #category : #svg }
RTSVGExporter >> addEnd [
	
	stream
		nextPutAll: '</svg>'.
]

{ #category : #svg }
RTSVGExporter >> addStart: bounds [
	self 
		addVersion;
		addCanvasSize: bounds;
		addCanvasColor;
		addXLinkVersion;
		addCode.
]

{ #category : #svg }
RTSVGExporter >> addVersion [
	stream nextPutAll: '<svg  xmlns="http://www.w3.org/2000/svg" '
]

{ #category : #svg }
RTSVGExporter >> addXLinkVersion [
	stream
		nextPutAll: String cr;
		nextPut: Character tab;
		nextPutAll: 'xmlns:xlink="http://www.w3.org/1999/xlink">';
		nextPutAll: String cr
]

{ #category : #accessing }
RTSVGExporter >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
RTSVGExporter >> backgroundColor: aColor [
	backgroundColor := aColor
]

{ #category : #accessing }
RTSVGExporter >> builder: builder filename: aName [
	self view: builder view filename: aName
]

{ #category : #accessing }
RTSVGExporter >> code: aString [
	code := aString
]

{ #category : #configuration }
RTSVGExporter >> defaultBackgroundColor [
	^ Color white
]

{ #category : #exporting }
RTSVGExporter >> exportOnStream: fileStream [
	| bounds |
	bounds := self fixedEncompassingRectangle.
	self stream: fileStream.
	self addStart: bounds.
	RTSVGVisitor visit: view on: stream canvas: bounds.
	self addEnd.
]

{ #category : #exporting }
RTSVGExporter >> exportToFile [

	| file |
	file := self fileName asFileReference.
	file exists ifTrue: [ file delete ].
	self fileName asFileReference writeStreamDo: [: fileStream |
		self exportOnStream: fileStream ]
]

{ #category : #accessing }
RTSVGExporter >> fileName [
	fileName = nil
		ifTrue: [ fileName := (Time current asString  copyReplaceAll: ':' with: '') squeezeOutNumber asString.
			 fileName := 'output',fileName.].
	^ fileName
]

{ #category : #accessing }
RTSVGExporter >> fileName: anObject [
	fileName := anObject
]

{ #category : #util }
RTSVGExporter >> fixedEncompassingRectangle [
 	| shapes canvas |
	shapes := self view canvas shapes.
	canvas := shapes first encompassingRectangle.
	shapes do: [ :s| |rect|
				rect := s encompassingRectangle.
				rect height < 0 
					ifTrue: [ rect := Rectangle origin: rect bottomLeft corner: rect topRight].
				canvas := canvas merge: rect.
				 ].
	^canvas 
]

{ #category : #svg }
RTSVGExporter >> getFinalBounds: bounds [
	canvasWidth := (bounds width + 2) rounded.
	canvasHeight := (bounds height + 2) rounded.
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
RTSVGExporter >> initialize [
	super initialize.
	backgroundColor := self defaultBackgroundColor
]

{ #category : #exporting }
RTSVGExporter >> interactiveExportToFile [

	| fileStream fileRef |
	
	fileRef := TRPlatform current 
		dialogRequestSaveFilename: 'Export as SVG'
		extensions: #('svg')
		path: nil.
		
	fileRef ifNil: [ TRPlatform current inform: 'Saving cancelled'. ^ self ].
	
	fileStream := fileRef writeStream.
	[ self exportOnStream: fileStream ] 
		ensure: [ fileStream notNil ifTrue: [ fileStream close ] ]
]

{ #category : #accessing }
RTSVGExporter >> stream [
	
	^stream
]

{ #category : #accessing }
RTSVGExporter >> stream: aStream [
	
	stream := aStream
]

{ #category : #accessing }
RTSVGExporter >> view [
	
	^view
]

{ #category : #accessing }
RTSVGExporter >> view: aView [
	self backgroundColor: aView canvas color.
	view := aView.
]

{ #category : #accessing }
RTSVGExporter >> view: aView filename: aName [
	self view: aView.
	self fileName: aName.
]
