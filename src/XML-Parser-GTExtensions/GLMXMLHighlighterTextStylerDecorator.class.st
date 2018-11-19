"
An abstract base class for XML highlighter text styler decorators. Subclasses need to implement #highlightingParse:onSuccess:onError: .
"
Class {
	#name : #GLMXMLHighlighterTextStylerDecorator,
	#superclass : #GLMHighlighterTextStylerDecorator,
	#instVars : [
		'highlightableLengthLimit',
		'errorColor'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> defaultErrorColor [
	^ TextColor red
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> defaultHighlightableLengthLimit [
	^ 100000
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> defaultStyler [
	^ GLMHighlighterTextParserStyler new
		view: self;
		parser: self
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> errorColor [
	^ errorColor
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> errorColor: aTextColor [
	errorColor := aTextColor
]

{ #category : #private }
GLMXMLHighlighterTextStylerDecorator >> highlightStartPositionForErrorAt: aPosition in: aString [
	"color all of it if the error occurred at the end of the
	input, otherwise there would be no error coloring at all"
	^ aPosition >= aString size
		ifTrue: [1]
		ifFalse: [aPosition]
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> highlightableLengthLimit [
	^ highlightableLengthLimit
]

{ #category : #accessing }
GLMXMLHighlighterTextStylerDecorator >> highlightableLengthLimit: anInteger [
	highlightableLengthLimit := anInteger
]

{ #category : #parsing }
GLMXMLHighlighterTextStylerDecorator >> highlightingParse: aString onError: aBlock [
	self subclassResponsibility
]

{ #category : #initialization }
GLMXMLHighlighterTextStylerDecorator >> initialize [
	super initialize.

	highlightableLengthLimit := self defaultHighlightableLengthLimit.
	errorColor := self defaultErrorColor.
]

{ #category : #parsing }
GLMXMLHighlighterTextStylerDecorator >> parse: aString onError: aBlock [
	aString size <= self highlightableLengthLimit
		ifTrue: [
			^ self
				highlightingParse: aString
				onError: aBlock]
		ifFalse: [^ self text]
]

{ #category : #parsing }
GLMXMLHighlighterTextStylerDecorator >> parser [
	^ self
]
