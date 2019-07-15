"
This is an abstract class for resolved external entity replacements.
"
Class {
	#name : #DTDResolvedExternalParsedEntityReplacement,
	#superclass : #Object,
	#category : #'XML-Parser-DTD'
}

{ #category : #converting }
DTDResolvedExternalParsedEntityReplacement >> asString [
	^ self contents
]

{ #category : #accessing }
DTDResolvedExternalParsedEntityReplacement >> contents [
	self subclassResponsibility
]

{ #category : #testing }
DTDResolvedExternalParsedEntityReplacement >> isEmpty [
	self subclassResponsibility
]

{ #category : #testing }
DTDResolvedExternalParsedEntityReplacement >> notEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
DTDResolvedExternalParsedEntityReplacement >> readStream [
	self subclassResponsibility
]
