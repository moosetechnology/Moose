"
This is an AST node class for subtraction '-' expressions. Negation expressions have a separate AST node class.
"
Class {
	#name : #XPathASTSubtractionExpressionNode,
	#superclass : #XPathASTAdditiveExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTSubtractionExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSubtractionExpression: self
]

{ #category : #testing }
XPathASTSubtractionExpressionNode >> isSubtractionExpression [
	^ true
]

{ #category : #accessing }
XPathASTSubtractionExpressionNode >> operatorName [
	^ '-'
]
