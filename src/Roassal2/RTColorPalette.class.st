"
Each ColorPalette is a set of beautiful color schemes in a context for a specific purpose.

Each palette contains several color schemes. Each scheme can be selected in different numbers of colors: 3 or 5 or 11 (depends on each scheme).

We have three palettes:
- Qualitative: helps to distinguish different classes of data. 
- Sequential: useful for showing graduable data with a very light ""low color"" increasing darkness to ""high color"".
- Diverging: it contains color scales with diverging colors on the extremes and transition colors from one extreme to the other. 

More detailed information is on it class comments.

---Copyright:
All colors, palettes and schemes are from www.ColorBrewer.org by Cynthia A. Brewer, Geography, Pennsylvania State University.
"
Class {
	#name : #RTColorPalette,
	#superclass : #RTObject,
	#classInstVars : [
		'palette'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #palettes }
RTColorPalette class >> diverging [

	^ RTCPDiverging new
]

{ #category : #info }
RTColorPalette class >> info [

	self subclassResponsibility 
]

{ #category : #default }
RTColorPalette class >> initializePalette [

	palette := self rawPalette asDictionary.
	palette keysDo: [ :k |  |v|
			v := palette at: k.
			palette at: k put: v asDictionary.
		 ]
]

{ #category : #public }
RTColorPalette class >> palette [

	^ palette ifNil: [ 
			self initializePalette.
			palette.
		 ]
]

{ #category : #public }
RTColorPalette class >> paletteFor: aColorScheme [
	"Returns an instance of CPDiverging, CPQualitative or CPSequential depending on which of them has the color scheme"
	^ ((self subclasses collect: [:cls | Array with: cls with: cls palette ] ) detect: [ :p | p second keys includes: aColorScheme ]) first new
]

{ #category : #info }
RTColorPalette class >> paletteName [
	|clsName|
	clsName := self asString. 
	^ clsName copyFrom: 5 to: clsName size. 
]

{ #category : #palettes }
RTColorPalette class >> qualitative [

	^ RTCPQualitative new
]

{ #category : #default }
RTColorPalette class >> rawPalette [
	"Here you will find all the scales with colors as tripets of rgb numbers [0..255]"
	self subclassResponsibility

]

{ #category : #public }
RTColorPalette class >> reset [
	"After executing this you would want to execute #palette to initialize it"
	palette := nil.
]

{ #category : #palettes }
RTColorPalette class >> sequential [

	^ RTCPSequential new
]

{ #category : #public }
RTColorPalette class >> show [
	"Open a window showing all colors scales of the palette"
	^ self new show
]

{ #category : #'showing palette' }
RTColorPalette >> addTitleTo: groups on: view [
	|label|
	label := (RTLabel new text: (self class paletteName)) element.
	label translateBy: 0 @label height negated.
	view add: label.
	
	"Adding info"
	label @ (RTPopup new group: [:infoGroup :el |
			| background elements|
			elements := OrderedCollection new.
			background := (RTBox new color: (Color white alpha: 0.7)) element.
			
			"add name of subpalette on the left of palette"
			(';' split: self class info) do: [ :line | 
				elements add: (RTLabel new text: line) element.
			 ].
			RTVerticalLineLayout on: elements.
			RTNest new centerOn: background elements: elements.
			
			infoGroup add: background .
			infoGroup addAll: elements.
		]).
		

]

{ #category : #public }
RTColorPalette >> colors: nbOfColors [ 
	
	|palette scheme|
	palette := self palette.
	scheme := palette keys atRandom.
	
	^ self colors: nbOfColors scheme: scheme.
	
]

{ #category : #public }
RTColorPalette >> colors: nbOfColors scheme: aString [ 
	|palette scheme|
	palette := self palette.
	
	"ERROR: number of colors is not an integer."
	nbOfColors isInteger ifFalse: [ 
		^ self error: 'Please, provide a correct number of colors' ].
	
	"ERROR: scheme not found"
	scheme := palette at: aString ifAbsent: [ 
		^ self error: 'Scheme not found. Try with: ',(', ' join: palette keys)].
	
	"Convert to list of colors and return"
	^ self convertSchemeToColors:  (scheme at: nbOfColors ifAbsent: [ 
			self error: 'Please, choice a number between: ', (',' join: scheme keys).
		 ])
]

{ #category : #public }
RTColorPalette >> colorsPerScheme [
	"It returns a list of schemes and the numbers of colors it contains"
	|table palette|
	table := OrderedCollection new.
	palette := self palette. 
	palette keysAndValuesDo: [ :k :v | table add:  k -> ((palette at: k) keys) ].
	table asDictionary inspect.
]

{ #category : #'private - processing' }
RTColorPalette >> convertSchemeToColors: aCollectionOfRGB256triplets [

	^  aCollectionOfRGB256triplets collect: [:triplet | Color fromRgb256Triplet: triplet ] 
]

{ #category : #'showing palette' }
RTColorPalette >> drawSubPallete: rawColors named: subPaletteName on: view [
	| colors group label |
	group := RTGroup new.
	colors := rawColors collect: [ :t | Color fromRgb256Triplet: t ].
	
	colors do: [ :c | |el|
			el := (RTElement on: c) + (RTBox new size: 20; color: c).
			el @ RTPopup.
			el @ (RTMouseHoverZoom new desiredExtent: [ :anElement | anElement extent * 1.7 ]).
			group add: el.
			view add: el.
		 ].
	
	label := (RTLabel new text: subPaletteName) element.	
	label @ RTHighlightable.
	label when: TRMouseClick do: [:evt | 
		Smalltalk tools workspaceTool 
			openContents: 'RTColorPalette ',(self class paletteName asLowercase),' colors: anInteger scheme:','''',subPaletteName,'''' ].	
	view add: label.
	TRConstraint stick: label trachelShape onTheLeftOf: group first trachelShape. 
	
	RTHorizontalLineLayout on: group.
	^ group.
	
]

{ #category : #accessing }
RTColorPalette >> palette [

	^ self class palette.
	
	
]

{ #category : #public }
RTColorPalette >> scheme: aString [ 
	|palette scheme nbOfColors |
	palette := self palette.
	
	"ERROR: scheme not found"
	scheme := palette at: aString ifAbsent: [ 
		^ self error: 'Scheme not found. Try with: ',(', ' join: palette keys)].
	
	nbOfColors := scheme keys max.
	
	"Convert to list of colors and return"
	^ self convertSchemeToColors:  (scheme at: nbOfColors ifAbsent: [ 
			self error: 'Please, choice a number between: ', (',' join: scheme keys).
		 ])
]

{ #category : #'showing palette' }
RTColorPalette >> show [
	| view |
	view := RTView new.
	self viewOn: view.
	view openInWindowSized: 600@700 titled: 'Color Palette: ',self class paletteName.
	^ view
]

{ #category : #'showing palette' }
RTColorPalette >> viewOn: view [
	
	| palette groups nbOfColors |
	palette := self class palette.
	groups := RTGroup new.
	nbOfColors := 10.
	
	"Draw palettes"
	palette keysAndValuesDo: [ :subPaletteName :subPalletes |
			groups add: (self drawSubPallete: (subPalletes at: (subPalletes keys max)) 
									named: subPaletteName 
									on: view).
		 ].	

	RTVerticalLineLayout on: groups.
	groups do: [ :aGroup | view addAll: aGroup ].
	
	"add title and info"
	self addTitleTo: groups on: view.
]
