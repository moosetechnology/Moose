"
Non-standard; added for completeness with starts-with().
"
Class {
	#name : #XPathEndsWithFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathEndsWithFunction class >> prototypeSource [
	^ 'boolean ends-with(string, string)'
]

{ #category : #implementing }
XPathEndsWithFunction >> function [
	^ self firstArgument endsWith: self lastArgument
]
