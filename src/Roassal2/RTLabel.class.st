"
A RTLabel is a shape to describe textual shape.
-=-=-=-=
| v shape es |
v := RTView new.
shape := RTLabel new text: [ :c | 'Class ', c name ].
es := shape elementsOn: Collection withAllSubclasses.
RTGridLayout on: es.
v addAll: es.
v open
-=-=-=-=

Raw font may also be provided:
-=-=-=-=
v := RTView new.

('/Library/Fonts/' asFileReference children first: 15) do: [ :fr |
    rawFont := FreeTypeFont fromFile: fr fullName pointSize: 10 index: 0.
    v add: (RTLabel new height: 4; rawFont: rawFont; elementOn: fr basename) ].

RTVerticalLineLayout on: v elements.
v @ RTDraggableView.
v
-=-=-=-=
"
Class {
	#name : #RTLabel,
	#superclass : #RTShape,
	#instVars : [
		'text',
		'height',
		'fontName',
		'rawFont'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #configuration }
RTLabel class >> defaultColor [
	"Set the default color of RTLabel"
	^ Color gray
]

{ #category : #public }
RTLabel class >> defaultFontName [
	"Return the default font name in Roassal"
	^ TRLabelShape defaultFamilyFontName
 
]

{ #category : #public }
RTLabel class >> defaultFontSize [
	"Return the default font size in Roassal"
	^ TRLabelShape defaultFontSize
]

{ #category : #public }
RTLabel class >> text: aBlockOrValueOrSymbol [
	^ self new text: aBlockOrValueOrSymbol
]

{ #category : #configuration }
RTLabel >> defaultColor [

	^ self class defaultColor
]

{ #category : #'instance creation' }
RTLabel >> defaultText [
	^ [ :e | e model asString ]
]

{ #category : #accessing }
RTLabel >> fontName: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	"Set the font name used by the label. You can check the expression
		FontChooser new fontListStrings.
	to know the different font installed on the system"
	self fontNameElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTLabel >> fontNameElement: aValueOrABlock [
	fontName := aValueOrABlock
]

{ #category : #rendering }
RTLabel >> fontNameFor: element [
	^ (fontName rtValue: element) asString
]

{ #category : #accessing }
RTLabel >> height: aValueOrAOneArgBlock [
	"Set the height of the label"
	"aValueOrAOneArgBlock is applied on the object model"
	self heightElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTLabel >> heightElement: aValueOrABlock [
	height := aValueOrABlock
]

{ #category : #rendering }
RTLabel >> heightFor: element [
	^ height rtValue: element
]

{ #category : #initialization }
RTLabel >> initialize [
	super initialize.
	text := self defaultText.
	height := self class defaultFontSize.
	fontName := self class defaultFontName
]

{ #category : #accessing }
RTLabel >> rawFont [
	"Return the raw font used by the label. If not explictely set, then it returns null"
	^ rawFont 
]

{ #category : #accessing }
RTLabel >> rawFont: aRawFont [
	"Set the raw font. In such a case, the lookup does not happen. For example:
	
-=-=-=-=
v := RTView new.

('/Library/Fonts/' asFileReference children first: 15) do: [ :fr |
    rawFont := FreeTypeFont fromFile: fr fullName pointSize: 10 index: 0.
    v add: (RTLabel new height: 4; rawFont: rawFont; elementOn: fr basename) ].

RTVerticalLineLayout on: v elements.
v @ RTDraggableView.
v
-=-=-=-=
	"
	rawFont := aRawFont
]

{ #category : #accessing }
RTLabel >> text: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self textElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTLabel >> textElement: aStringOrABlock [

	text := aStringOrABlock
]

{ #category : #rendering }
RTLabel >> textFor: element [
	^ (text rtValue: element) asString
]

{ #category : #hooks }
RTLabel >> trachelShapeClass [
	"cancelled methods. Please check #trachelShapeForMultiLine: and #trachelShapeForOneLine:"
]

{ #category : #hooks }
RTLabel >> trachelShapeFor: anElement [
	| c txt lines    |

	c := self colorFor: anElement.
	txt := self textFor: anElement.
	lines := txt lines.
	^ lines size <= 1
		ifTrue: [ self trachelShapeForOneLine: anElement ]
		ifFalse: [ self trachelShapeForMultiLine: anElement ]

]

{ #category : #'trachel shape production' }
RTLabel >> trachelShapeForMultiLine: anElement [
	| lines s lbl txt aColor fontSize |
	aColor := self colorFor: anElement.
	fontSize := self heightFor: anElement.
	
	txt := self textFor: anElement.
	txt := txt copyReplaceAll: String tab with: '    '.
	lines := txt lines.
	 
	s := TRCompositeShape new.
	lines doWithIndex: [ :l :index | 
		lbl := TRLabelShape new text: l.
		lbl color: aColor.
		lbl fontSize: fontSize.
		s addShape: lbl " translateBy: 0 @ (index * fontSize)."
	].
	s verticalAndLeft.
"	s := TRCompositeShape new.
	lines reverse do: [ :l | 
		lbl := TRLabelShape new text: l.
		lbl color: aColor.
		lbl fontSize: fontSize.
		
		s shape1: lbl offset: lbl width / 2 @ 0.
 		
		n := TRCompositeShape new.
		n shape2: s offset: 0 @ 20.
		s := n ]."

	"s offset2: s encompassingRectangle extent negated / 2."

	^ s
]

{ #category : #'trachel shape production' }
RTLabel >> trachelShapeForOneLine: anElement [
	|  shape |	
	shape := TRLabelShape new.
	shape text: (self textFor: anElement);
				color: (self colorFor: anElement);
				position: anElement position.
	rawFont ifNil: [
		shape
				fontSize: (self heightFor: anElement);
				fontName: (self fontNameFor: anElement) ].
	rawFont ifNotNil: [ 
		shape font: rawFont
		 ].
	^ shape
]

{ #category : #rendering }
RTLabel >> updateFor: anElement trachelShape: trachelShape [	
	| c s txt   |
	trachelShape isNil ifTrue: [ ^ self ].
	s := nil.
	c := self colorFor: anElement.
	trachelShape 
		color: c;
		position: anElement position.
	txt := self textFor: anElement.
	trachelShape 
		text: txt on: anElement position;
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement)
]

{ #category : #rendering }
RTLabel >> widthFor: anElement [
	^ TRLabelShape widthOfText: (self textFor: anElement) fontName: fontName fontSize: (self heightFor: anElement)
]
