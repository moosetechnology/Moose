Extension { #name : #Point }

{ #category : #'*Trachel' }
Point >> relativeAngleTo: aPoint [
	| width height hip |
	height:= (self y - aPoint y) abs.
	width:= (self x -aPoint x) abs.
	(height = 0 and: [ width = 0 ]) ifTrue: [ ^ 0 ].
	hip:= (self dotProduct: aPoint) sqrt.
	
	"First quadrant"
	(self x > 0 and: [self y > 0]) ifTrue: [ (width @ height) angle]
	
	
	
]
