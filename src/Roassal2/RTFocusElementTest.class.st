Class {
	#name : #RTFocusElementTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #tests }
RTFocusElementTest >> testBasic [

	| v e |
	v := RTView new.
	e := (RTBox new size: 50) element.
	e @ RTFocusElement.
	v add: e.

	e announce: TRMouseDoubleClick.
]

{ #category : #tests }
RTFocusElementTest >> testBasic02 [

	| v e |
	v := RTView new.
	e := (RTBox new size: 50) element.
	e @ RTFocusElement animated.
	v add: e.

	e announce: TRMouseDoubleClick.
]
