"
A highlighting XML document text style decorator for disabled highlighting text presentations. The text and encoding are set at instance creation and can't be changed with editing.
"
Class {
	#name : #GLMXMLDisabledDocumentHighlighterTextStylerDecorator,
	#superclass : #GLMXMLDocumentHighlighterTextStylerDecorator,
	#instVars : [
		'disabledText'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #'instance creation' }
GLMXMLDisabledDocumentHighlighterTextStylerDecorator class >> disabledText: aStringOrText [
	^ self
		disabledText: aStringOrText
		encoding: ''
]

{ #category : #'instance creation' }
GLMXMLDisabledDocumentHighlighterTextStylerDecorator class >> disabledText: aStringOrText encoding: anEncodingName [
	^ self new
		disabledText: aStringOrText;
		encoding: anEncodingName
]

{ #category : #accessing }
GLMXMLDisabledDocumentHighlighterTextStylerDecorator >> disabledText [
	^ disabledText ifNil: [disabledText := '' asText]
]

{ #category : #accessing }
GLMXMLDisabledDocumentHighlighterTextStylerDecorator >> disabledText: aStringOrText [
	disabledText := aStringOrText asText
]

{ #category : #parsing }
GLMXMLDisabledDocumentHighlighterTextStylerDecorator >> highlightingParse: aString onError: aBlock [
	^ self disabledText
]
