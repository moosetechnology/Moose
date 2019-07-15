"
I am a segment between two vertices
"
Class {
	#name : #GSegment,
	#superclass : #Object,
	#instVars : [
		'v1',
		'v2',
		'epsilon'
	],
	#category : 'Geometry'
}

{ #category : #'as yet unclassified' }
GSegment class >> with: aPoint1 with: aPoint2 [
	^ self new initializeWith: aPoint1 with: aPoint2
]

{ #category : #comparing }
GSegment >> = segment [
^
((self v1 =~ segment v1) and: [self v2 =~ segment v2]) 
or: 
[(self v1 =~ segment v2) and: [self v2 =~ segment v1]]
]

{ #category : #properties }
GSegment >> alreadyExistIn: aSet [ 
 	aSet do:[:eachS | (eachS asLine = (self asLine) )ifTrue:[ ^ true ]].
	^ false
]

{ #category : #properties }
GSegment >> asLine [
	^ GLine through: v1 and: v2
]

{ #category : #properties }
GSegment >> belowPoint:p [
^( (self v2 x - self v1 x)*(p y - self v1 y)-((self v2 y - self v1 y)*(p x - self v1 x))> 0 )
	

]

{ #category : #properties }
GSegment >> boundBy: aPoint [
	^ self v1 = aPoint or: [ self v2 = aPoint ]
]

{ #category : #properties }
GSegment >> cutWith: frame [
| coll |
coll := OrderedCollection new.
frame edges
	collect: [ :edge | edge intersectionPointWithSegment: self ]
	thenDo: [ :p |
		(p notNil and: [ coll noneSatisfy: [ :p2 | p2 =~ p ] ])
			ifTrue: [ coll add: p ] ].
coll ifEmpty: [ "self halt".
	(frame hasPoint: self v1)
		ifTrue:  [ ^ self ]
		ifFalse: [ ^ nil ] ].

coll size = 2 
	ifTrue: [ ^ GSegment with: coll first with: coll second ].

(frame hasPoint: self v1) 
	ifTrue:  [ ^ GSegment with: coll first with: self v1 ] 
	ifFalse: [ ^ GSegment with: coll first with: self v2 ]
							
	

]

{ #category : #properties }
GSegment >> dist: p [
	^ self asLine dist: p
]

{ #category : #properties }
GSegment >> distTo: point [
	^ (( 
		((self v2 y - self v1 y) * point x) - ((self v2 x - self v1 x) * point y) + ((self v2 x) * (self v1 y )) - ((self v1 x) * (self v2 y ))
		)abs)
	/
		((  (self v1 y - self v2 y) * (self v1 y - self v2 y) 
		+
			((self v1 x - self v2 x) * (self v1 x - self v2 x))
		 )sqrt)
	

]

{ #category : #properties }
GSegment >> extendSegmVert: v to: frame [
	|points ver p|
	points := frame intersectionPointsWithLine: self asLine.
	ver := self vertices detect:[:vi | (vi = v) not].
	( ver x = v x ) 
		ifTrue:[ ( ver y > v y )
			ifTrue: [ p := points detect:[ :pi | pi y < v y] ]
			ifFalse:[ p := points detect:[ :pi | pi y > v y] ]]
		ifFalse:	[ ( ver x > v x )
			ifTrue: [ p := points detect:[ :pi | pi x < v x] ]
			ifFalse:[ p := points detect:[ :pi | pi x > v x] ]
			 ].
^ GSegment with: ver with: p
							
	

]

{ #category : #properties }
GSegment >> extendWith: point and: frame [
	|points v|
	(self asLine hasPoint: point) 
		ifTrue:[ 
			(( self v1 dist: point ) < ( self v2 dist: point ))
				ifTrue:[ v1 := point]
				ifFalse:[ v2 := point].
			v := self vertices detect:[:p | (p = point) not ].
			points := frame intersectionPointsWithLine: (self asLine).
			points size = 2 
				ifTrue:[  ( ( GSegment with: point with: points first ) hasPoint: v )  
					ifTrue:[ ^ GSegment with: point with: points first ]
					ifFalse:[ ^ GSegment with: point with: points second] ]]
		
]

{ #category : #properties }
GSegment >> has: p [
	(self asLine hasPoint: p)
	ifFalse:[^false]
	ifTrue:[ ^((
		((self v1 x <= p x and:[ p x <= self v2 x]) 
						or:[ self v2 x <= p x and:[ p x <= self v1 x]]))
		and:[ 
			((self v1 y <= p y and:[ p y <= self v2 y]) 
						or:[ self v2 y <= p y and:[ p y <= self v1 y]])])
		]

]

{ #category : #properties }
GSegment >> hasOnLinePoint: p [
	| e k edges tr v|
	(self v1 =~ p or:[ self v2 =~ p] ) 
		ifTrue:[^true]
		ifFalse:[
			tr := ( GTriangle with: p with: self v1 with: self v2 ).
			edges:= tr edges.
			k := edges detectMax: [:ed | ed length].
			e := (1/2)*(
					(( self v1 x - self v2 x ) * ( p y - self v2 y )-
					(( self v1 y - self v2 y ) * ( p x - self v2 x )))
					abs
			/k length).
			v := tr vertices detect:[ :vi |  vi~= k v1 and:[ vi ~= k v2 ]].
			^ "k asLine hasPoint: v withApproximation: e."
			(k dist: v) lesserOrDifferentThan: (2*e)] 
	

]

{ #category : #properties }
GSegment >> hasOnLinePoint: p withRespectTo: vert [
	| e k edges tr v|
	(self v1 =~ p or:[ self v2 =~ p] ) 
		ifTrue:[^ true]
		ifFalse:[ "(vert x < self v2 x)
			ifTrue:[
				(vert x < p x and:[ p x < self v2 x ])
				or:[ (vert x < self v2 x and:[ p x > self v2 x ])]]"
			((
			( p x between: vert x and: self v2 x)and:
			[ p y between: vert y and: self v2 y]) 
		or:[ (self v2 x between: vert x and: p x) and:
			(self v2 y between: vert y and: p y)])
				ifFalse:[^ false]
				ifTrue:[
					tr := ( GTriangle with: p with: self v1 with: self v2 ).
					edges:= tr edges.
					k := edges detectMax: [:ed | ed length].
					e := (1/2)*(
							(( self v1 x - self v2 x ) * ( p y - self v2 y )-
							(( self v1 y - self v2 y ) * ( p x - self v2 x )))
							abs
					/k length).
					v := tr vertices detect:[ :vi |  vi~= k v1 and:[ vi ~= k v2 ]].
					^ "k asLine hasPoint: v withApproximation: e."
					(k dist: v) lesserOrDifferentThan: (2*e)]] 
	

]

{ #category : #properties }
GSegment >> hasOnLinePoint: p withRespectTo: vert withApprox: apro [
	| e k edges tr v eps |
	(self v1 =~ p or:[ self v2 =~ p] ) 
		ifTrue:[^ true]
		ifFalse:[ 
			tr := ( GTriangle with: p with: self v1 with: self v2 ).
			edges := tr edges.
			k := edges detectMax: [:ed | ed length].
			eps := (1/2)*(
							(( self v1 x - self v2 x ) * ( p y - self v2 y )-
							(( self v1 y - self v2 y ) * ( p x - self v2 x )))
							abs
					/k length).
			e := apro min: eps.
			(((
			( p x isBetween: vert x and: self v2 x with: e)and:
			[ p y isBetween: vert y and: self v2 y with: e]) 
		or:[ (self v2 x isBetween: vert x and: p x with: e) and:
			(self v2 y isBetween: vert y and: p y with: e)]) "and:[ self asLine hasPoint: p withApproximation: e ]")
				ifFalse:[^ false]
				ifTrue:[
					"tr := ( GTriangle with: p with: self v1 with: self v2 ).
					edges:= tr edges.
					k := edges detectMax: [:ed | ed length].
					e := (1/2)*(
							(( self v1 x - self v2 x ) * ( p y - self v2 y )-
							(( self v1 y - self v2 y ) * ( p x - self v2 x )))
							abs
					/k length)."
					v := tr vertices detect:[ :vi |  vi~= k v1 and:[ vi ~= k v2 ]].

					((k dist: v) lesserOrDifferentThan: (2*e)) 
						ifTrue:[ ^ true"(k asLine hasPoint: v withApproximation: e)"]
						ifFalse:[ ^ false]
					]]
	

]

{ #category : #properties }
GSegment >> hasPoint:aPoint [

  ^( ((self v1 x lesserOrDifferentThan: aPoint x) and: [aPoint x lesserOrDifferentThan: self v2 x])  or:
		[(self v2 x lesserOrDifferentThan: aPoint x) and: [aPoint x lesserOrDifferentThan: self v1 x]]  ) and: 
   [ ((self v1 y lesserOrDifferentThan: aPoint y) and: [aPoint y lesserOrDifferentThan: self v2 y])  or:
		[(self v2 y lesserOrDifferentThan: aPoint y) and: [aPoint y lesserOrDifferentThan: self v1 y]]   ]  .
   

]

{ #category : #comparing }
GSegment >> hash [
^( v1 hash  + v2 hash ) hashMultiply
]

{ #category : #initialization }
GSegment >> initializeWith: aPoint1 with: aPoint2 [
	super initialize.
	v1 := aPoint1.
	v2 := aPoint2
]

{ #category : #properties }
GSegment >> intersect: aSegment [

(self v1 to: self v2 intersects: aSegment v1 to: aSegment v2) 
	ifTrue:	[^self asLine intersect: (aSegment asLine)]
	ifFalse: [^nil]

]

{ #category : #properties }
GSegment >> intersectionPointWithLine: aLine [

	^ (self asLine intersect: aLine) ifNotNil: [ :point | 
		(self hasPoint: point)
			ifTrue:  [ point ]
			ifFalse: [ nil ] ]

]

{ #category : #properties }
GSegment >> intersectionPointWithRay: ray [

	^ (self asLine intersect: ray asLine) ifNotNil: [ :point | 
		((self hasPoint: point) and:
				[ray hasPoint: point])
			ifTrue:  [ point ]
			ifFalse: [ nil ] ]

]

{ #category : #properties }
GSegment >> intersectionPointWithSegment: segm [

	^ (self asLine intersect: segm asLine) ifNotNil: [ :point | 
		((self hasPoint: point) and:[segm hasPoint: point])
			ifTrue:  [ point ]
			ifFalse: [ nil ] ]

]

{ #category : #properties }
GSegment >> isOnLineWith: segm [
	self = segm 
		ifTrue:[^ true]
		ifFalse:[^ self asLine = (segm asLine)]
]

{ #category : #properties }
GSegment >> length [
	^ v1 dist: v2
]

{ #category : #properties }
GSegment >> locationOf: aPoint [
    
    ^ ((self v2 x - self v1 x) * (aPoint y - self v1 y) - 
      ((self v2 y - self v1 y) * (aPoint x - self v1 x))) signFuz
]

{ #category : #properties }
GSegment >> midPoint [
 ^ (v1 + v2) / 2.
]

{ #category : #properties }
GSegment >> perpendicularBisector [

^GLine
a:  (v2 x - v1 x)
b:  (v2 y - v1 y)
c: ((v1 x * v1 x) - (v2 x * v2 x) + (v1 y * v1 y) - (v2 y * v2 y))/2

]

{ #category : #printing }
GSegment >> printOn: aStream [
	v1 printOn: aStream.
	aStream nextPutAll: '>-<'.
	v2 printOn: aStream
]

{ #category : #accessing }
GSegment >> v1 [
^v1


]

{ #category : #accessing }
GSegment >> v2 [
^v2


]

{ #category : #initialization }
GSegment >> vertices [
	^ { v1 . v2 }
]
