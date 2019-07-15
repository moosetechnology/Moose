"
A TSOverview is a visualization of similarity between test methods as measured by TestSurgeon.

	TSOverview demo


"
Class {
	#name : #RTSimilarityMatrix,
	#superclass : #Object,
	#instVars : [
		'elements',
		'pairs',
		'action'
	],
	#category : #'Roassal2-Builder-SimilarityMatrix'
}

{ #category : #examples }
RTSimilarityMatrix class >> comparingMethodSourceCode [
	"Compare the source code of all the subclasses of ROShape"
	"Black dot means the two classes are identical"
	"White dot means the two classes are very different"
	^ RTSimilarityMatrix new
		on: RTShape withAllSubclasses
		by: [ :class1 :class2 |
			| sourceCode1 sourceCode2 s |
			"We get the source code of class1"
			s := WriteStream on: String new.
			class1 fileOutOn: s moveSource: false toFile: 0.
			sourceCode1 := s contents.
			
			"We get the source code of class2"
			s := WriteStream on: String new.
			class2 fileOutOn: s moveSource: false toFile: 0.
			sourceCode2 := s contents.
			
			(sourceCode1 lines intersection: sourceCode2 lines) size
			/ ((1 max: (sourceCode1 lines union: sourceCode2 lines) size) + 1) "NB penalty for small methods"
			];
		gridView
]

{ #category : #examples }
RTSimilarityMatrix class >> comparingWordsBetweenText [
	"methods are similar if they send the same messages; large methods are top-left"
	^ RTSimilarityMatrix new
		on: #('hello world' 'welcome to our world' 'hello means bonjour' 'bye bye')
		by: [ :m1 : m2 |
			(m1 substrings intersection: m2 substrings) size
			/ ((1 max: (m1 substrings union: m2 substrings) size) + 1) "NB penalty for small methods"
			];
		gridView
]

{ #category : #examples }
RTSimilarityMatrix class >> demo1 [
	^ RTSimilarityMatrix new
		on: (1 to: 50)
		by: [ :a :b |
			(a + b) odd
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]
			];
		viewMatrix
]

{ #category : #examples }
RTSimilarityMatrix class >> demo2 [
	"show which Collection subclasses have a similar number of methods"
	^ RTSimilarityMatrix new
		on: (Collection allSubclasses
			sort: [:a :b | a methods size < b methods size])
		by: [ :classA : classB | |a b|
			a := classA methods size.
			b := classB methods size.
			((a min: b) / ((b max: a) max: 1)) asFloat ]
		withAction: [:classA :classB |
			TRPlatform current browseClass: classA.
			TRPlatform current browseClass: classB. ] ;
		viewMatrix
]

{ #category : #examples }
RTSimilarityMatrix class >> demo3 [
	"methods are similar if they send the same messages; large methods are top-left"
	^ RTSimilarityMatrix new
		on: ((Set allSubclasses flatCollect: #methods)
					sort: [ :m1 :m2 | m1 size > m2 size ])
		by: [ :m1 : m2 |
			(m1 messages intersection: m2 messages) size
			/ ((1 max: (m1 messages union: m2 messages) size) + 1) "NB penalty for small methods"
			]
		withAction: [:m1 : m2 |
			m1 browse.
			m2 browse.
			];
		viewMatrix
]

{ #category : #interactions }
RTSimilarityMatrix >> action: aComparison [
	action
		ifNotNil: [ action value: aComparison lhs value: aComparison rhs ]
]

{ #category : #visualization }
RTSimilarityMatrix >> colorForElement: elt [
	^ Color gray: (1 - elt model similarity)
]

{ #category : #defaults }
RTSimilarityMatrix >> defaultExtent [
	^ 5@5
]

{ #category : #visualization }
RTSimilarityMatrix >> elementOn: pair For: view [
	| elt |
	elt := RTElement on: pair.
	elt + (RTBox new
		color: (self colorForElement: elt);
		extent: self defaultExtent).
	elt @ (RTPopup new text: [self popupTextFor: elt]).
	elt when: TRMouseClick do: [:event | self action: pair ].
	^ elt
]

{ #category : #visualization }
RTSimilarityMatrix >> elementOn: pair forView: view andStack: stack [
	| elt |
	elt := (RTElement on: pair ).
	elt + (RTBox new
		color: (self colorForElement: elt);
		extent: self defaultExtent
	).
	elt @ (RTPopup new text: [self popupTextFor: elt] ).

	elt when: TRMouseClick do: [:event | self action: pair ].
"	elt forward: ROMouseDragging."
	^ elt
]

{ #category : #visualization }
RTSimilarityMatrix >> gridSize [
	^ elements size
]

{ #category : #visualization }
RTSimilarityMatrix >> gridView [
	| view |
	view := RTView new.
	view addAll: (pairs collect: [ :pair | self elementOn: pair For: view ]).
	RTGridLayout new 
		gapSize: 0;
		lineItemsCount: self gridSize;
		on: view elements.
	view @ RTDraggableView.

	
"	zoomIn := self zoomInButtonOn: view.
	zoomOut := self zoomOutButtonOn: view.
"	
"	ROHorizontalLineLayout on: { zoomIn . zoomOut }.
"	"view @ (ROMiniMap new targetView: stack)."
	view open.
]

{ #category : #'initialize-release' }
RTSimilarityMatrix >> on: aCollection by: similarity [
	^ self on: aCollection by: similarity withAction: nil
]

{ #category : #'initialize-release' }
RTSimilarityMatrix >> on: aCollection by: similarity withAction: aCallBack [
	"initialize model"
	elements := aCollection.
	pairs := OrderedCollection new.
	action := aCallBack.
	elements
		do: [ : lhs |
			elements do: [ : rhs | | pair |
				pair := (RTComparison of: lhs with: rhs by: similarity).
				pairs add: pair ] ]
		displayingProgress: 'comparing elements ...'.
]

{ #category : #interactions }
RTSimilarityMatrix >> popupTextFor: elt [
	^ elt model lhs printString, String cr,
		elt model rhs printString, String cr,
		'similarity = ', elt model similarity printString
]

{ #category : #visualization }
RTSimilarityMatrix >> viewMatrix [
	"display the matrix view"
	| view |
	view := RTView new.
	view @ RTDraggableView.
	view addAll:
		(pairs collect: [ : pair | 
			self
				elementOn: pair 
				For: view ]).
	RTGridLayout new 
		gapSize: 0;
		lineItemsCount: self gridSize;
		on: view elements.
	view @ RTDraggableView.

	
	
"	view @ (ROMiniMap new targetView: stack).
"	view open.
]
