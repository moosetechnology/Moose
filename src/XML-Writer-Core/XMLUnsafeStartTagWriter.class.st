"
This class is a start tag writer. It does not automatically close itself like XMLTagWriter and will make non-wellformed XML if an end tag isn't generated for it.
"
Class {
	#name : #XMLUnsafeStartTagWriter,
	#superclass : #XMLUnsafeTagWriter,
	#instVars : [
		'xmlnsDeclarations',
		'attributes'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributeAt: aName [
	^ self attributeAt: aName ifAbsent: ['']
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributeAt: aName ifAbsent: aBlock [
	^ self attributes at: aName ifAbsent: aBlock
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributeAt: aName ifAbsentPut: aBlock [
	^ self attributes at: aName ifAbsentPut: aBlock
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributeAt: aName put: aValue [
	^ self attributes at: aName put: aValue
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributes [
	^ attributes ifNil: [attributes := OrderPreservingStringDictionary new]
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> attributes: anAssociationCollection [
	attributes := OrderPreservingStringDictionary newFrom: anAssociationCollection
]

{ #category : #testing }
XMLUnsafeStartTagWriter >> hasAttributes [
	^ attributes notNil and: [attributes notEmpty]
]

{ #category : #testing }
XMLUnsafeStartTagWriter >> hasXMLNSDeclarations [
	^ xmlnsDeclarations notNil and: [xmlnsDeclarations notEmpty]
]

{ #category : #testing }
XMLUnsafeStartTagWriter >> includesAttribute: anAttribute [
	^ self attributes includesKey: anAttribute
]

{ #category : #testing }
XMLUnsafeStartTagWriter >> includesXMLNS: aPrefix [
	^ self xmlnsDeclarations includesKey: aPrefix
]

{ #category : #private }
XMLUnsafeStartTagWriter >> setAttributes: aDictionary [
	attributes := aDictionary
]

{ #category : #private }
XMLUnsafeStartTagWriter >> setXMLNSDeclarations: aDictionary [ 
	xmlnsDeclarations := aDictionary
]

{ #category : #private }
XMLUnsafeStartTagWriter >> writeBody [
	self writer writeName: self name.
	xmlnsDeclarations
		ifNotNil: [self writer writeXMLNSDeclarations: xmlnsDeclarations].
	attributes
		ifNotNil: [self writer writeAttributes: attributes].
]

{ #category : #private }
XMLUnsafeStartTagWriter >> writeEpilogue [
	self writer
		nextPut: $>;
		formatAfterStartTag: self
]

{ #category : #private }
XMLUnsafeStartTagWriter >> writePrologue [
	self writer
		formatBeforeStartTag: self;
		nextPut: $<
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlns [
	^ self xmlnsDeclarations at: ''
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlns: aURI [
	self xmlnsDeclarations at: '' put: aURI
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsAt: aPrefix [
	^ self xmlnsDeclarations at: aPrefix ifAbsent: ['']
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsAt: aPrefix ifAbsent: aBlock [
	^ self xmlnsDeclarations at: aPrefix ifAbsent: aBlock
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsAt: aPrefix ifAbsentPut: aBlock [
	^ self xmlnsDeclarations at: aPrefix ifAbsentPut: aBlock
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsAt: aPrefix put: aValue [
	^ self xmlnsDeclarations at: aPrefix put: aValue
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsDeclarations [
	^ xmlnsDeclarations
		ifNil: [xmlnsDeclarations := OrderPreservingStringDictionary new: 5]
]

{ #category : #accessing }
XMLUnsafeStartTagWriter >> xmlnsDeclarations: anAssociationCollection [
	"set xmlns decls using a dictionary or array of prefix/uri associations.
	empty prefix is default xmlns."
	xmlnsDeclarations :=
		OrderPreservingStringDictionary newFrom: anAssociationCollection
]
