Class {
	#name : #RTMultipleDataTest,
	#superclass : #RTTest,
	#instVars : [
		'd'
	],
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #running }
RTMultipleDataTest >> setUp [
	super setUp.
	d := RTHorizontalMultipleData new.
	d points: #( #(1 2) #(2 4) #(3 5)).
	d addMetric: #first.
	d addMetric: #second.
]

{ #category : #tests }
RTMultipleDataTest >> testAddingInGrapher [
	| g elements |
	g := RTGrapher new.
	g add: d.
	elements := d elements.
	self assert: elements size equals: 8.
	self
		assert: d selectElementsForAddingBarTitle size
		equals: d numberOfPoints.
	self assert: d selectElementsForAddingBarTitle size equals: 3.
	self
		assert: d selectElementsForAddingBarTitle first
		equals: d elements second.
	self
		assert: d selectElementsForAddingBarTitle second
		equals: d elements fifth.
	self
		assert: d selectElementsForAddingBarTitle third
		equals: d elements eighth.
	g build.

	"Make sure that all the elements created by the data are in the view"
	self assert: (g view elements includesAll: d elements)
]

{ #category : #tests }
RTMultipleDataTest >> testBasic [

	| data |
	data := RTVerticalMultipleData new.
	self assert: data numberOfPoints equals: 0.
	self assert: data numberOfMetrics equals: 0.
]

{ #category : #tests }
RTMultipleDataTest >> testBasic02 [

	self assert: d numberOfPoints equals: 3.
	self assert: d numberOfMetrics equals: 2.
]

{ #category : #'tests - rendering' }
RTMultipleDataTest >> testRendering01 [

	| g elements |
	g := RTGrapher new.
	g add: d.
	elements := d elements.
	g build.

	self assert: elements first position x asInteger equals: 33.
	self assert: elements second position x asInteger equals: 66.
	
	self assert: elements third position x asInteger equals: 100.
	self assert: elements fourth position x asInteger equals: 133.

]

{ #category : #tests }
RTMultipleDataTest >> testSelectElementsForAddingBarTitle01 [

	| b |
	b := RTGrapher new.
	d := RTHorizontalMultipleData new.
	d barShape color: Color blue.
	d points: #( #('hello' 1 2 1) #('world' 2 4 2) #('bonjour' 3 5 4) #('Gutten Morgen' -1 4 -5)).
	d addMetric: #second.
	d addMetric: #third.
	d addMetric: #fourth.
	d barChartWithBarTitle: 'hello' rotation: -45 color: Color gray.
	b add: d.
	b build.
	
	self assert: d elements size equals: 15.
	self assert: d selectElementsForAddingBarTitle first equals: (d elements at: 2).
	
]
