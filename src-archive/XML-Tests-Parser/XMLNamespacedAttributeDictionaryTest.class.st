Class {
	#name : #XMLNamespacedAttributeDictionaryTest,
	#superclass : #XMLAttributeDictionaryTest,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLNamespacedAttributeDictionaryTest >> dictionaryClass [
	^ XMLNamespacedAttributeDictionary
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testAssociationAtNameNamespaceURI [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: 'defaultNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: 'defaultNS') isNil.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'prefixNS') = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'prefixNS') = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'defaultNS') isNil.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'otherPrefixNS')  = ('otherPrefix:name' -> 'otherPrefixValue').
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS')  = ('otherPrefix:name' -> 'otherPrefixValue').
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'defaultNS') isNil.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: '') = ('name' -> 'value').
	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'defaultNS') isNil.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testAssociationAtNameNamespaceURIIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self fail]) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: 'defaultNS'
			ifAbsent: [#absent]) = #absent.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self fail]) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: 'defaultNS'
			ifAbsent: [#absent]) = #absent.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [#absent]) = #absent.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self fail]) = ('otherPrefix:name' -> 'otherPrefixValue').
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self fail]) = ('otherPrefix:name' -> 'otherPrefixValue').
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [#absent]) = #absent.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: ''
			ifAbsent: [self fail]) = ('name' -> 'value').
	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'defaultNS'
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testAtNameNamespaceURI [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = 'id'.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: 'defaultNS') = ''.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = 'id'.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: 'defaultNS') = ''.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'prefixNS') = 'prefixValue'.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'prefixNS') = 'prefixValue'.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'defaultNS') = ''.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'otherPrefixNS') = 'otherPrefixValue'.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS') = 'otherPrefixValue'.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'defaultNS') = ''.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: '') = 'value'.
	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'defaultNS') = ''.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testAtNameNamespaceURIIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self fail]) = 'id'.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: 'defaultNS'
			ifAbsent: ['absent']) = 'absent'.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self fail]) = 'id'.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: 'defaultNS'
			ifAbsent: ['absent']) = 'absent'.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) = 'prefixValue'.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) = 'prefixValue'.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: ['absent']) = 'absent'.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self fail]) = 'otherPrefixValue'.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self fail]) = 'otherPrefixValue'.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: ['absent']) = 'absent'.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: ''
			ifAbsent: [self fail]) = 'value'.
	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'defaultNS'
			ifAbsent: ['absent']) = 'absent'.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testCopy [
	| dictionary copy |

	super testCopy.
	dictionary := self prefixedAttributeDictionary.
	copy := dictionary copy.
	self assert: dictionary namespaceScope == copy namespaceScope.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testNamespaceURIOf [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary namespaceURIOf: 'xml:id') =
			XMLNamespaceScope xmlNamespaceURI.
	self
		assert: (dictionary namespaceURIOf: 'prefix:name') = 'prefixNS';
		assert: (dictionary namespaceURIOf: 'otherPrefix:name') = 'otherPrefixNS';
		assert: (dictionary namespaceURIOf: 'name') = ''.
]

{ #category : #tests }
XMLNamespacedAttributeDictionaryTest >> testUsesNamespaces [
	self assert: self emptyDictionary usesNamespaces
]
