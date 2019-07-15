"
This class writes attribute <!ATTLIST ...> declarations for DTD internal subsets, but not if canonical XML is enabled.
"
Class {
	#name : #XMLAttributeDeclarationWriter,
	#superclass : #XMLMarkupDeclarationWriter,
	#instVars : [
		'attribute',
		'type',
		'defaultPragma',
		'defaultValue'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLAttributeDeclarationWriter >> attribute [
	^ attribute ifNil: [attribute := '']
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> attribute: aName [
	attribute := aName
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> declarationType [
	^ 'ATTLIST'
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> defaultPragma [
	^ defaultPragma ifNil: [defaultPragma := '']
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> defaultPragma: aDefaultPragma [
	defaultPragma :=
		(aDefaultPragma notNil
			and: [aDefaultPragma notEmpty
				and: [aDefaultPragma first == $#]])
			ifTrue: [aDefaultPragma allButFirst]
			ifFalse: [aDefaultPragma]
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> defaultValue [
	^ defaultValue ifNil: [defaultValue := '']
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> defaultValue: aDefaultValue [
	defaultValue := aDefaultValue
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> element [
	^ self name
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> element: aName [
	self name: aName
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> type [
	^ type ifNil: [type := 'CDATA']
]

{ #category : #accessing }
XMLAttributeDeclarationWriter >> type: aType [
	type := aType
]

{ #category : #private }
XMLAttributeDeclarationWriter >> writeAttribute [
	self writer
		space;
		writeName: self attribute
]

{ #category : #private }
XMLAttributeDeclarationWriter >> writeBody [
	self isOmittable
		ifFalse: [
			self
				writeAttribute;
				writeType;
				writeDefaultPragma;
				writeDefaultValue]
]

{ #category : #writing }
XMLAttributeDeclarationWriter >> writeDefaultPragma [
	self defaultPragma notEmpty
		ifTrue: [
			self writer
				space;
				nextPut: $#;
				nextPutAll: self defaultPragma]
]

{ #category : #writing }
XMLAttributeDeclarationWriter >> writeDefaultValue [
	(self defaultPragma isEmpty
		or: [self defaultPragma = 'FIXED'])
		ifTrue: [
			self writer
				space;
				writeEscapedContentString: self defaultValue]
]

{ #category : #private }
XMLAttributeDeclarationWriter >> writeType [
	| typeString typeStringSize isEnumeration nameStart |

	self writer space.
	typeString := self type.
	typeStringSize := typeString size.
	isEnumeration := false.
	1 to: typeStringSize do: [:i | | nextChar |
		nextChar := typeString at: i.
		isEnumeration
			ifTrue: [
				nameStart
					ifNil: [
						nextChar isXMLWriterNameStartChar
							ifTrue: [nameStart := i]
							ifFalse: [self writer nextPut: nextChar]]
					ifNotNil: [
						nextChar isXMLWriterNameChar
							ifFalse: [
								self writer writeName:
									(typeString
										copyFrom: nameStart
										to: i - 1).
								nameStart := nil.
								self writer nextPut: nextChar]]]
			ifFalse: [
				isEnumeration := nextChar == $(.
				self writer nextPut: nextChar]].

	nameStart
		ifNotNil: [
			self writer writeName:
				(typeString
					copyFrom: nameStart
					to: typeStringSize)].
]
