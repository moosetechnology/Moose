"
This class writes <!ELEMENT ...> declarations for DTD internal subsets, but not if canonical XML is enabled.
"
Class {
	#name : #XMLElementDeclarationWriter,
	#superclass : #XMLMarkupDeclarationWriter,
	#instVars : [
		'contentModel'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLElementDeclarationWriter >> contentModel [
	^ contentModel ifNil: [contentModel := '']
]

{ #category : #accessing }
XMLElementDeclarationWriter >> contentModel: aContentModelString [
	contentModel := aContentModelString
]

{ #category : #accessing }
XMLElementDeclarationWriter >> declarationType [
	^ 'ELEMENT'
]

{ #category : #accessing }
XMLElementDeclarationWriter >> element [
	^ self name
]

{ #category : #accessing }
XMLElementDeclarationWriter >> element: aName [
	self name: aName
]

{ #category : #private }
XMLElementDeclarationWriter >> writeBody [
	self isOmittable
		ifFalse: [self writeContentModel]
]

{ #category : #private }
XMLElementDeclarationWriter >> writeContentModel [
	| contentModelString contentModelStringSize isEnumeration nameStart isNonElementName |

	self writer space.
	contentModelString := self contentModel.
	contentModelStringSize := contentModelString size.
	isEnumeration := false.
	1 to: contentModelStringSize do: [:i | | nextChar |
		nextChar := contentModelString at: i.
		isEnumeration
			ifTrue: [
				nameStart
					ifNil: [
						nextChar isXMLWriterNameStartChar
							ifTrue: [
								nameStart := i.
								isNonElementName := (contentModelString at: i - 1) == $#]
							ifFalse: [self writer nextPut: nextChar]]
					ifNotNil: [
						nextChar isXMLWriterNameChar
							ifFalse: [
								self
									writeContentModelName:
										(contentModelString
											copyFrom: nameStart
											to: i - 1)
									isNonElementName: isNonElementName.
								nameStart := nil.
								self writer nextPut:  nextChar]]]
			ifFalse: [
				isEnumeration := nextChar == $(.
				self writer nextPut: nextChar]].

	nameStart
		ifNotNil: [
			self
				writeContentModelName:
					(contentModelString
						copyFrom: nameStart
						to: contentModelStringSize)
				isNonElementName: isNonElementName].
]

{ #category : #private }
XMLElementDeclarationWriter >> writeContentModelName: aName isNonElementName: aBoolean [
	aBoolean
		ifTrue: [self writer nextPutAll: aName]
		ifFalse: [self writer writeName: aName]
]
