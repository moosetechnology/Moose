"
Class implementing a slider with two cursors, useful for selection of intervals
"
Class {
	#name : #RTDoubleSlider,
	#superclass : #RTBuilder,
	#instVars : [
		'callback',
		'labelled',
		'position',
		'sliderElements',
		'min',
		'max',
		'useIntegerLabel',
		'extremity1',
		'extremity2',
		'line',
		'cursorMin',
		'cursorMax',
		'lineCursor'
	],
	#category : #'Roassal2-Builder-UI-Slider'
}

{ #category : #private }
RTDoubleSlider >> addDraggableInteractions [
	| draggable w1 w2 |
	draggable := RTConstrainedDraggable new.
	draggable rectangle: [ 
		w1 := (cursorMin encompassingRectangle width/2)@0.
		(extremity1 position - w1) corner: (extremity2 position+w1) ].
	draggable afterBlock: [ self eventForCursorMin: true ].
	cursorMin @ draggable.
	cursorMin translateTo: 0 @ 0.

	draggable := RTConstrainedDraggable new.
	draggable rectangle: [
		w2 := (cursorMax encompassingRectangle width/2)@0.
		(extremity1 position - w2) corner: (extremity2 position+w2) ].
	draggable afterBlock: [ self eventForCursorMax: true ].
	cursorMax @ draggable.
	cursorMax translateTo: 200 @ 0.
	
	draggable := RTConstrainedDraggable new.
	draggable rectangle: [ extremity1 position corner: extremity2 position].
	draggable afterBlock: [ self eventForLineCursor ].
	lineCursor @ draggable.
	lineCursor translateTo: 100@0.
	lineCursor trachelShape width: 200.
	
]

{ #category : #private }
RTDoubleSlider >> addLabelsIfNecessary [
	| positionMin positionMax |
	labelled ifFalse: [ ^ self ].
	
	positionMin := (cursorMin position x - extremity1 position x)
		/ (extremity2 position x - extremity1 position x).
	positionMin := positionMin * (max - min) + min.
	positionMin := useIntegerLabel
		ifTrue: [ (positionMin round: 0) asInteger ]
		ifFalse: [ positionMin round: 2 ].
	positionMax := (cursorMax position x - extremity1 position x)
		/ (extremity2 position x - extremity1 position x).
	positionMax := positionMax * (max - min) + min.
	positionMax := useIntegerLabel
		ifTrue: [ (positionMax round: 0) asInteger ]
		ifFalse: [ positionMax round: 2 ].
	cursorMin @ (RTLabeled new text: positionMin).
	cursorMax @ (RTLabeled new text: positionMax)
]

{ #category : #private }
RTDoubleSlider >> adjustPosition: order [
	| p1 p2 cmin cmax |
	p1 := cursorMin position.
	p2 := cursorMax position.
	order ifTrue: [ cmin:= cursorMin. cmax:=cursorMax ]
		ifFalse: [ cmin:=cursorMax. cmax:=cursorMin ].
	p1 x > p2 x ifTrue: [ cmin translateTo: (cmax position x @ cmin position y). ].
]

{ #category : #public }
RTDoubleSlider >> build [
	| allElements res |
	allElements := view elements.
	res := super build.
	TRConstraint move: sliderElements to: position and: allElements.
	^ res
]

{ #category : #accessing }
RTDoubleSlider >> callback [
	^ callback
]

{ #category : #accessing }
RTDoubleSlider >> callback: aTwoArgBlock [
	"everytime the slider is moved the aTwoArgBlock will be evaluated with 2 arguments which correspond 
	to the position of the 2 cursors of the double slider, from the configured min value to the configured max value"
	callback := aTwoArgBlock
]

{ #category : #examples }
RTDoubleSlider >> createElements [
	sliderElements := RTGroup new.
	extremity1 := (RTBox new width: 5; height: 10) element.
	extremity2 := (RTBox new width: 5; height: 10) element.
	line := (RTLine new width: 5) edgeFrom: extremity1 to: extremity2.
	extremity2 translateTo: 200 @ 0.
	
	cursorMin := self elementOn: nil.
	cursorMax := self elementOn: nil.
	lineCursor := (RTBox new height: 8; color: Color blue trans) element.
	
	sliderElements
		add: extremity1;
		add: extremity2;
		add: line;
		add: lineCursor;
		add: cursorMin;
		add: cursorMax.
]

{ #category : #hooks }
RTDoubleSlider >> createShapeBuilder [
	"RTBox new color: (Color red alpha: 0.5); width: 15; height: 20"
	^ super createShapeBuilder
		rectangle;
		color: (Color red alpha: 0.5);
		width: 10;
		height: 20;
		yourself
]

{ #category : #private }
RTDoubleSlider >> eventForCursor: propagate order: order [
	| p1 p2 pmin pmax e1 e2 res |
	self adjustPosition: order.
	p1 := cursorMin position.
	p2 := cursorMax position.
	e1 := extremity1 position.
	e2 := extremity2 position.
	pmin := (p1 x - e1 x)/ (e2 x - e1 x).
	pmin := (pmin * (max - min)) + min.
	pmax := (p2 x - e1 x)/(e2 x - e1 x).
	pmax := (pmax * (max - min))+min.
	res := Array with: pmin with: pmax.
	propagate ifTrue: [ 
		callback rtValue: res.
		self updateLineCursor ].
	self updateLabel: order 
		with: (order ifTrue: [ pmin ] ifFalse: [ pmax ] ).
	^ res
]

{ #category : #private }
RTDoubleSlider >> eventForCursorMax: propagate [
	^ self eventForCursor: propagate order: false.
]

{ #category : #private }
RTDoubleSlider >> eventForCursorMin: propagate [
	^ self eventForCursor: propagate order: true.
]

{ #category : #private }
RTDoubleSlider >> eventForLineCursor [
	| p w2 res |
	p := lineCursor position.
	w2 := (lineCursor trachelShape width/2) @ 0.
	cursorMin translateTo: p - w2.
	cursorMax translateTo: p + w2.
	self eventForCursorMax: false.
	res := self eventForCursorMin: false.
	callback rtValue: res.
]

{ #category : #examples }
RTDoubleSlider >> example01 [
	"
		self new example01
	"
	| v label1 label2 doubleSlider composer |
	v := RTView new.
	
	composer := RTComposer new.
	composer view: v.
	
	label1 := RTLabel elementOn: 0.
	v add: label1.
	composer group: label1.
	
	label2 := RTLabel elementOn: 0.
	v add: label2.
	composer group: label2.
	
	doubleSlider := RTDoubleSlider new.
	doubleSlider view: v.
	doubleSlider labeled.
	doubleSlider callback: [ :cursor1 :cursor2 | 
		label1 model: cursor1 * 100.
		label1 updateShape.
		label2 model: cursor2 * 100.
		label2 updateShape. ].
	doubleSlider move: #below.
	doubleSlider build.
	composer group: doubleSlider.
	
	composer layout: (RTVerticalLineLayout new gapSize: 25; center).
	^ v
	 
]

{ #category : #initialization }
RTDoubleSlider >> initialize [
	super initialize.
	labelled := false.
	callback := [ :arg1 :arg2 | ].
	sliderElements := #().
	min := 0.0.
	max := 1.0.
	useIntegerLabel := false.
]

{ #category : #accessing }
RTDoubleSlider >> isLabelled [
	^labelled
]

{ #category : #accessing }
RTDoubleSlider >> labeled [
	labelled := true
]

{ #category : #obsolete }
RTDoubleSlider >> labelled [
	self deprecated: 'Please, use #labeled instead'.
	self labeled
]

{ #category : #accessing }
RTDoubleSlider >> max [
	^ max
]

{ #category : #accessing }
RTDoubleSlider >> max: aNumber [
	self assert: [ min <= aNumber ] description: 'Max value cant be smaller than the min value'.
	max := aNumber
]

{ #category : #accessing }
RTDoubleSlider >> min [
	^ min
]

{ #category : #accessing }
RTDoubleSlider >> min: aNumber [
	self assert: [ aNumber <= max ] description: 'Min value cant be bigger than the max value'.
	min := aNumber
]

{ #category : #accessing }
RTDoubleSlider >> move: aSymbol [
	position := aSymbol
]

{ #category : #hooks }
RTDoubleSlider >> renderIn: aView [
	self createElements.
	aView addAll: sliderElements.
	self addDraggableInteractions.
	self addLabelsIfNecessary.
	
]

{ #category : #private }
RTDoubleSlider >> updateLabel: order with: value [
	| label |
	label := order ifTrue: [ cursorMin ] ifFalse: [ cursorMax ].
	(label attributes includesKey: #RTLabelledLabel) 
		ifTrue: [label := label attributeAt: #RTLabelledLabel.]
		ifFalse: [ ^ self ].
	labelled ifTrue: [ 
		label text: (useIntegerLabel 
			ifTrue: [ (value round: 0) asInteger]
			ifFalse: [ value round: 2 ] ) asString. ]
]

{ #category : #private }
RTDoubleSlider >> updateLineCursor [
	| p1 p2 |
	p1 := cursorMax position.
	p2 := cursorMin position.
	
	lineCursor trachelShape 
		width: p1 x - p2 x;
		translateTo: (p1 interpolateTo: p2 at: 0.5).
]

{ #category : #accessing }
RTDoubleSlider >> useIntegerLabel [
	"sets the display of the slider's label using an integral value instead of a floating point one
	ex:
		slider useIntegerLabel
	"
	useIntegerLabel := true
]

{ #category : #accessing }
RTDoubleSlider >> usingIntegerLabel [
	^useIntegerLabel
]
