Extension { #name : #Point }

{ #category : #'*Roassal2' }
Point class >> r: radius theta: angle [
	^ (radius * angle cos) @ (radius * angle sin)
]
