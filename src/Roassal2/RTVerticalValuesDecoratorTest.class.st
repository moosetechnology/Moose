Class {
	#name : #RTVerticalValuesDecoratorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #tests }
RTVerticalValuesDecoratorTest >> testBasic [

	| b ds deco labels |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(2 3 4 5 6).
	b add: ds.

	deco := RTVerticalValuesDecorator new.
	deco addAll: #(3 5).
	b addDecorator: deco.

	b axisX noTick; noLabel.
	b axisY noTick; noLabel.
	b build.
	
	labels := b view canvas shapes select: [ :s | s class == TRLabelShape ].
	self assert: labels size equals: 2.
]

{ #category : #tests }
RTVerticalValuesDecoratorTest >> testBasic02 [

	| b ds deco labels |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(2 3 4 5 6).
	b add: ds.

	deco := RTVerticalAllValuesDecorator new.
	b addDecorator: deco.

	b axisX noTick; noLabel.
	b axisY noTick; noLabel.
	b build.
	
	labels := b view canvas shapes select: [ :s | s class == TRLabelShape ].
	self assert: labels size equals: 5.
]

{ #category : #tests }
RTVerticalValuesDecoratorTest >> testBasic03 [

	| b ds deco labels |
	b := RTGrapher new.

	ds := RTData new.
	"We repeat the points"
	ds points: #(2 3 4 5 6 2).
	b add: ds.

	deco := RTVerticalAllValuesDecorator new.
	b addDecorator: deco.

	b axisX noTick; noLabel.
	b axisY noTick; noLabel.
	b build.
	
	labels := b view canvas shapes select: [ :s | s class == TRLabelShape ].
	self assert: labels size equals: 5.
]
