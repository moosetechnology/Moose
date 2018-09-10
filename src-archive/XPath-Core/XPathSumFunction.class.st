"
XPath node set sum function.
"
Class {
	#name : #XPathSumFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathSumFunction class >> prototypeSource [
	^ 'number sum(node-set)'
]

{ #category : #implementing }
XPathSumFunction >> function [
	^ self firstArgument
		inject: 0
		into: [:i :each | i + each stringValue asXPathNumber]
]
