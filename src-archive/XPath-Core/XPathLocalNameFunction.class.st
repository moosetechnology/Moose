"
XPath local name function.
"
Class {
	#name : #XPathLocalNameFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathLocalNameFunction class >> prototypeSource [
	^ 'string local-name(node-set?)'
]

{ #category : #implementing }
XPathLocalNameFunction >> function [
	| node |

	node :=
		self hasArguments
			ifTrue: [self firstArgument firstInDocumentOrder]
			ifFalse: [self contextNode].

	(node notNil
		and: [node hasExpandedName])
		ifTrue: [^ node localName]
		ifFalse: [^ '']
]
