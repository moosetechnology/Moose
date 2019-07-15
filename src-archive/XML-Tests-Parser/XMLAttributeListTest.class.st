Class {
	#name : #XMLAttributeListTest,
	#superclass : #XMLObservableListTest,
	#instVars : [
		'attributes',
		'newAttribute',
		'absentAttribute',
		'changedAttributes'
	],
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLAttributeListTest >> absentListItem [
	^ absentAttribute
		ifNil: [
			absentAttribute :=
				self attributeClass
					name: 'absentName'
					value: 'absentValue']
]

{ #category : #accessing }
XMLAttributeListTest >> afterAddingToNotifications [
	^ #(addedAttribute:)
]

{ #category : #accessing }
XMLAttributeListTest >> afterRemovingFromNotifications [
	^ #(removedAttribute:)
]

{ #category : #testing }
XMLAttributeListTest >> allowsDuplicates [
	^ false
]

{ #category : #accessing }
XMLAttributeListTest >> attributeAssociations [
	^ self listItems collect: [:each | each name -> each value]
]

{ #category : #accessing }
XMLAttributeListTest >> attributeClass [
	^ XMLAttribute
]

{ #category : #accessing }
XMLAttributeListTest >> attributeNames [
	^ self listItems collect: [:each | each name]
]

{ #category : #accessing }
XMLAttributeListTest >> attributeValues [
	^ self listItems collect: [:each | each value]
]

{ #category : #accessing }
XMLAttributeListTest >> attributesClass [
	^ OrderPreservingStringDictionary
]

{ #category : #accessing }
XMLAttributeListTest >> changedListItem: anAttribute [
	^ (changedAttributes ifNil: [changedAttributes := IdentityDictionary new])
		at: anAttribute
		ifAbsentPut: [
			self attributeClass
				name: 'new', anAttribute name
				value: 'new', anAttribute value]
]

{ #category : #accessing }
XMLAttributeListTest >> listClass [
	^ XMLAttributeList
]

{ #category : #accessing }
XMLAttributeListTest >> listItems [
	attributes ifNil: [
		attributes :=
			Array streamContents: [:stream |
				super listItems do: [:each |
					"have the prefixed attributes come before the non-prefixed
					versions to better test #isNamed: local name matching"
					stream
						nextPut:
							(self attributeClass
								name: 'prefix:', each
								value: 'prefixed', each);
						nextPut:
							(self attributeClass
								name: each
								value: each)]]].
	^ attributes copy.
]

{ #category : #accessing }
XMLAttributeListTest >> newListItem [
	^ newAttribute
		ifNil: [
			newAttribute :=
				self attributeClass
					name: 'newName'
					value: 'newValue']
]

{ #category : #accessing }
XMLAttributeListTest >> observerClass [
	^ XMLRecordingAttributeListObserver
]

{ #category : #accessing }
XMLAttributeListTest >> reverseSortBlock [
	^ [:a :b | a sortKey > b sortKey]
]

{ #category : #accessing }
XMLAttributeListTest >> sortBlock [
	^ [:a :b | a sortKey <= b sortKey]
]

{ #category : #tests }
XMLAttributeListTest >> testAddAttributeAssociation [
	| list |

	list := self emptyList.
	self listItems do: [:each | | attribute |
		attribute := list addAttributeAssociation: each name -> each value.
		self
			assert: attribute class == self attributeClass;
			assert: attribute name = each name;
			assert: attribute value = each value;
			assert: list last = attribute].
]

{ #category : #tests }
XMLAttributeListTest >> testAddAttributeNameValue [
	| list |

	list := self emptyList.
	self listItems do: [:each | | attribute |
		attribute :=
			list
				addAttributeName: each name
				value: each value.
		self
			assert: attribute class == self attributeClass;
			assert: attribute name = each name;
			assert: attribute value = each value;
			assert: list last = attribute].
]

{ #category : #tests }
XMLAttributeListTest >> testAsDictionary [
	| list dictionary |

	list := self listWithItems.
	dictionary := list asDictionary.
	self
		assert: dictionary class == self attributesClass;
		assert:
			dictionary =
				(self attributesClass newFrom: self attributeAssociations).
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeAssociations [
	| list |

	list := self listWithItems.
	self
		assertList: list attributeAssociations
		collectedFrom: list
		equals: (self listSpecies newFrom: self attributeAssociations).
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeAt [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list attributeAt: each name) =
					(i > 1
						ifTrue: [each value]
						ifFalse: ['']).
	
			list add: each.
			self assert: (list attributeAt: each name) = each value]].

	self listItems do: [:each |
		self assert: (list attributeAt: each name) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeAtIfAbsent [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list
					attributeAt: each name
					ifAbsent: [
						i > 1
							ifTrue: [self fail]
							ifFalse: [self absentListItem value]]) =
					(i > 1
						ifTrue: [each value]
						ifFalse: [self absentListItem value]).
	
			list add: each.
			self assert:
				(list
					attributeAt: each name
					ifAbsent: [self fail]) = each value]].

	self listItems do: [:each |
		self assert:
			(list
				attributeAt: each name
				ifAbsent: [self fail]) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeAtIfAbsentPut [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list
					attributeAt: each name
					ifAbsentPut: [
						i > 1
							ifTrue: [self fail]
							ifFalse: [each value]]) = each value.
	
			list add: each.
			self assert:
				(list
					attributeAt: each name
					ifAbsentPut: [self fail]) = each value]].

	self listItems do: [:each |
		self assert:
			(list
				attributeAt: each name
				ifAbsentPut: [self fail]) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeAtPut [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list attributeAt: each name) =
					(i > 1
						ifTrue: [each value]
						ifFalse: ['']).

			self assert:
				(list
					attributeAt: each name
					put: each value) = each value.
			self assert: (list attributeAt: each name) = each value]].

	self listItems do: [:each |
		self assert: (list attributeAt: each name) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeNames [
	| list |

	list := self listWithItems.
	self
		assertList: list attributeNames
		collectedFrom: list
		equals: (self listSpecies newFrom: self attributeNames).
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeNamesAndValuesDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:twoArgumentBlock |
			list attributeNamesAndValuesDo: twoArgumentBlock]
		enumerate: #()
		and: #().

	list := self listWithItems.
	self
		xmlShould: [:twoArgumentBlock |
			list attributeNamesAndValuesDo: twoArgumentBlock]
		enumerate: self attributeNames
		and: self attributeValues.
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeNamesDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list attributeNamesDo: block]
		enumerate: #().

	list := self listWithItems.
	self
		xmlShould: [:each | list attributeNamesDo: each]
		enumerate: self attributeNames.
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeNodeAt [
	| list |

	list := self emptyList.
	self listItems withIndexDo: [:attribute :i | | firstMatchingAttribute |
		firstMatchingAttribute :=
			(self listItems copyFrom: 1 to: i - 1)
				detect: [:each | each isNamed: attribute name]
				ifNone: [nil].
		self assert:
			(list attributeNodeAt: attribute name) =
				(firstMatchingAttribute
					ifNil: [self defaultValue]).
	
		list add: attribute.
		self assert:
			(list attributeNodeAt: attribute name) =
				(firstMatchingAttribute
					ifNil: [attribute])].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeNodeAtIfAbsent [
	| list |

	list := self emptyList.
	self listItems withIndexDo: [:attribute :i | | firstMatchingAttribute |
		firstMatchingAttribute :=
			(self listItems copyFrom: 1 to: i - 1)
				detect: [:each | each isNamed: attribute name]
				ifNone: [nil].
		self assert:
			(list
				attributeNodeAt: attribute name
				ifAbsent: [
					firstMatchingAttribute
						ifNil: [self absentListItem]]) =
				(firstMatchingAttribute
					ifNil: [self absentListItem]).
	
		list add: attribute.
		self assert:
			(list
				attributeNodeAt: attribute name
				ifAbsent: [self fail]) =
				(firstMatchingAttribute
					ifNil: [attribute])].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeValueAt [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list attributeValueAt: each name) =
					(i > 1
						ifTrue: [each value]
						ifFalse: ['']).
	
			list add: each.
			self assert: (list attributeValueAt: each name) = each value]].

	self listItems do: [:each |
		self assert: (list attributeValueAt: each name) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeValueAtIfAbsent [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list
					attributeValueAt: each name
					ifAbsent: [
						i > 1
							ifTrue: [self fail]
							ifFalse: [self absentListItem value]]) =
					(i > 1
						ifTrue: [each value]
						ifFalse: [self absentListItem value]).
	
			list add: each.
			self assert:
				(list
					attributeValueAt: each name
					ifAbsent: [self fail]) = each value]].

	self listItems do: [:each |
		self assert:
			(list
				attributeValueAt: each name
				ifAbsent: [self fail]) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeValueAtIfAbsentPut [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list
					attributeValueAt: each name
					ifAbsentPut: [
						i > 1
							ifTrue: [self fail]
							ifFalse: [each value]]) = each value.
	
			list add: each.
			self assert:
				(list
					attributeValueAt: each name
					ifAbsentPut: [self fail]) = each value]].

	self listItems do: [:each |
		self assert:
			(list
				attributeValueAt: each name
				ifAbsentPut: [self fail]) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributeValueAtPut [
	| list |

	list := self emptyList.
	1 to: 2 do: [:i |
		self listItems do: [:each |
			self assert:
				(list attributeValueAt: each name) =
					(i > 1
						ifTrue: [each value]
						ifFalse: ['']).

			self assert:
				(list
					attributeValueAt: each name
					put: each value) = each value.
			self assert: (list attributeValueAt: each name) = each value]].

	self listItems do: [:each |
		self assert: (list attributeValueAt: each name) = each value].
]

{ #category : #tests }
XMLAttributeListTest >> testAttributes [
	| list dictionary |

	list := self listWithItems.
	dictionary := list attributes.
	self
		assert: dictionary class == self attributesClass;
		assert:
			dictionary =
				(self attributesClass newFrom: self attributeAssociations).
]

{ #category : #tests }
XMLAttributeListTest >> testIncludesAttribute [
	| list |

	list := self emptyList.
	self listItems do: [:each |
		self deny: (list includesAttribute: each name).

		list add: each.
		self assert: (list includesAttribute: each name)].
]

{ #category : #tests }
XMLAttributeListTest >> testIncludesAttributeNode [
	| list |

	list := self emptyList.
	self listItems withIndexDo: [:attribute :i | | included |
		included :=
			(self listItems
				copyFrom: 1
				to: i - 1) anySatisfy: [:each |
				each isNamed: attribute name].
		self assert:
			(list includesAttributeNode: attribute name) =
				included.

		list add: attribute.
		self assert: (list includesAttributeNode: attribute name)].
]

{ #category : #tests }
XMLAttributeListTest >> testIncludesAttributeNodeNamespaceURI [
	| list |

	list := self emptyList.
	self listItems do: [:each |
		self deny:
			(list
				includesAttributeNode: each name
				namespaceURI: 'defaultNS').

		list add: each.
		self deny:
			(list
				includesAttributeNode: each name
				namespaceURI: 'defaultNS').
		self assert:
			(list
				includesAttributeNode: each name
				namespaceURI: '')].
]

{ #category : #tests }
XMLAttributeListTest >> testRemoveAttribute [
	(Array
		with: self listWithItems
		with: self listWithItems reversed)
		do: [:list | | copy |
			copy := list copy.
			copy withIndexDo: [:each :i |
				self
					assert: (list removeAttribute: each name) = each value;
					deny: (list includes: each).
				self
					assertList: list
					equals: (copy allButFirst: i).

				self
					should: [list removeAttribute: each name]
					raise: Error]].
]

{ #category : #tests }
XMLAttributeListTest >> testRemoveAttributeIfAbsent [
	(Array
		with: self listWithItems
		with: self listWithItems reversed)
		do: [:list | | copy |
			copy := list copy.
			copy withIndexDo: [:each :i |
				self assert:
					(list
						removeAttribute: each name
						ifAbsent: [self fail]) = each value;
					deny: (list includes: each).
				self
					assertList: list
					equals: (copy allButFirst: i).

				self assert:
					(list
						removeAttribute: each name
						ifAbsent: [self absentListItem value]) = self absentListItem value]].
]

{ #category : #tests }
XMLAttributeListTest >> testSetAttributes [
	| list associations |

	list := self emptyList.
	associations := self attributeAssociations.
	self
		assert: (list setAttributes: associations) == list;
		assert: list attributeAssociations asArray = associations asArray.

	associations :=
		self changedListItems collect: [:each | each name -> each value].
	self
		assert: (list setAttributes: associations) == list;
		assert: list attributeAssociations asArray = associations asArray.
]

{ #category : #tests }
XMLAttributeListTest >> testSetAttributesFromOrderPreservingDictionary [
	| element list dictionary |

	element := XMLElement new.
	list := self listClass observer: element.
	dictionary := OrderPreservingDictionary newFrom: self attributeAssociations.
	self assert:
		(list setAttributesFromOrderPreservingDictionary: dictionary) == list.
	self assert:
		list attributeAssociations asArray =
			self attributeAssociations asArray.
	list do: [:each |
		self
			assert: each class == self attributeClass;
			assert: each parent == element;
			assert: each element == element]
]
