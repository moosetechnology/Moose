"
XPath node set count (size) function.
"
Class {
	#name : #XPathCountFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathCountFunction class >> prototypeSource [
	^ 'number count(node-set)'
]

{ #category : #implementing }
XPathCountFunction >> function [
	^ self firstArgument size
]
