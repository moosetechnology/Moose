"
I am a simple label shape to draw text with the command textPath:
"
Class {
	#name : #TRTextPath,
	#superclass : #TRLabelShape,
	#instVars : [
		'outlineColor',
		'outlineWidth'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #drawing }
TRTextPath >> drawOn: athensCanvas [
	TRPlatform current drawTextPathFor: self canvas: athensCanvas
]

{ #category : #accessing }
TRTextPath >> outlineColor [
	^ outlineColor
]

{ #category : #accessing }
TRTextPath >> outlineColor: aColor [
	outlineColor:= aColor
]

{ #category : #accessing }
TRTextPath >> outlineWidth [
	^ outlineWidth
]

{ #category : #accessing }
TRTextPath >> outlineWidth: aNumber [
	outlineWidth := aNumber
]
