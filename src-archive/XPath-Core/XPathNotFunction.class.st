"
XPath negation function.
"
Class {
	#name : #XPathNotFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathNotFunction class >> prototypeSource [
	^ 'boolean not(boolean)'
]

{ #category : #implementing }
XPathNotFunction >> function [
	^ self firstArgument not
]
