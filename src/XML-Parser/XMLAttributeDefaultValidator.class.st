"
This is a base class for attribute default validators that implement constraints from the default declaration part of an ATTLIST attribute definition.
"
Class {
	#name : #XMLAttributeDefaultValidator,
	#superclass : #Object,
	#instVars : [
		'attribute'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLAttributeDefaultValidator class >> attribute: anAttribute [
	^ self
		attribute: anAttribute
		value: ''
]

{ #category : #'instance creation' }
XMLAttributeDefaultValidator class >> attribute: anAttribute value: aDefaultValue [
	^ self new
		setAttribute: anAttribute
		value: aDefaultValue
]

{ #category : #defaults }
XMLAttributeDefaultValidator class >> standaloneExternalClass [
	^ self
]

{ #category : #accessing }
XMLAttributeDefaultValidator >> attribute [
	^ attribute
]

{ #category : #testing }
XMLAttributeDefaultValidator >> isFixedValue [
	^ false
]

{ #category : #testing }
XMLAttributeDefaultValidator >> isImplied [
	^ false
]

{ #category : #testing }
XMLAttributeDefaultValidator >> isRequired [
	^ false
]

{ #category : #testing }
XMLAttributeDefaultValidator >> isValue [
	^ false
]

{ #category : #printing }
XMLAttributeDefaultValidator >> printNameAndValueOn: aStream [
	aStream
		nextPutAll: self attribute;
		nextPutAll: '="';
		nextPutAll: self value;
		nextPut: $"
]

{ #category : #printing }
XMLAttributeDefaultValidator >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self printNameAndValueOn: aStream.
	aStream nextPut: $).
]

{ #category : #processing }
XMLAttributeDefaultValidator >> processedDefaultForAbsentAttributeValue [
	^ nil
]

{ #category : #processing }
XMLAttributeDefaultValidator >> processedDefaultForPresentAttributeValue: anAttributeValue [
	^ anAttributeValue
]

{ #category : #initialization }
XMLAttributeDefaultValidator >> setAttribute: anAttribute value: aDefaultValue [
	attribute := anAttribute
]

{ #category : #validating }
XMLAttributeDefaultValidator >> validatedDefaultForAbsentAttributeValue [
	^ nil
]

{ #category : #validating }
XMLAttributeDefaultValidator >> validatedDefaultForPresentAttributeValue: anAttributeValue [
	^ anAttributeValue
]

{ #category : #accessing }
XMLAttributeDefaultValidator >> value [
	^ ''
]
