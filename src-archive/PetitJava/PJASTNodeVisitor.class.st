"
Abstract visitor with all methods needed to visit a PetitJava AST
"
Class {
	#name : #PJASTNodeVisitor,
	#superclass : #Object,
	#category : #'PetitJava-AST-Visitors'
}

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitBlockNode: aBodyNode [
	self visitNodes: aBodyNode statements
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitBooleanLiteralNode: aBooleanLiteralNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitCharacterLiteralNode: aCharacterLiteralNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitCommentsNode: aCommentNode [
	self visitNode: aCommentNode expression
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitCompilationUnitNode: aCompilationUnitNode [

	self flag: 'TODO'
]

{ #category : #'as yet unclassified' }
PJASTNodeVisitor >> visitEndOfLineCommentsNode: anEndOfLineCommentNode [
	self visitNode: anEndOfLineCommentNode expression
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitExpressionStatementNode: anExpressionStatementNode [
	self visitNode: anExpressionStatementNode expression
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitFloatLiteralNode: aIntegerLiteralNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitIdentifierNode: anIdentifierNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitIfStatementNode: anIfStatementNode [

	self visitNode: anIfStatementNode condition.
	self visitNode: anIfStatementNode thenPart.
	self visitNode: anIfStatementNode elsePart
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitImportDeclarationNode: anImportDeclarationNode [

	self visitNode: anImportDeclarationNode nameNode
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitInfixOperationNode: anInfixOperationNode [
	self visitNode: anInfixOperationNode left.
	self visitNode: anInfixOperationNode right
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitIntegerLiteralNode: aIntegerLiteralNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitLocalVariableDeclarationStatementNode: aLocalVariableDeclarationStatementNode [
	self visitNode: aLocalVariableDeclarationStatementNode type.
	self visitNodes: aLocalVariableDeclarationStatementNode modifiers.
	self visitNode: aLocalVariableDeclarationStatementNode declarators
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitMethodDeclarationNode: aMethodDeclarationNode [
	self visitNode: aMethodDeclarationNode returnType.
	self visitNode: aMethodDeclarationNode simpleName.
	self visitNode: aMethodDeclarationNode block
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitNameNode: aNameNode [
	"this is a leaf, so no further traversing"
]

{ #category : #visiting }
PJASTNodeVisitor >> visitNode: aNode [ 

	^aNode acceptVisitor: self
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitNodes: aCollection [
	aCollection do: [:each | each acceptVisitor: self]
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitNullLiteralNode: aNullLiteralNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitPackageDeclarationNode: aPackageDeclarationNode [

	self visitNode: aPackageDeclarationNode nameNode
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitParameterDeclaratorNode: aParameterDeclaratorNode [
	self visitNode: aParameterDeclaratorNode identifier.
	self visitNodes: aParameterDeclaratorNode modifiers
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitReturnStatementNode: aReturnStatementNode [
	self visitNode: aReturnStatementNode expression
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitSeparatorNode: aSeparatorNode [
	self subclassResponsibility
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitStringLiteralNode: aStringLiteralNode [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PJASTNodeVisitor >> visitTraditionalCommentsNode: aCommentNode [
	self visitNode: aCommentNode expression
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitVariableDeclaratorNode: aVariableDeclaratorNode [
	self visitNode: aVariableDeclaratorNode variable.
	self visitNode: aVariableDeclaratorNode initializer
]

{ #category : #'visitor-doubleDispatching' }
PJASTNodeVisitor >> visitWhileStatementNode: aWhileStatementNode [

	self visitNode: aWhileStatementNode expression.
	self visitNode: aWhileStatementNode statement
]
