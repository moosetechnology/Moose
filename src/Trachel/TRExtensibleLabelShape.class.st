Class {
	#name : #TRExtensibleLabelShape,
	#superclass : #TRLabelShape,
	#category : #'Trachel-Shapes'
}

{ #category : #accessing }
TRExtensibleLabelShape >> extent: newExtent [
	| oldExtent |
	oldExtent := self extent.
	(oldExtent = (0 @ 0)) ifTrue: [ ^ self ].
	matrix scaleBy: newExtent / oldExtent.
	self triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent.

]
