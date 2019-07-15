Class {
	#name : #RTSankeyAttachPoint,
	#superclass : #RTAttachPoint,
	#category : #'Roassal2-Experimental'
}

{ #category : #'public - hooks' }
RTSankeyAttachPoint >> basicEndingPointOf: anEdge [
	| ty x y |
	ty := self for: anEdge get: #ty.
	x := anEdge to position x.
	y := anEdge to position y + ty + ((self for: anEdge get: #dy)/2) - ((self for: anEdge to get: #dy)/2).
	^ x@y 
]

{ #category : #'public - hooks' }
RTSankeyAttachPoint >> basicStartingPointOf: anEdge [
	| sy x y |
	sy := self for: anEdge get: #sy.
	x := anEdge from position x+ (self for: anEdge from get: #dx).
	y := anEdge from position y + sy + ((self for: anEdge get: #dy)/2) - ((self for: anEdge from get: #dy)/2).
	^ x@y 
]

{ #category : #'public - hooks' }
RTSankeyAttachPoint >> for: e get: k [
	^ e attributes at: k ifAbsent: [ 0 ].
]
