"
XPath contains substring function.
"
Class {
	#name : #XPathContainsFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathContainsFunction class >> prototypeSource [
	^ 'boolean contains(string, string)'
]

{ #category : #implementing }
XPathContainsFunction >> function [
	"use findString:startingAt: for portability"
	^ (self firstArgument
		findString: self lastArgument
		startingAt: 1) > 0
]
