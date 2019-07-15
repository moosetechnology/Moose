"
This class is a pluggable node factory that can also map elements to different XMLElement subclasses based on the name, namespace information, and attributes of those elements. You have to create an instance, configure it to handle certain elements with certain classes, and then inject your instance into a DOM parser using #nodeFactory: before parsing. Here is an example:

	(XMLDOMParser on: anXMLStringOrStream)
		nodeFactory:
			(XMLPluggableElementFactory new
				elementClass: GenericElement;
				handleElement: 'user' withClass: UserElement;
				handleElement: 'report' withClass: ReportElement;
				handleElement: 'report' namespaceURI: 'urn:specialreprot' withClass: SpecialReportElement);
		parseDocument.

Instances can be saved and reused for performance and safely modified after copying.
"
Class {
	#name : #XMLPluggableElementFactory,
	#superclass : #XMLPluggableNodeFactory,
	#instVars : [
		'elementClassMapper'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #accessing }
XMLPluggableElementFactory >> classForElement: aQualifiedName [
	^ elementClassMapper
		classForElement: aQualifiedName
		ifNone: [self elementClass]
]

{ #category : #accessing }
XMLPluggableElementFactory >> classForElement: aQualifiedName attributes: anAssociationCollection [
	^ elementClassMapper
		classForElement: aQualifiedName
		attributes: anAssociationCollection
		ifNone: [self elementClass]
]

{ #category : #accessing }
XMLPluggableElementFactory >> classForElement: aQualifiedName namespaceURI: aURI [
	^ elementClassMapper
		classForElement: aQualifiedName
		namespaceURI: aURI
		ifNone: [self elementClass]
]

{ #category : #accessing }
XMLPluggableElementFactory >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection [
	^ elementClassMapper
		classForElement: aQualifiedName
		namespaceURI: aURI
		attributes: anAssociationCollection
		ifNone: [self elementClass]
]

{ #category : #accessing }
XMLPluggableElementFactory >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ elementClassMapper
		classForElement: aQualifiedName
		namespaceURI: aURI
		localName: aLocalName
		attributes: anAssociationCollection
		ifNone: [self elementClass]
]

{ #category : #private }
XMLPluggableElementFactory >> elementClassMapper [
	^ elementClassMapper
]

{ #category : #private }
XMLPluggableElementFactory >> elementClassMapper: anElementClassMapper [
	elementClassMapper := anElementClassMapper
]

{ #category : #defaults }
XMLPluggableElementFactory >> elementClassMapperClass [
	^ XMLBasicElementClassMapper
]

{ #category : #handling }
XMLPluggableElementFactory >> handleElement: anElementName attributes: aCollectionOrAttributeSpec withClass: aClass [
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
XMLPluggableElementFactory >> handleElement: anElementName namespaceURI: aURI attributes: aCollectionOrAttributeSpec withClass: aClass [
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
XMLPluggableElementFactory >> handleElement: anElementName namespaceURI: aURI withClass: aClass [
	elementClassMapper
		mapElement: anElementName
		namespaceURI: aURI
		toClass: aClass
]

{ #category : #handling }
XMLPluggableElementFactory >> handleElement: anElementName withClass: aClass [
	elementClassMapper
		mapElement: anElementName
		toClass: aClass
]

{ #category : #handling }
XMLPluggableElementFactory >> handleElements: anElementNameCollection namespaceURI: aNamespaceURI withClass: aClass [
	elementClassMapper
		mapElements: anElementNameCollection
		namespaceURI: aNamespaceURI
		toClass: aClass
]

{ #category : #handling }
XMLPluggableElementFactory >> handleElements: anElementNameCollection withClass: aClass [
	elementClassMapper
		mapElements: anElementNameCollection
		toClass: aClass
]

{ #category : #handling }
XMLPluggableElementFactory >> handleElementsMatchingClass: aClass [
	"This will handle all elements matching the name of a class with that
	class, but igoring the class's prefix and any 'Element' suffix.

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
XMLPluggableElementFactory >> handleElementsMatchingClasses: aClassCollection [
	"See the comment in #handleElementsMatchingClass:"

	elementClassMapper
		mapAllMatchingElementsToClasses: aClassCollection
		ignoringSuffixes: self ignorableClassNameSuffixes
]

{ #category : #defaults }
XMLPluggableElementFactory >> ignorableClassNameSuffixes [
	^ #('Element')
]

{ #category : #initialization }
XMLPluggableElementFactory >> initialize [
	super initialize.

	elementClassMapper := self elementClassMapperClass new.
]

{ #category : #copying }
XMLPluggableElementFactory >> postCopy [
	super postCopy.

	elementClassMapper := elementClassMapper copy.
]
