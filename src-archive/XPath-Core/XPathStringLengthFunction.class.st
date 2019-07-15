"
XPath string length function.

"
Class {
	#name : #XPathStringLengthFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathStringLengthFunction class >> prototypeSource [
	^ 'number string-length(string?)'
]

{ #category : #implementing }
XPathStringLengthFunction >> function [
	^ (self hasArguments
		ifTrue: [self firstArgument]
		ifFalse: [self contextNode ifNil: ['']]) size
]
