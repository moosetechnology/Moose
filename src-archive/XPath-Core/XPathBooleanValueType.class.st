"
This is an XPath type class for 'true' and 'false' values.
"
Class {
	#name : #XPathBooleanValueType,
	#superclass : #XPathValueType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathBooleanValueType >> isBooleanValueType [
	^ true
]

{ #category : #accessing }
XPathBooleanValueType >> name [
	^ 'boolean'
]

{ #category : #'instance creation' }
XPathBooleanValueType >> newFrom: anObject [
	^ anObject asXPathBoolean
]
