"
A RTKiviatNode represent a polygon in the view, it represent one objects that is studied. It is composed by as many kiviatElement as the umber of metrics, connected by edges. 

Instance Variables
	arrayValues:		<Object>
	edgeElements:		<Object>
	named:		<Object>
	nodeElements:		<Object>
	shapeEdge:		<Object>
	shapeNode:		<Object>

arrayValues
	- xxxxx

edgeElements
	- xxxxx

named
	- xxxxx

nodeElements
	- xxxxx

shapeEdge
	- xxxxx

shapeNode
	- xxxxx

"
Class {
	#name : #RTKiviatNode,
	#superclass : #RTObject,
	#instVars : [
		'named',
		'arrayValues',
		'nodeKiviatElements',
		'edgeKiviatElements',
		'shapeNode',
		'shapeEdge',
		'polygonElement'
	],
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #adding }
RTKiviatNode >> addEdgeElement: anElement [
	edgeKiviatElements add: anElement.
]

{ #category : #adding }
RTKiviatNode >> addEdgeElements: anElementsCollection [
	anElementsCollection do: [ :e | edgeKiviatElements add: e].
]

{ #category : #adding }
RTKiviatNode >> addNodeElement: anElement [
	nodeKiviatElements add: anElement.
]

{ #category : #adding }
RTKiviatNode >> addNodeElements: anElementsCollection [
	anElementsCollection do: [ :e | nodeKiviatElements add: e].
]

{ #category : #accessing }
RTKiviatNode >> arrayValues [
	^ arrayValues.
]

{ #category : #default }
RTKiviatNode >> defaultArrayValues [
	arrayValues := Array new.
]

{ #category : #default }
RTKiviatNode >> defaultShapeEdge [
	shapeEdge := RTLine new.
]

{ #category : #default }
RTKiviatNode >> defaultShapeNode [
	shapeNode := RTEllipse new color: (Color blue alpha: 0.3); size: 10.
]

{ #category : #accessing }
RTKiviatNode >> edgeKiviatElements [
	^ edgeKiviatElements
]

{ #category : #initialization }
RTKiviatNode >> initialize [
	super initialize.
	self defaultArrayValues.
	self defaultShapeNode.
	self defaultShapeEdge.
	nodeKiviatElements := OrderedCollection new.
	edgeKiviatElements := OrderedCollection new.
]

{ #category : #accessing }
RTKiviatNode >> named [
	^ named
]

{ #category : #accessing }
RTKiviatNode >> named: aString [
	named := aString
]

{ #category : #accessing }
RTKiviatNode >> nodeKiviatElements [
	^ nodeKiviatElements
]

{ #category : #accessing }
RTKiviatNode >> polygonElement [
	^ polygonElement.
]

{ #category : #accessing }
RTKiviatNode >> polygonElement: anRTElement [
	polygonElement := anRTElement.
]

{ #category : #accessing }
RTKiviatNode >> shapeEdge [
	^ shapeEdge.
]

{ #category : #accessing }
RTKiviatNode >> shapeEdge: aShape [
	shapeEdge := aShape.
]

{ #category : #accessing }
RTKiviatNode >> shapeNode [
	^ shapeNode.
]

{ #category : #accessing }
RTKiviatNode >> shapeNode: aShape [
	shapeNode := aShape.
]

{ #category : #accessing }
RTKiviatNode >> values: anArrayValue [
	arrayValues := anArrayValue.
]
