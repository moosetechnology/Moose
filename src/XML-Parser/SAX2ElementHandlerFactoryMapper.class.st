"
This is a base class for mappers to map element handler objects to element handler factories.

Requesting the factory for an element handler checks the handler's #elementHandlerFactory message first and then the mapper's own #elementHandlerFactory message which can be (and is) overridden in subclasses to return a default factory.

When a SAX2ElementParser requests the factory for a new element handler, if none is found, it will reuse (inherit) the current factory.
"
Class {
	#name : #SAX2ElementHandlerFactoryMapper,
	#superclass : #Object,
	#category : #'XML-Parser'
}

{ #category : #accessing }
SAX2ElementHandlerFactoryMapper >> elementHandlerFactory [
	"Can be overridden to return a default element handler factory to use
	if no other mapping is defined for it."

	^ nil
]

{ #category : #accessing }
SAX2ElementHandlerFactoryMapper >> factoryForElementHandler: anElementHandler [
	^ self
		factoryForElementHandler: anElementHandler
		ifNone: [nil]
]

{ #category : #accessing }
SAX2ElementHandlerFactoryMapper >> factoryForElementHandler: anElementHandler ifNone: aBlock [
	^ anElementHandler elementHandlerFactory
		ifNil: [
			self elementHandlerFactory
				ifNil: [aBlock value]]
]
