Class {
	#name : #CSProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSProgramNodeVisitor >> visitAddAccessorDeclaration: anAddAccessorDeclaration [
	^ self visitProgram: anAddAccessorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAnonymousFunctionParameter: anAnonymousFunctionParameter [
	^ self visitProgram: anAnonymousFunctionParameter
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAnonymousMethodExpression: anAnonymousMethodExpression [
	^ self visitExpression: anAnonymousMethodExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAnonymousObjectCreationExpression: anAnonymousObjectCreationExpression [
	^ self visitExpression: anAnonymousObjectCreationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitArgument: anArgument [
	^ self visitProgram: anArgument
]

{ #category : #generated }
CSProgramNodeVisitor >> visitArrayCreationExpression: anArrayCreationExpression [
	^ self visitExpression: anArrayCreationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitArrayInitializer: anArrayInitializer [
	^ self visitProgram: anArrayInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitArrayParameter: anArrayParameter [
	^ self visitProgram: anArrayParameter
]

{ #category : #generated }
CSProgramNodeVisitor >> visitArrayType: anArrayType [
	^ self visitType: anArrayType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAssignment: anAssignment [
	^ self visitExpression: anAssignment
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAttribute: anAttribute [
	^ self visitProgram: anAttribute
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAttributeValue: anAttributeValue [
	^ self visitProgram: anAttributeValue
]

{ #category : #generated }
CSProgramNodeVisitor >> visitAwaitExpression: anAwaitExpression [
	^ self visitExpression: anAwaitExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitBaseAccess: aBaseAccess [
	^ self visitExpression: aBaseAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitBaseExpression: aBaseExpression [
	^ self visitExpression: aBaseExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitBlockStatement: aBlockStatement [
	^ self visitStatement: aBlockStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitStatement: aBreakStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCastExpression: aCastExpression [
	^ self visitExpression: aCastExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCatchClause: aCatchClause [
	^ self visitProgram: aCatchClause
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCheckedExpression: aCheckedExpression [
	^ self visitExpression: aCheckedExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCheckedStatement: aCheckedStatement [
	^ self visitStatement: aCheckedStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitClassDeclaration: aClassDeclaration [
	^ self visitDeclaration: aClassDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCollectionInitializer: aCollectionInitializer [
	^ self visitProgram: aCollectionInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitCompilationUnit: aCompilationUnit [
	^ self visitProgram: aCompilationUnit
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConditionalExpression: aConditionalExpression [
	^ self visitExpression: aConditionalExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstDeclarator: aConstDeclarator [
	^ self visitProgram: aConstDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstantDeclaration: aConstantDeclaration [
	^ self visitDeclaration: aConstantDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstantDeclarator: aConstantDeclarator [
	^ self visitProgram: aConstantDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstructorConstraint: aConstructorConstraint [
	^ self visitProgram: aConstructorConstraint
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstructorDeclaration: aConstructorDeclaration [
	^ self visitDeclaration: aConstructorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitConstructorInitializer: aConstructorInitializer [
	^ self visitProgram: aConstructorInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitStatement: aContinueStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDeclaration: aDeclaration [
	^ self visitProgram: aDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDeclarationStatement: aDeclarationStatement [
	^ self visitStatement: aDeclarationStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDefaultValueExpression: aDefaultValueExpression [
	^ self visitExpression: aDefaultValueExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDelegateCreationExpression: aDelegateCreationExpression [
	^ self visitExpression: aDelegateCreationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDelegateDeclaration: aDelegateDeclaration [
	^ self visitDeclaration: aDelegateDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDestructorDeclaration: aDestructorDeclaration [
	^ self visitDeclaration: aDestructorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitDoStatement: aDoStatement [
	^ self visitStatement: aDoStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitElementAccess: anElementAccess [
	^ self visitExpression: anElementAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitElementInitializer: anElementInitializer [
	^ self visitProgram: anElementInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitEmptyStatement: anEmptyStatement [
	^ self visitStatement: anEmptyStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitEnumDeclaration: anEnumDeclaration [
	^ self visitDeclaration: anEnumDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitEventDeclaration: anEventDeclaration [
	^ self visitDeclaration: anEventDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitExceptionFilter: anExceptionFilter [
	^ self visitProgram: anExceptionFilter
]

{ #category : #generated }
CSProgramNodeVisitor >> visitExplicitAnonymousFunctionSignature: anExplicitAnonymousFunctionSignature [
	^ self visitProgram: anExplicitAnonymousFunctionSignature
]

{ #category : #generated }
CSProgramNodeVisitor >> visitExpression: anExpression [
	^ self visitProgram: anExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitStatement: anExpressionStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitExternAliasDirective: anExternAliasDirective [
	^ self visitProgram: anExternAliasDirective
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFieldDeclaration: aFieldDeclaration [
	^ self visitDeclaration: aFieldDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFinallyClause: aFinallyClause [
	^ self visitProgram: aFinallyClause
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFixedParameter: aFixedParameter [
	^ self visitProgram: aFixedParameter
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFixedPointerDeclarator: aFixedPointerDeclarator [
	^ self visitProgram: aFixedPointerDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFixedSizeBufferDeclaration: aFixedSizeBufferDeclaration [
	^ self visitDeclaration: aFixedSizeBufferDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFixedSizeBufferDeclarator: aFixedSizeBufferDeclarator [
	^ self visitProgram: aFixedSizeBufferDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitFixedStatement: aFixedStatement [
	^ self visitStatement: aFixedStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitForStatement: aForStatement [
	^ self visitStatement: aForStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitForeachStatement: aForeachStatement [
	^ self visitStatement: aForeachStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitGetAccessorDeclaration: aGetAccessorDeclaration [
	^ self visitProgram: aGetAccessorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitGotoStatement: aGotoStatement [
	^ self visitStatement: aGotoStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitStatement: anIfStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitImplicitAnonymousFunctionSignature: anImplicitAnonymousFunctionSignature [
	^ self visitProgram: anImplicitAnonymousFunctionSignature
]

{ #category : #generated }
CSProgramNodeVisitor >> visitIndexerDeclaration: anIndexerDeclaration [
	^ self visitDeclaration: anIndexerDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfaceDeclaration: anInterfaceDeclaration [
	^ self visitDeclaration: anInterfaceDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfaceEventDeclaration: anInterfaceEventDeclaration [
	^ self visitDeclaration: anInterfaceEventDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfaceIndexerDeclaration: anInterfaceIndexerDeclaration [
	^ self visitDeclaration: anInterfaceIndexerDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfaceMethodDeclaration: anInterfaceMethodDeclaration [
	^ self visitDeclaration: anInterfaceMethodDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfacePropertyAccessor: anInterfacePropertyAccessor [
	^ self visitProgram: anInterfacePropertyAccessor
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterfacePropertyDeclaration: anInterfacePropertyDeclaration [
	^ self visitDeclaration: anInterfacePropertyDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterpolatedStringExpression: anInterpolatedStringExpression [
	^ self visitExpression: anInterpolatedStringExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInterpolation: anInterpolation [
	^ self visitProgram: anInterpolation
]

{ #category : #generated }
CSProgramNodeVisitor >> visitInvocationExpression: anInvocationExpression [
	^ self visitExpression: anInvocationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLabeledStatement: aLabeledStatement [
	^ self visitStatement: aLabeledStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLambdaExpression: aLambdaExpression [
	^ self visitExpression: aLambdaExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLiteralExpression: aLiteralExpression [
	^ self visitExpression: aLiteralExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLocalConstantDeclaration: aLocalConstantDeclaration [
	^ self visitDeclaration: aLocalConstantDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	^ self visitDeclaration: aLocalVariableDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLocalVariableDeclarator: aLocalVariableDeclarator [
	^ self visitProgram: aLocalVariableDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitLockStatement: aLockStatement [
	^ self visitStatement: aLockStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMemberAccess: aMemberAccess [
	^ self visitExpression: aMemberAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMemberDeclarator: aMemberDeclarator [
	^ self visitProgram: aMemberDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMemberInitializer: aMemberInitializer [
	^ self visitProgram: aMemberInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMethodBody: aMethodBody [
	^ self visitProgram: aMethodBody
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMethodDeclaration: aMethodDeclaration [
	^ self visitDeclaration: aMethodDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitMethodHeader: aMethodHeader [
	^ self visitProgram: aMethodHeader
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNamedArgument: aNamedArgument [
	^ self visitProgram: aNamedArgument
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNamedEntity: aNamedEntity [
	^ self visitExpression: aNamedEntity
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNameofExpression: aNameofExpression [
	^ self visitExpression: aNameofExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNamespaceDeclaration: aNamespaceDeclaration [
	^ self visitDeclaration: aNamespaceDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNullConditionalElementAccess: aNullConditionalElementAccess [
	^ self visitElementAccess: aNullConditionalElementAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNullConditionalExpression: aNullConditionalExpression [
	^ self visitExpression: aNullConditionalExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNullConditionalInvocationExpression: aNullConditionalInvocationExpression [
	^ self
		visitInvocationExpression: aNullConditionalInvocationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNullConditionalMemberAccess: aNullConditionalMemberAccess [
	^ self visitMemberAccess: aNullConditionalMemberAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitNullableType: aNullableType [
	^ self visitType: aNullableType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitObjectCreationExpression: anObjectCreationExpression [
	^ self visitExpression: anObjectCreationExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitObjectInitializer: anObjectInitializer [
	^ self visitProgram: anObjectInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitOperatorDeclaration: anOperatorDeclaration [
	^ self visitDeclaration: anOperatorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPointerElementAccess: aPointerElementAccess [
	^ self visitExpression: aPointerElementAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPointerMemberAccess: aPointerMemberAccess [
	^ self visitExpression: aPointerMemberAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPointerType: aPointerType [
	^ self visitType: aPointerType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPostExpression: aPostExpression [
	^ self visitExpression: aPostExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPrefixExpression: aPrefixExpression [
	^ self visitExpression: aPrefixExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPrimaryConstraint: aPrimaryConstraint [
	^ self visitProgram: aPrimaryConstraint
]

{ #category : #generated }
CSProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
CSProgramNodeVisitor >> visitPropertyDeclaration: aPropertyDeclaration [
	^ self visitDeclaration: aPropertyDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitQualifiedAliasMember: aQualifiedAliasMember [
	^ self visitType: aQualifiedAliasMember
]

{ #category : #generated }
CSProgramNodeVisitor >> visitQualifiedIdentifier: aQualifiedIdentifier [
	^ self visitProgram: aQualifiedIdentifier
]

{ #category : #generated }
CSProgramNodeVisitor >> visitQueryExpression: aQueryExpression [
	^ self visitExpression: aQueryExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitRankSpecifier: aRankSpecifier [
	^ self visitProgram: aRankSpecifier
]

{ #category : #generated }
CSProgramNodeVisitor >> visitRemoveAccessorDeclaration: aRemoveAccessorDeclaration [
	^ self visitProgram: aRemoveAccessorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitStatement: aReturnStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSetAccessorDeclaration: aSetAccessorDeclaration [
	^ self visitProgram: aSetAccessorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSimpleName: aSimpleName [
	^ self visitExpression: aSimpleName
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSimpleType: aSimpleType [
	^ self visitType: aSimpleType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSizeofExpression: aSizeofExpression [
	^ self visitExpression: aSizeofExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitStackallocInitializer: aStackallocInitializer [
	^ self visitProgram: aStackallocInitializer
]

{ #category : #generated }
CSProgramNodeVisitor >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitStatementList: aStatementList [
	^ self visitProgram: aStatementList
]

{ #category : #generated }
CSProgramNodeVisitor >> visitStaticConstructorDeclaration: aStaticConstructorDeclaration [
	^ self visitDeclaration: aStaticConstructorDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitStructDeclaration: aStructDeclaration [
	^ self visitDeclaration: aStructDeclaration
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSwitchLabel: aSwitchLabel [
	^ self visitProgram: aSwitchLabel
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSwitchSection: aSwitchSection [
	^ self visitProgram: aSwitchSection
]

{ #category : #generated }
CSProgramNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitStatement: aSwitchStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitThisAccess: aThisAccess [
	^ self visitExpression: aThisAccess
]

{ #category : #generated }
CSProgramNodeVisitor >> visitThrowStatement: aThrowStatement [
	^ self visitStatement: aThrowStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTryStatement: aTryStatement [
	^ self visitStatement: aTryStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitType: aType [
	^ self visitProgram: aType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeArgumentList: aTypeArgumentList [
	^ self visitProgram: aTypeArgumentList
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeConstraint: aTypeConstraint [
	^ self visitProgram: aTypeConstraint
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeExpression: aTypeExpression [
	^ self visitExpression: aTypeExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeName: aTypeName [
	^ self visitType: aTypeName
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeParameterConstraintsClause: aTypeParameterConstraintsClause [
	^ self visitProgram: aTypeParameterConstraintsClause
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeParameterList: aTypeParameterList [
	^ self visitProgram: aTypeParameterList
]

{ #category : #generated }
CSProgramNodeVisitor >> visitTypeofExpression: aTypeofExpression [
	^ self visitExpression: aTypeofExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUnboundTypeName: anUnboundTypeName [
	^ self visitProgram: anUnboundTypeName
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUncheckedExpression: anUncheckedExpression [
	^ self visitExpression: anUncheckedExpression
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUncheckedStatement: anUncheckedStatement [
	^ self visitStatement: anUncheckedStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUnsafeStatement: anUnsafeStatement [
	^ self visitStatement: anUnsafeStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUsingAliasDirective: anUsingAliasDirective [
	^ self visitUsingDirective: anUsingAliasDirective
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUsingDirective: anUsingDirective [
	^ self visitProgram: anUsingDirective
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUsingNamespaceDirective: anUsingNamespaceDirective [
	^ self visitUsingDirective: anUsingNamespaceDirective
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUsingStatement: anUsingStatement [
	^ self visitStatement: anUsingStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitUsingStaticDirective: anUsingStaticDirective [
	^ self visitUsingDirective: anUsingStaticDirective
]

{ #category : #generated }
CSProgramNodeVisitor >> visitVarType: aVarType [
	^ self visitType: aVarType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitVariableDeclarator: aVariableDeclarator [
	^ self visitProgram: aVariableDeclarator
]

{ #category : #generated }
CSProgramNodeVisitor >> visitVariantTypeParameterList: aVariantTypeParameterList [
	^ self visitTypeParameterList: aVariantTypeParameterList
]

{ #category : #generated }
CSProgramNodeVisitor >> visitVoidType: aVoidType [
	^ self visitType: aVoidType
]

{ #category : #generated }
CSProgramNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitStatement: aWhileStatement
]

{ #category : #generated }
CSProgramNodeVisitor >> visitYieldStatement: aYieldStatement [
	^ self visitStatement: aYieldStatement
]
