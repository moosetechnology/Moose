Class {
	#name : #RTCompoundElementTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTCompoundElementTest >> testAdding [
	| v c es |
	v := RTView new.
	c := RTBox compoundElement.
	es := RTBox elementsOn: (1 to: 5).
	c addAll: es.
	self assert: c children equals: es.

	v add: c.
	self assert: v numberOfElements equals: 6
	
	
]

{ #category : #tests }
RTCompoundElementTest >> testBasic [

	| c |
	c := RTCompoundElement new.
	self assert: c children size equals: 0.
	self assert: c children class equals: RTGroup.
	 
]

{ #category : #tests }
RTCompoundElementTest >> testLayoutBuilder [

	| c v |
	c := RTBox compoundElement.
	c addAll: (RTBox elementsOn: (1 to: 5)).
	c layout grid.
	
	v := RTView new.
	v add: c.
	
	
	
	 
]

{ #category : #tests }
RTCompoundElementTest >> testOrder [

	| c v e |
	c := RTBox compoundElement.
	e := RTBox element.
	c add: e.
	v := RTView new.
	v add: c.
	
	self assert: v elements equals: (RTGroup with: c with: e).
	self assert: (v elements collect: #trachelShape) asArray equals: v canvas shapes asArray
	
	
	 
]
