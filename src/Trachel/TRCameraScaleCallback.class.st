"
I am triggered when the Camera scale (zoom) has changed.

I should be atteched to TRCamera (`aView canvas camera addCallback:`)
"
Class {
	#name : #TRCameraScaleCallback,
	#superclass : #TRCallback,
	#category : #'Trachel-Callbacks'
}

{ #category : #testing }
TRCameraScaleCallback >> isCameraScaleCallback [
	^ true
]

{ #category : #action }
TRCameraScaleCallback >> scaleChanged: aScaleFactorAsInteger [
	^ block cull: aScaleFactorAsInteger
]
