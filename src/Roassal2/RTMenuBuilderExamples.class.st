Class {
	#name : #RTMenuBuilderExamples,
	#superclass : #RTBuilder,
	#category : #'Roassal2-Builder-Menu'
}

{ #category : #examples }
RTMenuBuilderExamples >> example01 [
	<script: 'self new example01 inspect'>
	"
	self new example01
	"
	| v b |
	v := RTView new.
	
	b := RTMenuBuilder new view: v.
	b menu: 'add values' background: Color red callback: [ 
		| es |
		es := (RTLabel new color: [ :tt| Color random ]) elementsOn: (1 to: 10).
		es do: [ :e | e translateTo: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ].
		v addAll: es. 
		v canvas signalUpdate ].
	
	b menu: 'remove odd' callback: [ (v elements select: [ :e | e model odd ]) do: #remove. v canvas signalUpdate ].
	b menu: 'remove even' callback: [ (v elements select: [ :e | e model even ]) do: #remove. v canvas signalUpdate ].

	b menu: 'shuffle' callback: [ 
		| tra |
		tra := RTSmoothLayoutTranslator new.
		tra nbCycles: 0.5.
		(v elements do: [ :e | tra translate: e to: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ]) ].		

	^ v
]

{ #category : #examples }
RTMenuBuilderExamples >> example02 [
	<script: 'self new example02 inspect'>
	"
	self new example02
	"
	| v b |
	v := RTView new.
	
	b := RTMenuBuilder new view: v.
	b menu: 'add' submenu: '10' background: (Color red alpha:0.3) callback: [ 
		| es |
		es := (RTLabel new color: [ :tt| Color random ]) elementsOn: (1 to: 10).
		es do: [ :e | e translateTo: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ].
		v addAll: es. 
		v canvas signalUpdate ].

	b menu: 'add' submenu: '20' background: (Color red alpha:0.3) callback: [ 
		| es |
		es := (RTLabel new color: [ :tt| Color random ]) elementsOn: (1 to: 20).
		es do: [ :e | e translateTo: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ].
		v addAll: es. 
		v canvas signalUpdate ].

	
	b menu: 'remove' submenu: 'odd' background: (Color red alpha:0.3) callback: [ (v elements select: [ :e | e model odd ]) do: #remove. v canvas signalUpdate ].
	b menu: 'remove' submenu: 'even' background: (Color red alpha:0.3) callback: [ (v elements select: [ :e | e model even ]) do: #remove. v canvas signalUpdate ].

	b menu: 'shuffle' callback: [ 
		| tra |
		tra := RTSmoothLayoutTranslator new.
		tra nbCycles: 0.5.
		(v elements do: [ :e | tra translate: e to: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ]) ].		

	^ v 
]

{ #category : #examples }
RTMenuBuilderExamples >> example03 [
	<script: 'self new example03 inspect'>

	"
	self new example03
	"
	| v b menus withBorder withText shape |
	v := RTView new.
	withBorder := false.
	withText := false.
	shape := false.
	
	b := RTMenuBuilder new view: v.
	menus := Array with: 
		'with border'->[:m | withBorder := m selected ] with:
		'with text'->[:m | withText := m selected] with:
		'ellipse'->[:m | shape := m selected].
			
	b menu: 'add element' callback: [ 
		| e t s |
		t := withText ifTrue:['Demo'] ifFalse: [ '...' ].
		e := RTLabel elementOn: t.
		
		v add: e. 
		RTVerticalLineLayout on: v elements.
		s := (shape ifTrue: [TREllipseShape] ifFalse: [TRBoxShape])
		 new extent: e encompassingRectangle extent.
		s color: Color green.
		s strokePaint: (withBorder ifTrue: [Color black] ifFalse: [nil]).
		TRConstraint move: s onTheCenterOf: e.
		v canvas addShape: s.
		s pushBack.
		v canvas signalUpdate ].
	menus := b menu: 'options' subcheckmenus: menus background: Color red.
	^ v
]

{ #category : #examples }
RTMenuBuilderExamples >> example04 [
	<script: 'self new example04 inspect'>
	"
	self new example04
	"
	| v b menus withBorder withBackground text shape |
	v := RTView new.
	withBorder := false.
	withBackground := true.
	text := 'test'.
	shape := TREllipseShape.
	b := RTMenuBuilder new view: v.
	
	b menu: 'add element' callback: [ 
		| e  s |
		
		e := RTLabel elementOn: text.
		v add: e. 
		RTVerticalLineLayout on: v elements.
		s := shape new extent: e encompassingRectangle extent.
		s color: (withBackground ifTrue: [Color green] ifFalse: [Color transparent]).
		s strokePaint: (withBorder ifTrue: [Color black] ifFalse: [nil]).
		TRConstraint move: s onTheCenterOf: e.
		v canvas addShape: s.
		s pushBack.
		v canvas signalUpdate ].
	b menu: 'Text' callback: [ text := text,'test'. ].
	

	menus := Array with: 
		('Ellipse'->[:m | shape := TREllipseShape ]) with:
		('Box'->[:m | shape := TRBoxShape]).
	
	menus := b menu: 'Shape' subcheckmenus: menus background: Color red.
	RTMenuGroup on: menus.
	menus first selected: true.
	
	menus := Array with:  
		('with background'->[:m | withBackground := m selected]) with:
		('with border'->[:m | withBorder := m selected]) .
	menus := b menu: 'opions' subcheckmenus: menus background: Color green.
	menus first selected: true.
	^ v
]

{ #category : #examples }
RTMenuBuilderExamples >> example05 [
	<script: 'self new example05 inspect'>
	"
	self new example05
	"
	| v |
	v := RTView new.

	RTMenuBuilder new
		view: v;
		menu: 'add' submenu: 'circle' background: Color red 
			callback: [ v add: (RTEllipse new size: 40) element @ RTDraggable. v signalUpdate ];
		menu: 'add' submenu: 'box' background: Color blue
			callback: [ v add: (RTBox new size: 40) element @ RTDraggable. v signalUpdate ];
		menu: 'add2' submenu: 'circle' background: Color red 
			callback: [ v add: (RTEllipse new size: 40) element @ RTDraggable. v signalUpdate ];
		menu: 'add2' submenu: 'box' background: Color blue
			callback: [ v add: (RTBox new size: 40) element @ RTDraggable. v signalUpdate ];
		
		menu: 'add3' submenu: 'circle' background: Color red 
			callback: [ v add: (RTEllipse new size: 40) element @ RTDraggable. v signalUpdate ];
		menu: 'add3' submenu: 'box' background: Color blue
			callback: [ v add: (RTBox new size: 40) element @ RTDraggable. v signalUpdate ];
		build.	
	^ v

]

{ #category : #examples }
RTMenuBuilderExamples >> example06 [
	<script: 'self new example06 inspect'>
	"
	self new example06
	"
	| v b |
	v := RTView new.
	
	b := RTMenuBuilder new view: v.
	b menu: 'add' submenu: '10' callback: [ 
		| es |
		es := (RTLabel new color: [ :tt| Color random ]) elementsOn: (1 to: 10).
		es do: [ :e | e translateTo: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ].
		v addAll: es. 
		v canvas signalUpdate ].

	b menu: 'add' submenu: '20' callback: [ 
		| es |
		es := (RTLabel new color: [ :tt| Color random ]) elementsOn: (1 to: 20).
		es do: [ :e | e translateTo: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ].
		v addAll: es. 
		v canvas signalUpdate ].

	
	b menu: 'remove' submenu: 'odd' background: (Color blue alpha:0.3) callback: [ (v elements select: [ :e | e model odd ]) do: #remove. v canvas signalUpdate ].
	b menu: 'remove' submenu: 'even' background: Color red callback: [ (v elements select: [ :e | e model even ]) do: #remove. v canvas signalUpdate ].

	b menu: 'shuffle' highlight: Color lightBlue callback: [ 
		| tra |
		tra := RTSmoothLayoutTranslator new.
		tra nbCycles: 0.5.
		(v elements do: [ :e | tra translate: e to: ((500 atRandom @ 500 atRandom) - (250 @ 250)) ]) ].		

	^ v
]
