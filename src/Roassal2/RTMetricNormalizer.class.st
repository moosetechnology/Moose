"
A Metric normalizer is made to assign a color, or a particular shape computed from a group of elements. Consider the following example:
-=-=-=-=-=-=-=-=-=-=-=-=
""Set here the classes you wish to visualize""
classes := Collection withAllSubclasses.

v := RTView new.
v @ RTDraggableView.
shape := RTBox new.
es := shape elementsOn: classes.
v addAll: es.

RTMetricNormalizer new
	elements: es;
	normalizeWidth: #numberOfVariables;
	normalizeHeight: #numberOfMethods;
	normalizeColor: #numberOfLinesOfCode.

RTFlowLayout on: es.

v
-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTMetricNormalizer,
	#superclass : #RTObject,
	#instVars : [
		'elements',
		'view',
		'translator',
		'edges'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #accessing }
RTMetricNormalizer >> alphaColor [
	"Make all the elements translucent"
	^ self alphaColor: 0.4
]

{ #category : #accessing }
RTMetricNormalizer >> alphaColor: anAlphaValue [
	"Set an alpha color (transparency) for nodes"
	"aFloat has to be between 0.0 and 1.0"
	elements do: [ :el | 
				el trachelShape color: (el trachelShape color alpha: anAlphaValue) ] 
		 
]

{ #category : #utility }
RTMetricNormalizer >> checkNotEmpty [
	"Raise an error if no elements have been added"
	elements ifNil: [ self error: 'Need to provide a list of elements' ].
	elements ifEmpty: [ self error: 'Please specify what are the elements I should operate on using #elements:' ]
]

{ #category : #'public translation' }
RTMetricNormalizer >> directTranslation [
	translator := RTDirectLayoutTranslator new
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> distinctColor [
	"give a color to each element based on the model identify.
	Two elements have the same color if they have the same model"
	^ self distinctColorUsing: #yourself
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> distinctColorUsing: aBlockOrSymbol [
	"Give a color to each element according to the result of execution the block and symbol on each element.

	For example, the following example paints all the class according to the package the class is in:
	| b |
	b := RTMondrian new.
	b shape circle.
	b nodes: Collection withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b normalizer
		normalizeSize: #numberOfMethods;
		distinctColorUsing: #package.
	b	
	"
	| normalizer allObjects |
	allObjects := elements collect: [ :e | aBlockOrSymbol rtValue: e model ].
	allObjects removeDuplicates.
	
	normalizer := RTMultiLinearColorForIdentity new 
						objects: allObjects; 
						command: aBlockOrSymbol.

	elements do: [ :el | el trachelShape color: (normalizer rtValue: el model) ]
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> edges [
	edges ifNotNil: [ ^ edges ].
	
	edges := Set new.
	elements do: [ :el | edges addAll: el connectedEdges ]. 
	edges := edges asArray.
	^ edges
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> edges: someEdges [
	"Set the edges to take into account"
	edges := someEdges.
]

{ #category : #accessing }
RTMetricNormalizer >> elements [
	"Elements on which the normalization will occur"
	^ elements
]

{ #category : #accessing }
RTMetricNormalizer >> elements: someElements [
	elements := someElements
]

{ #category : #'public translation' }
RTMetricNormalizer >> fastSmoothTranslation [
	translator := RTSmoothLayoutTranslator new nbCycles: 0.5; yourself
]

{ #category : #utility }
RTMetricNormalizer >> getElementNormalizedValues: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model"

	self checkNotEmpty.
	(maxValue = minValue) ifTrue: [ 
		^ elements collect: [ :el | min ] ].
	
 	^ elements collect: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))) ]
]

{ #category : #utility }
RTMetricNormalizer >> getNormalizedForLineWidthValues: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model"

	self checkNotEmpty.
	(maxValue = minValue) ifTrue: [ 
		^ self edges collect: [ :edge | min ] ].
	
 	^ self edges collect: [ :edge | 
			| tt t |
			t := transformation rtValue: (metricBlock value: edge from model value: edge to model).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))) ]
]

{ #category : #utility }
RTMetricNormalizer >> getNormalizedValues: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model"

	self checkNotEmpty.
	(maxValue = minValue) ifTrue: [ 
		^ elements collect: [ :el | min ] ].
	
 	^ elements collect: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))) ]
]

{ #category : #utility }
RTMetricNormalizer >> getValue: t min: min max: max minValue: minValue maxValue: maxValue [
	maxValue = minValue ifTrue: [ ^ min ].
	^ min + ((max - min) * ( (t - minValue) / (maxValue - minValue)))
]

{ #category : #initialization }
RTMetricNormalizer >> initialize [
	super initialize.
	elements := OrderedCollection new.
	self directTranslation
]

{ #category : #accessing }
RTMetricNormalizer >> maxSize: anInteger [
	"aBlock is evaluated on each node model. 
	Set the maximum size of each element"
	elements do: [ :el | 
		el trachelShape extent: (el trachelShape extent min: anInteger @ anInteger) ]
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	^ self normalizeColor: metricBlock using: (Array with: Color gray with: Color red)
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	^ self normalizeColor: metricBlock using: colors using: #yourself
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors min: min [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	self normalizeColor: metricBlock using: colors using: #yourself min: min
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors min: min max: max [
	^ self normalizeColor: metricBlock using: colors using: #yourself min: min max: max
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| min max |
	"We get the min and the max of the metric for all the elements"
	self assert: [ elements notEmpty ] description: 'You need to provide elements using #objects:, #elements:, #fromObjects:, ... '.
	min := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	max := min.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		min := min min: t.
		max := max max: t ].
	max = 0 ifTrue: [ ^ self ].
	
	self normalizeColor: metricBlock using: colors using: transformation min: min max: max

]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors using: transformation min: min [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| max |
	"We get the min and the max of the metric for all the elements"
	self assert: [ elements notEmpty ] description: 'You need to provide elements using #objects:, #elements:, #fromObjects:, ... '.
	max := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		max := max max: t ].

	self normalizeColor: metricBlock using: colors using: transformation min: min max: max

]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColor: metricBlock using: colors using: transformation min: min max: max [
	| values normalizer |
	self checkNotEmpty.	
	
	values := (self getNormalizedValues: metricBlock 
							min: 0.0 max: 1.0 
							minValue: min maxValue: max
							using: transformation).
	normalizer := RTMultiLinearColor new colors: colors.
	elements with: values do: [ :el :v | 
		el trachelShape color: (normalizer level: v) ] 
	
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColorAsGray: metricBlock [
	"aBlock is evaluated on each node model."
	^ self normalizeColor: metricBlock using: (Array with: Color white with: Color black)
]

{ #category : #'public normalize color' }
RTMetricNormalizer >> normalizeColorUsing: colors [
	^ self normalizeColor: #yourself using: colors
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementHeight: metricBlock [
	"metricBlock is evaluated on each node model"
	^ self normalizeElementHeight: metricBlock min: 5 max: 30
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementHeight: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeElementHeight: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementHeight: metricBlock min: min max: max minValue: aMinValue maxValue: aMaxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeElementHeight: metricBlock min: min max: max minValue: aMinValue maxValue: aMaxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementHeight: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"

	| values |
	self checkNotEmpty.
	values := (self getElementNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | el trachelShape height: v ] 
	
	
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementHeight: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| minValue maxValue |
	
	self checkNotEmpty.

	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	self normalizeHeight: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementWidth: metricBlock [
	"metricBlock is evaluated on each element"
	^ self normalizeElementWidth: metricBlock min: 5 max: 30
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementWidth: metricBlock max: maxValue [
	"metricBlock is evaluated on each node. 
	 maxValue is an integer representing the maximum size in pixels for each node"
	self normalizeElementWidth: metricBlock min: 5 max: maxValue
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementWidth: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeElementWidth: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node. 
	 Colors is an array of colors used to do the fading"
		
	| values |
	self checkNotEmpty.	
	
	values := (self getElementNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | el trachelShape width: v ] 

]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeElementWidth: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node. 
	 Colors is an array of colors used to do the fading"
	
	| minValue maxValue |
	
	self checkNotEmpty.

	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	
	self normalizeElementWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation.
	
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeElementX: metricBlock min: min max: max minValue: minValue maxValue: maxValue [ 
	"
	metricBlock is evaluated on each element. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	self normalizeElementX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeElementX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"
	metricBlock is evaluated on each element. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))).
			translator translate: el to: el position + (tt @ 0) ] ] 
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeElementY: metricBlock min: min max: max minValue: minValue maxValue: maxValue [ 
	"
	metricBlock is evaluated on each element. 	

	min represent the Y value of the minimum value.
	max represent the Y value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	self normalizeElementY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeElementY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"
	metricBlock is evaluated on each element. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))).
			translator translate: el to: el position + (0 @ tt) ] ] 
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock [
	"metricBlock is evaluated on each node model"
	^ self normalizeHeight: metricBlock min: 5 max: 30
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock max: maxValue [
	"metricBlock is evaluated on each node model. 
	 maxValue is an integer representing the maximum size in pixels for each node"
	self normalizeHeight: metricBlock min: 5 max: maxValue
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeHeight: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock min: min max: max minValue: aMinValue maxValue: aMaxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeHeight: metricBlock min: min max: max minValue: aMinValue maxValue: aMaxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"

	| values |

	self checkNotEmpty.
	
	values := (self getNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | el trachelShape height: v ] 
	
	
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeHeight: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| minValue maxValue |
	
	self checkNotEmpty.

	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	self normalizeHeight: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> normalizeLineWidth: metricBlock [
	"metricBlock is a two arg block that accept the from model and the to model"
	^ self normalizeLineWidth: metricBlock min: 0.5 max: 30
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> normalizeLineWidth: metricBlock min: min max: max [
	"metricBlock is a two arg block that accept the from model and the to model"
	^ self normalizeLineWidth: metricBlock min: min max: max using: #yourself
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> normalizeLineWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	| values block |
	self checkNotEmpty.
	
	values := (self getNormalizedForLineWidthValues: metricBlock 
							min: min 
							max: max 
							minValue: minValue 
							maxValue: maxValue 
							using: transformation).
	"Very ugly hack"
	block := [ :modelOfTheEdge | modelOfTheEdge ].
	self edges with: values do: [ :edge :aValue | 
		edge model: aValue asFloat.
		edge shape width: block.
		] 
	
	
]

{ #category : #'public normalize line width' }
RTMetricNormalizer >> normalizeLineWidth: metricBlock min: min max: max using: transformation [
	"metricBlock is a two arg block that accept the from model and the to model"
	| e minValue maxValue |
	self checkNotEmpty.
	
	"We get the min and the max of the metric for all the edges"
	self edges ifEmpty: [ ^ self ].
	e := self edges anyOne.
	minValue := transformation rtValue: (metricBlock value: e from model value: e to model).
	maxValue := minValue.
	self edges do: [ :edge | 
		| t |  
		t := transformation rtValue: (metricBlock value: edge from model value: edge to model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	^ self normalizeLineWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize position' }
RTMetricNormalizer >> normalizePosition: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizePosition: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize position' }
RTMetricNormalizer >> normalizePosition: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model"
	
	| values |
	values := (self getNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | translator translate: el to: el position + (v asIntegerPoint) ] 

]

{ #category : #'public normalize position' }
RTMetricNormalizer >> normalizePosition: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node model"
	
	| minValue maxValue |
	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	(maxValue - minValue) ~= (0 @ 0) ifTrue: [ 
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			"tt := minValue + (maxValue * (t - min) / max) asInteger."
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))) asIntegerPoint.
			translator translate: el to: (tt) ] ] 

]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize [
	"Normalize the size of each element. It also assume that each model is a numerical value"
	self normalizeSize: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeSize: metricBlock min: 5 max: 30
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeSize: metricBlock min: 5 max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeSize: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"

	| values |
	self checkNotEmpty.
	
	values := (self getNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | el trachelShape extent: v @ v ] 
	
	
"	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			tt := min + ((max - min) * ( (t - minValue) / (maxValue - minValue))) asInteger.
			el trachelShape extent: tt @ tt ] ] 
	
	"
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| minValue maxValue |
	
	self checkNotEmpty.
	elements size <= 1 ifTrue: [ ^ self ].

	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	self normalizeSize: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeSize: metricBlock using: transformation [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeSize: metricBlock min: 5 max: 30 using: transformation
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeTopLeftOfX: metricBlock [
	"metricBlock is evaluated on each node model"
	^ self normalizeTopLeftOfX: metricBlock min: 0 max: 200
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeTopLeftOfX: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeTopLeftOfX: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeTopLeftOfX: metricBlock min: min max: max minValue: minValue maxValue: maxValue [ 
	"
	metricBlock is evaluated on each node model. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]
	"
		
	self normalizeTopLeftOfX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeTopLeftOfX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"
	metricBlock is evaluated on each node model. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			tt := self getValue: t min: min max: max minValue: minValue maxValue: maxValue.
			translator translateTopLeftOf: el to: el encompassingRectangle topLeft + (tt @ 0) ] ] 
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeTopLeftOfX: metricBlock min: min max: max minValue: minValue using: transformation [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	| maxValue |
	"We get the min and the max of the metric for all the elements"
	maxValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		maxValue := maxValue max: t ].
	
	self normalizeTopLeftOfX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock [
	"metricBlock is evaluated on each node model."
	^ self normalizeWidth: metricBlock min: 5 max: 30
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock max: maxValue [
	"metricBlock is evaluated on each node model. 
	 maxValue is an integer representing the maximum size in pixels for each node"
	self normalizeWidth: metricBlock min: 5 max: maxValue
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeWidth: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: min max: max minValue: minValue [
	"aBlock is evaluated on each node model"
	
	^ self normalizeWidth: metricBlock min: min max: max minValue: minValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue [
	"aBlock is evaluated on each node model"
	
	^ self normalizeWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
		
	| values |
	self checkNotEmpty.	
	
	values := (self getNormalizedValues: metricBlock 
							min: min max: max 
							minValue: minValue maxValue: maxValue 
							using: transformation).
	elements with: values do: [ :el :v | el trachelShape width: v ] 

]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: min max: max minValue: minValue using: transformation [
	"aBlock is evaluated on each node model"
	
	|  maxValue |
	
	self checkNotEmpty.

	"We get the max of the metric for all the elements"
	maxValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		maxValue := maxValue max: t ].

	self normalizeWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation

]

{ #category : #'public normalize size' }
RTMetricNormalizer >> normalizeWidth: metricBlock min: min max: max using: transformation [
	"aBlock is evaluated on each node model. 
	 Colors is an array of colors used to do the fading"
	
	| minValue maxValue |
	
	self checkNotEmpty.

	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	
	self normalizeWidth: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation.
	
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock [
	"metricBlock is evaluated on each node model"
	^ self normalizeX: metricBlock min: 0 max: 200
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeX: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: min max: max minValue: minValue [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	^ self normalizeX: metricBlock min: min max: max minValue: minValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: min max: max minValue: minValue maxValue: maxValue [ 
	"
	metricBlock is evaluated on each node model. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]
	"
		
	self normalizeX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"
	metricBlock is evaluated on each node model. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			tt := self getValue: t min: min max: max minValue: minValue maxValue: maxValue.
			translator translate: el to: el position + (tt @ 0) ] ] 
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: min max: max minValue: minValue using: transformation [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	| maxValue |
	"We get the min and the max of the metric for all the elements"
	maxValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		maxValue := maxValue max: t ].
	
	self normalizeX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize x' }
RTMetricNormalizer >> normalizeX: metricBlock min: min max: max using: transformation [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	| minValue maxValue |
	"We get the min and the max of the metric for all the elements"
	minValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	maxValue := minValue.
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	self normalizeX: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: minValue max: maxValue [
	"metricBlock is evaluated on each node model. 
	 minValue and maxValue are integer representing the minimum and maximum size in pixels for each node"
	self normalizeY: metricBlock min: minValue max: maxValue using: #yourself
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: min max: max minValue: minValue [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	^ self normalizeY: metricBlock min: min max: max minValue: minValue using: #yourself
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: min max: max minValue: minValue maxValue: maxValue [ 
	"
	metricBlock is evaluated on each node model. 	

	min represent the X value of the minimum value.
	max represent the X value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]
	"
		
	self normalizeY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: #yourself
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation [
	"
	metricBlock is evaluated on each node model. 	

	min represent the Y value of the minimum value.
	max represent the Y value of the maximum value.
	
	minValue is the minimum value of the dataset.
	maxValue is the maximum value of the dataset.
	
	[ minValue ; maxValue ] is mapped to [ min ; max ]

	transformation is used to transform the metric value"
		
	(maxValue - minValue) ~= 0 ifTrue: [
		elements do: [ :el | 
			| tt t |
			t := transformation rtValue: (metricBlock rtValue: el model).
			tt := self getValue: t min: min max: max minValue: minValue maxValue: maxValue.
			translator translate: el to: el position + (0 @ tt) ] ] 
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: min max: max minValue: minValue using: transformation [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	| maxValue |
	"We get the min and the max of the metric for all the elements"
	maxValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		maxValue := maxValue max: t ].
	
	self normalizeY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #'public normalize y' }
RTMetricNormalizer >> normalizeY: metricBlock min: min max: max using: transformation [
	"metricBlock is evaluated on each node model. 	
	 min represent the X value of the minimum value.
	 max represent the X value of the maximum value.
	 transformation is used to transform the metric value"
	
	| minValue maxValue |
	"We get the min and the max of the metric for all the elements"
	maxValue := transformation rtValue: (metricBlock rtValue: elements anyOne model).
	minValue := maxValue.
	
	elements do: [ :el | 
		| t |  
		t := transformation rtValue: (metricBlock rtValue: el model).
		minValue := minValue min: t.
		maxValue := maxValue max: t ].
	
	self normalizeY: metricBlock min: min max: max minValue: minValue maxValue: maxValue using: transformation
]

{ #category : #accessing }
RTMetricNormalizer >> objects: someObjects [
	self assert: [ view notNil ] description: 'A view has to be set'.
	
	self elements: (self view elementsFromModels: someObjects)
]

{ #category : #'public translation' }
RTMetricNormalizer >> smoothTranslation [
	translator := RTSmoothLayoutTranslator new
]

{ #category : #accessing }
RTMetricNormalizer >> view [
	^ view
]

{ #category : #accessing }
RTMetricNormalizer >> view: aViewOrAGroup [
	view := aViewOrAGroup
]
