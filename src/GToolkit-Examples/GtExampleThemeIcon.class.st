"
I allow icons from the current theme to be as used as icons for an example. I obtain the icon from the theme.
"
Class {
	#name : #GtExampleThemeIcon,
	#superclass : #GtExampleIcon,
	#instVars : [
		'selector'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #'instance creation' }
GtExampleThemeIcon class >> fromSelector: aSelector [
	^ self new 
		selector: aSelector;
		yourself
]

{ #category : #'instance creation' }
GtExampleThemeIcon class >> fromString: aString [
	^ self fromSelector: aString asSymbol
]

{ #category : #private }
GtExampleThemeIcon >> basicForm [
	^ Smalltalk ui icons iconNamed: self selector 
]

{ #category : #testing }
GtExampleThemeIcon >> exists [
	^ (Smalltalk ui icons iconNamed: self selector ifNone: [ nil ]) notNil
]

{ #category : #accessing }
GtExampleThemeIcon >> selector [
	^ selector
]

{ #category : #accessing }
GtExampleThemeIcon >> selector: anObject [
	selector := anObject
]
