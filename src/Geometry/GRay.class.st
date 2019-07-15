"
I am a vector builded on line ax+by+c=0 and have my start in point v1.


"
Class {
	#name : #GRay,
	#superclass : #Object,
	#instVars : [
		'origin',
		'direction'
	],
	#category : 'Geometry'
}

{ #category : #'as yet unclassified' }
GRay class >> new [
	^ self basicNew initializeWithOrigin: 0@0 direction: 0@0
]

{ #category : #'as yet unclassified' }
GRay class >> origin: aPoint1 direction: aPoint2 [
	^ self new initializeWithOrigin: aPoint1 direction: aPoint2
]

{ #category : #arithmetic }
GRay >> * aRay [

^ ( self origin x - self direction x ) * ( aRay origin x - aRay direction x ) 
+ (( self origin y - self direction y ) * ( aRay origin y - aRay direction y ) )
]

{ #category : #arithmetic }
GRay >> + aRay [
	| newOrigin vector |
	
	newOrigin := self origin + aRay origin / 2.
	
	vector := (self direction - self origin) + 
				 (aRay direction - aRay origin).

	^ GRay origin: newOrigin direction: newOrigin + vector
 
]

{ #category : #comparing }
GRay >> = aRay [

^ self origin =~ aRay origin and: [
 (self origin bearingToPoint: self direction) =~
 (aRay origin bearingToPoint: aRay direction) ]

]

{ #category : #converting }
GRay >> asLine [
|ai bi ci|
(self origin  y) = (self direction  y) ifTrue:
[ ^ GLine
		a: 0 b: 1 c: ((self origin y) negated)].
(self origin x) = (self direction x) ifTrue:[ 
	^ GLine
		a: 1 b: 0 c: ((self origin x) negated)].	
ai := (self origin y) - (self direction y). 
bi := (self direction x) - (self origin x).
ci := ((self origin x) - (self direction x)) * (self origin y) + ( ((self direction y) - (self origin y)) * (self origin x) ).
^ GLine
		a:ai b: bi c: ci

]

{ #category : #converting }
GRay >> asSegment [
	^ GSegment with: origin with: direction
]

{ #category : #properties }
GRay >> cutWith: frame [
| coll |
coll := OrderedCollection new.
frame edges
	collect: [ :edge | edge intersectionPointWithRay: self ]
	thenDo: [ :p |
		(p notNil and: [ coll noneSatisfy: [ :p2 | p2 =~ p ] ])
			ifTrue: [ coll add: p ] ] .
coll isEmpty ifTrue:[^ nil]
				 ifFalse:[coll size = 2 
					ifTrue:  [ ^GSegment with: coll first with: coll second ]
					ifFalse: [ ^GSegment with: coll first with: self origin ] ]
]

{ #category : #accessing }
GRay >> direction [
	^direction 

]

{ #category : #accessing }
GRay >> direction: aPoint [
	direction := aPoint

]

{ #category : #'rectangle functions' }
GRay >> extendBy1: num [
|vect k  xn yn|
	( self origin x = self direction x ) 
		ifTrue:[ xn := self origin x.
			( self origin y > self direction y )
				ifFalse:[ yn := self direction y + num. ] 
				ifTrue:[ yn := self direction y - num ] ]
		ifFalse:[
			k := ( self origin y - ( self direction y ) )/( self origin x - ( self direction x ) ).
			( self origin x > self direction x ) 
				ifFalse:[ xn := self direction x + num. ] 
				ifTrue:[ xn := self direction x - num. ].
			yn := self direction y + ( k *( xn - self direction x ))].
	vect := GRay origin: self origin direction: ( xn @ yn ).
	(vect asLine = self asLine)
	ifTrue:[^vect]

]

{ #category : #'rectangle functions' }
GRay >> extendBy: num [
|cos sin|
self length = 0 
	ifTrue:[ self direction: ( (direction - origin) x * num  ) @ ((direction - origin) y * num ) ]
	ifFalse:[
cos := (direction - origin) x / self length.
sin := (direction - origin) y / self length.	
self direction: ( cos * num * self length ) @ ( sin * num * self length )].
^ self 

]

{ #category : #'rectangle functions' }
GRay >> extendWith: num [
|cos sin|
cos := (direction - origin) x / self length.
sin := (direction - origin) y / self length.	
self direction: ( self direction x +  (cos * num) ) @ ( self direction y + (sin * num) ).
^ self 

]

{ #category : #properties }
GRay >> flipped [

	^ GRay origin: self origin direction: (origin + (origin - direction))

]

{ #category : #properties }
GRay >> hasPoint: aPoint [
^ (( origin - direction ) signFuz = ( origin - aPoint ) signFuz  or:
					[ origin = aPoint ])
 

]

{ #category : #comparing }
GRay >> hash [
	^ ( self origin hash hashMultiply +
		(self origin bearingToPoint: self direction) hash ) hashMultiply

]

{ #category : #initialization }
GRay >> initialize [
	super initialize.
	origin := 0@0.
	direction := 0@0
]

{ #category : #initialization }
GRay >> initializeWithOrigin: aPoint1 direction: aPoint2 [
	super initialize.
	origin  := aPoint1.
	direction  := aPoint2 

]

{ #category : #accessing }
GRay >> length [
	^ (( self origin x - self direction x ) * ( self origin x - self direction x )
	+
	(( self origin y - self direction y ) * ( self origin y - self direction y )))sqrt
	

]

{ #category : #accessing }
GRay >> origin [ 
	^origin

]
