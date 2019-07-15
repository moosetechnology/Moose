"
XPath string prefix testing function.
"
Class {
	#name : #XPathStartsWithFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathStartsWithFunction class >> prototypeSource [
	^ 'boolean starts-with(string, string)'
]

{ #category : #implementing }
XPathStartsWithFunction >> function [
	^ self firstArgument beginsWith: self lastArgument
]
