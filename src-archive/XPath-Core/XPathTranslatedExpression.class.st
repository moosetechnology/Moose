"
This class stores the XPath expression's translation to Smalltalk source code and its array of XPathNodeTest objects.
"
Class {
	#name : #XPathTranslatedExpression,
	#superclass : #Object,
	#instVars : [
		'sourceCode',
		'nodeTests'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathTranslatedExpression class >> sourceCode: aSourceString nodeTests: aNodeTestCollection [
	^ self new
		setSourceCode: aSourceString
		nodeTests: aNodeTestCollection
]

{ #category : #accessing }
XPathTranslatedExpression >> nodeTests [
	^ nodeTests
]

{ #category : #printing }
XPathTranslatedExpression >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self sourceCode;
		nextPut: $).
]

{ #category : #initialization }
XPathTranslatedExpression >> setSourceCode: aSourceString nodeTests: aNodeTestCollection [
	sourceCode := aSourceString.
	nodeTests := aNodeTestCollection asArray.
]

{ #category : #accessing }
XPathTranslatedExpression >> sourceCode [
	^ sourceCode
]
