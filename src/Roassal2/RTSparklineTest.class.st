Class {
	#name : #RTSparklineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Sparkline'
}

{ #category : #tests }
RTSparklineTest >> testValue [
	| shape e obj |
	obj := #(1 2 3 4 5).
	shape := RTSparkline new values: [ :tuple | tuple + 10 ].
	e := shape elementOn: obj.
	self assert: (shape valuesFor: e) = (obj + 10).
	
	self assert: (shape heightFor: obj) equals: 5.
	self assert: (shape widthFor: obj) equals: 5.
	
]

{ #category : #tests }
RTSparklineTest >> testWithOneValue [
	| shape e obj |
	obj := #(1).
	shape := RTSparkline new values: [ :tuple | tuple + 10 ].
	e := shape elementOn: obj.
	self assert: (shape valuesFor: e) = (obj + 10).
	
	self assert: (shape heightFor: obj) equals: 5.
	self assert: (shape widthFor: obj) equals: 5.
	
]

{ #category : #tests }
RTSparklineTest >> testWithOneValueAndExtent [
	| shape e obj |
	obj := #(1).
	shape := RTSparkline new 
					width: 30;
					height: 20;
					values: [ :tuple | tuple + 10 ].
	e := shape elementOn: obj.
	self assert: (shape valuesFor: e) = (obj + 10).
	
	self assert: (shape heightFor: e) equals: 20.
	self assert: (shape widthFor: e) equals: 30.
	"because all the values are the same"
	self assert: e trachelShape basicEncompassingRectangle extent equals: 30 @ 1.
	self assert: e trachelShape encompassingRectangle extent equals: 30 @ 1.
	self assert: e extent equals: 30 @ 1.
	
]
