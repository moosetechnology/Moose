Class {
	#name : #RTAnimatedScatterPlot,
	#superclass : #RTBuilder,
	#instVars : [
		'tables',
		'x',
		'y',
		'color',
		'size',
		'frame',
		'maxX',
		'maxY',
		'sizeMax',
		'labelShape',
		'colors',
		'properties',
		'columns'
	],
	#category : #'Roassal2-Builder-AnimatedScatterPlot'
}

{ #category : #adding }
RTAnimatedScatterPlot >> addName: aTitle table: aTable [
	"This method will be enhanced later"
	aTable attributes at: #title put: aTitle.
	self addTable: aTable
]

{ #category : #adding }
RTAnimatedScatterPlot >> addTable: table [
	tables add: table.
	table convertColumnsAsFloat: (2 to: table numberOfColumns).
]

{ #category : #enumerating }
RTAnimatedScatterPlot >> allEntries [
	| answer |
	answer := Set new.
	tables do: [ :t | answer addAll: t firstColumn ].
	^ answer asSortedCollection asArray
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> chartTotalSize [
	^ 200
]

{ #category : #accessing }
RTAnimatedScatterPlot >> color: aBlock [
	color := aBlock
]

{ #category : #accessing }
RTAnimatedScatterPlot >> columns: columnNames [
	columns := columnNames
]

{ #category : #UI }
RTAnimatedScatterPlot >> createElements [
	| es shape |
	shape := RTEllipse new
		size: 15;
		color: (Color gray alpha: 0.4).
	es := shape elementsOn: self allEntries.
	es @ RTPopup.
	es when: TRMouseClick do: [ :evt | evt element inspect ].
	^ es
]

{ #category : #UI }
RTAnimatedScatterPlot >> createView [
	| v |
	v := RTView new.
	v setDefaultMenu.
	v @ RTDraggableView.
	^ v
]

{ #category : #UI }
RTAnimatedScatterPlot >> drawAxis [
	view canvas
		addShape:
			(TRLineShape new
				color: Color veryLightGray;
				from: 0 @ 0 to: 0 @ self chartTotalSize negated).
	view canvas
		addShape:
			(TRLineShape new
				color: Color veryLightGray;
				from: 0 @ 0 to: self chartTotalSize @ 0)
]

{ #category : #accessing }
RTAnimatedScatterPlot >> frame [
	^ frame
]

{ #category : #utlity }
RTAnimatedScatterPlot >> getTableForClasses: classes [
	"
	self new getTableForClasses: { RTAnimatedScatterPlot . RTElement . RTShape }
	"
	
	| s |
	s := WriteStream on: String new.
	classes do: [ :c |
		s nextPutAll: c name.
		s nextPut: Character tab.
		s nextPutAll: (c numberOfMethods) printString.
		s nextPut: Character tab.
		s nextPutAll: (c numberOfVariables) printString.
		s nextPut: Character tab.
		s nextPutAll: (c numberOfLinesOfCode) printString.
		s nextPut: Character tab.
		s cr.
		].
	^ s contents
]

{ #category : #utlity }
RTAnimatedScatterPlot >> getTableForPackage: packageName [
	"
	self new getTableForPackage: 'Trachel'
	"
	
	| s classes |
	classes := ((TRPlatform current packageNamed: packageName) classes collect: #baseClass) asSet.
	s := WriteStream on: String new.
	classes do: [ :c |
		s nextPutAll: c name.
		s nextPut: Character tab.
		s nextPutAll: c numberOfMethods printString.
		s nextPut: Character tab.
		s nextPutAll: c numberOfVariables printString.
		s nextPut: Character tab.
		s nextPutAll: c numberOfLinesOfCode printString.
		s nextPut: Character tab.
		s cr.
		].
	^ s contents
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> getTitleNumber: aFrameNumber table: table [
	^ (table attributes at: #title ifAbsent: ['']) , ' ' , aFrameNumber printString , '/' , self numberOfTables printString
]

{ #category : #coloring }
RTAnimatedScatterPlot >> if: aBlockForCondition color: aBlockForColor [
	properties add: [ :row :element |
		(aBlockForCondition rtValue: row) ifTrue: [ element trachelShape color: ((aBlockForColor rtValue: row) alpha: 0.4) ] ]
	
]

{ #category : #initialization }
RTAnimatedScatterPlot >> initialize [
	super initialize.
	tables := OrderedCollection new.
	frame := 1.
	properties := OrderedCollection new.
	columns := #()
]

{ #category : #accessing }
RTAnimatedScatterPlot >> maxOfColumn: aBlock [
	"aBlock is evaluated for each row, in each table, and return the maximum value"
	| max |
	max := tables first maxOfColumn: aBlock.
	tables do: [ :t |
		max := max max: (t maxOfColumn: aBlock)
		 ].
	^ max
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> nextFrame [
	frame := (frame + 1) min: self numberOfTables.
	self renderFrame: frame
	
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> numberOfTables [
	^ tables size
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> previousFrame [
	frame := (frame - 1) max: 1.
	self renderFrame: frame
	
]

{ #category : #UI }
RTAnimatedScatterPlot >> renderCurrentFrame [
	self renderFrame: frame
]

{ #category : #'public - frames' }
RTAnimatedScatterPlot >> renderFrame: aFrameNumber [
	| elements newX newY r newSize table |
	table := tables at: aFrameNumber.
	elements := self allEntries collect: [ :entryName | view elementFromModel: entryName ].
	elements
		do: [ :e | 
			"We get the row that we are interested in"
			r := table values detect: [ :rrow | rrow first = e model ] ifNone: [ nil ].
			r
				ifNil: [ 
					newSize := 0.
					newX := 0.
					newY := 0 ].
			r
				ifNotNil: [ 
					newX := (x rtValue: r) max: maxX in: (0 to: self chartTotalSize).
					newY := ((y rtValue: r) max: maxY in: (0 to: self chartTotalSize)) negated.
					newSize := (size rtValue: r) max: sizeMax in: (5 to: 30).
					properties do: [ :prop | prop value: r value: e ] ].
			view addAnimation: (RTAccelerationMove new to: newX @ newY during: 0.4 on: e).
			e trachelShape size: newSize ].	"Give indication about the frame"
	labelShape text: (self getTitleNumber: aFrameNumber table: table).
	view signalUpdate
]

{ #category : #UI }
RTAnimatedScatterPlot >> renderIn: aView [
	self setScale.
	self setAndCreateElements.
	self drawAxis.
	self setButtons.
	self setViewTitle.
	self renderCurrentFrame
]

{ #category : #UI }
RTAnimatedScatterPlot >> setAndCreateElements [
	| es |
	es := self createElements.
	view addAll: es
]

{ #category : #UI }
RTAnimatedScatterPlot >> setButtons [
	| menuBuilder |
	menuBuilder := RTMenuBuilder new view: view.
	
	menuBuilder menu: 'previous' background: (Color lightBlue alpha: 0.4) callback: [ self previousFrame ].
	menuBuilder menu: 'next' background: (Color lightBlue alpha: 0.4) callback: [ self nextFrame ].

	menuBuilder menu: 'x-axis' submenu: '0' background: (Color red alpha: 0.4) callback: [ self x: 0. self renderCurrentFrame ].
	menuBuilder menu: 'y-axis' submenu: '0' background: (Color red alpha: 0.4) callback: [ self y: 0. self renderCurrentFrame ].	
	columns withIndexDo: [ :columnName :index | 
		menuBuilder 
			menu: 'x-axis' 
			submenu: columnName
			background: (Color red alpha: 0.4)
			callback: [ self x: [ :row | row at: (index + 1) ]. self setScale. self renderCurrentFrame ].
		menuBuilder 
			menu: 'y-axis' 
			submenu: columnName
			background: (Color red alpha: 0.4)
			callback: [ self y: [ :row | row at: (index + 1) ]. self setScale. self renderCurrentFrame ].
	].


]

{ #category : #UI }
RTAnimatedScatterPlot >> setMaxSize [
	sizeMax := self maxOfColumn: size
]

{ #category : #UI }
RTAnimatedScatterPlot >> setScale [
	self setMaxSize.
	maxX := self maxOfColumn: x.
	maxY := self maxOfColumn: y
]

{ #category : #UI }
RTAnimatedScatterPlot >> setViewTitle [
	labelShape := TRLabelShape new text: 'Hello'.
	view canvas addFixedShape: labelShape.
	TRConstraint stickAtTheBottomOfTheWindow: labelShape 

]

{ #category : #accessing }
RTAnimatedScatterPlot >> size: aBlock [
	size := aBlock
]

{ #category : #accessing }
RTAnimatedScatterPlot >> x: aBlock [
	x := aBlock
]

{ #category : #accessing }
RTAnimatedScatterPlot >> y: aBlock [
	y := aBlock
]
