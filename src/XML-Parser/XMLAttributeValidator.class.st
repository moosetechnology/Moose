"
This is a base class for attribute validators.
"
Class {
	#name : #XMLAttributeValidator,
	#superclass : #Object,
	#instVars : [
		'element',
		'attribute',
		'defaultValidator'
	],
	#classVars : [
		'NormalizedSpace'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLAttributeValidator class >> element: anElement attribute: anAttribute defaultValidator: aDefaultValidator [
	^ self new
		setElement: anElement
		attribute: anAttribute
		defaultValidator: aDefaultValidator
]

{ #category : #'class initialization' }
XMLAttributeValidator class >> initialize [
	"self initialize"

	"stored in a class var for faster access"
	NormalizedSpace := Character space
]

{ #category : #defaults }
XMLAttributeValidator class >> standaloneExternalClass [
	^ self
]

{ #category : #accessing }
XMLAttributeValidator >> attribute [
	^ attribute
]

{ #category : #accessing }
XMLAttributeValidator >> defaultValidator [
	^ defaultValidator
]

{ #category : #accessing }
XMLAttributeValidator >> element [
	^ element
]

{ #category : #private }
XMLAttributeValidator >> errorInvalidDefaultAttributeValue: aDefaultValue [
	XMLValidationException
		formatSignal:
			'Invalid default value "{1}" in declaration for ',
			'attribute "{2}" of element <3>'
		with: aDefaultValue
		with: self attribute
		with: self element
]

{ #category : #private }
XMLAttributeValidator >> errorInvalidXMLIDAttributeDeclaration [
	XMLValidationException signal:
		'All "xml:id" attributes must be declared to be of ID type'
]

{ #category : #private }
XMLAttributeValidator >> errorInvalidXMLSpaceAttributeDeclaration [
	XMLValidationException
		formatSignal:
			'Attribute "xml:space" of element <{1}> must be declared as ',
			'an enumeration type with "default" and/or "preserve" values'
		with: self element
]

{ #category : #private }
XMLAttributeValidator >> errorNormalizedStandaloneExternalAttribute [
	XMLValidationException
		formatSignal:
			'Externally defined attribute "{1}" of element <{2}> required ',
			'further value normalizaiton in standalone="yes" document'
		with: self attribute
		with: self element
]

{ #category : #private }
XMLAttributeValidator >> furtherNormalizeAttributeValue: aSemiNormalizedAttributeValue [
	"The tokenizer normalizes all non-char escaped whitespace in attribute
	values to spaces (0x20). This further normalizes them by removing leading
	and trailing spaces and turing multiple spaces to single spaces."
	| writeStream isInWhitespace |

	aSemiNormalizedAttributeValue size > 0 "optimization"
		ifFalse: [^ aSemiNormalizedAttributeValue].

	"must use #writeStream instead of 'WriteStream on:' to get a 0-based stream
	on Gemstone"
	writeStream := (String new: aSemiNormalizedAttributeValue size) writeStream.
	isInWhitespace := false.
	"use #to:do: for speed"
	1 to: aSemiNormalizedAttributeValue size do: [:i | | nextChar |
		(nextChar := aSemiNormalizedAttributeValue at: i) == NormalizedSpace
			ifTrue: [
				isInWhitespace
					ifFalse: [isInWhitespace := true]]
			ifFalse: [
				isInWhitespace
					ifTrue: [
						writeStream position > 0
							ifTrue: [writeStream nextPut: NormalizedSpace].
						isInWhitespace := false].
				writeStream nextPut: nextChar]].
	^ writeStream contents.
]

{ #category : #initialization }
XMLAttributeValidator >> initializeWithValidatorsFrom: aValidatorContainer [
	(self mustFurtherNormalizeAttributeValue
		and: [self defaultValidator isValue])
		ifTrue: [
			self defaultValidator value:
				(self furtherNormalizeAttributeValue:
					self defaultValidator value)]
]

{ #category : #testing }
XMLAttributeValidator >> isCData [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isEntities [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isEntity [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isEnumeration [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isID [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isIDRef [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isIDRefs [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isNmtoken [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isNmtokens [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isNotationEnumeration [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isStandaloneExternal [
	"this is overridden in each standalone external subclass to return
	true instead of just returning a boolean inst var to save memory"
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> isXMLID [
	^ false
]

{ #category : #testing }
XMLAttributeValidator >> mustFurtherNormalizeAttributeValue [
	^ true
]

{ #category : #printing }
XMLAttributeValidator >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPutAll: '(<';
		nextPutAll: self element;
		space.
	self defaultValidator printNameAndValueOn: aStream.
	aStream nextPutAll: '>)'.
]

{ #category : #processing }
XMLAttributeValidator >> processAttributes: aDictionary [
	| attributeAssociation normalizedValue |

	attributeAssociation :=
		aDictionary
			associationAt: self attribute
			ifAbsent: [
				self defaultValidator processedDefaultForAbsentAttributeValue
					ifNotNil: [:defaultValue |
						aDictionary
							at: self attribute
							put: defaultValue].
				^ self].

	self mustFurtherNormalizeAttributeValue
		ifTrue: [
			normalizedValue :=
				self furtherNormalizeAttributeValue:
					attributeAssociation value]
		ifFalse: [normalizedValue := attributeAssociation value].
	attributeAssociation value:
		(self defaultValidator processedDefaultForPresentAttributeValue:
			normalizedValue).
]

{ #category : #initialization }
XMLAttributeValidator >> setElement: anElement attribute: anAttribute defaultValidator: aDefaultValidator [
	element := anElement.
	attribute := anAttribute.
	defaultValidator := aDefaultValidator.
]

{ #category : #private }
XMLAttributeValidator >> spaceSeparatedListValuesIn: aSpaceSeparatedList do: aBlock [
	NormalizedSpace
		xmlSplit: aSpaceSeparatedList
		do: aBlock
]

{ #category : #validating }
XMLAttributeValidator >> validateAttributeDeclaration [
	(self attribute at: 1) == $x "optimization"
		ifTrue: [
			(self attribute = 'xml:id')
				ifTrue: [^ self validateXMLIDAttributeDeclaration].
			(self attribute = 'xml:space')
				ifTrue: [^ self validateXMLSpaceAttributeDeclaration]].

	self defaultValidator isValue
		ifTrue: [	
			self validateAttributeDefaultValue:
				self defaultValidator value].
]

{ #category : #validating }
XMLAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	"This is overridden in subclasses to check default values when validating
	the declaration, but CDATA types should not be validated, and ID types
	cannot have default values at all"
]

{ #category : #validating }
XMLAttributeValidator >> validateAttributeValue: aValue [
	"This is overridden in subclasses to check attribute values"
]

{ #category : #validating }
XMLAttributeValidator >> validateAttributes: aDictionary [
	| attributeAssociation wasAbsent |

	wasAbsent := false.
	attributeAssociation :=
		aDictionary
			associationAt: self attribute
			ifAbsent: [
				wasAbsent := true.
				self defaultValidator validatedDefaultForAbsentAttributeValue
					ifNil: [^ self]
					ifNotNil: [:defaultValue |
						aDictionary add: self attribute -> defaultValue]].

	wasAbsent
		ifFalse: [| normalizedValue |
			self mustFurtherNormalizeAttributeValue
				ifTrue: [
					normalizedValue :=
						self furtherNormalizeAttributeValue:
							attributeAssociation value.
					self isStandaloneExternal
						ifTrue: [
							"since further normalization just condences multiple spaces
							to single spaces and removes trailing and leading spaces,
							comparing the sizes after is enough to detect if it was
							done"
							normalizedValue size = attributeAssociation value size
								ifFalse: [
									self errorNormalizedStandaloneExternalAttribute]]]
				ifFalse: [normalizedValue := attributeAssociation value].
			attributeAssociation value:
				(self defaultValidator validatedDefaultForPresentAttributeValue:
					normalizedValue)].

	self validateAttributeValue: attributeAssociation value.
]

{ #category : #validating }
XMLAttributeValidator >> validateXMLIDAttributeDeclaration [
	self errorInvalidXMLIDAttributeDeclaration
]

{ #category : #validating }
XMLAttributeValidator >> validateXMLSpaceAttributeDeclaration [
	self errorInvalidXMLSpaceAttributeDeclaration
]
