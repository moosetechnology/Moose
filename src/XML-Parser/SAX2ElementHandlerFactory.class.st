"
This is a base class for element handler factories used by SAX2ElementParsers to create element handlers. Instances can be injected into a SAX2ElementParser with #elementHandlerFactory: before parsing.

This factory just uses the default handler class SAX2ElementHandler for all elements.
"
Class {
	#name : #SAX2ElementHandlerFactory,
	#superclass : #Object,
	#category : #'XML-Parser'
}

{ #category : #accessing }
SAX2ElementHandlerFactory >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ self elementHandlerClass
]

{ #category : #accessing }
SAX2ElementHandlerFactory >> elementHandlerClass [
	^ SAX2ElementHandler
]
