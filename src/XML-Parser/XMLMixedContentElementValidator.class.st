"
This class validates elements that can contain a mix of PCDATA and certain elements.
"
Class {
	#name : #XMLMixedContentElementValidator,
	#superclass : #XMLElementValidator,
	#instVars : [
		'allowedContent'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLMixedContentElementValidator class >> element: anElement allowedContent: anAllowedContentCollection [
	^ self new
		setElement: anElement
		allowedContent: anAllowedContentCollection
]

{ #category : #accessing }
XMLMixedContentElementValidator >> allowedContent [
	^ allowedContent
]

{ #category : #accessing }
XMLMixedContentElementValidator >> allowedContent: anAllowedContentCollection [
	allowedContent := anAllowedContentCollection
]

{ #category : #testing }
XMLMixedContentElementValidator >> atEnd [
	^ true
]

{ #category : #private }
XMLMixedContentElementValidator >> errorContentContainsDuplicates [
	XMLValidationException
		formatSignal:
			'Declaration for mixed content element <{1}> contains duplicate names'
		with: self element
]

{ #category : #testing }
XMLMixedContentElementValidator >> isMixedContent [
	^ true
]

{ #category : #initialization }
XMLMixedContentElementValidator >> setElement: anElement allowedContent: anAllowedContentCollection [
	element := anElement.
	allowedContent := anAllowedContentCollection.
]

{ #category : #defaults }
XMLMixedContentElementValidator >> typeName [
	^ 'mixed content'
]

{ #category : #validating }
XMLMixedContentElementValidator >> validateElementDeclaration [
	| oldAllowedContentCollection |

	oldAllowedContentCollection := self allowedContent.
	self allowedContent: oldAllowedContentCollection asSet.
	(self allowedContent size < oldAllowedContentCollection size)
		ifTrue: [self errorContentContainsDuplicates].
]

{ #category : #validating }
XMLMixedContentElementValidator >> validateStartTag: anElement [
	(self allowedContent includes: anElement)
		ifFalse: [self errorUnexpectedElement: anElement]
	
]
