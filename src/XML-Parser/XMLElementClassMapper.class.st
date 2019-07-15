"
This is a base class for element class mappers. Subclasses need to implement the abstract methods to register and lookup classes mapped to element names, namespace URIs, and attributes.
"
Class {
	#name : #XMLElementClassMapper,
	#superclass : #Object,
	#category : #'XML-Parser-Utils'
}

{ #category : #private }
XMLElementClassMapper >> camelCasedNameFromClassNameSegments: aNameSegmentCollection [
	^ String streamContents: [:stream |
		aNameSegmentCollection withIndexDo: [:each :i |
			stream nextPutAll:
				(i > 1
					ifTrue: [each]
					ifFalse: [each asLowercase])]]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName [
	^ self
		classForElement: aQualifiedName
		ifNone: [nil]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName attributes: anAssociationCollection [
	^ self
		classForElement: aQualifiedName
		attributes: anAssociationCollection
		ifNone: [nil]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName attributes: anAssociationCollection ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI [
	^ self
		classForElement: aQualifiedName
		namespaceURI: aURI
		ifNone: [nil]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection [
	^ self
		classForElement: aQualifiedName
		namespaceURI: aURI
		attributes: anAssociationCollection
		ifNone: [nil]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ self
		classForElement: aQualifiedName
		namespaceURI: aURI
		localName: aLocalName
		attributes: anAssociationCollection
		ifNone: [nil]
]

{ #category : #accessing }
XMLElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #private }
XMLElementClassMapper >> classNameFrom: aClass withoutIgnorableSuffixes: aSuffixCollection [
	| className |

	className := aClass name asString.
	aSuffixCollection do: [:each |
		(className endsWith: each)
			ifTrue: [^ className allButLast: each size]].
	^ className.
]

{ #category : #private }
XMLElementClassMapper >> classNameSegmentsFrom: aString [
	| nameSegments startIndex |

	nameSegments := OrderedCollection new.
	startIndex := 1.
	1 to: aString size do: [:i |
		(((aString at: i) isLowercase
			and: [aString size >= (i + 1)
				and: [(aString at: i + 1) isLowercase not]])
			or: [
				((aString at: i) isUppercase
					and: [aString size >= (i + 2)
						and: [(aString at: i + 1) isUppercase
							and: [(aString at: i + 2) isUppercase not]]])])
			ifTrue: [
				nameSegments addLast:
					(aString
						copyFrom: startIndex
						to: i).
				startIndex := i + 1]].

	startIndex <= aString size
		ifTrue: [
			nameSegments addLast:
				(aString
					copyFrom: startIndex
					to: aString size)].

	^ nameSegments.
]

{ #category : #private }
XMLElementClassMapper >> hyphenatedNameFromClassNameSegments: aNameSegmentCollection [
	^ String streamContents: [:stream |
		aNameSegmentCollection
			do: [:each | stream nextPutAll: each asLowercase]
			separatedBy: [stream nextPut: $-]]
]

{ #category : #mapping }
XMLElementClassMapper >> mapAllMatchingElementsToClass: aClass ignoringSuffixes: aSuffixCollection [
	| classNameWithoutSuffixes classNameSegments totalClassNameSegments |

	classNameWithoutSuffixes :=
		self
			classNameFrom: aClass
			withoutIgnorableSuffixes: aSuffixCollection.
	classNameSegments := self classNameSegmentsFrom: classNameWithoutSuffixes.
	(totalClassNameSegments := classNameSegments size) > 0
		ifFalse: [^ self].

	"remove the class prefix if any"
	totalClassNameSegments > 1
		ifTrue: [classNameSegments removeFirst].
	self
		mapElement:
			(self nameFromClassNameSegments: classNameSegments)
		toClass: aClass.
	self
		mapElement:
			(self camelCasedNameFromClassNameSegments: classNameSegments)
		toClass: aClass.
	self
		mapElement:
			(self hyphenatedNameFromClassNameSegments: classNameSegments)
		toClass: aClass.
	self
		mapElement:
			(self underscoredNameFromClassNameSegments: classNameSegments)
		toClass: aClass.
]

{ #category : #mapping }
XMLElementClassMapper >> mapAllMatchingElementsToClasses: aClassCollection ignoringSuffixes: aSuffixCollection [
	aClassCollection do: [:each |
		self
			mapAllMatchingElementsToClass: each
			ignoringSuffixes: aSuffixCollection]
]

{ #category : #mapping }
XMLElementClassMapper >> mapElement: anElement attributeSpec: anAttributeSpec toClass: aClass [
	self subclassResponsibility
]

{ #category : #mapping }
XMLElementClassMapper >> mapElement: anElement namespaceURI: aURI attributeSpec: anAttributeSpec toClass: aClass [
	self subclassResponsibility
]

{ #category : #mapping }
XMLElementClassMapper >> mapElement: anElement namespaceURI: aURI toClass: aClass [
	self subclassResponsibility
]

{ #category : #mapping }
XMLElementClassMapper >> mapElement: anElement toClass: aClass [
	self subclassResponsibility
]

{ #category : #mapping }
XMLElementClassMapper >> mapElements: anElementCollection namespaceURI: aNamespaceURI toClass: aClass [
	anElementCollection do: [:each |
		self
			mapElement: each
			namespaceURI: aNamespaceURI
			toClass: aClass]
]

{ #category : #mapping }
XMLElementClassMapper >> mapElements: anElementCollection toClass: aClass [
	anElementCollection do: [:each |
		self
			mapElement: each
			toClass: aClass]
]

{ #category : #private }
XMLElementClassMapper >> nameFromClassNameSegments: aNameSegmentCollection [
	"avoid join: for Squeak/GS portability"
	^ String streamContents: [:stream |
		aNameSegmentCollection do: [:each | stream nextPutAll: each]]
]

{ #category : #private }
XMLElementClassMapper >> underscoredNameFromClassNameSegments: aNameSegmentCollection [
	^ String streamContents: [:stream |
		aNameSegmentCollection
			do: [:each | stream nextPutAll: each asLowercase]
			separatedBy: [stream nextPut: $_]]
]
