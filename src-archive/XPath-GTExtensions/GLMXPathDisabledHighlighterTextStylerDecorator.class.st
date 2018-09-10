"
A disabled highlighting XPath expression text style decorator.
"
Class {
	#name : #GLMXPathDisabledHighlighterTextStylerDecorator,
	#superclass : #GLMXPathHighlighterTextStylerDecorator,
	#instVars : [
		'disabledText'
	],
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #'instance creation' }
GLMXPathDisabledHighlighterTextStylerDecorator class >> disabledText: aStringOrText [
	^ self new disabledText: aStringOrText
]

{ #category : #accessing }
GLMXPathDisabledHighlighterTextStylerDecorator >> disabledText [
	^ disabledText ifNil: [disabledText := '' asText]
]

{ #category : #accessing }
GLMXPathDisabledHighlighterTextStylerDecorator >> disabledText: aStringOrText [
	disabledText := aStringOrText asText
]

{ #category : #parsing }
GLMXPathDisabledHighlighterTextStylerDecorator >> highlightingParse: aString onError: aBlock [
	^ self disabledText
]
