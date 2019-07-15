"
A simple attribute spec that checks for attributes being present and optionally having a specific value.
"
Class {
	#name : #XMLBasicAttributeSpec,
	#superclass : #XMLAttributeSpec,
	#instVars : [
		'attributeSpec'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #'instance creation' }
XMLBasicAttributeSpec class >> attributes: aDictionaryOrCollectionOfAssociationsAndStrings [
	^ self new setAttributes: aDictionaryOrCollectionOfAssociationsAndStrings
]

{ #category : #adding }
XMLBasicAttributeSpec >> addAttribute: anAttribute [
	^ attributeSpec
		at: anAttribute
		ifAbsentPut: [nil]
]

{ #category : #adding }
XMLBasicAttributeSpec >> addAttributeAssociation: anAssociation [
	^ self
		addAttributeName: anAssociation key
		value: anAssociation value
]

{ #category : #adding }
XMLBasicAttributeSpec >> addAttributeName: aName value: aValue [
	^ attributeSpec
		at: aName
		put: aValue
]

{ #category : #initialization }
XMLBasicAttributeSpec >> initialize [
	super initialize.

	attributeSpec := Dictionary new.
]

{ #category : #matching }
XMLBasicAttributeSpec >> matchesAttributes: anAttributeDictionary [
	attributeSpec keysAndValuesDo: [:specName :specValue |
		specValue
			ifNil: [
				"nil values mean the attribute has to be present and can have
				any value"
				(anAttributeDictionary includesKey: specName)
					ifFalse: [^ false]]
			ifNotNil: [
				(specValue isBlock
					ifTrue: [
						specValue value:
							(anAttributeDictionary
								at: specName
								ifAbsent: [^ false])]
					ifFalse: [
						specValue =
							(anAttributeDictionary
								at: specName
								ifAbsent: [^ false])])
							ifFalse: [^ false]]].
	^ true.
]

{ #category : #initialization }
XMLBasicAttributeSpec >> setAttributes: aDictionaryOrCollectionOfAssociationsAndStrings [
	attributeSpec removeAll.

	"associationsDo: works for dictionaries and non-dictionaries, including
	arrays, to support specs like {'one'. 'two'->'three'}"
	aDictionaryOrCollectionOfAssociationsAndStrings associationsDo: [:each |
		each isString
			ifTrue: [self addAttribute: each]
			ifFalse: [self addAttributeAssociation: each]].
]
