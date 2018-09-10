Extension { #name : #XPathNodeTest }

{ #category : #'*XPath-GTExtensions' }
XPathNodeTest class >> generateASTTreeViewLabels [
	"
	self generateASTTreeViewLabels
	"

	self allSubclasses
		select: [:each | each includesSelector: #printOn:]
		thenDo: [:each | | astNodeClass |
			astNodeClass :=
				XMLClassFinder classNamed:
					('XPathAST',
					(each name asString allButFirst: 'XPath' size),
					'Node') asSymbol.
			astNodeClass
				compile:
					((each sourceCodeAt: #printOn:)
						copyReplaceAll: 'printOn:'
						with: 'printTreeViewLabelOn:')
				classified: '*XPath-GTExtensions']
]
