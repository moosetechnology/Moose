"
I am an abstract class. My subclasses have to override #attachPointsFor:on:
"
Class {
	#name : #RTAbstractShorterDistanceAttachPoint,
	#superclass : #RTAttachPoint,
	#category : #'Roassal2-AttachPoint'
}

{ #category : #util }
RTAbstractShorterDistanceAttachPoint >> attachPointFor: anEdge on: referenceElement with: elementsPossibleAttachPoints [
	"Returns the attach point having the shortest route for given edge on given element."
	| p dp t |
	"We take an arbitrary point. The center of the reference point"
	p := referenceElement encompassingRectangle center.
	
	"We get the list of dot products"
	dp := elementsPossibleAttachPoints collect: [ :pp | 
		t := p - pp.
		Array with: (t dotProduct: t) with:  pp ].
	
	"We look for the shortest path and return the point"
	^ (dp inject: dp first into: [ :shorter :el | (shorter first < el first) ifTrue: [ shorter ] ifFalse: [ el ]]) second
]

{ #category : #'public - hooks' }
RTAbstractShorterDistanceAttachPoint >> attachPointsFor: anEdge on: anElement [
	self subclassResponsibility 
]

{ #category : #'public - hooks' }
RTAbstractShorterDistanceAttachPoint >> basicEndingPointOf: anEdge [
	^ self attachPointFor: anEdge on: anEdge from with: (self destinationAttachPointsFor: anEdge)
]

{ #category : #'public - hooks' }
RTAbstractShorterDistanceAttachPoint >> basicStartingPointOf: anEdge [
	^ self attachPointFor: anEdge on: anEdge to with: (self startingAttachPointsFor: anEdge)
]

{ #category : #util }
RTAbstractShorterDistanceAttachPoint >> destinationAttachPointsFor: anEdge [
	"Return the four possible attach points for each of the four sides for this edges destination node."
	^ self attachPointsFor: anEdge on: (anEdge to).
]

{ #category : #util }
RTAbstractShorterDistanceAttachPoint >> startingAttachPointsFor: anEdge [
	"Return the four possible attach points for each of the four sides for this edges starting node."
	^ self attachPointsFor: anEdge on: (anEdge from).
]
