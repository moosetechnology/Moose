Class {
	#name : #RTStackBarPlot,
	#superclass : #RTBuilder,
	#instVars : [
		'values',
		'normalizer',
		'widthBlock',
		'heightBlock',
		'numberOfValuesPerRow',
		'colorPalette',
		'labelBlock',
		'labelConditionalBlock',
		'labelColor',
		'legend',
		'isVertical'
	],
	#category : #'Roassal2-Builder-StackBarPlot'
}

{ #category : #'public - adding' }
RTStackBarPlot >> add: someValues [
	values add: (RTStackBarRow new values: someValues)
]

{ #category : #'public - adding' }
RTStackBarPlot >> add: someValues title: aTitle [
	values add: (RTStackBarRow new values: someValues; title: aTitle)
]

{ #category : #'private - utility' }
RTStackBarPlot >> addLabelToBarIfNecessary [
	labelBlock ifNil: [ ^ self ].
	view elements do: [ :e | 
		(labelConditionalBlock rtValue: e model)
			ifTrue: [ e @ (RTLabeled new 
				center; 
				color: labelColor; 
				setAsShouldBeInTheFront;
				text: labelBlock) ] ].
]

{ #category : #'public - configuration' }
RTStackBarPlot >> addLabelToBars [
	^ self addLabelToBars: #yourself
]

{ #category : #'public - configuration' }
RTStackBarPlot >> addLabelToBars: aBlock [

	^ self addLabelToBars: aBlock if: true
]

{ #category : #'public - configuration' }
RTStackBarPlot >> addLabelToBars: aBlock if: aConditionalBlock [

	self addLabelToBars: aBlock if: aConditionalBlock color: Color black
]

{ #category : #'public - configuration' }
RTStackBarPlot >> addLabelToBars: aBlock if: aConditionalBlock color: aLabelColor [

	labelBlock := aBlock.
	labelConditionalBlock := aConditionalBlock.
	labelColor := aLabelColor
]

{ #category : #'public - adding' }
RTStackBarPlot >> addLegend: strings [
	"The argument is a collection of string. The size of strings (ie., number of strings provided as parameter) should the of the same size than each represented tupple."
	legend := strings
"	l := RTLegendBuilder new.
	l view: b view.
	l addText: 'How people are happy'.
	l build."
]

{ #category : #'private - utility' }
RTStackBarPlot >> addLegendIfNecessary [
	| l c |
	legend ifNil: [ ^ self ].
	
	l := RTLegendBuilder new.
	l right.
	l view: view.
"	l addText: title."
	1 to: self numberOfValuesPerRow do: [ :index |
		c := self colorPalette level: (self levelFor: index).
		l addColor: c text: (legend at: index).
	].
	l build.
]

{ #category : #'public - configuration' }
RTStackBarPlot >> barWidth: aWidthBlock height: aHeightBlock [
	widthBlock := aWidthBlock.
	heightBlock := aHeightBlock.
	
]

{ #category : #accessing }
RTStackBarPlot >> colorPalette [
	^ colorPalette
]

{ #category : #hooks }
RTStackBarPlot >> createShapeBuilder [
	| sb |
	sb := RTShapeBuilder new.
	sb
			rectangle; 
			height: [ :anObject | self height rtValue: anObject ];
			width: [ :anObject | self width rtValue: anObject ];
			color: [ :association |
				self colorPalette level: (self levelFor: association value) ];
			yourself.
	^ sb
	

]

{ #category : #hooks }
RTStackBarPlot >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #configuration }
RTStackBarPlot >> defaultBarHeight [
	"Default bar height"
	^ 20
]

{ #category : #configuration }
RTStackBarPlot >> defaultBarWidth [
	^ 150
]

{ #category : #examples }
RTStackBarPlot >> example01 [

	| b |
	b := RTStackBarPlot new.
	b add: #(1 2 3 4).
	b add: #(4 3 2 1).
	b add: #(5 3 2 0).
	^ b
]

{ #category : #examples }
RTStackBarPlot >> example02 [

	
| b |
b := RTStackBarPlot new.
b interaction popupText; draggable.
b colorPalette colors: (Array with: Color blue with: Color gray with: Color red ).
b add: #(1 2 3 4 ).
b add: #(4 3 2 1).
b add: #(5 3 2 0).

b barWidth: 150 height: 20.

^ b
]

{ #category : #examples }
RTStackBarPlot >> example03 [
		
	| b |
	b := RTStackBarPlot new.
	b interaction popupText; draggable.
	b colorPalette colors: (Array with: Color blue with: Color lightBlue ).
	b add: #(37	33	0	0 0) title: 'DN1'.
	b add: #(24	26	17	3 0) title: 'DN2'.
	b add: #(25	29	15	1 0) title: 'DN3'.
	b add: #(30	33	6	1 0) title: 'DN4'.	
					
	b addLegend: #('strongly agree' 'agree' 'neutral' 'disagree' 'strongly disagree').
	b barWidth: 150 height: 20.

	b addLabelToBars: #key.

	^ b
]

{ #category : #examples }
RTStackBarPlot >> example04 [
		
	| b |
	b := RTStackBarPlot new.
	b interaction popupText; draggable.
	b colorPalette colors: (Array with: Color blue with: Color lightBlue ).
	b add: #(37	33	0	0 0) title: 'DN1'.
	b add: #(24	26	17	3 0) title: 'DN2'.
	b add: #(25	29	15	1 0) title: 'DN3'.
	b add: #(30	33	6	1 0) title: 'DN4'.	
					
	b addLegend: #('strongly agree' 'agree' 'neutral' 'disagree' 'strongly disagree').
	b barWidth: 150 height: 20.

	b addLabelToBars: #key if: [ :assoc | assoc key > 10 ].
	^ b
]

{ #category : #examples }
RTStackBarPlot >> example05 [
		
	| b |		
	b := RTStackBarPlot new.
	b interaction popupText.
	b colorPalette colors: (Array with: Color blue with: Color lightBlue ).
	b add: #(37	33	0	0 0) title: 'DN1'.
	b add: #(24	26	17	3 0) title: 'DN2'.
	b add: #(25	29	15	1 0) title: 'DN3'.
	b add: #(30	33	6	1 0) title: 'DN4'.	
					
	b addLegend: #('strongly agree' 'agree' 'neutral' 'disagree' 'strongly disagree').
	b barWidth: 260 height: 20.

	b addLabelToBars: [ :assoc | (assoc key  / b totalSum * 100) asInteger asString, '%' ] if: [:assoc | assoc key > 5 ] color: Color white.
	
	^ b
]

{ #category : #accessing }
RTStackBarPlot >> height [
	"Return the height that will be used for drawing the bars"
	^ heightBlock
]

{ #category : #accessing }
RTStackBarPlot >> horizontal [
	isVertical := false.
]

{ #category : #initialization }
RTStackBarPlot >> initialize [
	super initialize.
	values := OrderedCollection new.
	self horizontal.
	colorPalette := RTMultiLinearColorForIdentity new.
	self barWidth: self defaultBarWidth height: self defaultBarHeight.
	
	labelConditionalBlock := true.
	labelColor := Color black
]

{ #category : #accessing }
RTStackBarPlot >> isVertical [
	^ isVertical
]

{ #category : #'private - utility' }
RTStackBarPlot >> levelFor: value [ 
	| temp |
	temp := self numberOfValuesPerRow -1.
	^ temp <= 0 
		ifTrue: [ 1 ]
		ifFalse: [ (value-1) / temp]
]

{ #category : #accessing }
RTStackBarPlot >> normalizer [
	normalizer ifNil: [ normalizer := RTMetricNormalizer new ].
	^ normalizer 
]

{ #category : #accessing }
RTStackBarPlot >> numberOfValuesPerRow [
	^ numberOfValuesPerRow
]

{ #category : #configuration }
RTStackBarPlot >> offsetBetweenBarAndTitle [
	^ 21
]

{ #category : #hooks }
RTStackBarPlot >> renderIn: aView [
	| elements lines lbl maxSum|
	numberOfValuesPerRow := values first numberOfValues.
	maxSum := (values collect: #totalSum) max. 
	lines := RTGroup new.
	values
		do: [ :tupple | 
			elements := tupple values asGroup collectWithIndex: [ :aValue :index | self elementOn: aValue -> index ].
			aView addAll: elements.
			lines add: elements ].
	lines doWithIndex: [ :l :i | 
		self isVertical ifTrue: [ 
			self normalizer
				elements: l;
				normalizeHeight: [ :m | m key * maxSum / (values at: i) totalSum ]
					min: 0
					max: heightBlock
					minValue: 0
					maxValue: maxSum
			 ] ifFalse: [ 
			self normalizer
				elements: l;
				normalizeWidth: [ :m | m key * maxSum / (values at: i) totalSum ]
					min: 0
					max: widthBlock
					minValue: 0
					maxValue: maxSum
			 ] ].
	lines
		do: [ :aLineOfElements | 
			(self isVertical 
				ifTrue: [ RTVerticalLineLayout  ]
				ifFalse: [ RTHorizontalLineLayout ]) new
				gapSize: 0;
				on: aLineOfElements ].
	(self isVertical 
		ifTrue: [ RTHorizontalLineLayout ]
		ifFalse: [ RTVerticalLineLayout  ]) on: lines.
	
	self addLabelToBarIfNecessary.
	values with: lines do: [ :barRow :line | | const fix |
		barRow title ifNotNil: [ 
			lbl := (RTLabel new text: barRow title) element.
			aView add: lbl.
			fix := line first.
			self isVertical ifTrue: [
				fix := line last.
				lbl rotateByDegrees: -30 ].
			const := RTConstraint movable: lbl fix: fix.
			const outer.
			self isVertical 
				ifTrue: [ const verticalPadding: self offsetBetweenBarAndTitle; bottom ]
				ifFalse: [ const horizontalPadding: self offsetBetweenBarAndTitle; left ].
			const move] ].
	
	self addLegendIfNecessary
]

{ #category : #accessing }
RTStackBarPlot >> totalSum [
	^ values first totalSum
]

{ #category : #accessing }
RTStackBarPlot >> vertical [
	isVertical := true.
]

{ #category : #accessing }
RTStackBarPlot >> width [
	"Return the width that will be used for drawing the bars"
	^ widthBlock
]
