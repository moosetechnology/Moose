"
XPath string conversion function.
"
Class {
	#name : #XPathStringFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathStringFunction class >> prototypeSource [
	^ 'string string(object?)'
]

{ #category : #implementing }
XPathStringFunction >> function [
	"From the spec: 'If the argument is omitted, it defaults to a
	node-set with the context node as its only member.'"
	^ self hasArguments
		ifTrue: [self firstArgument]
		ifFalse: [self newContextNodeNodeSet]
]
