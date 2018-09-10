Class {
	#name : #RTLabelTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTLabelTest >> rotated45gridLayout [
	<gtExample>
	"
	self new rotated45gridLayout.
	"
	| v shape |
	v := RTView new.
	1 to: 20 do: [ :i |
			shape := RTRotatedLabel new.
			shape text: 'Hello World'.
			shape angleInDegree: 45.
			v add: shape element.
	].
	RTGridLayout on: v elements.
	^ v
]

{ #category : #tests }
RTLabelTest >> rotated90gridLayout [
	<gtExample>
	"
	self new rotated90gridLayout.
	"
	| v shape |
	v := RTView new.
	1 to: 20 do: [ :i |
			shape := RTRotatedLabel new.
			shape text: 'Hello World'.
			shape angleInDegree: 90.
			v add: shape element.
	].
	RTGridLayout on: v elements.
	^ v
]

{ #category : #tests }
RTLabelTest >> testDefault [
	self assert: (RTLabel new heightFor: RTElement new) = TRLabelShape new defaultFontSize.
]

{ #category : #tests }
RTLabelTest >> testEncompassing [

	| lbl rec |
	lbl := (RTLabel elementOn: 'hello world').
	rec := lbl encompassingRectangle.
	self assert: rec class == Rectangle.
	self assert: rec center = (0 @ 0).
	self assert: rec extent > (10 @ 10)
]

{ #category : #font }
RTLabelTest >> testFont [
	| v shape es firstShape fontList |
	v := RTView new.
	fontList := TRPlatform current fontListStrings.
	shape := RTLabel new 
		fontName: [ :i | fontList at: i ]; 
		text: 'The quick brown fox jumps over the lazy dog'.

	es := shape elementsOn: (1 to: fontList size).
	es @ RTPopup.

	v addAll: es.
	RTVerticalLineLayout on: v elements.

	firstShape := v canvas shapes first.
	self assert: firstShape fontName equals: fontList first.
]

{ #category : #tests }
RTLabelTest >> testHeight2 [
	| v label els |
	v := RTView new.
	label := RTLabel new.
	label height: #yourself.
	els := label elementsOn: (1 to: 3).
	self assert: els first trachelShape text = '1'.
	self assert: els first trachelShape fontSize = 1.

	self assert: els second trachelShape text = '2'.
	self assert: els second trachelShape fontSize = 2.

	self assert: els third trachelShape text = '3'.
	self assert: els third trachelShape fontSize = 3.
]

{ #category : #tests }
RTLabelTest >> testLabel [
	| label1 label2 el |
	label1 := RTLabel new.
	label2 := RTLabel new textElement: [ :e | e model, '2' ].
	el := RTElement on: 'hello'.
	self assert: (label1 textFor: el) = 'hello'.
	self assert: (label2 textFor: el) = 'hello2'.
]

{ #category : #tests }
RTLabelTest >> testLabelAndElement [
	| label el |
	label := RTLabel new textElement: [ :e | e model ].
	el := label elementOn: 'hello'.
	self assert: el width = (label widthFor: el)
]

{ #category : #tests }
RTLabelTest >> testLabelHeight [
	| label1 label2 el |
	label1 := RTLabel new text: 'hello'.
	label2 := RTLabel new text: 'hello world'.
	el := RTElement new.
	self assert: (label1 heightFor: el) = (label2 heightFor: el)
]

{ #category : #tests }
RTLabelTest >> testLabelWidth [
	| label1 label2 el |
	label1 := RTLabel new text: 'hello'.
	label2 := RTLabel new text: 'hello world'.
	el := RTElement new.
	self assert: (label1 widthFor: el) < (label2 widthFor: el)
]

{ #category : #'test multilines' }
RTLabelTest >> testMultiline01 [

	| v lbl |
	v := RTView new.
	lbl := RTLabel elementOn: 'Hello', String cr, 'World'.
	v add: lbl.
	
	lbl trachelShape setAsFixed.
	self assert: lbl trachelShape class == TRCompositeShape
]

{ #category : #tests }
RTLabelTest >> testText [
	| v label els |
	v := RTView new.
	label := RTLabel new.
	els := label elementsOn: (1 to: 30).
	self assert: els first trachelShape text = '1'.
	self assert: els second trachelShape text = '2'.
]

{ #category : #tests }
RTLabelTest >> testUpdatingShape [
	| view el |
	view := RTView new.
	el := (RTLabel new text: 'Hello') element.
	view add: el.
	
	self assert: el trachelShape class == TRLabelShape.
	self assert: el trachelShape text = 'Hello'.
	
	el shape text: 'Change'; color: Color red. el update.
	self assert: el trachelShape class == TRLabelShape.
	self assert: el trachelShape text = 'Change'.
]
