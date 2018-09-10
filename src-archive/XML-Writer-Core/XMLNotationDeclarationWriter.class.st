"
This class writes <!NOTATION ...> declarations for DTD internal subsets, but not if canonical XML is enabled.
"
Class {
	#name : #XMLNotationDeclarationWriter,
	#superclass : #XMLMarkupDeclarationWriter,
	#instVars : [
		'externalIDWriter'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLNotationDeclarationWriter >> declarationType [
	^ 'NOTATION'
]

{ #category : #accessing }
XMLNotationDeclarationWriter >> externalIDWriter [
	^ externalIDWriter ifNil: [externalIDWriter := XMLNotationExternalIDWriter new]
]

{ #category : #accessing }
XMLNotationDeclarationWriter >> publicID [
	^ self externalIDWriter publicID
]

{ #category : #accessing }
XMLNotationDeclarationWriter >> publicID: aPublicID [
	self externalIDWriter publicID: aPublicID
]

{ #category : #accessing }
XMLNotationDeclarationWriter >> systemID [
	^ self externalIDWriter systemID
]

{ #category : #accessing }
XMLNotationDeclarationWriter >> systemID: aSystemID [
	self externalIDWriter systemID: aSystemID
]

{ #category : #private }
XMLNotationDeclarationWriter >> writeBody [
	self isOmittable
		ifFalse: [self writeExternalID]
]

{ #category : #private }
XMLNotationDeclarationWriter >> writeExternalID [
	self writer space.
	self externalIDWriter writeOn: self writer.
]
