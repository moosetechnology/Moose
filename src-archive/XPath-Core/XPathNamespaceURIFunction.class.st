"
XPath namespace URI function.
"
Class {
	#name : #XPathNamespaceURIFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathNamespaceURIFunction class >> prototypeSource [
	^ 'string namespace-uri(node-set?)'
]

{ #category : #implementing }
XPathNamespaceURIFunction >> function [
	| node |

	node :=
		self hasArguments
			ifTrue: [self firstArgument firstInDocumentOrder]
			ifFalse: [self contextNode].

	(node notNil
		and: [node hasExpandedName])
		ifTrue: [^ node namespaceURI]
		ifFalse: [^ '']
]
