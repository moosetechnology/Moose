"
XPath boolean conversion function.
"
Class {
	#name : #XPathBooleanFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathBooleanFunction class >> prototypeSource [
	^ 'boolean boolean(object)'
]

{ #category : #implementing }
XPathBooleanFunction >> function [
	^ self firstArgument
]
