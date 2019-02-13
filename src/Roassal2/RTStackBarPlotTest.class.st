Class {
	#name : #RTStackBarPlotTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-StackBarPlot'
}

{ #category : #tests }
RTStackBarPlotTest >> testBarHeight [

	| b e |
	b := RTStackBarPlot new.
	b add: #(37).				
	b barWidth: 150 height: 50.
	b build.
	self assert: b view numberOfElements equals: 1.

	e := b view elements anyOne.
	self assert: e extent y equals: 50
]

{ #category : #tests }
RTStackBarPlotTest >> testDefault [

	| b |
	b := RTStackBarPlot new.
	self assert: b height equals: 20.
	self assert: (b createShapeBuilder current height rtValue: RTElement new) equals: 20.
]

{ #category : #tests }
RTStackBarPlotTest >> testExample01 [

	| b |
	b := RTStackBarPlot new.
	b add: #(1 2 3 4).
	b add: #(4 3 2 1).
	b add: #(5 3 2 0).
	b barWidth: 150 height: 20.
	b build.
	
	self assert: (b view elements collect: #position) asArray equals: ((Array new: 12) at: 1 put: ((7.5@10.0)); at: 2 put: ((30.0@10.0)); at: 3 put: ((67.5@10.0)); at: 4 put: ((120.0@10.0)); at: 5 put: ((30.0@40.0)); at: 6 put: ((82.5@40.0)); at: 7 put: ((120.0@40.0)); at: 8 put: ((142.5@40.0)); at: 9 put: ((37.5@70.0)); at: 10 put: ((97.5@70.0)); at: 11 put: ((135.0@70.0)); at: 12 put: ((150.0@70.0)); yourself) asArray
	
]

{ #category : #tests }
RTStackBarPlotTest >> testExample02 [

	| b |
	b := RTStackBarPlot new.
	b add: #(1 2 3 4).
	b add: #(4 3 2 1).
	b add: #(5 3 2 0).
	b build.
	
	self assert: (b view elements collect: #position) asArray equals: ((Array new: 12) at: 1 put: ((7.5@10.0)); at: 2 put: ((30.0@10.0)); at: 3 put: ((67.5@10.0)); at: 4 put: ((120.0@10.0)); at: 5 put: ((30.0@40.0)); at: 6 put: ((82.5@40.0)); at: 7 put: ((120.0@40.0)); at: 8 put: ((142.5@40.0)); at: 9 put: ((37.5@70.0)); at: 10 put: ((97.5@70.0)); at: 11 put: ((135.0@70.0)); at: 12 put: ((150.0@70.0)); yourself) asArray
	
]
