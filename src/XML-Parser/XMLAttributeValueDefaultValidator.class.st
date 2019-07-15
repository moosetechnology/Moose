"
This class will put a default value for an attribute if the attribute is absent.
"
Class {
	#name : #XMLAttributeValueDefaultValidator,
	#superclass : #XMLAttributeDefaultValidator,
	#instVars : [
		'value'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLAttributeValueDefaultValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalAttributeValueDefaultValidator
]

{ #category : #testing }
XMLAttributeValueDefaultValidator >> isValue [
	^ true
]

{ #category : #processing }
XMLAttributeValueDefaultValidator >> processedDefaultForAbsentAttributeValue [
	^ self value
]

{ #category : #initialization }
XMLAttributeValueDefaultValidator >> setAttribute: anAttribute value: aDefaultValue [
	attribute := anAttribute.
	value := aDefaultValue.
]

{ #category : #validating }
XMLAttributeValueDefaultValidator >> validatedDefaultForAbsentAttributeValue [
	^ self value
]

{ #category : #accessing }
XMLAttributeValueDefaultValidator >> value [
	^ value
]

{ #category : #accessing }
XMLAttributeValueDefaultValidator >> value: aDefaultValue [
	value := aDefaultValue
]
