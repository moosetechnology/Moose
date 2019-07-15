Class {
	#name : #RTCompositeElementAttachPoint,
	#superclass : #RTAttachPoint,
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'public - hooks' }
RTCompositeElementAttachPoint >> basicEndingPointOf: aRTEdge [
	^ aRTEdge to encompassingRectangle topCenter
]

{ #category : #'public - hooks' }
RTCompositeElementAttachPoint >> basicStartingPointOf: aRTEdge [
	^ aRTEdge from encompassingRectangle bottomCenter
]
