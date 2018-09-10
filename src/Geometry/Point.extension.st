Extension { #name : #Point }

{ #category : #'*Geometry' }
Point >> =~ aPoint [
	^ (self dist: aPoint) =~ 0

]

{ #category : #'*Geometry' }
Point >> has: aPoint onTheSameSideAs: p [
	(self x <= p x) 
		ifTrue:[ self y <= p y
			ifTrue:[ ^ (self x <= aPoint x) and:[ self y <= aPoint y ] ]
			ifFalse:[ ^ (self x <= aPoint x) and:[ self y > aPoint y ] ] ]
		ifFalse:[ self y <= p y
			ifTrue:[ ^ (self x > aPoint x) and:[ self y <= aPoint y ] ]
			ifFalse:[ ^ (self x > aPoint x) and:[ self y > aPoint y ] ] ]
	 
]

{ #category : #'*Geometry' }
Point >> notEqualTo: aPoint [
	^ (self =~ aPoint) not
]

{ #category : #'*Geometry' }
Point >> ray: aPoint [ 
	^ GRay origin: self direction: aPoint 
]

{ #category : #'*Geometry' }
Point >> segment: aPoint [ 
	^ GSegment with: self with: aPoint 
]

{ #category : #'*Geometry' }
Point >> signFuz [
	^ (x signFuz @ y signFuz)
]
