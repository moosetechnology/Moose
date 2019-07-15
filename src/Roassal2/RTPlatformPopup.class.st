"
I am a basic class to have the platform popup instead of the roassal popup (RTPopup)
"
Class {
	#name : #RTPlatformPopup,
	#superclass : #RTAbstractPopup,
	#instVars : [
		'background',
		'text'
	],
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #'as yet unclassified' }
RTPlatformPopup class >> color: aColor [
	^ self new background: aColor
]

{ #category : #'as yet unclassified' }
RTPlatformPopup class >> removeLastPopup [
	TRPlatform current deletePopup: self lastPopup.
	self resetLastPopup.
]

{ #category : #'as yet unclassified' }
RTPlatformPopup class >> text: aString [
	^ self new text: aString
]

{ #category : #'as yet unclassified' }
RTPlatformPopup class >> text: aString color: aColor [
	^ self new text: aString; background: aColor
]

{ #category : #'as yet unclassified' }
RTPlatformPopup >> background: aColor [
	background := aColor
]

{ #category : #'as yet unclassified' }
RTPlatformPopup >> createAndShowPopupFor: element event: event [
	| popup |
	self removeLastPopup.
	popup := TRPlatform current
		createPopupFor: element view canvas morph
		in: event position
		background: (background rtValue: element)
	 	string: (text rtValue: element model) asString.
	self lastPopup: popup
]

{ #category : #'as yet unclassified' }
RTPlatformPopup >> initialize [
	super initialize.
	background := Color gray.
	text := #yourself.
]

{ #category : #'as yet unclassified' }
RTPlatformPopup >> text [
	^ text
]

{ #category : #'as yet unclassified' }
RTPlatformPopup >> text: aBlock [
	text := aBlock
]
