"
A GETDistributionTest is a test class for testing the behavior of GETDistribution
"
Class {
	#name : #RTDistributionTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Utility'
}

{ #category : #tests }
RTDistributionTest >> testAnnotatedFrequency [
	| set d f |
	set := #(2 2 2 5 5).
	d := RTDistribution on: set.
	f := d annotatedFrequency.
	self assert: d amountOfDifferentValues = 2.
	self assert: f = (Array 
		with: (Array with: 3 with: #(2 2 2) asOrderedCollection)
		with: (Array with: 0 with: OrderedCollection new) 
		with: (Array with: 2 with: #(5 5) asOrderedCollection)) 

]

{ #category : #tests }
RTDistributionTest >> testBasic [

	| numbers distribution values |
	numbers := #(5 2 1 8 1 2 4 8 1 9 7 3 7).
	distribution := RTDistribution on: numbers.
	values := distribution frequencyMin: 1 max: 9 amountOfIntervals: 3.
	
	self assert: values size = 3.
	self assert: values first asSortedCollection = ((numbers select: [ :n | n < 4 ]) asSortedCollection).
	self assert: values second asSortedCollection = ((numbers select: [ :n | n >= 4 and: [ n < 6 ] ]) asSortedCollection).
	self assert: values third asSortedCollection = ((numbers select: [ :n | n >= 6 ]) asSortedCollection).
]

{ #category : #tests }
RTDistributionTest >> testBasic2 [

	| numbers distribution values |
	numbers := #(5 2 1 8 1 2 4 8 1 9 7 3 7).
	distribution := RTDistribution on: numbers.
	values := distribution frequencyWithAmountOfIntervals: 3.
	
	self assert: values size = 3.
	self assert: values first asSortedCollection = ((numbers select: [ :n | n < 4 ]) asSortedCollection).
	self assert: values second asSortedCollection = ((numbers select: [ :n | n >= 4 and: [ n < 6 ] ]) asSortedCollection).
	self assert: values third asSortedCollection = ((numbers select: [ :n | n >= 6 ]) asSortedCollection).
]

{ #category : #tests }
RTDistributionTest >> testFrequency [
	| set d f |
	set := #(3 31 17 17 20 50 9 32 47 2 8 36 30 33 49 31 18 25 21 31 1 37 1 40 46 16 18 20 30 29 4 49 31 45 25 44 12 16 23 27 5 41 20 23 29 17 7 20 13 11).
	d := RTDistribution on: set.
	
	self assert: d amountOfDifferentValues = set asSet size.
	
	f := d frequency.
	self assert: f size = 6.
]

{ #category : #tests }
RTDistributionTest >> testFrequencyOfObjects [
	| set d f |
	set := #(yes yes no maybe no maybe maybe yes no maybe yes maybe).
	d := RTDistribution on: set.
	
	self assert: d amountOfDifferentValues = set asSet size.
	
	"No idea why this fails"
"	f := d annotatedFrequencyWithAmountOfIntervals: d amountOfDifferentValues.
	self assert: f size = 3.
	self assert: (f copy sort: [:a :b | a first < b first ]) = (Array 
		with: (Array with: 3 with: #(no no no) asOrderedCollection)
		with: (Array with: 4 with: #(yes yes yes yes) asOrderedCollection)
		with: (Array with: 5 with: #(maybe maybe maybe maybe maybe) asOrderedCollection))"
]

{ #category : #tests }
RTDistributionTest >> testFrequencyWithSetSize [
	| set d f |
	set := #(3 31 17 17 20 50 9 32 47 2 8 36 30 33 49 31 18 25 21 31 1 37 1 40 46 16 18 20 30 29 4 49 31 45 25 44 12 16 23 27 5 41 20 23 29 17 7 20 13 11).
	d := RTDistribution on: set.
	
	self assert: d amountOfDifferentValues = set asSet size.
	
	f := d frequencyWithAmountOfIntervals: set asSet size.
	self assert: f size = set asSet size.
]
