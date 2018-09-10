"
I am a collection of several shapes. Useful for finding an intersection of a more complex shape.
"
Class {
	#name : #GCollection,
	#superclass : #OrderedCollection,
	#category : 'Geometry'
}

{ #category : #accessing }
GCollection >> center [
	^ self encompassingRectangle center
]

{ #category : #accessing }
GCollection >> encompassingRectangle [
	^ self
		ifEmpty: [ 0 @ 0 corner: 0 @ 0 ]
		ifNotEmpty: [ Rectangle merging: (self collect: #encompassingRectangle) ]
]

{ #category : #accessing }
GCollection >> height [
	^ self encompassingRectangle height
]

{ #category : #comparing }
GCollection >> intersectLine: aLine [
	self logCr: (self flatCollect: [ :each | aLine intersect: each ]).
	^ (self flatCollect: [ :each | aLine intersect: each ]) asArray
]

{ #category : #intersection }
GCollection >> intersectLineSegment: aLineSegment [
	^ self flatCollect: [ :each | each intersectLineSegment: aLineSegment ]
]

{ #category : #accessing }
GCollection >> width [
	^ self encompassingRectangle width
]
