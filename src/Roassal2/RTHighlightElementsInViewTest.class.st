Class {
	#name : #RTHighlightElementsInViewTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Interactions'
}

{ #category : #tests }
RTHighlightElementsInViewTest >> testBasic [

	| v cs i |
	cs := Collection withAllSubclasses.
	v := RTView new.
	v addAll: (RTBox elementsOn: cs).
	RTGridLayout on: v elements.
	v elements @ RTPopup.
	i := RTHighlightElementsInView new.
	v @  i.
	
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 1.
	
	i highlightElementsUsing: '*Collection*'.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 2.

	i highlightElementsUsing: 'Hash'.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 2.
	
	i highlightElementsUsing: '*Array*'.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 3.
	
	i highlightElementsUsing: ''.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 1.
]

{ #category : #tests }
RTHighlightElementsInViewTest >> testBasic02 [

	| v cs i |
	cs := Collection withAllSubclasses.
	v := RTView new.
	v addAll: (RTBox elementsOn: cs).
	RTGridLayout on: v elements.
	v elements @ RTPopup.
	i := RTHighlightElementsInView new.
	v @  i.
	
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 1.
	
	i highlightElementsUsing: 'Collection'.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 2.

	i highlightElementsUsing: 'Collection'.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 2.

	"We make sure that if we select twice the same element, we should not forget it"	
	i highlightElementsUsing: ''.
	self assert: (v elements collect: [ :e | e trachelShape color ] as: Set) size equals: 1.
]

{ #category : #tests }
RTHighlightElementsInViewTest >> testBasic3 [

	| i |
	i := RTHighlightElementsInView new.
	self assert: i isNotTransparent.
	i transparent. 
	self deny: i isNotTransparent.
]
