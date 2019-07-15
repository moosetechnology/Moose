"
I provide some primitives for manipulating with rectangles and its sides.

!! Collaborators

DCRTResizable
"
Class {
	#name : #RTResizableRectangle,
	#superclass : #RTObject,
	#classInstVars : [
		'cornerDirections',
		'oppositeCorners'
	],
	#category : #'Roassal2-Interactions-Resize'
}

{ #category : #accessing }
RTResizableRectangle class >> cornerDirectionFor: aCorner [
	^ self cornerDirections at: aCorner
]

{ #category : #accessing }
RTResizableRectangle class >> cornerDirections [
	^ cornerDirections
		ifNil: [ 
			cornerDirections := (OrderedCollection new
				add: (#top -> (0 @ 1));
				add: (	#bottom -> (0 @ -1));
				add: (#left -> (1 @ 0));
				add: (#right -> (-1 @ 0));
				add: (#topRight -> (-1 @ 1));
				add: (#bottomRight -> (-1 @ -1));
				add: (#bottomLeft -> (1 @ -1));
				add: (#topLeft -> (1 @ 1));
				yourself) asDictionary ]
]

{ #category : #accessing }
RTResizableRectangle class >> corners [
	^ #(#topRight #bottomRight #topLeft #bottomLeft)
]

{ #category : #accessing }
RTResizableRectangle class >> cornersAndSides [
	^ OrderedCollection new add: #top;
		add: #topRight;
		add: #right;
		add: #bottomRight;
		add: #bottom;
		add: #bottomLeft;
		add: #left;
		add: #topLeft;
		asArray
]

{ #category : #'as yet unclassified' }
RTResizableRectangle class >> oppositeCornerFor: aCorner [
	^ self oppositeCorners at: aCorner
]

{ #category : #'as yet unclassified' }
RTResizableRectangle class >> oppositeCorners [
	^ oppositeCorners
		ifNil: [ 
			oppositeCorners := (OrderedCollection new
				add: (#topRight -> #bottomLeft);
				add: (#bottomLeft -> #topRight);
				add: (	#bottomRight -> #topLeft);
				add: (#topLeft -> #bottomRight);
				add: (	#top -> #bottom);
				add: (	#bottom -> #top);
				add: (	#left -> #right);
				add: (	#right -> #left);
				yourself) asDictionary ]
]

{ #category : #accessing }
RTResizableRectangle class >> sides [
	^ #(#top #right #bottom #left)
]
