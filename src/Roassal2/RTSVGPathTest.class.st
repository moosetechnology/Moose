Class {
	#name : #RTSVGPathTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #'test countries' }
RTSVGPathTest >> testCountries [

	self assert: ((RTSVGPath countries collect: [ :k | RTSVGPath perform: k ]) allSatisfy: #isString)
	
]

{ #category : #'point inclusion' }
RTSVGPathTest >> testIncludesPointBasic [
	| v e |
	v := RTView new.
	e := (RTSVGPath new path: 'M 100 100 L 300 100 L 200 300 z') element.
	v add: e.
	self assert: (e trachelShape includesPoint: 200@200).
	self assert: (e trachelShape includesPoint: 200@80) not
]

{ #category : #tests }
RTSVGPathTest >> testParseSimple [
	|res p1 |
	res := OrderedCollection new.
	res
		add: (Array with: #absolute with: #() );
		add: (Array with: #moveTo: with: (Array with: 100.0@100.0) );
		add: (Array with: #absolute with: #() );
		add: (Array with: #lineTo: with: (Array with: 300.0@100.0) );
		add: (Array with: #absolute with: #() );
		add: (Array with: #lineTo: with: (Array with: 200.0@300.0) );
		add: (Array with: #close with: #()).
	p1 := (TRSVGPath new path: 'M 100 100 L 300 100 L 200 300 z') curves.
	self assert: p1 = res.
	
	"
	According to the specification: 
	
	The command letter can be eliminated on subsequent commands if the same command is used multiple times in a row (e.g., you can drop the second 'L' in 'M 100 200 L 200 100 L 	-100 -200' and use 'M 100 200 L 200 100 -100 -200' instead).
		
	Hence, the following assertion should be true:
	
	p2 := (RTSVGPath new path: 'M 100 100 L 300 100 200 300 z') processPath asString.
	self assert: p2 = res."
]

{ #category : #tests }
RTSVGPathTest >> testTranslateBy [
	| v e |
	v := RTView new.
	e := (RTSVGPath new path: 'M200,200l100,0l0,100l-100,0z') element.
	v add: e.
	self assert: (e trachelShape includesPoint: 210@210).
	e translateBy: -10@0.
	self assert: (e trachelShape includesPoint: 200@200).
	self assert: (e trachelShape includesPoint: 0@0) not.
]

{ #category : #tests }
RTSVGPathTest >> testTranslateTo [
	| v e |
	v := RTView new.
	e := (RTSVGPath new path: 'M200,200l100,0l0,100l-100,0z') element.
	v add: e.
	self assert: (e trachelShape includesPoint: 210@210).
	e translateTo: 0@0.
	self assert: (e trachelShape includesPoint: 200@200).
	self assert: (e trachelShape includesPoint: 0@0) not.
]

{ #category : #tests }
RTSVGPathTest >> testTranslateToCentered [
	| v e rectangle |
	v := RTView new.
	e := (RTSVGPath new centeredPath: 'M200,200l100,0l0,100l-100,0z') element.
	rectangle := (Rectangle encompassing: (Array with: 200@200 with: 300@200 with: 300@300 with: 200@300)).
	v add: e.
	self deny: (e trachelShape includesPoint: 200@200).
	self assert: (e trachelShape includesPoint: 0@0).
	e translateTo: rectangle center.
	self assert: (e trachelShape includesPoint: 200@200).
	self deny: (e trachelShape includesPoint: 0@0).
]

{ #category : #'point inclusion' }
RTSVGPathTest >> testUpdate [
	| v e |
	v := RTView new.
	e := (RTSVGPath new path: 'M 0 0 h 10 v 100 h -10 z') element.
	v add: e.
	self assert: (e trachelShape includesPoint: 5 @ 50).
	self assert: (e trachelShape includesPoint: 50 @ 5) not.
	e shape path: 'M 0 0 h 100 v 10 h -100 z'.
	e update.
	self assert: (e trachelShape includesPoint: 5 @ 50) not.
	self assert: (e trachelShape includesPoint: 50 @ 5)
]
