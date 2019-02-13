"
I hold various default configurations for Roassal such as default colors etc, so each shape doesn't have to set it by itself.
"
Class {
	#name : #RTTheme,
	#superclass : #RTObject,
	#classInstVars : [
		'current'
	],
	#category : #'Roassal2-Core'
}

{ #category : #accessing }
RTTheme class >> current [
	^ current ifNil: [ current := self new ]
]

{ #category : #accessing }
RTTheme >> textColor [
	^ Color gray
]

{ #category : #accessing }
RTTheme >> textFont [
	^ TRLabelShape getFontForSize: self textSize
]

{ #category : #accessing }
RTTheme >> textSize [
	^ 10
]
