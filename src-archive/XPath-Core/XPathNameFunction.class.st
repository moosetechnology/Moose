"
XPath name function. Returns expanded name or local name of a node or empty string if node has no name. Operates on argument node or the context node if called with no arguments.
"
Class {
	#name : #XPathNameFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathNameFunction class >> prototypeSource [
	^ 'string name(node-set?)'
]

{ #category : #implementing }
XPathNameFunction >> function [
	| node |

	node :=
		self hasArguments
			ifTrue: [self firstArgument firstInDocumentOrder]
			ifFalse: [self contextNode].

	(node notNil
		and: [node hasExpandedName])
		ifTrue: [| namespaceURI |
			(self context hasNamespaces
				and: [(namespaceURI := node namespaceURI) notEmpty
					and: [node hasPrefix]])
				ifTrue: [
					((self context resolvePrefixesOfNamespaceURI: namespaceURI)
						ifEmpty: [^ node localName]
						ifNotEmpty: [:prefixes |
							^ node localName qualifyWithXMLPrefix: prefixes anyOne])]
				ifFalse: [^ node name]]
		ifFalse: [^ ''].
]
