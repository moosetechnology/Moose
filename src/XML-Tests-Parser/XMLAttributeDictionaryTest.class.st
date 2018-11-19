Class {
	#name : #XMLAttributeDictionaryTest,
	#superclass : #OrderPreservingStringDictionaryTest,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLAttributeDictionaryTest >> dictionaryClass [
	^ XMLAttributeDictionary
]

{ #category : #testing }
XMLAttributeDictionaryTest >> isTestingLazyDictionary [
	^ false
]

{ #category : #accessing }
XMLAttributeDictionaryTest >> namespaceScope [
	^ XMLNamespaceScope new
		mapPrefix: '' to: 'defaultNS';
		mapPrefix: 'prefix' to: 'prefixNS';
		mapPrefix: 'otherPrefix' to: 'otherPrefixNS';
		yourself
]

{ #category : #accessing }
XMLAttributeDictionaryTest >> prefixedAttributeDictionary [
	^ (self dictionaryClass new setNamespaceScope: self namespaceScope)
		at: 'name' put: 'value';
		at: 'xml:id' put: 'id';
		at: 'prefix:name' put: 'prefixValue';
		at: 'otherPrefix:name' put: 'otherPrefixValue';
		yourself
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAsXMLAttributeDictionary [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: dictionary asXMLAttributeDictionary == dictionary.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAssociationAtName [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary associationAtName: 'id') = ('xml:id' -> 'id').
	self assert:
		(dictionary associationAtName: 'xml:id') = ('xml:id' -> 'id').
	self assert:
		(dictionary associationAtName: 'name') = ('name' -> 'value').
	self assert:
		(dictionary associationAtName: 'prefix:name') = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary associationAtName: 'otherPrefix:name') =
			('otherPrefix:name' -> 'otherPrefixValue').
	self assert: (dictionary associationAtName: self absentKey) isNil.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAssociationAtNameIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			associationAtName: 'id'
			ifAbsent: [self fail]) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			ifAbsent: [self fail]) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'name'
			ifAbsent: [self fail]) = ('name' -> 'value').
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			ifAbsent: [self fail]) = ('prefix:name' -> 'prefixValue').
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			ifAbsent: [self fail]) = ('otherPrefix:name' -> 'otherPrefixValue').
	self assert:
		(dictionary
			associationAtName: self absentKey
			ifAbsent: [self absentValue]) = self absentValue.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAssociationAtNameNamespaceURI [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) isNil.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: 'defaultNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: '') = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) isNil.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: 'defaultNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: '') = ('xml:id' -> 'id').

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'prefixNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'prefixNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'defaultNS') isNil.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'otherPrefixNS') isNil.
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS') isNil.
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
XMLAttributeDictionaryTest >> testAssociationAtNameNamespaceURIIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'id'
			namespaceURI: ''
			ifAbsent: [self fail]) = ('xml:id' -> 'id').
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'xml:id'
			namespaceURI: ''
			ifAbsent: [self fail]) = ('xml:id' -> 'id').

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'prefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			associationAtName: 'otherPrefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.

	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: ''
			ifAbsent: [self fail]) = ('name' -> 'value').
	self assert:
		(dictionary
			associationAtName: 'name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAtName [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self
		assert: (dictionary atName: 'id') = 'id';
		assert: (dictionary atName: 'xml:id') = 'id';
		assert: (dictionary atName: 'name') = 'value';
		assert: (dictionary atName: 'prefix:name') = 'prefixValue';
		assert: (dictionary atName: 'otherPrefix:name') = 'otherPrefixValue';
		assert: (dictionary atName: self absentKey) = ''.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAtNameIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			atName: 'id'
			ifAbsent: [self fail]) = 'id'.
	self assert:
		(dictionary
			atName: 'xml:id'
			ifAbsent: [self fail]) = 'id'.
	self assert:
		(dictionary
			atName: 'name'
			ifAbsent: [self fail]) = 'value'.
	self assert:
		(dictionary
			atName: 'prefix:name'
			ifAbsent: [self fail]) = 'prefixValue'.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			ifAbsent: [self fail]) = 'otherPrefixValue'.
	self assert:
		(dictionary
			atName: self absentKey
			ifAbsent: [self absentValue]) = self absentValue.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testAtNameNamespaceURI [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = ''.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: 'defaultNS') = ''.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: '') = 'id'.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI) = ''.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: 'defaultNS') = ''.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: '') = 'id'.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'prefixNS') = ''.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'prefixNS') = ''.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'defaultNS') = ''.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'otherPrefixNS') = ''.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS') = ''.
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
XMLAttributeDictionaryTest >> testAtNameNamespaceURIIfAbsent [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'id'
			namespaceURI: ''
			ifAbsent: [self fail]) = 'id'.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: XMLNamespaceScope xmlNamespaceURI
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'xml:id'
			namespaceURI: ''
			ifAbsent: [self fail]) = 'id'.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'prefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'prefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'otherPrefixNS'
			ifAbsent: [self absentValue]) = self absentValue.
	self assert:
		(dictionary
			atName: 'otherPrefix:name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.

	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: ''
			ifAbsent: [self fail]) = 'value'.
	self assert:
		(dictionary
			atName: 'name'
			namespaceURI: 'defaultNS'
			ifAbsent: [self absentValue]) = self absentValue.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testLazyDictionaryEmptyAttributeDictionary [
	self isTestingLazyDictionary
		ifFalse: [^ self].

	self assert:
		self emptyDictionary attributeDictionary ==
			self dictionaryClass emptyAttributeDictionary.
	self assert:
		self dictionaryClass emptyAttributeDictionary isEmpty.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testLazyDictionaryInterfaceCompatibility [
	| dictionary |

	self isTestingLazyDictionary
		ifFalse: [^ self].

	"protocols must be the same as the non-lazy dictionaries"
	dictionary := self emptyDictionary.
	XMLAttributeDictionary selectors do: [:each |
		self assert: (dictionary respondsTo: each)].
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testNamespaceURIOf [
	| dictionary |

	dictionary := self prefixedAttributeDictionary.
	self
		assert: (dictionary namespaceURIOf: 'xml:id') = '';
		assert: (dictionary namespaceURIOf: 'prefix:name') = '';
		assert: (dictionary namespaceURIOf: 'otherPrefix:name') = '';
		assert: (dictionary namespaceURIOf: 'name') = ''.
]

{ #category : #tests }
XMLAttributeDictionaryTest >> testUsesNamespaces [
	self deny: self emptyDictionary usesNamespaces
]
