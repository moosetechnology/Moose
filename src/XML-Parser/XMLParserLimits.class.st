"
This class places security limits on input. Setting a limit to nil disables it, and removeAll disables all.
"
Class {
	#name : #XMLParserLimits,
	#superclass : #Object,
	#instVars : [
		'documentReadLimit',
		'maxEntityReplacementDepth'
	],
	#classVars : [
		'DefaultReadLimit'
	],
	#category : #'XML-Parser'
}

{ #category : #defaults }
XMLParserLimits class >> defaultDocumentReadLimit [
	^ self defaultReadLimit
]

{ #category : #defaults }
XMLParserLimits class >> defaultMaxEntityReplacementDepth [
	^ 10
]

{ #category : #accessing }
XMLParserLimits class >> defaultReadLimit [
	^ DefaultReadLimit
		ifNil: [DefaultReadLimit := 10000000]
]

{ #category : #accessing }
XMLParserLimits class >> defaultReadLimit: aDefaultLimit [
	"can be used to change the default read limit instances start with"
	DefaultReadLimit := aDefaultLimit
]

{ #category : #accessing }
XMLParserLimits >> documentReadLimit [
	^ documentReadLimit
]

{ #category : #accessing }
XMLParserLimits >> documentReadLimit: anInteger [
	documentReadLimit := anInteger
]

{ #category : #initialization }
XMLParserLimits >> initialize [
	super initialize.

	documentReadLimit := self class defaultDocumentReadLimit.
	maxEntityReplacementDepth := self class defaultMaxEntityReplacementDepth.
]

{ #category : #accessing }
XMLParserLimits >> maxEntityReplacementDepth [
	^ maxEntityReplacementDepth
]

{ #category : #accessing }
XMLParserLimits >> maxEntityReplacementDepth: anInteger [
	maxEntityReplacementDepth := anInteger
]

{ #category : #removing }
XMLParserLimits >> removeAll [
	documentReadLimit := nil.
	maxEntityReplacementDepth := nil.
]
