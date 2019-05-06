Class {
	#name : #RTMetricNormalizerTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #'test y' }
RTMetricNormalizerTest >> testBasicNegativeRange [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 @ 0 with: 50 @ 25 with: 100 @ 50).

	RTMetricNormalizer new
			elements: es;
			normalizeY: #y min: -200 max: 200.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ -200 with: 0 @ 0 with: 0 @ 200)
]

{ #category : #'test y' }
RTMetricNormalizerTest >> testBasicNegativeRange2 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 @ 0 with: 50 @ 25 with: 100 @ 50).

	RTMetricNormalizer new
			elements: es;
			normalizeY: #y min: -200 max: -100.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ -200 with: 0 @ -150 with: 0 @ -100)
]

{ #category : #'test y' }
RTMetricNormalizerTest >> testBasicNegativeRange3 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 @ 0 with: 50 @ 25 with: 100 @ 50).

	RTMetricNormalizer new
			elements: es;
			normalizeY: #y min: 0 max: -200.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ 0 with: 0 @ -100 with: 0 @ -200)
]

{ #category : #'test y' }
RTMetricNormalizerTest >> testBasicNegativeRange4 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 @ 0 with: 50 @ 25 with: 100 @ 50).

	RTMetricNormalizer new
			elements: es;
			normalizeY: #y min: -200 max: 0.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ -200 with: 0 @ -100 with: 0 @ 0)
]

{ #category : #'test x' }
RTMetricNormalizerTest >> testBasicNegativeRangeX [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeX: #yourself min: -200 max: 200.
	self assert: (es collect: #position) asArray equals: (Array with: -200 @ 0 with: 0 @ 0 with: 200 @ 0)
]

{ #category : #'test y' }
RTMetricNormalizerTest >> testBasicPositiveRange [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 @ 0 with: 50 @ 25 with: 100 @ 50).

	RTMetricNormalizer new
			elements: es;
			normalizeY: #y min: 0 max: 200.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ 0 with: 0 @ 100 with: 0 @ 200)
]

{ #category : #'test size' }
RTMetricNormalizerTest >> testBasicPositiveRangeSize [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeSize: #yourself min: 0 max: 200.
	self assert: (es collect: [ :e | e extent x ]) asArray equals: (Array with: 0 with: 100 with: 200)
]

{ #category : #'test size' }
RTMetricNormalizerTest >> testBasicPositiveRangeWidth [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeWidth: #yourself min: 0 max: 200.
	self assert: (es collect: [ :e | e extent x ]) asArray equals: (Array with: 0 with: 200)
]

{ #category : #'test size' }
RTMetricNormalizerTest >> testBasicPositiveRangeWidth2 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeWidth: #yourself min: 0 max: 200 minValue: 0.
	self assert: (es collect: [ :e | e extent x ]) asArray equals: (Array with: 100 with: 200)
]

{ #category : #'test x' }
RTMetricNormalizerTest >> testBasicPositiveRangeX [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 0 with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeX: #yourself min: 0 max: 200.
	self assert: (es collect: #position) asArray equals: (Array with: 0 @ 0 with: 100 @ 0 with: 200 @ 0)
]

{ #category : #'test x' }
RTMetricNormalizerTest >> testBasicPositiveRangeX2 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeX: #yourself min: 0 max: 200 minValue: 0 maxValue: 50.
	self assert: (es collect: #position) asArray equals: (Array with: 100 @ 0 with: 200 @ 0)
]

{ #category : #'test x' }
RTMetricNormalizerTest >> testBasicPositiveRangeX3 [
	
	| es |
	es := RTEllipse new elementsOn: (Array with: 25 with: 50).

	RTMetricNormalizer new
			elements: es;
			normalizeX: #yourself min: 0 max: 200 minValue: 0.
	self assert: (es collect: #position) asArray equals: (Array with: 100 @ 0 with: 200 @ 0)
]

{ #category : #'test colors' }
RTMetricNormalizerTest >> testColorFading [

	| v1 objects es1 v2 es2 |
	v1 := RTView new.
	objects := (0 to: 1).
	es1 := RTBox new elementsOn: objects.
	v1 addAll: es1.
	RTHorizontalLineLayout on: es1.
	RTMetricNormalizer new
		elements: es1;
		normalizeColor: #yourself.

	v2 := RTView new.
	objects := (10 to: 11).
	es2 := RTBox new elementsOn: objects.
	v2 addAll: es2.
	RTHorizontalLineLayout new gapSize: 0; on: es2.
	RTMetricNormalizer new
		elements: es2;
		normalizeColor: #yourself.

	es1 with: es2 do: [ :e1 :e2 | self assert: e1 trachelShape color equals: e2 trachelShape color ].
	self assert: es1 first trachelShape color equals: Color gray.
	self assert: es1 second trachelShape color equals: Color red.
]

{ #category : #'test colors' }
RTMetricNormalizerTest >> testColors [

	| v objects es n |
	v := RTView new.
	objects := (1 to: 5).
	es := RTBox new elementsOn: objects.
	v addAll: es.

	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 1.

	n := RTMetricNormalizer new.
	n view: v.
	n objects: objects.
	n distinctColor.
	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 5.
]

{ #category : #'test colors' }
RTMetricNormalizerTest >> testColors02 [

	| v objects es n |
	v := RTView new.
	objects := (1 to: 5).
	es := RTBox new elementsOn: objects.
	v addAll: es.

	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 1.

	n := RTMetricNormalizer new.
	n view: v.
	n objects: objects.
	n distinctColorUsing: #odd.
	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 2.
]

{ #category : #'test colors' }
RTMetricNormalizerTest >> testDistinctColor [

	| v data es n |
	v := RTView new.
	data := #((1) (2) (1 2)).
	data do: [ :d |
		v addAll: (RTEllipse elementsOn: d) @ RTPopup.
	].

	"Checking RTView>>elementsFromModels:"
	self assert: (v elementsFromModels: #(1 2)) size equals: 4.

	RTGridLayout on: v elements.
	n := RTMetricNormalizer new.
	n
		view: v;
		objects: #(1 2);
		distinctColor. 

	self assert: v numberOfElements equals: 4.

	"Checking the normalizer"
	self assert: n elements size equals: 4.

	"For elements 1"
	es := v elementsFromModel: 1.
	self assert: es size equals: 2.
	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 1.
	
	"For elements 2"
	es := v elementsFromModel: 2.
	self assert: es size equals: 2.
	self assert: (es collect: [ :e | e trachelShape color ]) asSet size equals: 1.

	"Elements 1 and 2 have different color"
	self assert: (v elementFromModel: 1) trachelShape color ~= (v elementFromModel: 2) trachelShape color
]

{ #category : #'test edges width' }
RTMetricNormalizerTest >> testEdgesWidth01 [

	| v eb as rel mn trLines |
	v := RTView new.
	v addAll: (RTBox elementsOn: #(1 2 3)).
	eb := RTEdgeBuilder new.
	eb view: v.
	
	as := OrderedCollection new.
	as add: 1 -> 2.
	as add: 1 -> 3.
	as add: 3 -> 1.
	eb useAssociations: as.
	
	rel := Dictionary new.
	rel at: 1 put: #(2 3 3).
   rel at: 3 put: #(1 1 1).

	mn := RTMetricNormalizer new.
	mn elements: v elements.
	mn normalizeLineWidthBasedOnOccurences: [ :aNumber | rel at: aNumber ].
	
	v edges do: #updateShape.
	"v open delete."
	
	self assert: v numberOfEdges equals: 3.
	trLines := v canvas shapes select: #isLineShape.
	self assert: trLines size equals: 3.
	
	self assert: trLines first element from model equals: 1.
	self assert: trLines first element to model equals: 2.
	self assert: trLines first width equals: 0.5.
	
	self assert: trLines second element from model equals: 1.
	self assert: trLines second element to model equals: 3.
	self assert: trLines second width equals: 15.25.

	self assert: trLines third element from model equals: 3.
	self assert: trLines third element to model equals: 1.
	self assert: trLines third width equals: 30.



]

{ #category : #'test edges width' }
RTMetricNormalizerTest >> testEdgesWidth02 [

	| v eb as rel mn |
	v := RTView new.
	v addAll: (RTBox elementsOn: #(1 2 3)).
	eb := RTEdgeBuilder new.
	eb view: v.
	
	as := OrderedCollection new.
	as add: 1 -> 2.
	as add: 1 -> 3.
	as add: 3 -> 1.
	eb useAssociations: as.
	
	self assert: v edges first model equals: 1->2.
	
	rel := Dictionary new.
	rel at: 1 put: #(2 3 3).
   rel at: 3 put: #(1 1 1).

	mn := RTMetricNormalizer new.
	mn elements: v elements.
	mn normalizeLineWidthBasedOnOccurences: [ :aNumber | rel at: aNumber ].
	
	v edges do: #updateShape.
	"v open delete."
	
	self assert: v edges first model equals: 1->2.
	
]

{ #category : #'test edges width' }
RTMetricNormalizerTest >> testLineWidthAndArrowedLine [
	| b edgeElements |
	b := RTMondrian new.
	b nodes: #(1 2 3).
	b shape shape: RTArrowedLine new.
	edgeElements := b edges useAssociations: (Array with: 1 -> 2 with: 1 -> 3).
	b normalizer
		edges: edgeElements;
		normalizeLineWidth: [ :from :to | from + to ] min: 1 max: 10.
	b layout horizontalLine.
	
	b view edges do: #updateShape.

	
	self assert: edgeElements second trachelShape shapes first width equals: 10.
	self assert: edgeElements first trachelShape shapes first width equals: 1
]

{ #category : #'test edges width' }
RTMetricNormalizerTest >> testLineWidthIsNotFraction [

| data b edgeElements |
data := Collection withAllSubclasses .

b := RTMondrian new.
b shape circle.    
b nodes: data.

edgeElements := b edges connectFrom: [ :c | c superclass ].

b normalizer
    edges: edgeElements;
    normalizeLineWidth: [ :from :to | to numberOfMethods ] min: 1 max: 10.

b layout tree.
b build.

"Drawing the visualization in a mock Pharo Canvas"
b view canvas buildMorph drawOnMockCanvas.

]

{ #category : #'test x' }
RTMetricNormalizerTest >> testNormalizeXBugTracking [

	| es |
	es := RTBox elementsOn: (0.0 to: 1.0 by: 0.005).
	self assert: es size equals: (0.0 to: 1.0 by: 0.005) size.

	RTMetricNormalizer new
		elements: es;
		normalizeElementX: [ :anElement | #yourself rtValue: anElement model ]
			min: 0
			max: 300
			minValue: 0
			maxValue: 1.2.

	RTMetricNormalizer new
		elements: es;
		normalizeY: [ :model | #yourself rtValue: model ]
			min: 0
			max: 300
			minValue: 0
			maxValue: 1.2.
	"
	es collect: #position
	"
	self assert: (es allSatisfy: [ :e | e position x = e position y ]) 
]
