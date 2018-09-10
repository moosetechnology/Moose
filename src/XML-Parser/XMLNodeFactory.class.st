"
This class is the default node factory. Its accessor messages return the classes used by the DOM parser to build a node tree. You can override these messages to return different classes and inject an instance with the DOM parser's #nodeFactory: message before parsing.
"
Class {
	#name : #XMLNodeFactory,
	#superclass : #Object,
	#category : #'XML-Parser-DOM'
}

{ #category : #converting }
XMLNodeFactory >> asPluggableNodeFactory [
	^ XMLPluggableNodeFactory new
]

{ #category : #accessing }
XMLNodeFactory >> attributeDeclarationClass [
	^ XMLAttributeDeclaration
]

{ #category : #accessing }
XMLNodeFactory >> attributeListClass [
	^ XMLCachingAttributeList
]

{ #category : #accessing }
XMLNodeFactory >> cdataClass [
	"Can be overridden to return a custom XMLCData subclass."

	^ XMLCData
]

{ #category : #accessing }
XMLNodeFactory >> classForElement: aQualifiedName [
	^ self elementClass
]

{ #category : #accessing }
XMLNodeFactory >> classForElement: aQualifiedName attributes: anAssociationCollection [
	^ self elementClass
]

{ #category : #accessing }
XMLNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI [
	^ self elementClass
]

{ #category : #accessing }
XMLNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection [
	^ self elementClass
]

{ #category : #accessing }
XMLNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ self elementClass
]

{ #category : #accessing }
XMLNodeFactory >> commentClass [
	"Can be overridden to return a custom XMLComment subclass."

	^ XMLComment
]

{ #category : #accessing }
XMLNodeFactory >> doctypeDeclarationClass [
	^ XMLDoctypeDeclaration
]

{ #category : #accessing }
XMLNodeFactory >> documentClass [
	"Can be overridden to return a custom XMLDocument subclass."

	^ XMLDocument
]

{ #category : #accessing }
XMLNodeFactory >> elementClass [
	"Can be overridden to return a custom XMLElement subclass."

	^ XMLElement
]

{ #category : #accessing }
XMLNodeFactory >> elementDeclarationClass [
	^ XMLElementDeclaration
]

{ #category : #accessing }
XMLNodeFactory >> generalEntityDeclarationClass [
	^ XMLGeneralEntityDeclaration
]

{ #category : #'instance creation' }
XMLNodeFactory >> newCData: aString [
	^ self cdataClass string: aString
]

{ #category : #'instance creation' }
XMLNodeFactory >> newComment: aString [
	^ self commentClass string: aString
]

{ #category : #'instance creation' }
XMLNodeFactory >> newDocument [
	^ self documentClass new
]

{ #category : #'instance creation' }
XMLNodeFactory >> newElement [
	^ self elementClass new
]

{ #category : #'instance creation' }
XMLNodeFactory >> newElementNamed: aName [
	^ (self classForElement: aName)
		named: aName
]

{ #category : #'instance creation' }
XMLNodeFactory >> newElementNamed: aName attributes: anAssociationCollection [
	^ (self
		classForElement: aName
		attributes: anAssociationCollection)
			name: aName
			attributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLNodeFactory >> newElementNamed: aName namespaceURI: aURI [
	^ (self
		classForElement: aName
		namespaceURI: aURI)
			name: aName
			namespaceURI: aURI
]

{ #category : #'instance creation' }
XMLNodeFactory >> newElementNamed: aName namespaceURI: aURI attributes: anAssociationCollection [
	^ (self
		classForElement: aName
		namespaceURI: aURI
		attributes: anAssociationCollection)
			name: aName
			namespaceURI: aURI
			attributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLNodeFactory >> newPI [
	^ self piClass new
]

{ #category : #'instance creation' }
XMLNodeFactory >> newPITarget: aTargetString data: aDataString [
	^ self newPI
		target: aTargetString;
		data: aDataString
]

{ #category : #deprecated }
XMLNodeFactory >> newString: aString [
	"will be deprecated; use #newStringNode: instead"

	^ self newStringNode: aString
]

{ #category : #'instance creation' }
XMLNodeFactory >> newStringNode: aString [
	^ self stringNodeClass new string: aString
]

{ #category : #accessing }
XMLNodeFactory >> nodeListClass [
	^ XMLNodeList
]

{ #category : #accessing }
XMLNodeFactory >> notationDeclarationClass [
	^ XMLNotationDeclaration
]

{ #category : #accessing }
XMLNodeFactory >> parameterEntityDeclarationClass [
	^ XMLParameterEntityDeclaration
]

{ #category : #accessing }
XMLNodeFactory >> piClass [
	"Can be overridden to return a custom XMLPI subclass."

	^ XMLPI
]

{ #category : #deprecated }
XMLNodeFactory >> stringClass [
	"will be deprecated; use #stringNodeClass instead"

	^ XMLString
]

{ #category : #accessing }
XMLNodeFactory >> stringNodeClass [
	"Can be overridden to return a custom XMLString subclass."

	"for now this delegates to the soft-deprecated #stringClass to not
	break custom subclasses that override it expecting it to be sent"
	^ self stringClass
]
