"
This class writes <!DOCTYPE ...> declarations. You can set the root element and the public and system IDs using the messages under ""accessing"" before specifying any internal subset with #with:.
"
Class {
	#name : #XMLDoctypeDeclarationWriter,
	#superclass : #XMLEmbeddedMarkupWriter,
	#instVars : [
		'root',
		'externalIDWriter'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> externalIDWriter [
	^ externalIDWriter ifNil: [externalIDWriter := XMLExternalIDWriter new]
]

{ #category : #testing }
XMLDoctypeDeclarationWriter >> isDoctypeDeclarationWriter [
	^ true
]

{ #category : #testing }
XMLDoctypeDeclarationWriter >> isExternalIDOmittable [
	^ self externalIDWriter isOmittable
]

{ #category : #testing }
XMLDoctypeDeclarationWriter >> isOmittable [
	^ self isCanonical
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> publicID [
	^ self externalIDWriter publicID
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> publicID: aPublicID [
	self externalIDWriter publicID: aPublicID
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> root [
	^ root ifNil: ['']
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> root: aRootElementName [
	root := aRootElementName
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> systemID [
	^ self externalIDWriter systemID
]

{ #category : #accessing }
XMLDoctypeDeclarationWriter >> systemID: aSystemID [
	self externalIDWriter systemID: aSystemID
]

{ #category : #deprecated }
XMLDoctypeDeclarationWriter >> withInternalSubset: aStringOrCollectionOrBlock [
	self deprecated: 'use #with: instead'.

	self with: aStringOrCollectionOrBlock.
]

{ #category : #private }
XMLDoctypeDeclarationWriter >> writeBody: aStringOrCollectionOrBlock [
	self isOmittable
		ifFalse: [super writeBody: aStringOrCollectionOrBlock]
]

{ #category : #private }
XMLDoctypeDeclarationWriter >> writeEmbeddedMarkupPrologue [
	self isOmittable
		ifFalse: [
			self writer
				space;
				nextPut: $[;
				formatBeforeInternalSubset: self]
]

{ #category : #private }
XMLDoctypeDeclarationWriter >> writeEpilogue [
	self isOmittable
		ifTrue: [^ self].

	self hasEmbeddedMarkup
		ifTrue: [
			self writer
				formatAfterInternalSubset: self;
				nextPut: $]].

	self writer
		nextPut: $>;
		formatAfterDoctypeDeclaration: self.
]

{ #category : #private }
XMLDoctypeDeclarationWriter >> writeExternalID [
	self writer space.
	self externalIDWriter writeOn: self writer.
]

{ #category : #private }
XMLDoctypeDeclarationWriter >> writePrologue [
	self isOmittable
		ifTrue: [^ self].

	self writer
		formatBeforeDoctypeDeclaration: self;
		nextPutAll: '<!DOCTYPE';
		space;
		writeName: self root.

	self isExternalIDOmittable
		ifFalse: [self writeExternalID].
]
