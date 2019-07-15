Class {
	#name : #RTDoubleScrollBarTest,
	#superclass : #RTTest,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Builder-ScrollBar'
}

{ #category : #running }
RTDoubleScrollBarTest >> setUp [
	super setUp.
	view := RTView new
]

{ #category : #tests }
RTDoubleScrollBarTest >> testBasic [
	view @ RTDoubleScrollBar
]

{ #category : #tests }
RTDoubleScrollBarTest >> testBasic02 [

	| es |
	es := (RTBox new size: #yourself) elementsOn: (0 to: 1000 by: 100).
	view addAll: es.
	RTFlowLayout on: es.
	view @ RTDoubleScrollBar
]
