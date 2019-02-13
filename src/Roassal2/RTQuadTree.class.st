"
A ROQuadTree is xxxxxxxxx.

Instance Variables
	charge:		<Object>
	corner:		<Object>
	cx:		<Object>
	cy:		<Object>
	leaf:		<Object>
	node:		<Object>
	nodes:		<Object>
	origin:		<Object>
	x:		<Object>
	y:		<Object>

charge
	- xxxxx

corner
	- xxxxx

cx
	- xxxxx

cy
	- xxxxx

leaf
	- xxxxx

node
	- xxxxx

nodes
	- xxxxx

origin
	- xxxxx

x
	- xxxxx

y
	- xxxxx

"
Class {
	#name : #RTQuadTree,
	#superclass : #RTObject,
	#instVars : [
		'charge',
		'x',
		'y',
		'leaf',
		'nodes',
		'origin',
		'corner',
		'node',
		'cx',
		'cy'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #public }
RTQuadTree class >> withAll: aNodeCollection [

	^ self withAll: aNodeCollection origin: (aNodeCollection collect: [:e | e position x]) min @ (aNodeCollection collect: [:e | e position y]) min corner: (aNodeCollection collect: [:e | e position x]) max @ (aNodeCollection collect: [:e | e position y]) max
]

{ #category : #public }
RTQuadTree class >> withAll: aNodeCollection origin: aPoint corner: anotherPoint [

	| dx dy root |

	dx := anotherPoint x - aPoint x.
	dy := anotherPoint y - aPoint y.


	(dx closeTo: dy ) ifTrue: [ root := self new.
										root origin: aPoint;
											corner: anotherPoint.
										aNodeCollection do: [ :e | root add: e ].
										^ root ] .
	
	dx > dy ifTrue: [ ^ self withAll: aNodeCollection origin: aPoint corner: anotherPoint x @ (aPoint y + dx) ].
	dy > dx ifTrue: [ ^ self withAll: aNodeCollection origin: aPoint corner: (aPoint x + dy) @ anotherPoint y ] .
]

{ #category : #adding }
RTQuadTree >> add: aNode [

	|n|

	leaf ifTrue: [ x isNil ifFalse: [ (x - aNode position x) abs + (y - aNode position y) abs < 0.01 ifTrue: [ self addChild: aNode ]
																								   ifFalse: [ n := node.
																											x := nil.
																											y := nil.
																											node := nil.
																											self addChild: aNode;
																												addChild: n ] ] 
						ifTrue: [ x := aNode position x.
								y := aNode position y.
								node := aNode ] ] 
		 ifFalse: [ self addChild: aNode ] 
]

{ #category : #adding }
RTQuadTree >> addChild: aNode [


	| sx sy new |
	
	sx := (origin x + corner x) / 2.
	sy := (origin y + corner y) / 2.
	
	leaf := false.

	aNode position x < sx ifTrue: [ aNode position y < sy ifTrue: [ (nodes at: 1) isNil ifTrue: [ new := RTQuadTree new.
																								new origin: origin;
																									corner: sx@sy.
																								nodes at: 1 put: new ] .
																	(nodes at: 1) add: aNode ]
															ifFalse: [ (nodes at: 3) isNil ifTrue: [ new := RTQuadTree new.
																								new origin: origin x @ sy;
																									corner: sx @ corner y.
																								nodes at: 3 put: new ] .
																	(nodes at: 3) add: aNode ] ]
	 
						    ifFalse: [ aNode position y < sy ifTrue: [  (nodes at: 2) isNil ifTrue: [ new := RTQuadTree new.
																								new origin: sx @ origin y;
																									corner: corner x @ sy.
																								nodes at: 2 put: new ] .
																	(nodes at: 2) add: aNode ] 
															ifFalse: [ (nodes at: 4) isNil ifTrue: [ new := RTQuadTree new.
																								new origin: sx @ sy;
																									corner: corner.
																								nodes at: 4 put: new ] .
																	(nodes at: 4) add: aNode ] ] 
]

{ #category : #accessing }
RTQuadTree >> charge [
	^ charge
]

{ #category : #accessing }
RTQuadTree >> charge: anObject [
	charge := anObject
]

{ #category : #accessing }
RTQuadTree >> corner [
	^ corner
]

{ #category : #accessing }
RTQuadTree >> corner: anObject [
	corner := anObject
]

{ #category : #accessing }
RTQuadTree >> cx [
	^ cx
]

{ #category : #accessing }
RTQuadTree >> cx: aFloat [
	cx := aFloat
]

{ #category : #accessing }
RTQuadTree >> cy [
	^ cy
]

{ #category : #accessing }
RTQuadTree >> cy: aFloat [
	cy := aFloat
]

{ #category : #'initialize-release' }
RTQuadTree >> initialize [ 

	super initialize.
	
	leaf := true.
	nodes := Array new: 4.
	
]

{ #category : #accessing }
RTQuadTree >> leaf [
	^ leaf
]

{ #category : #accessing }
RTQuadTree >> node [
	^ node
]

{ #category : #accessing }
RTQuadTree >> nodes [
	^ nodes
]

{ #category : #accessing }
RTQuadTree >> origin [
	^ origin
]

{ #category : #accessing }
RTQuadTree >> origin: anObject [
	origin := anObject
]
