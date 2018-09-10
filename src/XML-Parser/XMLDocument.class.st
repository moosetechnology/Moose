"
This class represents a document node, which is often the root of a DOM tree. Nodes can access their document ancestor with #document.
"
Class {
	#name : #XMLDocument,
	#superclass : #XMLNodeWithElements,
	#instVars : [
		'version',
		'encoding',
		'isStandalone',
		'doctypeDeclaration',
		'doctypeDefinition'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLDocument class >> root: aRoot [
	^ self new root: aRoot
]

{ #category : #visiting }
XMLDocument >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitDocument: self
]

{ #category : #accessing }
XMLDocument >> doctypeDeclaration [
	^ doctypeDeclaration
]

{ #category : #accessing }
XMLDocument >> doctypeDeclaration: aDoctypeDeclaration [
	doctypeDeclaration
		ifNotNil: [doctypeDeclaration parent: nil].

	aDoctypeDeclaration
		ifNotNil: [
			aDoctypeDeclaration hasParent
				ifTrue: [
					"remove it from its current parent"
					aDoctypeDeclaration parent doctypeDeclaration: nil].
			aDoctypeDeclaration parent: self].

	doctypeDeclaration := aDoctypeDeclaration.
]

{ #category : #accessing }
XMLDocument >> doctypeDefinition [
	^ doctypeDefinition
]

{ #category : #accessing }
XMLDocument >> doctypeDefinition: aDoctypeDefinition [
	doctypeDefinition := aDoctypeDefinition
]

{ #category : #accessing }
XMLDocument >> document [
	^ self
]

{ #category : #accessing }
XMLDocument >> documentRoot [
	"returns the root of the DOM tree"
	^ self
]

{ #category : #accessing }
XMLDocument >> encoding [	
	^ encoding ifNil: [encoding := '']
]

{ #category : #accessing }
XMLDocument >> encoding: aString [	
	encoding := aString
]

{ #category : #private }
XMLDocument >> errorCannotHaveNonElementRoot [
	XMLDOMException signal: 'Cannot have non-element root'
]

{ #category : #testing }
XMLDocument >> hasDoctypeDeclaration [
	^ self doctypeDeclaration notNil
]

{ #category : #testing }
XMLDocument >> hasDoctypeDefinition [
	^ self doctypeDefinition notNil
]

{ #category : #testing }
XMLDocument >> hasEncoding [
	^ self encoding notEmpty
]

{ #category : #testing }
XMLDocument >> hasRoot [
	^ self root notNil
]

{ #category : #private }
XMLDocument >> innerXMLStateClass [
	^ XMLPostDoctypeDeclarationState
]

{ #category : #testing }
XMLDocument >> isDocument [
	^ true
]

{ #category : #testing }
XMLDocument >> isStandalone [
	^ isStandalone ifNil: [isStandalone := false]
]

{ #category : #accessing }
XMLDocument >> isStandalone: aBoolean [
	isStandalone := aBoolean
]

{ #category : #copying }
XMLDocument >> postCopy [
	super postCopy.

	doctypeDeclaration
		ifNotNil: [doctypeDeclaration := doctypeDeclaration copy].
]

{ #category : #accessing }
XMLDocument >> root [
	"Returns the current root element or nil if there isn't one"

	^ self firstElement
]

{ #category : #accessing }
XMLDocument >> root: anElement [
	"Replaces the current root element (if any) with anElement,
	leaving all other nodes in place"

	anElement isElement
		ifFalse: [self errorCannotHaveNonElementRoot].

	self firstElement
		ifNil: [self addNode: anElement]
		ifNotNil: [:firstElement |
			self
				replaceNode: firstElement
				with: anElement].
]

{ #category : #validating }
XMLDocument >> validate [
	"revalidate against the DTD it was parsed with (if any)"

	self hasDoctypeDefinition
		ifTrue: [
			self doctypeDefinition
				removeElementIDReferences;
				removeElementIDs.
			self validateWith: self doctypeDefinition newValidator]
]

{ #category : #validating }
XMLDocument >> validateWith: aValidator [
	"revalidate against a custom DTD or other validator"

	(XMLValidatingNodeVisitor validator: aValidator) visitDocument: self
]

{ #category : #accessing }
XMLDocument >> version [	
	^ version
]

{ #category : #accessing }
XMLDocument >> version: aVersionFloat [
	version := aVersionFloat
]

{ #category : #printing }
XMLDocument >> writeDoctypeDeclarationOn: aWriter [
	self hasDoctypeDeclaration
		ifTrue: [self doctypeDeclaration writeXMLOn: aWriter]
]

{ #category : #printing }
XMLDocument >> writeXMLDeclarationOn: aWriter [
	self version
		ifNotNil: [
			aWriter xml
				version: self version;
				encoding: self encoding;
				standalone: self isStandalone;
				write]
]

{ #category : #printing }
XMLDocument >> writeXMLOn: aWriter [
	self
		writeXMLDeclarationOn: aWriter;
		writeDoctypeDeclarationOn: aWriter;
		writeInnerXMLOn: aWriter
]
