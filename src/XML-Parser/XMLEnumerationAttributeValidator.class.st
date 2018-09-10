"
This class validates attributes that can have any value taken from a list like ""(one|two|thee)"".
"
Class {
	#name : #XMLEnumerationAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#instVars : [
		'allowedValues'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLEnumerationAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalEnumerationAttributeValidator
]

{ #category : #accessing }
XMLEnumerationAttributeValidator >> allowedValues [
	^ allowedValues ifNil: [allowedValues := Set new]
]

{ #category : #accessing }
XMLEnumerationAttributeValidator >> allowedValues: anAllowedValuesCollection [
	allowedValues := anAllowedValuesCollection
]

{ #category : #'private ' }
XMLEnumerationAttributeValidator >> errorEnumerationContainsDuplicateValues [
	XMLValidationException
		formatSignal:
			'Declaration for enumeration attribute "{1}" of element ',
			'<{2}> contains duplicate values'
		with: self attribute
		with: self element
]

{ #category : #'private ' }
XMLEnumerationAttributeValidator >> errorInvalidValue: aValue [
	XMLValidationException
		formatSignal: 'Invalid value "{1}" for attribute "{2}" of element <{3}>'
		with: aValue
		with: self attribute
		with: self element
]

{ #category : #testing }
XMLEnumerationAttributeValidator >> isEnumeration [
	^ true
]

{ #category : #validating }
XMLEnumerationAttributeValidator >> validateAttributeDeclaration [
	| oldAllowedValues |

	oldAllowedValues := self allowedValues.
	self allowedValues: oldAllowedValues asSet.
	(self allowedValues size < oldAllowedValues size)
		ifTrue: [self errorEnumerationContainsDuplicateValues].

	super validateAttributeDeclaration.
]

{ #category : #validating }
XMLEnumerationAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	(self allowedValues includes: aDefaultValue)
		ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]
]

{ #category : #validating }
XMLEnumerationAttributeValidator >> validateAttributeValue: aValue [
	(self allowedValues includes: aValue)
		ifFalse: [self errorInvalidValue: aValue]
]

{ #category : #validating }
XMLEnumerationAttributeValidator >> validateXMLSpaceAttributeDeclaration [
	self allowedValues size > 2
		ifTrue: [self errorInvalidXMLSpaceAttributeDeclaration].
	self allowedValues do: [:each |
		(each = 'preserve'
			or: [each = 'default'])
			ifFalse: [self errorInvalidXMLSpaceAttributeDeclaration]].
]
