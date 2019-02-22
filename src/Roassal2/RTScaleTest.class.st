Class {
	#name : #RTScaleTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Scaling-Tests'
}

{ #category : #tests }
RTScaleTest >> testLinearScale [

	| s |
	s := RTScale linear 
		domain: #(0 100);
		range: #(5 10).
	self assert: (s scale: 50) equals: 15 / 2.
	self assert: (s scale: 0) equals: 5.
	self assert: (s scale: 100) equals: 10.	
]

{ #category : #tests }
RTScaleTest >> testLinearScaleWithColors [

	| s |
	s := RTScale linear 
		domain: #(0 100);
		range: (Array with: Color white with: Color black).
	self assert: (s scale: 50) equals: Color gray.
	self assert: (s scale: 0) equals: Color white.
	self assert: (s scale: 100) equals: Color black.	
]

{ #category : #tests }
RTScaleTest >> testLinearScaleWithNegative [

	| s |
	s := RTScale linear 
		domain: #(0 100);
		range: #(-10 -5).
	self assert: (s scale: 50) equals: -15 / 2.
	self assert: (s scale: 0) equals: -10.
	self assert: (s scale: 100) equals: -5.	
]

{ #category : #tests }
RTScaleTest >> testLogarithmScale [

	| s |
	s := RTScale log
		base: Float e; 
		domain: (#(0 9) collect: #exp);
		range: #(200 0).
	self assert: ((s scale: 50) closeTo: 113.06615543493011).
	self assert: ((s scale: 0.01) closeTo: 302.3371152441798).
	self assert: ((s scale: 100) closeTo: 97.66288475582019).
	
	self assert: ((s invert: 10) closeTo: 5166.754427175983)
]

{ #category : #tests }
RTScaleTest >> testScalePolyLinear [
	| linear |
	linear := RTScale linear
		domain: #(0 0.5 1);
		range: #(10 80 10).
	self 
		assert: (linear scale: 0) equals: 10;
		assert: (linear scale: 0.5) equals: 80;
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 1.5) equals: -60.
	linear := RTScale linear
		domain: #(0 0.5 1);
		range: #('white' 'black' 'white').
	self 
		assert: (linear scale: 0) equals: Color white;
		assert: (linear scale: 0.25) equals: Color gray;
		assert: (linear scale: 0.75) equals: Color gray.
	
	
	
]
