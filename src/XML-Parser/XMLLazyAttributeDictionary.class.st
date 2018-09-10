"
A lazy version of XMLAttributeDictionary that uses less memory until it's modified.
"
Class {
	#name : #XMLLazyAttributeDictionary,
	#superclass : #Collection,
	#instVars : [
		'attributeDictionary'
	],
	#classInstVars : [
		'emptyAttributeDictionary'
	],
	#category : #'XML-Parser'
}

{ #category : #private }
XMLLazyAttributeDictionary class >> emptyAttributeDictionary [
	^ emptyAttributeDictionary
]

{ #category : #private }
XMLLazyAttributeDictionary class >> emptyAttributeDictionaryClass [
	^ XMLAttributeDictionary
]

{ #category : #'class initialization' }
XMLLazyAttributeDictionary class >> initialize [
	"self initialize"

	self initializeEmptyAttributeDictionary
]

{ #category : #'class initialization' }
XMLLazyAttributeDictionary class >> initializeEmptyAttributeDictionary [
	"explictly initialized class inst vars are used for the empty
	dictionaries to simplify class initialization (on GS) and to
	speed up lazy dictionary instance creation"
	emptyAttributeDictionary := self emptyAttributeDictionaryClass new
]

{ #category : #'instance creation' }
XMLLazyAttributeDictionary class >> new [
	^ self basicNew setAttributeDictionary: emptyAttributeDictionary
]

{ #category : #'instance creation' }
XMLLazyAttributeDictionary class >> new: aCapacity [
	^ self new
]

{ #category : #'instance creation' }
XMLLazyAttributeDictionary class >> newFrom: anAssociationCollection [
	^ self basicNew setAttributeDictionary:
		(self emptyAttributeDictionaryClass newFrom:
			anAssociationCollection)
]

{ #category : #'instance creation' }
XMLLazyAttributeDictionary class >> newFromPairs: aSequenceableCollection [
	^ self basicNew setAttributeDictionary:
		(self emptyAttributeDictionaryClass newFromPairs:
			aSequenceableCollection)
]

{ #category : #comparing }
XMLLazyAttributeDictionary >> = anObject [
	^ attributeDictionary = anObject
]

{ #category : #adding }
XMLLazyAttributeDictionary >> add: anAssociation [
	^ self copiedAttributeDictionary add: anAssociation
]

{ #category : #adding }
XMLLazyAttributeDictionary >> addAll: anAssociationCollection [
	^ self copiedAttributeDictionary addAll: anAssociationCollection
]

{ #category : #converting }
XMLLazyAttributeDictionary >> asXMLAttributeDictionary [
	^ self
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAt: aKey [
	^ attributeDictionary associationAt: aKey
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAt: aKey ifAbsent: aBlock [
	^ attributeDictionary
		associationAt: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAt: aKey ifPresent: aBlock [
	^ attributeDictionary
		associationAt: aKey
		ifPresent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAtName: aQualifiedOrLocalName [
	^ attributeDictionary associationAtName: aQualifiedOrLocalName
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAtName: aKey ifAbsent: aBlock [
	^ attributeDictionary
		associationAtName: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAtName: aQualifiedOrLocalName namespaceURI: aURI [
	^ attributeDictionary
		associationAtName: aQualifiedOrLocalName
		namespaceURI: aURI
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associationAtName: aKey namespaceURI: aURI ifAbsent: aBlock [
	^ attributeDictionary
		associationAtName: aKey
		namespaceURI: aURI
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> associations [
	^ attributeDictionary associations
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> associationsDo: aBlock [
	attributeDictionary associationsDo: aBlock
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> associationsSelect: aBlock [
	^ self copyEmpty setAttributeDictionary:
		(attributeDictionary associationsSelect: aBlock)
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey [
	^ attributeDictionary at: aKey
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey ifAbsent: aBlock [
	^ attributeDictionary
		at: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey ifAbsentPut: aBlock [
	^ self copiedAttributeDictionary
		at: aKey
		ifAbsentPut: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey ifPresent: aBlock [
	^ attributeDictionary
		at: aKey
		ifPresent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ attributeDictionary
		at: aKey
		ifPresent: aPresentBlock
		ifAbsent: anAbsentBlock
]

{ #category : #private }
XMLLazyAttributeDictionary >> at: aKey newPut: aValue [
	"added to be consistent with XMLAttributeDictionary,
	but it shouldn't be needed"
	^ self copiedAttributeDictionary
		at: aKey
		newPut: aValue
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> at: aKey put: aValue [
	^ self copiedAttributeDictionary
		at: aKey
		put: aValue
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> atName: aQualifiedOrLocalName [
	^ attributeDictionary atName: aQualifiedOrLocalName
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> atName: aQualifiedOrLocalName ifAbsent: aBlock [
	^ attributeDictionary
		atName: aQualifiedOrLocalName
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> atName: aQualifiedOrLocalName namespaceURI: aURI [
	^ attributeDictionary
		atName: aQualifiedOrLocalName
		namespaceURI: aURI
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> atName: aQualifiedOrLocalName namespaceURI: aURI ifAbsent: aBlock [
	^ attributeDictionary
		atName: aQualifiedOrLocalName
		namespaceURI: aURI
		ifAbsent: aBlock
]

{ #category : #private }
XMLLazyAttributeDictionary >> attributeDictionary [
	^ attributeDictionary
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> capacity [
	^ attributeDictionary capacity
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> collect: aBlock [
	^ self copyEmpty setAttributeDictionary:
		(attributeDictionary collect: aBlock)
]

{ #category : #private }
XMLLazyAttributeDictionary >> copiedAttributeDictionary [
	"replaces the shared, empty order-preserving dictionary with a new
	mutable one ready for modification"
	^ attributeDictionary == self emptyAttributeDictionary
		ifTrue: [attributeDictionary := self copyEmptyAttributeDictionary]
		ifFalse: [attributeDictionary]
]

{ #category : #copying }
XMLLazyAttributeDictionary >> copyEmpty [
	"Squeak and GS don't have Collection>>#copyEmpty:, so it is
	reimplemented for portability"
	^ self species new
]

{ #category : #private }
XMLLazyAttributeDictionary >> copyEmptyAttributeDictionary [
	^ attributeDictionary copy
]

{ #category : #private }
XMLLazyAttributeDictionary >> dictionary [
	^ attributeDictionary dictionary
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> dictionaryClass [
	^ attributeDictionary dictionaryClass
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> do: aBlock [
	attributeDictionary do: aBlock
]

{ #category : #private }
XMLLazyAttributeDictionary >> emptyAttributeDictionary [
	^ self class emptyAttributeDictionary
]

{ #category : #comparing }
XMLLazyAttributeDictionary >> hash [
	^ attributeDictionary hash
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> identityIndexOfKey: aKey [
	^ attributeDictionary identityIndexOfKey: aKey
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> identityIndexOfKey: aKey ifAbsent: aBlock [
	^ attributeDictionary
		identityIndexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
XMLLazyAttributeDictionary >> includesAssociation: anAssociation [
	^ attributeDictionary includesAssociation: anAssociation
]

{ #category : #testing }
XMLLazyAttributeDictionary >> includesIdentity: anObject [
	^ attributeDictionary includesIdentity: anObject
]

{ #category : #testing }
XMLLazyAttributeDictionary >> includesKey: aKey [
	^ attributeDictionary includesKey: aKey
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> indexOfKey: aKey [
	^ attributeDictionary indexOfKey: aKey
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	^ attributeDictionary
		indexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
XMLLazyAttributeDictionary >> isDictionary [
	^ true
]

{ #category : #testing }
XMLLazyAttributeDictionary >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ attributeDictionary isEmpty
]

{ #category : #testing }
XMLLazyAttributeDictionary >> isIdentityDictionary [
	^ attributeDictionary isIdentityDictionary
]

{ #category : #testing }
XMLLazyAttributeDictionary >> isOrderPreservingDictionary [
	^ true
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtIdentityValue: aValue [
	^ attributeDictionary keyAtIdentityValue: aValue
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtIdentityValue: aValue ifAbsent: aBlock [
	^ attributeDictionary
		keyAtIdentityValue: aValue
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtIndex: anIndex [
	^ attributeDictionary keyAtIndex: anIndex
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtIndex: anIndex ifAbsent: aBlock [
	^ attributeDictionary
		keyAtIndex: anIndex
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtValue: anObject [
	^ attributeDictionary keyAtValue: anObject
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyAtValue: anObject ifAbsent: aBlock [
	^ attributeDictionary
		keyAtValue: anObject
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keyForIdentity: anObject [
	^ attributeDictionary keyForIdentity: anObject
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keys [
	^ attributeDictionary keys
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> keysAndValuesDo: aBlock [
	attributeDictionary keysAndValuesDo: aBlock
]

{ #category : #removing }
XMLLazyAttributeDictionary >> keysAndValuesRemove: aTwoArgumentBlock [
	self copiedAttributeDictionary keysAndValuesRemove: aTwoArgumentBlock
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> keysDo: aBlock [
	attributeDictionary keysDo: aBlock
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> keysSortedSafely [
	^ attributeDictionary keysSortedSafely
]

{ #category : #private }
XMLLazyAttributeDictionary >> namespaceScope [
	^ attributeDictionary namespaceScope
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> namespaceURIOf: aKey [
	^ attributeDictionary namespaceURIOf: aKey
]

{ #category : #private }
XMLLazyAttributeDictionary >> orderedKeys [
	^ attributeDictionary orderedKeys
]

{ #category : #copying }
XMLLazyAttributeDictionary >> postCopy [
	attributeDictionary == self emptyAttributeDictionary
		ifFalse: [attributeDictionary := attributeDictionary copy]
]

{ #category : #printing }
XMLLazyAttributeDictionary >> printElementsOn: aStream [
	attributeDictionary printElementsOn: aStream
]

{ #category : #removing }
XMLLazyAttributeDictionary >> remove: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{ #category : #removing }
XMLLazyAttributeDictionary >> removeAll [
	attributeDictionary := self emptyAttributeDictionary
]

{ #category : #removing }
XMLLazyAttributeDictionary >> removeKey: aKey [
	^ self copiedAttributeDictionary removeKey: aKey
]

{ #category : #removing }
XMLLazyAttributeDictionary >> removeKey: aKey ifAbsent: aBlock [
	^ self copiedAttributeDictionary
		removeKey: aKey
		ifAbsent: aBlock
]

{ #category : #removing }
XMLLazyAttributeDictionary >> removeKeys: aKeyCollection [
	self copiedAttributeDictionary removeKeys: aKeyCollection
]

{ #category : #private }
XMLLazyAttributeDictionary >> resolvePrefix: aPrefix [
	^ attributeDictionary resolvePrefix: aPrefix
]

{ #category : #private }
XMLLazyAttributeDictionary >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	^ attributeDictionary
		resolvePrefix: aPrefix
		ifUnresolvable: aBlock
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> select: aBlock [
	^ self copyEmpty setAttributeDictionary:
		(attributeDictionary select: aBlock)
]

{ #category : #initialization }
XMLLazyAttributeDictionary >> setAttributeDictionary: anAttributeDictionary [
	attributeDictionary := anAttributeDictionary
]

{ #category : #initialization }
XMLLazyAttributeDictionary >> setNamespaceScope: aNamespaceScope [
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> size [
	^ attributeDictionary size
]

{ #category : #testing }
XMLLazyAttributeDictionary >> usesNamespaces [
	^ attributeDictionary usesNamespaces
]

{ #category : #accessing }
XMLLazyAttributeDictionary >> values [
	^ attributeDictionary values
]

{ #category : #enumerating }
XMLLazyAttributeDictionary >> valuesDo: aBlock [
	attributeDictionary valuesDo: aBlock
]
