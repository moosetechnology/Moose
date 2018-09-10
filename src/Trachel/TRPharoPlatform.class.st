"
I am a class for pharo platform
"
Class {
	#name : #TRPharoPlatform,
	#superclass : #TRPlatform,
	#category : #'Trachel-MorphSpecific'
}

{ #category : #testing }
TRPharoPlatform class >> isActivePlatform [
	^ true.
	"^ SmalltalkImage current vm isPharoVM".
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> affineTransformClass [
	^ AthensAffineTransform
]

{ #category : #public }
TRPharoPlatform >> browseClass: aClass [
	^ Smalltalk tools browser openOnClass: aClass
	
]

{ #category : #public }
TRPharoPlatform >> colorFormClass [
	^ ColorForm
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> computeArcPathFor: aShape [
	| i e aAngle bAngle aSin aCos bSin bCos |
	aShape canvas ifNil: [ ^ nil ].
	aAngle:=aShape alphaAngle value degreesToRadians.
	bAngle:=aShape betaAngle value degreesToRadians.
	i := aShape innerRadius value.
	e := aShape externalRadius value.
	aCos := aAngle cos.
	aSin := aAngle sin negated.
	bCos := bAngle cos.
	bSin := bAngle sin negated.
	^ aShape athensCanvas
			createPath: [ :builder | 
				builder
					absolute;
					moveTo: ((i * (bCos)) @ (i * (bSin)));
					arcTo:  ((i * (aCos)) @ (i * (aSin))) angle: bAngle - aAngle cw: true;
					ccwArcTo: ((e * (aCos)) @ (e * (aSin))) angle: 0;
					ccwArcTo: ((e * (bCos)) @ (e * (bSin))) angle: bAngle  - aAngle;
					ccwArcTo: ((i * (bCos)) @ (i * (bSin))) angle: 0 ]
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> computeCircleHeadPathFor: shape [
	| vector r unit radius center endPoint |
	vector := shape to - shape from.
	r := vector r.
	r = 0
		ifTrue: [ ^ false ].
	unit := vector / r.
	radius := unit / 2 * shape mySize.
	endPoint := shape to - (vector * (1-shape percentage)).
	center := endPoint - radius.
	^  shape athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: center + radius;
				ccwArcTo: center + radius leftRotated angle: 90 degreesToRadians;
				ccwArcTo: center - radius angle: 90 degreesToRadians;
				ccwArcTo: center - radius leftRotated angle: 90 degreesToRadians;
				ccwArcTo: center + radius angle: 90 degreesToRadians ]
	
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> computeEllipsePathFor: aShape [
	| halfWidth halfHeight rectangle |
	aShape canvas ifNil: [ ^ nil ].
	rectangle := aShape basicEncompassingRectangle.
	halfWidth := rectangle width / 2 asFloat.
	halfHeight := rectangle height / 2 asFloat.

	^ aShape athensCanvas
		createPath: [ :builder | 
			builder
				relative;
				moveTo: halfWidth negated @ 0;
				curveVia: 0 @ (halfHeight negated * 0.55)
					and: (0.45 * halfWidth) @ halfHeight negated
					to: halfWidth @ halfHeight negated;
				curveVia: (halfWidth * 0.55) @ 0 
					and: halfWidth @ (0.45 * halfHeight) 
					to: halfWidth @ halfHeight;
				curveVia: 0 @ (halfHeight * 0.55) 
					and: (0.45 * halfWidth negated) @ halfHeight 
					to: halfWidth negated @ halfHeight;
				curveVia: (halfWidth negated * 0.55) @ 0
					and: halfWidth negated @ (halfHeight negated * 0.45)
					to: halfWidth negated @ halfHeight negated ]
				
			
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> computeRoundBoxPathFor: aShape [
	| r vr hr rectangle |
	aShape canvas ifNil: [ ^ nil ].
	r := aShape borderRadius.
	vr := 0 @ r.
	hr := r @ 0.
	rectangle := aShape basicEncompassingRectangle.
	^ aShape athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: rectangle topLeft + hr;
				lineTo: rectangle topRight - hr;
				cwArcTo: rectangle topRight + vr angle: Float halfPi;
				lineTo: rectangle bottomRight - vr;
				cwArcTo: rectangle bottomRight - hr angle: Float halfPi;
				lineTo: rectangle bottomLeft + hr;
				cwArcTo: rectangle bottomLeft - vr angle: Float halfPi;
				lineTo: rectangle topLeft + vr;
				cwArcTo: rectangle topLeft + hr angle: Float halfPi;
				closePath ]
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> computeSVGPathFor: aShape [
	^ aShape athensCanvas createPath: [ :builder |
		aShape curves do: [ :each | 
			builder perform: each first withArguments: each second ]
		]
	
]

{ #category : #public }
TRPharoPlatform >> createPopupFor: aMorph in: aPoint background: aColor string: aString [
	| popup tm vertices xdelta ydelta world position |
	tm := SimpleBalloonMorph getTextMorph: aString for: aMorph.
	tm composeToBounds.
	vertices := SimpleBalloonMorph getVertices: tm bounds.
	popup := SimpleBalloonMorph new color: aColor;
		addMorph: tm; 
		setTarget: nil;
		setVertices: vertices.
	world := aMorph world 
		ifNil: [ ^ popup ].
	position := aPoint + aMorph position.
	xdelta := ydelta := 0.
	
	(position x + popup width) > world width 
		ifTrue: [ xdelta := popup width negated ].
	(position y + popup height) > world height 
		ifTrue: [ ydelta := popup height negated ].
	popup lock;
		fullBounds;
		setProperty: #morphicLayerNumber toValue: popup morphicLayerNumber.
	popup position: position + (xdelta @ydelta).
	aMorph world addMorphFront: popup.
	
	aMorph world activeHand balloonHelp: popup.
	^ popup
]

{ #category : #public }
TRPharoPlatform >> dateAndTime [
	^ DateAndTime
]

{ #category : #public }
TRPharoPlatform >> dateAndTimeClass [
	^ DateAndTime
]

{ #category : #public }
TRPharoPlatform >> dateAndTimeFromString: aString [
	^ DateAndTime fromString: aString.
]

{ #category : #utilities }
TRPharoPlatform >> dateTimeStringExample [
	^ 'Ebola2.1,POINT (-9.696645 9.945587),2014-01-01T00:00:00,2015-01-01T00:00:00,Guinea,9.945587,-9.696645,ZEBOV,528,337,64%,"Outbreak is currently ongoing in southeastern Guinea, including the capital?Conakry?and the neighbour countries?Sierra Leone?andLiberia"
Ebola2.2,POINT (32.290275 1.373333),2012-01-01T00:00:00,-0002-12-29T00:00:00,Uganda,1.373333,32.290275,SEBOV,24,17,71%,Outbreak occurred in the?Kibaale District.[34]
Ebola2.6,POINT (21.758664 -4.038333),2008-01-01T00:00:00,2009-01-01T00:00:00,Democratic Republic of Congo,-4.038333,21.758664,ZEBOV,32,14,45%,Outbreak occurred in the Mweka and Luebo health zones of the Province of?Kasai-Occidental.[33]' 
]

{ #category : #fonts }
TRPharoPlatform >> defaultFamilyFontName [
	"Default Family font"
	| fontList |
	fontList := TRPlatform current fontListStrings.
	fontList ifEmpty: [ ^ TRPlatform current defaultFont familyName ].
	
	(fontList includes: StandardFonts listFont familyName ) 
		ifTrue: [ ^ StandardFonts listFont familyName ].
	
	(fontList includes: 'Source Sans Pro') ifTrue: [ ^ 'Source Sans Pro' ].
	(fontList includes: 'DejaVu Sans') ifTrue: [ ^ 'DejaVu Sans' ].

    ^ TRPlatform current defaultFont familyName
]

{ #category : #fonts }
TRPharoPlatform >> defaultFont [
	^ StandardFonts defaultFont
]

{ #category : #public }
TRPharoPlatform >> deletePopup: popup [
	popup ifNil: [ ^ self ].
	popup do: [:e | e ifNotNil: [ e remove ] ].
]

{ #category : #windows }
TRPharoPlatform >> dialogChooseFile: pattern label: title [
	^ UIManager default chooseFullFileNameMatching: pattern label: title.
]

{ #category : #public }
TRPharoPlatform >> dialogChooseFrom: options values: values [
	^ UIManager default chooseFrom: options values: values.
]

{ #category : #windows }
TRPharoPlatform >> dialogConfirm: question [
	^ UIManager default confirm: question
]

{ #category : #public }
TRPharoPlatform >> dialogInform: aMessage [
	self inform: aMessage
]

{ #category : #public }
TRPharoPlatform >> dialogRequest: request initialAnswer: answer [
	^ UIManager default request: request initialAnswer: answer.
	
]

{ #category : #public }
TRPharoPlatform >> dialogRequestSaveFilename: filename extensions: exts path: path [
	
	^ UITheme builder fileSave: filename extensions: exts path: path.
]

{ #category : #public }
TRPharoPlatform >> download: aString [
	^ ZnEasy get: aString.
]

{ #category : #'http requests' }
TRPharoPlatform >> downloadContent: aString [
	^ aString asUrl retrieveContents
]

{ #category : #public }
TRPharoPlatform >> downloadPng: aUrl [
	^ ZnEasy getPng: aUrl
]

{ #category : #'drawing - helpers' }
TRPharoPlatform >> drawTextPathFor: shape canvas: canvas [
	| f |
	canvas pathTransform restoreAfter: [ 
		canvas pathTransform
			multiplyBy: shape matrix asFloatTransform;
			translateBy: ((shape textWidth / -2) @ (shape textHeight/2)) asFloatPoint;
			translateBy: (0 @ shape descent negated) asFloatPoint.
		canvas setFont: shape font.
		f := CairoScaledFont fromFreetypeFont: shape font realFont.
		f lock.
		shape color loadOnCairoCanvas: canvas.
		canvas setPathMatrix;
			setScaledFont: f.
		canvas textPath: shape text.
		canvas fillPreserve.
		shape outlineColor loadOnCairoCanvas: canvas.
		canvas primSetLineWidth: shape outlineWidth asFloat.
		canvas stroke.
		f unlock ]
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> exampleSelectionClass [
	^ RTExampleSelection
]

{ #category : #fonts }
TRPharoPlatform >> fontFamilyName: name pointSize: number [
	"return the an instance of the default class font with that name and that size"
	^ LogicalFont familyName: name pointSize: number
]

{ #category : #public }
TRPharoPlatform >> fontFamilyName: name size: number [
	^ StrikeFont familyName: name size: number
]

{ #category : #public }
TRPharoPlatform >> fontListStrings [
	^ FontChooser new fontListStrings.
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> fontMetricsClass [
	^ CairoFontMetricsProvider
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> formCanvasClass [
	^ FormCanvas
]

{ #category : #public }
TRPharoPlatform >> formClass [
	^ Form
]

{ #category : #public }
TRPharoPlatform >> getFontForSize: aNumber [

   ^ LogicalFont familyName: StandardFonts defaultFont familyName pointSize: aNumber
]

{ #category : #public }
TRPharoPlatform >> httpClientRequestClass [
	^ ZnClient
]

{ #category : #public }
TRPharoPlatform >> imageExporterForType: imageType [
	^ (imageType = #JPEG or: imageType = #JPG)
		ifTrue: [ PluginBasedJPEGReadWriter ]
		ifFalse: [ Smalltalk at: (imageType, 'ReadWriter') asSymbol ]
]

{ #category : #public }
TRPharoPlatform >> inform: str [
	UIManager default inform: str
]

{ #category : #public }
TRPharoPlatform >> jsonReaderClass [
	^ STONJSON
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> linearGradientClass [
	^ LinearGradientPaint
	
]

{ #category : #public }
TRPharoPlatform >> materializeFromByteArray: array [
 	^ FLMaterializer materializeFromByteArray: array.
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> matrixClass [
	^ Matrix
]

{ #category : #public }
TRPharoPlatform >> menuMorphClass [
	^ MenuMorph
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> messageTallyClass [
	^ MessageTally
]

{ #category : #public }
TRPharoPlatform >> mimeDecodeToBytes: stream [
	 ^(ZnBase64Encoder new decode: stream contents) readStream
]

{ #category : #public }
TRPharoPlatform >> mimeEncode: aStream [
	^ Base64MimeConverter mimeEncode: aStream
]

{ #category : #public }
TRPharoPlatform >> mimeEncode: aStream multiLine: aBool [
	^ Base64MimeConverter mimeEncode: aStream multiLine: aBool.
]

{ #category : #public }
TRPharoPlatform >> morphClass [
	^ Morph
]

{ #category : #public }
TRPharoPlatform >> newColorFormWithExtent: extent depth: depth [
	^ ColorForm extent: extent depth: depth.
]

{ #category : #public }
TRPharoPlatform >> newFormWithExtent: extent depth: depth [
	^ Form extent: extent depth: depth
]

{ #category : #windows }
TRPharoPlatform >> openFile: filename [
	filename asUrl open
]

{ #category : #public }
TRPharoPlatform >> packageNamed: packageName [
	^ RPackageOrganizer default packageNamed: packageName
]

{ #category : #public }
TRPharoPlatform >> pngReadWriterClass [
	^ PNGReadWriter
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> polygonTesterClass [
	^ AthensPolygonTester
]

{ #category : #public }
TRPharoPlatform >> roassalIcon [
	^ Form fromBinaryStream: (self roassalIconContents base64Decoded readStream)
]

{ #category : #public }
TRPharoPlatform >> roassalIconContents [

	^ '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
TQAAAABJRU5ErkJggg=='
]

{ #category : #public }
TRPharoPlatform >> session [
	^ Smalltalk session
]

{ #category : #windows }
TRPharoPlatform >> showTemporaryCursor: cursorOrNil [
	World currentHand showTemporaryCursor: cursorOrNil
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> surfaceClass [
	^ AthensCairoSurface
]

{ #category : #'accessing-classes' }
TRPharoPlatform >> textEmphasisClass [
	^ TextEmphasis
]

{ #category : #public }
TRPharoPlatform >> trMorphClass [
	^ TRMorph
]

{ #category : #utilities }
TRPharoPlatform >> validInteractionsOf: anObject oklist: validList [
	| first list temp |
	
	first := true.
	list := OrderedCollection new.
	temp := OrderedCollection new.
	(anObject announcer subscriptions trSubscriptions do: [ :sub | 
		((validList includes: sub subscriber class name) 
		and: [ (temp includes: sub subscriber class) not ]) ifTrue: [ 
			temp add: sub subscriber class.
			list add: sub ] ] ).
	^ list collect: #subscriber.
]

{ #category : #utilities }
TRPharoPlatform >> visitInteractionsFor: aVisitor and: anObject [
	
	| first list temp |
	
	first := true.
	list := OrderedCollection new.
	temp := OrderedCollection new.
	(anObject announcer subscriptions trSubscriptions do: [ :sub | 
		((aVisitor validInteractions includes: sub subscriber class name) 
		and: [ (temp includes: sub subscriber class) not ]) ifTrue: [ 
			temp add: sub subscriber class.
			list add: sub ] ] ).
	aVisitor stream nextPutAll: '['.
	list do: [ :sub | 
		first ifTrue: [ first := false.
			sub subscriber accept: aVisitor with: anObject ]
		ifFalse: [ 
			aVisitor stream nextPutAll: ', '.
			sub subscriber accept: aVisitor with: anObject ]
		 ].
	aVisitor stream nextPutAll: ']'.	
]

{ #category : #public }
TRPharoPlatform >> widthOfString: string font: font [

	^ (font widthOfString: string)
]

{ #category : #public }
TRPharoPlatform >> widthOfString: string fontFamilyName: fontFamilyName fontSize: fontSize [
	^ self widthOfString: string font: (StrikeFont familyName: fontFamilyName size: fontSize).
]

{ #category : #public }
TRPharoPlatform >> workingDirectory [
	^ FileSystem disk workingDirectory
]
