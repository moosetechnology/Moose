"
I am a basic builder to build a matrix of scatterplot with roassal
"
Class {
	#name : #RTScatterplotMatrix,
	#superclass : #RTAbstractGrapher,
	#instVars : [
		'metrics',
		'objects',
		'xScales',
		'yScales',
		'padding',
		'boxSize',
		'shouldUseAxisForX',
		'shouldUseAxisForY',
		'generator',
		'lineShape',
		'boxShape',
		'allowEvent',
		'boxes',
		'allDotElements',
		'labelShape'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #helpers }
RTScatterplotMatrix >> addBrushInteractionIfNecessary: aView [
	| int |
	self allowSelectableView ifFalse: [ ^ self ].
	int := RTBrushInteraction new.
	int elementsToBrush: [ :group | 
		group flatCollect: [ :e | aView elementsFromModel: e model ] ].
	int domainElements: self allDotElements.
	int groups: self boxes.
	aView @ int.
]

{ #category : #accesing }
RTScatterplotMatrix >> allDotElements [
	^ allDotElements
]

{ #category : #accesing }
RTScatterplotMatrix >> allowSelectableView [
	^ allowEvent
]

{ #category : #accesing }
RTScatterplotMatrix >> allowSelectableView: aBool [
	allowEvent := aBool
]

{ #category : #accesing }
RTScatterplotMatrix >> boxShape [
	^ boxShape
]

{ #category : #accesing }
RTScatterplotMatrix >> boxShape: aShape [
	boxShape := aShape
]

{ #category : #accesing }
RTScatterplotMatrix >> boxes [
	^ boxes ifNil: [ boxes := RTGroup new ].
]

{ #category : #helpers }
RTScatterplotMatrix >> createAxisIfNecessary: aView [
	self createAxisXIfNecessary: aView.
	self createAxisYIfNecessary: aView.
	aView edges do: #pushBack 
]

{ #category : #helpers }
RTScatterplotMatrix >> createAxisXIfNecessary: aView [
	| m min max v box line e1 e2 edge axe nticks result delta size scale |
	shouldUseAxisForX ifFalse: [ ^ self ].
	m := self metrics.
	size := (boxSize*m keys size) + (padding * m keys size) + (boxSize/2)+ (padding/2).
	box := RTBox new size: 0.
	line := self lineShape.
	axe := self axisX.
	m keys doWithIndex: [ :m0 :j |
		min := Float fmax.
		max := Float fmin.
		delta := ((boxSize*j) + (padding * j))@0.
		
		self objects do: [ :o |
			v := (m at: m0) rtValue: o.
			min := min min: v.
			max := max max: v.
			 ]. 
		nticks := axe numberOfTicks.
		nticks isZero ifTrue: [ nticks := 2 ].
		result := generator searchMin: min max: max desired: axe numberOfTicks.
		scale := xScales at: m0.
		(result min to: result max by: result step) do: [ :n |
			e1 := box element.
			e2 := box element.
			edge := RTEdge from: e1 to: e2.
			edge + line.
			v := scale scale: n.
			e1 translateTo: v @(boxSize/2).
			e2 translateTo: v @size.
			e1 translateBy: delta.
			e2 translateBy: delta.
			view add: e1; add: e2; add: edge ].
		axe minValue: result min;
			maxValue: result max;
			numberOfTicks: result numberOfTicks;
			numberOfLabels: result numberOfTicks;
			axisFrom: ((scale scale: result min)@size) + delta
			to: ((scale scale: result max)@size) + delta
		].
	


]

{ #category : #helpers }
RTScatterplotMatrix >> createAxisYIfNecessary: aView [
	| m min max v box line e1 e2 edge axe nticks result delta size scale |
	shouldUseAxisForY ifFalse: [ ^ self ].
	m := self metrics.
	size := (boxSize*m keys size) + (padding * m keys size) + (boxSize/2)+ (padding/2).
	box := RTBox new size: 0.
	line := self lineShape.
	axe := self axisY.
	m keys doWithIndex: [ :m0 :j |
		min := Float fmax.
		max := Float fmin.
		delta := 0@((boxSize*j) + (padding * j)).
		
		self objects do: [ :o |
			v := (m at: m0) rtValue: o.
			min := min min: v.
			max := max max: v.
			 ]. 
		nticks := axe numberOfTicks.
		nticks isZero ifTrue: [ nticks := 2 ].
		result := generator searchMin: min max: max desired: axe numberOfTicks.
		scale := yScales at: m0.
		(result min to: result max by: result step) do: [ :n |
			e1 := box element.
			e2 := box element.
			edge := RTEdge from: e1 to: e2.
			edge + line.
			v := scale scale: n.
			e1 translateTo: (boxSize/2)@v.
			e2 translateTo: size@v.
			e1 translateBy: delta.
			e2 translateBy: delta.
			view add: e1; add: e2; add: edge ].
		axe minValue: result min;
			maxValue: result max;
			numberOfTicks: result numberOfTicks;
			numberOfLabels: result numberOfTicks;
			axisFrom: ( (boxSize/2) @(scale scale: result min)) + delta
			to: ( (boxSize/2) @(scale scale: result max)) + delta
		].
	


]

{ #category : #hooks }
RTScatterplotMatrix >> createView [
	^ RTView new @ RTDraggableView @ RTZoomableView  
]

{ #category : #initialization }
RTScatterplotMatrix >> initialize [
	super initialize.
	self padding: 15.
	self scatterBoxSize: 150.
	self shouldUseAxis: true.
	self allowSelectableView: true.
	
	self shape circle 
		size: 4; 
		color: (Color colorFrom: '#020289').
	self boxShape: (RTBox new size: self scatterBoxSize;
		color: Color transparent; 
		borderColor: Color veryLightGray).
	self lineShape: (RTLine new color: Color veryLightGray trans).
	self labelShape: (RTLabel new).
	
	generator := RTLabelGenerator nice: RTNiceStepSizeGenerator new.
	generator setLooseFlag: true.
	metrics := Dictionary new.
	

]

{ #category : #accessing }
RTScatterplotMatrix >> labelShape [
	^ labelShape
]

{ #category : #accessing }
RTScatterplotMatrix >> labelShape: aShape [
	labelShape := aShape
]

{ #category : #accesing }
RTScatterplotMatrix >> lineShape [
	^ lineShape
]

{ #category : #accesing }
RTScatterplotMatrix >> lineShape: aShape [
	lineShape := aShape
]

{ #category : #accesing }
RTScatterplotMatrix >> metrics [
	^ metrics
]

{ #category : #accesing }
RTScatterplotMatrix >> objects [
	^ objects
]

{ #category : #accessing }
RTScatterplotMatrix >> objects: aCollection [
	objects := aCollection
]

{ #category : #accesing }
RTScatterplotMatrix >> padding [
	^ padding
]

{ #category : #accesing }
RTScatterplotMatrix >> padding: aNumber [
	padding := aNumber
]

{ #category : #helpers }
RTScatterplotMatrix >> prepareScales [
	| domain range x y m value | 
	xScales := Dictionary new.
	yScales := Dictionary new.
	m := self metrics.
	
	m keys do: [ :k |
		value := m at: k.
		domain := Array 
			with: (value value: (objects minFor: value)) 
			with: (value value: (objects maxFor: value)).
		range := Array with: (padding /2)-(boxSize /2) with: (boxSize/2) - (padding/2).
		x := RTScale linear domain: domain; range: range.
		y := RTScale linear domain: domain; range: range reverse.
		xScales at: k put: x.
		yScales at: k put: y ].
]

{ #category : #hooks }
RTScatterplotMatrix >> renderIn: aView [
	self renderMatrix: aView.
	self createAxisIfNecessary: aView.
	self addBrushInteractionIfNecessary: aView.
]

{ #category : #rendering }
RTScatterplotMatrix >> renderMatrix: aView [
	| m elements x y box delta label |
	m := self metrics.
	self prepareScales.
	allDotElements := RTGroup new.
	m keys doWithIndex: [ :metric1 :j | 
		m keys doWithIndex: [ :metric2 :k |
			delta := ((k@j)* boxSize)+((k@j)*padding).
			box := self boxShape elementOn: k@j.
			box translateBy: delta.
			self boxes add: box.
			
			k = j ifTrue: [
				label := self labelShape elementOn: metric1.
				RTConstraint new
					fix: box; movable: label; inner;
					left; top; move.
				aView add: label  ].
			
			aView add: box.
			elements := self shape elementsOn: self objects.
			elements do: [ :e | 
				x := (xScales at: metric1) scale: ((m at: metric1) rtValue: e model).
				y := (yScales at: metric2) scale: ((m at: metric2) rtValue: e model).
				e translateTo: (x @ y)+delta ].
			allDotElements addAll: elements.
			aView addAll: elements.
			 ].
		].
]

{ #category : #accesing }
RTScatterplotMatrix >> scatterBoxSize [
	^ boxSize
]

{ #category : #accesing }
RTScatterplotMatrix >> scatterBoxSize: aNumber [
	boxSize := aNumber
]

{ #category : #accesing }
RTScatterplotMatrix >> shouldUseAxis: aBool [
	self shouldUseAxisForX: aBool.
	self shouldUseAxisForY: aBool.
	
]

{ #category : #accesing }
RTScatterplotMatrix >> shouldUseAxisForX: aBool [
	shouldUseAxisForX := aBool
	
]

{ #category : #accesing }
RTScatterplotMatrix >> shouldUseAxisForY: aBool [
	shouldUseAxisForY := aBool
	
]

{ #category : #example }
RTScatterplotMatrix >> simpleExample [
	<script: 'self new simpleExample inspect'>

	| data b |
	data := #(#(0.9170513021285733 0.0580469642003943 0.039843878609283574 0.0002245982079426635 0.05972580998057905 0.0019284395112519062 0.00021906741531635694 5.473034153567295e-6 ) #(0.06048091857225325 0.9166835387857581 0.0003678798636292227 0.057876396100326674 0.00025171421352151486 0.04972402349772913 7.985804967567212e-7 0.0005194571702382702 ) #(0.04622317014158704 0.00041004416698765003 0.9244099030731187 0.06839983681421519 0.000703357404647377 5.004361330987118e-6 0.04460644890296643 0.0005317834030606535 ) #(0.00024375904463163906 0.04814482773087908 0.05442601427673935 0.9039271604738842 4.660455666875091e-6 0.00020702232492367798 0.00017780875972990329 0.04925968266399622 ) #(0.036947474062634315 2.825552863661125e-5 0.0008838568131096336 2.2630966773718294e-6 0.9044321387959263 0.04916792435099527 0.059619694411017436 0.0009448845151166426 ) #(0.0009842742481259623 0.0478623864966833 1.4811612028109072e-6 0.00024742526627396177 0.05213480303079985 0.927946186713344 0.00010323374637841176 0.051160897588891995 ) #(0.0009469604744566376 4.2985596348793275e-6 0.04091471867749136 0.00039220591930379294 0.06840844695205231 0.0018678035203494939 0.9094220831260129 0.07187071938698951 ) #(2.3766234918319515e-6 0.0001901256507429913 0.00028381623526550905 0.05112224848197423 0.0004572063960853635 0.03776581656802525 0.05391160100887221 0.9093226397537215 ) ).

	b := RTScatterplotMatrix new.

	b objects: data.

	b shape circle
		size: 3.5;
		color: Color blue trans.

	b metrics
		at: '1st' put: #first;
		at: '2nd' put: #second;
		at: '3st' put: #third.

	b axisX numberOfTicks: 5.
	b axisY numberOfTicks: 5.
	^ b
]
