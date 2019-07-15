"
This class writes general and parameter <!ENTITY ...> declarations for DTD internal subsets, but not if canonical XML is enabled.
"
Class {
	#name : #XMLEntityDeclarationWriter,
	#superclass : #XMLMarkupDeclarationWriter,
	#instVars : [
		'isParameter',
		'replacement',
		'externalIDWriter',
		'ndata'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLEntityDeclarationWriter >> declarationType [
	^ self isParameter
		ifTrue: ['ENTITY %']
		ifFalse: ['ENTITY']
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> externalIDWriter [
	^ externalIDWriter ifNil: [externalIDWriter := XMLExternalIDWriter new]
]

{ #category : #testing }
XMLEntityDeclarationWriter >> isExternalIDOmittable [
	^ self externalIDWriter isOmittable
]

{ #category : #testing }
XMLEntityDeclarationWriter >> isParameter [
	^ isParameter ifNil: [isParameter := false]
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> isParameter: aBoolean [
	isParameter := aBoolean
]

{ #category : #testing }
XMLEntityDeclarationWriter >> isUnparsed [
	^ self ndata notEmpty
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> ndata [
	^ ndata ifNil: [ndata := '']
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> ndata: aNotationName [
	ndata := aNotationName
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> publicID [
	^ self externalIDWriter publicID
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> publicID: aPublicID [
	self externalIDWriter publicID: aPublicID
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> replacement [
	^ replacement ifNil: [replacement := '']
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> replacement: aReplacement [
	replacement := aReplacement
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> systemID [
	^ self externalIDWriter systemID
]

{ #category : #accessing }
XMLEntityDeclarationWriter >> systemID: aSystemID [
	self externalIDWriter systemID: aSystemID
]

{ #category : #private }
XMLEntityDeclarationWriter >> writeBody [
	self isOmittable
		ifFalse: [
			self isExternalIDOmittable
				ifTrue: [self writeReplacement]
				ifFalse: [
					self writeExternalID.
					self isUnparsed
						ifTrue: [self writeNData]]]
]

{ #category : #private }
XMLEntityDeclarationWriter >> writeExternalID [
	self writer space.
	self externalIDWriter writeOn: self writer.
]

{ #category : #private }
XMLEntityDeclarationWriter >> writeNData [
	self writer
		space;
		nextPutAll: 'NDATA';
		space;
		writeName: self ndata
]

{ #category : #private }
XMLEntityDeclarationWriter >> writeReplacement [
	self writer
		space;
		writeEscapedEntityString: self replacement
]
