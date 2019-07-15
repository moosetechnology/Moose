Class {
	#name : #TRAbstractMouseEvent,
	#superclass : #TRUserInputEvent,
	#category : #'Trachel-Events'
}

{ #category : #testing }
TRAbstractMouseEvent >> isPositionAboveShape [
	^ shape encompassingRectangle containsPoint: self positionFromCamera
]
