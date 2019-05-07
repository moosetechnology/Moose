"
Nodes with a 2D position in a grid with x and y.
"
Class {
	#name : #Mal2DGridNode,
	#superclass : #MalGraphNode,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #accessing }
Mal2DGridNode >> x [
^x
]

{ #category : #accessing }
Mal2DGridNode >> x: anInteger [ 
	x := anInteger
]

{ #category : #accessing }
Mal2DGridNode >> y [
	^ y
]

{ #category : #accessing }
Mal2DGridNode >> y: anInteger [ 
	y := anInteger
]
