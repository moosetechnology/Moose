"
RTResetAllShape is an animation (in the Roassal sense) that reset all the trachel shapes in the canvas. 
"
Class {
	#name : #RTResetAllShape,
	#superclass : #RTObject,
	#instVars : [
		'trCanvas'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #accessing }
RTResetAllShape >> addedIn: aTRCanvas [
	self trCanvas: aTRCanvas
]

{ #category : #testing }
RTResetAllShape >> hasCompleted [
	^ false
]

{ #category : #refreshing }
RTResetAllShape >> refresh [
	self resetShapes
]

{ #category : #action }
RTResetAllShape >> resetShapes [
	trCanvas shapes do: #resetPath
]

{ #category : #accessing }
RTResetAllShape >> start [
	self resetShapes
]

{ #category : #accessing }
RTResetAllShape >> trCanvas [
	^ trCanvas
]

{ #category : #accessing }
RTResetAllShape >> trCanvas: anObject [
	trCanvas := anObject
]
