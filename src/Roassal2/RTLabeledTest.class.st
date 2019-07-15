Class {
	#name : #RTLabeledTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTLabeledTest >> testAddAndRemoveLabel [

	| v e |
	e := RTEllipse elementOn: 'hello'.
	v := RTView new.
	v add: e.
	self deny: (RTLabeled hasLabel: e).
	
	e @ RTLabeled.
	self assert: (RTLabeled hasLabel: e).
	
	RTLabeled removeLabelFrom: e.
	self deny: (RTLabeled hasLabel: e).
]

{ #category : #tests }
RTLabeledTest >> testConstruction [

	RTLabeled above; below; center
]

{ #category : #tests }
RTLabeledTest >> testDefault [

	| v el |
	v := RTView new.
	el := (RTBox new size: 30) elementOn: 'hello world'.
	v add: el.
	
	el @ RTLabeled.
	self assert: v numberOfElements = 1.
	self assert: v canvas numberOfShapes = 2.
	
	self assert: v canvas shapes first class == TRLabelShape.
	self assert: v canvas shapes first position x = 0.
	self assert: v canvas shapes first position y < 10
]

{ #category : #tests }
RTLabeledTest >> testDefaultFromNumber [

	| v el |
	v := RTView new.
	el := (RTBox new size: 30) elementOn: 5.
	v add: el.
	
	el @ RTLabeled.
	self assert: v numberOfElements = 1.
	self assert: v canvas numberOfShapes = 2.
	
	self assert: v canvas shapes first class == TRLabelShape.
	self assert: v canvas shapes first position x = 0.
	self assert: v canvas shapes first position y < 10.
	self assert: v canvas shapes first text = '5'.
]

{ #category : #tests }
RTLabeledTest >> testDefaultWithNoLabel [

	| v el |
	v := RTView new.
	el := (RTBox new size: 30) element.
	v add: el.
	
	el @ RTLabeled.
	self assert: v numberOfElements = 1.
	
	"No label since there is no object behind the el"
	self assert: v canvas numberOfShapes = 1.
	
]

{ #category : #tests }
RTLabeledTest >> testRemovingLabelledElement [

	| v el |
	v := RTView new.
	el := (RTBox new size: 30) elementOn: 'hello world'.
	v add: el.
	
	el @ RTLabeled.
	self assert: v numberOfElements = 1.
	self assert: v canvas numberOfShapes = 2.
	
	el remove.
	self assert: v numberOfElements equals: 0.
	self assert: v canvas numberOfShapes equals: 0.

]

{ #category : #tests }
RTLabeledTest >> testremoveFromElements [
	| v es  |
	es := RTEllipse elementsOn: #(1 2 3).
	v := RTView new.
	v addAll: es.
	self deny: (RTLabeled hasLabel: es anyOne).
	
	es @ RTLabeled.
	self assert: (RTLabeled hasLabel: es anyOne).
	
	RTLabeled removeLabelFromElements: es.
	self deny: (RTLabeled hasLabel: es anyOne).
]
