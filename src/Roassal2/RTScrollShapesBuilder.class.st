"
Define the shapes added to the view by the pad and bar builders
"
Class {
	#name : #RTScrollShapesBuilder,
	#superclass : #RTObject,
	#instVars : [
		'margeRectangle',
		'bar',
		'surroundingRectangle',
		'collection',
		'scrollBuilder'
	],
	#category : #'Roassal2-Builder-ScrollBar'
}

{ #category : #'as yet unclassified' }
RTScrollShapesBuilder class >> for: aRTScrollBuilder [
	^ self new scrollBuilder: aRTScrollBuilder 
]

{ #category : #accessing }
RTScrollShapesBuilder >> bar [
	^ bar
]

{ #category : #accessing }
RTScrollShapesBuilder >> bar: aTRShape [
	bar := aTRShape. 
	collection add: aTRShape.
]

{ #category : #accessing }
RTScrollShapesBuilder >> collection [
	^ collection
]

{ #category : #accessing }
RTScrollShapesBuilder >> defineHorizontalShapes [

		self bar height: self scrollBuilder width; width: self scrollBuilder barWidth; color: Color lightGray; position: self scrollBuilder fixedPosition; strokePaint: nil.
		
		"This shape is the the fill of the scroll bar"
		self surroundingRectangle: (TRBoxShape new height: self scrollBuilder width; width: self scrollBuilder size; position: (self scrollBuilder fixedPosition x )@(self scrollBuilder fixedPosition y); color: self scrollBuilder fillColor; strokePaint: nil).
		
		"the margeRectangle handle the width/2 of the bar"
		self margeRectangle: (TRBoxShape new fromRectangle: (Rectangle origin: (self surroundingRectangle encompassingRectangle origin)corner: (self surroundingRectangle encompassingRectangle corner)); color: (Color gray alpha:0); strokePaint: nil) .
]

{ #category : #accessing }
RTScrollShapesBuilder >> defineVerticalShapes [

		self bar height: self scrollBuilder barHeight; width: self scrollBuilder width; color: (Color lightGray);  position: self scrollBuilder fixedPosition; strokePaint: nil.
		
		"This shape is the the fill of the scroll bar"
		self surroundingRectangle: (TRBoxShape new width: self scrollBuilder width; height: self scrollBuilder size; position: (self scrollBuilder fixedPosition x )@(self scrollBuilder fixedPosition y); color: self scrollBuilder fillColor; strokePaint: nil).

		"the margeRectangle handle the width/2 of the bar"
		self margeRectangle: (TRBoxShape new fromRectangle: (Rectangle origin: (self surroundingRectangle encompassingRectangle origin)corner: (self surroundingRectangle encompassingRectangle corner)); color: (Color gray alpha:0); strokePaint: nil).
]

{ #category : #initialization }
RTScrollShapesBuilder >> initialize [
	super initialize.
	collection := OrderedCollection new.
]

{ #category : #accessing }
RTScrollShapesBuilder >> margeRectangle [
	^ margeRectangle
]

{ #category : #accessing }
RTScrollShapesBuilder >> margeRectangle: aTRShape [
	margeRectangle := aTRShape.
	collection add: aTRShape. 
]

{ #category : #accessing }
RTScrollShapesBuilder >> scrollBuilder [
	^ scrollBuilder 
]

{ #category : #accessing }
RTScrollShapesBuilder >> scrollBuilder: aRTSCrollBuilder [
	scrollBuilder := aRTSCrollBuilder 
]

{ #category : #accessing }
RTScrollShapesBuilder >> surroundingRectangle [
	^ surroundingRectangle 
]

{ #category : #accessing }
RTScrollShapesBuilder >> surroundingRectangle: aTRShape [
	surroundingRectangle := aTRShape.
	collection add: aTRShape. 
]
