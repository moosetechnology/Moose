Class {
	#name : #RTVisibleTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTVisibleTest >> testBasic [

	| v e t |
	v := RTView new.
	e := RTBox element.
	v add: e.
	t := 0.
	e @ (RTVisible new 
			visibleBlock: [ :el | t := t + 1 ]; 
			invisibleBlock: [ :el | t := t - 10 ]).

	self assert: t equals: 1.
	e translateBy: 5 @ 5.
	self assert: t equals: 1.
	
	e translateTo: 1000 @ 1000.
	self assert: t equals: -9.
]

{ #category : #tests }
RTVisibleTest >> testBasicWithoutInvisibleBlock [

	| v e t |
	v := RTView new.
	e := RTBox element.
	v add: e.
	t := 0.
	e @ (RTVisible new 
			visibleBlock: [ :el | t := t + 1 ]).

	self assert: t equals: 1.
	e translateBy: 5 @ 5.
	self assert: t equals: 1.
	
	e translateTo: 1000 @ 1000.
	self assert: t equals: 1.
]

{ #category : #tests }
RTVisibleTest >> testInitialization [

	| v |
	v := RTVisible new.
	v visibleBlock rtValue: RTElement new.
	v invisibleBlock rtValue: RTElement new.
	self assert: v visibleBlock notNil.
	self assert: v invisibleBlock notNil.
]

{ #category : #tests }
RTVisibleTest >> testIsVisible [
	"The center of e is outside the canvas"
	| v e |
	v := RTView new.
	self assert: v canvas extent equals: 500 @ 500.
	
	e := (RTBox new size: 100) element.
	v add: e.
	e translateTo: 260 @ 260.

	self assert: e trachelShape isVisible
]

{ #category : #tests }
RTVisibleTest >> testIsVisible2 [
	"The center of e is outside the canvas"
	| v e |
	v := RTView new.
	self assert: v canvas extent equals: 500 @ 500.
	
	e := (RTBox new size: 100) element.
	v add: e.
	e translateTo: 248 @ 248.

	self assert: e trachelShape isVisible
]

{ #category : #tests }
RTVisibleTest >> testVisible [
	"The center of e is outside the canvas"
	| v t visible e |
	v := RTView new.
	self assert: v canvas extent equals: 500 @ 500.
	
	e := (RTBox new size: 100) element.
	v add: e.
	e translateTo: 260 @ 260.

	t := false.
	visible := RTVisible new
					visibleBlock: [ :el | t := true ].
	e @ visible.
	self assert: t
]

{ #category : #tests }
RTVisibleTest >> testVisible2 [
	"The center of e is within the canvas"
	| v t visible e |
	v := RTView new.
	self assert: v canvas extent equals: 500 @ 500.
	
	e := (RTBox new size: 100) element.
	v add: e.
	e translateTo: 248 @ 248.

	t := false.
	visible := RTVisible new
					visibleBlock: [ :el | t := true ].
	e @ visible.
	self assert: t
]
