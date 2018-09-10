"
This is a base class for location path step node test AST node classes.
"
Class {
	#name : #XPathASTNodeTestNode,
	#superclass : #XPathASTNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'private ' }
XPathASTNodeTestNode class >> generateNodeTestClasses [
	"
	self generateNodeTestClasses
	"

	self allSubclasses
		sort: [:a :b |
			(b inheritsFrom: a)
				ifTrue: [true]
				ifFalse: [a name <= b name]];
		do: [:astNodeClass |
			| astNodeClassName astNodeSuperClassName astNodeSuperClass nodeTestClass |

			astNodeClassName := 'XPath', astNodeClass nameWithoutPrefixAndSuffix.
			astNodeSuperClassName := 'XPath', astNodeClass superclass nameWithoutPrefixAndSuffix.
			astNodeSuperClass := XMLClassFinder classNamed: astNodeSuperClassName.
			nodeTestClass :=
				astNodeSuperClass
					subclass: astNodeClassName asSymbol
					instanceVariableNames:
						(' ' join:
							(astNodeClass instanceVariables collect: #asString))
					classVariableNames: ''
					package: #'XPath-Core-Compilation'.
			astNodeClass methodsDo: [:method | | protocol |
				protocol := method protocol.
				((#('printing' 'visiting') anySatisfy: [:each |
					protocol asString beginsWith: each]))
					ifFalse: [
						nodeTestClass
							compile: method sourceCode
							classified: protocol]].
			astNodeClass class methodsDo: [:method |
				method selector = #generateNodeTestClasses
					ifFalse: [
						nodeTestClass class
							compile: method sourceCode
							classified: method protocol]]].
]

{ #category : #visiting }
XPathASTNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNodeTest: self
]

{ #category : #testing }
XPathASTNodeTestNode >> isNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTNodeTestNode >> nodeType [
	self subclassResponsibility
]
