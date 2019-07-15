"
XPath ceiling function.
"
Class {
	#name : #XPathCeilingFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathCeilingFunction class >> prototypeSource [
	^ 'number ceiling(number)'
]

{ #category : #implementing }
XPathCeilingFunction >> function [
	^ self firstArgument xpathCeiling
]
