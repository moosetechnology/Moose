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
	n := RTMetricNormalizer new
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
