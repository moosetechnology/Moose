Class {
	#name : #RTGridLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTGridLayoutTest >> testIsAbstract [

	self deny: RTGridLayout isAbstract.
	self assert: RTGridLayout superclass isAbstract.
]

{ #category : #tests }
RTGridLayoutTest >> testLineItemsCount [
	| layout |
	layout := RTGridLayout new.
	self assert: layout lineItemsCountBlock notNil.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 10)) equals: 4.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 2)) equals: 2.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 100)) equals: 13.
]

{ #category : #tests }
RTGridLayoutTest >> testSpaceBetweenElements [

	| v es |
	v := RTView new.
	es := (RTBox new size: 5) elementsOn: (1 to: 4).
	v addAll: es.
	RTGridLayout new on: es.
	
	self assert: (es second position - es first position) = (10 @ 0).
	self assert: (es third position - es first position) = (0 @ 10).

]

{ #category : #tests }
RTGridLayoutTest >> testWithGap [

	| layout |
	layout := RTGridLayout withGap: 5.
	self assert: layout class equals: RTGridLayout.
	self assert: layout gapSize equals: 5
]

{ #category : #tests }
RTGridLayoutTest >> testWithLineItemsCount [
	| layout |
	layout := RTGridLayout withLineItemsCount: 5.
	self assert: layout lineItemsCountBlock notNil.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 10)) equals: 5.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 2)) equals: 5.
	self assert: (layout lineItemsCountBlock rtValue: (1 to: 100)) equals: 5.
]
