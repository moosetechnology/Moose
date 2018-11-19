"
This is a base class for storing the default highlight TextColors used by a highlighter. It gets the initial defaults from Shout text styling.
"
Class {
	#name : #XMLHighlightDefaults,
	#superclass : #Object,
	#classInstVars : [
		'defaultDefaultColor',
		'uiTheme'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting'
}

{ #category : #accessing }
XMLHighlightDefaults class >> defaultDefaultColor [
	^ defaultDefaultColor
		ifNil: [defaultDefaultColor := self textColorForShoutProperty: #default]
]

{ #category : #accessing }
XMLHighlightDefaults class >> defaultDefaultColor: aTextColor [
	defaultDefaultColor := aTextColor
]

{ #category : #'class initialization' }
XMLHighlightDefaults class >> initialize [
	"self initialize"

	self resetDefaults
]

{ #category : #'instance creation' }
XMLHighlightDefaults class >> new [
	"if the theme was changed since last initialization, reset the defaults"
	self uiTheme = Smalltalk ui theme
		ifFalse: [self resetDefaults].

	^ super new.
]

{ #category : #'class initialization' }
XMLHighlightDefaults class >> resetDefaults [
	defaultDefaultColor := nil
]

{ #category : #private }
XMLHighlightDefaults class >> textColorForShoutProperty: aShoutProperty [
	^ TextColor color:
		(((SHTextStylerST80 new attributesFor: aShoutProperty)
			detect: [:each | each respondsTo: #color]
			ifNone: [^ nil]) color)
]

{ #category : #private }
XMLHighlightDefaults class >> uiTheme [
	^ uiTheme ifNil: [uiTheme := Smalltalk ui theme]
]

{ #category : #defaults }
XMLHighlightDefaults >> defaultColor [
	^ self class defaultDefaultColor
]
