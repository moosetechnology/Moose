"
XPath number rounding function.
"
Class {
	#name : #XPathRoundFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathRoundFunction class >> prototypeSource [
	^ 'number round(number)'
]

{ #category : #implementing }
XPathRoundFunction >> function [
	^ self firstArgument xpathRounded
]
