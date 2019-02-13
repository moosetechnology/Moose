Class {
	#name : #RTAbstractGrapherDecoratorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #tests }
RTAbstractGrapherDecoratorTest >> testDatasetValues [
	| b ds1 ds2 deco |
	b := RTGrapher new.
	ds1 := RTData new.
	ds1 points: #(2 4 6).
	b add: ds1.
	ds2 := RTData new.
	ds2 points: #(1 3 5).
	b add: ds2.
	deco := RTAverageDecorator new.
	b addDecorator: deco.
	b build.
	self assert: deco datasets asSet equals: (Set with: ds1 with: ds2).
	deco dataset: ds1.
	self assert: deco datasets asSet equals: (Set with: ds1)
]
