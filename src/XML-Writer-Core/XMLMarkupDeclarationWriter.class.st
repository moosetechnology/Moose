"
This is an abstract class for DTD markup declaration writers.
"
Class {
	#name : #XMLMarkupDeclarationWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'name'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLMarkupDeclarationWriter >> declarationType [
	self subclassResponsibility
]

{ #category : #testing }
XMLMarkupDeclarationWriter >> isOmittable [
	^ self isCanonical
]

{ #category : #accessing }
XMLMarkupDeclarationWriter >> name [
	^ name ifNil: ['']
]

{ #category : #accessing }
XMLMarkupDeclarationWriter >> name: aName [
	name := aName
]

{ #category : #private }
XMLMarkupDeclarationWriter >> writeEpilogue [
	self isOmittable
		ifFalse: [
			self writer
				nextPut: $>;
				formatAfterDeclaration: self]
]

{ #category : #private }
XMLMarkupDeclarationWriter >> writePrologue [
	self isOmittable
		ifFalse: [
			self writer
				formatBeforeDeclaration: self;
				nextPutAll: '<!';
				nextPutAll: self declarationType;
				space;
				writeName: self name]
]
