"
A RTBezier3LineTest is a test class for testing the behavior of RTBezier3Line
"
Class {
	#name : #RTBezier3LineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTBezier3LineTest >> testBasic [

	| v e1 e2 e3 lineShape s edge|
	v := RTView new.

	s := RTEllipse new color: (Color red alpha: 0.4); size: 30.
	e1 := s elementOn: 'Begin'.
	e2 := s elementOn: 'End'.
	e3 := s elementOn: 'Middle'.


	lineShape := RTBezier3Line new.
	lineShape controlElement: e3.

	lineShape attachPoint: (RTShorterDistanceAttachPoint instance).
	edge := lineShape edgeFrom: e1 to: e2.

	v add: e1; add: e2; add: e3; add: edge.

	e2 translateBy: 80 @ 50.
	e3 translateBy: 40 @ 25.

]
