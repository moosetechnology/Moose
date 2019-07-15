"
This class is a pluggable element handler factory with an API like XMLPluggableElementFactory. Instances can be injected into a SAX2ElementParser with #elementHandlerFactory: before parsing.

You can map combinations of element name, namespace URI, and attributes to specific element handler classes using the ""handling"" messages, and change the default element handler class used when there's no mapping with #elementHandlerClass:.

Instances can be saved and reused for performance and safely modified after copying.
"
Class {
	#name : #SAX2PluggableElementHandlerFactory,
	#superclass : #SAX2ElementHandlerFactory,
	#instVars : [
		'elementClassMapper',
		'elementHandlerClass'
	],
	#category : #'XML-Parser'
}

{ #category : #accessing }
SAX2PluggableElementHandlerFactory >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ elementClassMapper
		classForElement: aQualifiedName
		namespaceURI: aURI
		attributes: anAssociationCollection
		ifNone: [self elementHandlerClass]
]

{ #category : #private }
SAX2PluggableElementHandlerFactory >> elementClassMapper [
	^ elementClassMapper
]

{ #category : #private }
SAX2PluggableElementHandlerFactory >> elementClassMapper: anElementClassMapper [
	elementClassMapper := anElementClassMapper
]

{ #category : #defaults }
SAX2PluggableElementHandlerFactory >> elementClassMapperClass [
	^ XMLBasicElementClassMapper
]

{ #category : #accessing }
SAX2PluggableElementHandlerFactory >> elementHandlerClass [
	^ elementHandlerClass
]

{ #category : #accessing }
SAX2PluggableElementHandlerFactory >> elementHandlerClass: aClass [
	"set the default element handler class"
	elementHandlerClass := aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElement: anElementName attributes: aCollectionOrAttributeSpec withClass: aClass [
	"aCollectionOrAttributeSpec can be some kind of XMLAttributeSpec or a
	collection of associations of required attribute names and values, and the
	required values can be strings, blocks, or nil meaning the attribute is
	required but can take any value"

	elementClassMapper
		mapElement: anElementName
		attributeSpec: aCollectionOrAttributeSpec asXMLAttributeSpec
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElement: anElementName namespaceURI: aURI attributes: aCollectionOrAttributeSpec withClass: aClass [
	"aCollectionOrAttributeSpec can be some kind of XMLAttributeSpec or a
	collection of associations of required attribute names and values, and the
	required values can be strings, blocks, or nil meaning the attribute is
	required but can take any value"

	elementClassMapper
		mapElement: anElementName
		namespaceURI: aURI
		attributeSpec: aCollectionOrAttributeSpec asXMLAttributeSpec
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElement: anElementName namespaceURI: aURI withClass: aClass [
	elementClassMapper
		mapElement: anElementName
		namespaceURI: aURI
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElement: anElementName withClass: aClass [
	elementClassMapper
		mapElement: anElementName
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElements: anElementNameCollection namespaceURI: aNamespaceURI withClass: aClass [
	elementClassMapper
		mapElements: anElementNameCollection
		namespaceURI: aNamespaceURI
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElements: anElementNameCollection withClass: aClass [
	elementClassMapper
		mapElements: anElementNameCollection
		toClass: aClass
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElementsMatchingClass: aClass [
	"This will handle all elements matching the name of a class with that
	class, but igoring the class's prefix and any 'Element' or 'ElementHandler'
	suffix.

	For example, it will match MyUserDefinedElement to:
		<UserDefined>
		<userDefined>
		<user-defined>
		<user_defined>"

	elementClassMapper
		mapAllMatchingElementsToClass: aClass
		ignoringSuffixes: self ignorableClassNameSuffixes
]

{ #category : #handling }
SAX2PluggableElementHandlerFactory >> handleElementsMatchingClasses: aClassCollection [
	"See the comment in #handleElementsMatchingClass:"

	elementClassMapper
		mapAllMatchingElementsToClasses: aClassCollection
		ignoringSuffixes: self ignorableClassNameSuffixes
]

{ #category : #defaults }
SAX2PluggableElementHandlerFactory >> ignorableClassNameSuffixes [
	^ #('Element' 'ElementHandler')
]

{ #category : #initialization }
SAX2PluggableElementHandlerFactory >> initialize [
	super initialize.

	elementClassMapper := self elementClassMapperClass new.
	elementHandlerClass := SAX2ElementHandler.
]

{ #category : #copying }
SAX2PluggableElementHandlerFactory >> postCopy [
	super postCopy.

	elementClassMapper := elementClassMapper copy.
]
