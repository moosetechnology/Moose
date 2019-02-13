Class {
	#name : #RTVerticalTickLineDecoratorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Decorators-Tests'
}

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicHorizontal [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTHorizontalTickLineDecorator new.
	b addDecorator: d.

	b shouldUseNiceLabels: false.
	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 2.
]

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicHorizontalWithNumberOfTicks [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTHorizontalTickLineDecorator new.
	d numberOfTicks: 10.
	b addDecorator: d.

	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 4 / 5.
]

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicHorizontalWithStep [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTHorizontalTickLineDecorator new.
	d step: 1.
	b addDecorator: d.

	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 1.
]

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicVertical [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTVerticalTickLineDecorator new.
	b addDecorator: d.

	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 1.
]

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicVerticalWithNumberOfTicks [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTVerticalTickLineDecorator new.
	d numberOfTicks: 10.
	b addDecorator: d.

	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 2 / 5.
]

{ #category : #tests }
RTVerticalTickLineDecoratorTest >> testBasicVerticalWithStep [

	| b ds d |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(3 4 6 -2).
	b add: ds.

	d := RTVerticalTickLineDecorator new.
	d step: 1.
	b addDecorator: d.

	b build.
	
	self assert: b axisX numberOfTicks equals: 4.
	self assert: b axisX step equals: 1.
	self assert: d step equals: 1.
]
