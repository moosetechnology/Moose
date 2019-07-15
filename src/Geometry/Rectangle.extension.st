Extension { #name : #Rectangle }

{ #category : #'*Geometry' }
Rectangle >> edges [
	^ { 
		GSegment with: (self origin ) with: (self origin x @ self corner y). 
		GSegment with: (self origin x @ self corner y) with: (self corner).
		GSegment with: (self corner ) with: (self corner x @ self origin y).
 		GSegment with: (self corner x @ self origin y) with: (self origin).
}

]

{ #category : #'*Geometry' }
Rectangle >> geomCenter [
	"Answer the point at the center of the receiver."

	^self topLeft + self bottomRight / 2
]

{ #category : #'*Geometry' }
Rectangle class >> geomCenter: centerPoint extent: extentPoint [ 
	"Answer an instance of me whose center is centerPoint and width 
	by height is extentPoint.  "

	^self origin: centerPoint - (extentPoint / 2) extent: extentPoint
]

{ #category : #'*Geometry' }
Rectangle >> hasOnBoundary: point [
| a |
	a := self edges select: [:edge | a := edge hasPoint: point].
	^a isNotEmpty
]

{ #category : #'*Geometry' }
Rectangle >> hasOnOneSide: point1 and: point2 [ 
 ^	
	((point1 x = point2 x and:[point1 x = self origin x or:[point1 x = self corner x]] )
or:[point1 y = point2 y and:[point1 y = self origin y or:[point1 y = self corner y]] ])
]

{ #category : #'*Geometry' }
Rectangle >> hasPoint: point [ 
"inside the frame and on the boundary"
 ^	((self origin x <= point x and: [point x <= self corner x])
	and:[ (self origin y <= point y and: [point y <= self corner y]) 
	or:[self origin y >= point y and: [point y >= self corner y]]])
	or:
	[(self origin x >= point x and: [point x >= self corner x ])
	and:[ (self origin y <= point y and: [point y <= self corner y]) 
	or:[self origin y >= point y and: [point y >= self corner y]]]
	]
]

{ #category : #'*Geometry' }
Rectangle >> intersectionPointWithRay: ray [

^ self edges collect:[ :edge | edge intersectionPointWithRay: ray]  
				thenReject: #isNil.
	
]

{ #category : #'*Geometry' }
Rectangle >> intersectionPointsWithLine: line [
	|points ps|
	ps := OrderedCollection new.
	points := OrderedCollection new.
 	self edges do:[ :edge | 
		|p|
		p := edge intersectionPointWithLine: line.
		p isNotNil 
			ifTrue:[ (ps noneSatisfy: [:pi| pi =~p]) ifTrue:[
			ps add: p ]]]. 
	^ ps

"^ self edges collect:[ :edge | edge intersectionPointWithLine: line]  
				thenReject: #isNil."
	
]

{ #category : #'*Geometry' }
Rectangle >> intersectionPointsWithSegment: segm [

^ self edges collect:[ :edge | edge intersectionPointWithSegment: segm]  
				thenReject: #isNil.
	
]

{ #category : #'*Geometry' }
Rectangle >> sideWhichHas: point [
	
	^ self edges detect: [ :edge | edge hasPoint: point ]

]

{ #category : #'*Geometry' }
Rectangle >> vertices [

	^ { origin . 
		origin x @ corner y . 
		corner. 
		corner x @ origin y }
]
