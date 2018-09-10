"
I am a circle. I have a center in (cx, cy) and radius. My equation is: 
(x-cx)^2  + (y-cy)^2 = radius^2 or 
a * (x^2) + a * (y^2) + d * x + e * y + f = 0 

"
Class {
	#name : #GCircle,
	#superclass : #Object,
	#instVars : [
		'center',
		'radius'
	],
	#category : 'Geometry'
}

{ #category : #'as yet unclassified' }
GCircle class >> center: aPoint1 radius: aNumber [
	^ self new initializeWithCenter: aPoint1 radius: aNumber
]

{ #category : #comparing }
GCircle >> = circ [
	^( self radius =~ circ radius and:[ self center =~ circ center ])



]

{ #category : #comparing }
GCircle >> boundaryContains: aPoint [
^(self radius =~ (self center dist: aPoint))

]

{ #category : #comparing }
GCircle >> boundaryContainsThis: points [

 ^(points select:[ :point| self boundaryContains: point]) isNotEmpty 

]

{ #category : #comparing }
GCircle >> boundaryContainsWhichOf: points [
 ^ points select:[ :point| self boundaryContains: point]

]

{ #category : #accessing }
GCircle >> center [

	^center 
]

{ #category : #testing }
GCircle >> contains: aPoint [
^ (self radius > (self center dist: aPoint)) and:[ (self boundaryContains: aPoint) not ]
]

{ #category : #comparing }
GCircle >> cosBetween: p1 and: p2 [


^ (( GRay origin: self center direction: p1 ) * ( GRay origin: self center direction: p2 )) 
/
( ( GRay origin: self center direction: p1 )length * (( GRay origin: self center direction: p2 ) length ) )

]

{ #category : #accessing }
GCircle >> encompassingRectangle [
	^ (center - radius) corner: (center + radius)
]

{ #category : #comparing }
GCircle >> equal: circ withApproximation: aNumber [
"self halt."
	^( (self radius - circ radius ) abs < aNumber )
	and:[ 
		( (self center x - circ center x)abs < aNumber)
		""and:[  (self center y - circ center y)abs < aNumber ]""
		]



]

{ #category : #initialization }
GCircle >> initializeWithCenter: aPoint1 radius: aNumber [
	super initialize.
	center := aPoint1.
	radius := aNumber.
]

{ #category : #accessing }
GCircle >> inscribedRectangle [
	
	^ Rectangle
		origin: center - (radius / 2 sqrt)
		corner: center + (radius / 2 sqrt)
				
]

{ #category : #'as yet unclassified' }
GCircle >> intersectLineSegment: aLineSegment [
	^ aLineSegment intersectCircle: self
]

{ #category : #'public interface' }
GCircle >> intersectWith: line [
  

]

{ #category : #accessing }
GCircle >> length [
	^ 2 * (self radius)* (Float pi)
]

{ #category : #'public interface' }
GCircle >> point: p1 isTooCloseTo: p2 [
	^ 1 -( self cosBetween: p1 and: p2 ) <~ 0.1


]

{ #category : #'public interface' }
GCircle >> polygonOn: points [
|polygonSegm firstP notUsedPoints currentP|
	currentP := points anyOne.
	firstP := currentP.
	notUsedPoints := points asOrderedCollection remove: currentP; yourself.
	polygonSegm := OrderedCollection new.
	
	[ notUsedPoints isNotEmpty ] whileTrue: [
		| nextP |
		nextP := notUsedPoints detectMin: [ :point | point dist: currentP ].
		polygonSegm add:( GSegment with: currentP with: nextP).
		currentP := nextP.
		notUsedPoints remove: currentP ].
	polygonSegm add:( GSegment with: currentP with: firstP).
	^ polygonSegm
]

{ #category : #accessing }
GCircle >> radius [

^radius 
]

{ #category : #'public interface' }
GCircle >> upperPoint [
	^ center x @ ( center y + radius )
]

{ #category : #'public interface' }
GCircle >> with: p1 boundaryContains1: aPoint [
 ( self boundaryContains: aPoint )
	ifFalse:[
		(self point: p1 isTooCloseTo: aPoint) 
			ifTrue:[ |cir newCenter| 
				newCenter := (self center + (self center dist: aPoint))/2.
				cir := GCircle center: newCenter radius: (self radius + (self radius dist: aPoint))/2 ]
		
		]

]

{ #category : #'public interface' }
GCircle >> with: p1 boundaryContains: aPoint [
^ ( self boundaryContains: aPoint ) or:[self point: p1 isTooCloseTo: aPoint]

]
