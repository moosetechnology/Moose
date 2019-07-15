"
A RTShowLabelTest is a test class for testing the behavior of RTShowLabel
"
Class {
	#name : #RTShowLabelTest,
	#superclass : #RTTest,
	#instVars : [
		'box',
		'view'
	],
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTShowLabelTest >> testBasic [
	view := RTView new.
	box := RTBox new size: 30; elementOn: 'Hi'.
	view add: box.
	self assert: view canvas shapes size equals: 1.

	box @ RTShowLabel.
	self assert: view canvas shapes size equals: 1.

	box testCaseAnnounce: TRMouseEnter.
	self assert: view canvas shapes size equals: 2.
	
	box testCaseAnnounce: TRMouseLeave.
	self assert: view canvas shapes size equals: 1.

]

{ #category : #tests }
RTShowLabelTest >> testBasic02 [

	| v e int labelledInteraction |
	v := RTView new.

	e := RTBox elementOn: 1.
	v add: e.

	int := RTShowLabel new.
	int highlightObject: #yourself.
	int top.
	int color: Color red.
	e @ int.

	"Checking the labelledInteraction"
	labelledInteraction := int labelledInteraction.
	self assert: labelledInteraction textElement notNil.
	self assert: (labelledInteraction textElement rtValue: e) equals: 1.

	"Low level highlight"	
	self assert: v canvas numberOfShapes equals: 1.
	int doHighlightElement: e.
	self assert: v canvas numberOfShapes equals: 2.
	int doUnhighlightElement: e.
	self assert: v canvas numberOfShapes equals: 1.
	
	"High level highlight"	
	self assert: v canvas numberOfShapes equals: 1.
	int doHighlight: e.
	self assert: v canvas numberOfShapes equals: 2.
	int doUnhighlight: e.
	self assert: v canvas numberOfShapes equals: 1.

	"Simulating mouse entering"
	self assert: v canvas numberOfShapes equals: 1.
	e testCaseAnnounce: TRMouseEnter.
	self assert: v canvas numberOfShapes equals: 2.
	e testCaseAnnounce: TRMouseLeave.
	self assert: v canvas numberOfShapes equals: 1.
]

{ #category : #tests }
RTShowLabelTest >> testBasic03 [
	view := RTView new.
	box := RTBox new size: 30; elementOn: 'Hi'.
	view add: box.
	self assert: view canvas shapes size equals: 1.

	box @ RTShowLabel.
	self assert: view canvas shapes size equals: 1.

	box announce: TRMouseEnter.
	box announce: TRMouseEnter.
	self assert: view canvas shapes size equals: 2.
	
	box announce: TRMouseLeave.
	self assert: view canvas shapes size equals: 1.

]

{ #category : #tests }
RTShowLabelTest >> testSetLabelledInteraction [
	| lbl |
	lbl := RTShowLabel new.
	lbl labelledInteraction: RTLabeled new
]

{ #category : #tests }
RTShowLabelTest >> testVisit [
	| int e v |
	int := RTShowLabel new.
	int highlightObject: #yourself.
	int top.
	int color: Color red.
	
	e := (RTBox elementOn: 3).
	v := RTView new.
	v add: e.
	int accept: RTJavascriptVisitor new with: e
]

{ #category : #tests }
RTShowLabelTest >> testWithNesting [
	| v e e2 int |
	v := RTView new.

	e := RTBox elementOn: 1.
	v add: e.

	e2 := (RTBox new color: Color blue) elementOn: 2.
	v add: e2.
	RTNest new on: e nest: (Array with: e2).

	int := RTShowLabel new.
	int highlightObject: #yourself.
	e @ int.
	
	"We enter and leave the outter element"
	self assert: v canvas numberOfShapes equals: 2.
	e announce: TRMouseEnter.
	self assert: v canvas numberOfShapes equals: 3.
	e announce: TRMouseLeave.
	self assert: v canvas numberOfShapes equals: 2.
	

	"We enter the outer and inner elements"
	e announce: TRMouseEnter.
	e announce: TRMouseLeave.
	e2 announce: TRMouseEnter.
	self assert: v canvas numberOfShapes equals: 2.
	e2 announce: TRMouseLeave.
	e announce: TRMouseLeave.
	self assert: v canvas numberOfShapes equals: 2.


]

{ #category : #tests }
RTShowLabelTest >> testWithNesting02 [
	| v e e2 int |
	v := RTView new.

	e := RTBox elementOn: 1.
	v add: e.

	e2 := (RTBox new color: Color blue) elementOn: 2.
	v add: e2.
	RTNest new on: e nest: (Array with: e2).

	int := RTShowLabel new.
	int highlightObject: #yourself.
	e @ int.
	
	"We enter and leave the outter element"
	self assert: v canvas numberOfShapes equals: 2.
	e announce: TRMouseEnter.
	self assert: v canvas numberOfShapes equals: 3.
	e announce: TRMouseLeave.
	self assert: v canvas numberOfShapes equals: 2.
	

	"We enter the outer and inner elements"
	e announce: TRMouseEnter.
	e announce: TRMouseLeave.
	"For some strange reason, this is what happens"
	e announce: TRMouseEnter.
	self assert: v canvas numberOfShapes equals: 3.
	e2 announce: TRMouseLeave.
	e announce: TRMouseEnter.
	e announce: TRMouseLeave.
	self assert: v canvas numberOfShapes equals: 2.


]
