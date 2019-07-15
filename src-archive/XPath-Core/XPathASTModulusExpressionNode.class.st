"
This is an AST node class for 'mod' modulus expressions that return the remainder after truncating division. Unlike \\, the result takes the sign of the receiver, so '5 mod 2' and '5 mod -2'  are both '1'.
"
Class {
	#name : #XPathASTModulusExpressionNode,
	#superclass : #XPathASTMultiplicativeExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTModulusExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitModulusExpression: self
]

{ #category : #testing }
XPathASTModulusExpressionNode >> isModulusExpression [
	^ true
]

{ #category : #accessing }
XPathASTModulusExpressionNode >> operatorName [
	^ 'mod'
]
