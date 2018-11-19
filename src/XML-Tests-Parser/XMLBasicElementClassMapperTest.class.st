Class {
	#name : #XMLBasicElementClassMapperTest,
	#superclass : #XMLElementClassMapperTest,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #acccessing }
XMLBasicElementClassMapperTest >> mapperClass [
	^ XMLBasicElementClassMapper
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElement [
	| mapper |

	mapper := self newMapper.
	self
		assert: (mapper classForElement: 'test') isNil;
		assert: (mapper classForElement: 'prefix:test') isNil.

	mapper
		mapElement: 'test'
		toClass: self elementClass.
	self
		assert: (mapper classForElement: 'test') == self elementClass;
		assert: (mapper classForElement: 'prefix:test') == self elementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self
		assert: (mapper classForElement: 'test') == self elementClass;
		assert: (mapper classForElement: 'prefix:test') == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self
		assert: (mapper classForElement: 'test') == self elementClass;
		assert: (mapper classForElement: 'prefix:test') == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self
		assert: (mapper classForElement: 'test') == self elementClass;
		assert: (mapper classForElement: 'prefix:test') == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		toClass: self otherElementClass.
	self
		assert: (mapper classForElement: 'test') == self elementClass;
		assert: (mapper classForElement: 'prefix:test') == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementAttributes [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) isNil.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) isNil.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self otherElementClass.
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementAttributesIfNone [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [#none]) == #none.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [#none]) == #none.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementIfNone [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [#none]) == #none.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [#none]) == #none.

	mapper
		mapElement: 'test'
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [self fail]) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			ifNone: [self fail]) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURI [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') isNil.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') isNil.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS') == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURIAttributes [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) isNil.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) isNil.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURIAttributesIfNone [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [#none]) == #none.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [#none]) == #none.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURIIfNone [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [#none]) == #none.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [#none]) == #none.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self elementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			ifNone: [self fail]) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURILocalNameAttributes [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) isNil.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) isNil.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testClassForElementNamespaceURILocalNameAttributesIfNone [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [#none]) == #none.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [#none]) == #none.

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.

	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.

	"QName mappings should take precedence over NCName mappings"
	mapper
		mapElement: 'prefix:test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self otherElementClass.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self elementClass.
	self assert:
		(mapper
			classForElement: 'prefix:test'
			namespaceURI: 'testNS'
			localName: 'test'
			attributes: self attributes
			ifNone: [self fail]) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testCopy [
	| mapper copy |

	mapper := self newMapperWithMappings.
	copy := mapper copy.
	self
		deny: mapper == copy;
		deny: mapper elementClassMap == copy elementClassMap;
		assert: mapper elementClassMap = copy elementClassMap.

	mapper elementClassMap values
		with: copy elementClassMap values
		do: [:classOrCollection :classOrCollectionCopy |
			"the collection values need to be copied so any new mappings
			in either the copy or original don't affect the other"
			classOrCollection isCollection
				ifTrue: [
					self
						deny: classOrCollection == classOrCollectionCopy;
						assert: classOrCollection = classOrCollectionCopy]
				ifFalse: [
					self deny: classOrCollection == classOrCollectionCopy]].

	mapper
		mapElement: 'test'
		toClass: self otherElementClass.
	self deny: mapper elementClassMap = copy elementClassMap.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testMapElementAttributeSpecToClass [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			mapElement: 'test'
			attributeSpec: self attributes asXMLAttributeSpec
			toClass: self elementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self elementClass.

	self assert:
		(mapper
			mapElement: 'test'
			attributeSpec: self attributes asXMLAttributeSpec
			toClass: self otherElementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			attributes: self attributes) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testMapElementNamespaceURIAttributeSpecToClass [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			mapElement: 'test'
			namespaceURI: 'testNS'
			attributeSpec: self attributes asXMLAttributeSpec
			toClass: self elementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self elementClass.

	self assert:
		(mapper
			mapElement: 'test'
			namespaceURI: 'testNS'
			attributeSpec: self attributes asXMLAttributeSpec
			toClass: self otherElementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS'
			attributes: self attributes) == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testMapElementNamespaceURIToClass [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			mapElement: 'test'
			namespaceURI: 'testNS'
			toClass: self elementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self elementClass.

	self assert:
		(mapper
			mapElement: 'test'
			namespaceURI: 'testNS'
			toClass: self otherElementClass) == mapper.
	self assert:
		(mapper
			classForElement: 'test'
			namespaceURI: 'testNS') == self otherElementClass.
]

{ #category : #tests }
XMLBasicElementClassMapperTest >> testMapElementToClass [
	| mapper |

	mapper := self newMapper.
	self assert:
		(mapper
			mapElement: 'test'
			toClass: self elementClass) == mapper.
	self assert: (mapper classForElement: 'test') == self elementClass.

	self assert:
		(mapper
			mapElement: 'test'
			toClass: self otherElementClass) == mapper.
	self assert: (mapper classForElement: 'test') == self otherElementClass.
]
