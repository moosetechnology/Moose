Class {
	#name : #SwiftParseNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftParseNodeVisitor >> visitArrayType: anArrayType [
	^ self visitParse: anArrayType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitAssignmentOperator: anAssignmentOperator [
	^ self visitParse: anAssignmentOperator
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitParse: aBinaryExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitBinaryOperator: aBinaryOperator [
	^ self visitParse: aBinaryOperator
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitBlock: aBlock [
	^ self visitParse: aBlock
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitBranchStatement: aBranchStatement [
	^ self visitStatement: aBranchStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitControlTransferStatement: aBreakStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitClassDeclaration: aClassDeclaration [
	^ self visitParse: aClassDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitClosureExpression: aClosureExpression [
	^ self visitParse: aClosureExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitCondionalOperator: aCondionalOperator [
	^ self visitParse: aCondionalOperator
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitConstantDeclaration: aConstantDeclaration [
	^ self visitParse: aConstantDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitControlTransferStatement: aContinueStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitControlTransferStatement: aControlTransferStatement [
	^ self visitStatement: aControlTransferStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitDeclarationStatement: aDeclarationStatement [
	^ self visitStatement: aDeclarationStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitDeinitializerDeclaration: aDeinitializerDeclaration [
	^ self visitParse: aDeinitializerDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitDictionaryType: aDictionaryType [
	^ self visitParse: aDictionaryType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitDoWhileStatement: aDoWhileStatement [
	^ self visitLoopStatement: aDoWhileStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitDynamicTypeExpression: aDynamicTypeExpression [
	^ self visitParse: aDynamicTypeExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitEnumDeclaration: anEnumDeclaration [
	^ self visitParse: anEnumDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitExplicitMemberExpression: anExplicitMemberExpression [
	^ self visitParse: anExplicitMemberExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitStatement: anExpressionStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitExtensionDeclaration: anExtensionDeclaration [
	^ self visitParse: anExtensionDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitFallThroughStatement: aFallThroughStatement [
	^ self visitControlTransferStatement: aFallThroughStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitFile: aFile [
	^ self visitParse: aFile
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitForInStatement: aForInStatement [
	^ self visitLoopStatement: aForInStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitForStatement: aForStatement [
	^ self visitLoopStatement: aForStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitForcedValueExpression: aForcedValueExpression [
	^ self visitParse: aForcedValueExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitFunctionCallExpression: aFunctionCallExpression [
	^ self visitParse: aFunctionCallExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitFunctionDeclaration: aFunctionDeclaration [
	^ self visitParse: aFunctionDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitFunctionType: aFunctionType [
	^ self visitParse: aFunctionType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitBranchStatement: anIfStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitImplicitMemberExpression: anImplicitMemberExpression [
	^ self visitParse: anImplicitMemberExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitImplicitlyUnwrappedOptionalType: anImplicitlyUnwrappedOptionalType [
	^ self visitParse: anImplicitlyUnwrappedOptionalType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitImportDeclaration: anImportDeclaration [
	^ self visitParse: anImportDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitInOutExpression: anInOutExpression [
	^ self visitParse: anInOutExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitInfixOperatorDeclaration: anInfixOperatorDeclaration [
	^ self visitParse: anInfixOperatorDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitInitializerDeclaration: anInitializerDeclaration [
	^ self visitParse: anInitializerDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitInitializerExpression: anInitializerExpression [
	^ self visitParse: anInitializerExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitLabeledStatement: aLabeledStatement [
	^ self visitStatement: aLabeledStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitLiteralExpression: aLiteralExpression [
	^ self visitParse: aLiteralExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitLoopStatement: aLoopStatement [
	^ self visitStatement: aLoopStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitMetatypeType: aMetatypeType [
	^ self visitParse: aMetatypeType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitNamedExpression: aNamedExpression [
	^ self visitParse: aNamedExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitOptionalChainingExpression: anOptionalChainingExpression [
	^ self visitParse: anOptionalChainingExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitOptionalType: anOptionalType [
	^ self visitParse: anOptionalType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitParenthesizedExpression: aParenthesizedExpression [
	^ self visitParse: aParenthesizedExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitParse: aParse [
	^ self visitSmaCCParseNode: aParse
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPatternInitializer: aPatternInitializer [
	^ self visitParse: aPatternInitializer
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPostfixOperatorDeclaration: aPostfixOperatorDeclaration [
	^ self visitParse: aPostfixOperatorDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPostfixSelfExpression: aPostfixSelfExpression [
	^ self visitParse: aPostfixSelfExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPrefixExpression: aPrefixExpression [
	^ self visitParse: aPrefixExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPrefixOperatorDeclaration: aPrefixOperatorDeclaration [
	^ self visitParse: aPrefixOperatorDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitPrimaryExpression: aPrimaryExpression [
	^ self visitParse: aPrimaryExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolAssociationTypeDeclaration: aProtocolAssociationTypeDeclaration [
	^ self visitParse: aProtocolAssociationTypeDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolCompositionType: aProtocolCompositionType [
	^ self visitParse: aProtocolCompositionType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolDeclaration: aProtocolDeclaration [
	^ self visitParse: aProtocolDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolInitializerDeclaration: aProtocolInitializerDeclaration [
	^ self visitParse: aProtocolInitializerDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolMethodDeclaration: aProtocolMethodDeclaration [
	^ self visitParse: aProtocolMethodDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolPropertyDeclaration: aProtocolPropertyDeclaration [
	^ self visitParse: aProtocolPropertyDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitProtocolSubscriptDeclaration: aProtocolSubscriptDeclaration [
	^ self visitParse: aProtocolSubscriptDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitControlTransferStatement: aReturnStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSelfExpression: aSelfExpression [
	^ self visitParse: aSelfExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitStatement: aStatement [
	^ self visitParse: aStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitStructDeclaration: aStructDeclaration [
	^ self visitParse: aStructDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSubscriptDeclaration: aSubscriptDeclaration [
	^ self visitParse: aSubscriptDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSubscriptExpression: aSubscriptExpression [
	^ self visitParse: aSubscriptExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSuperclassInitializerExpression: aSuperclassInitializerExpression [
	^ self visitParse: aSuperclassInitializerExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSuperclassMethodExpression: aSuperclassMethodExpression [
	^ self visitParse: aSuperclassMethodExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSuperclassSubscriptExpression: aSuperclassSubscriptExpression [
	^ self visitParse: aSuperclassSubscriptExpression
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitBranchStatement: aSwitchStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitTupleType: aTupleType [
	^ self visitParse: aTupleType
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitTypeCastOperator: aTypeCastOperator [
	^ self visitParse: aTypeCastOperator
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitTypeIdentifier: aTypeIdentifier [
	^ self visitParse: aTypeIdentifier
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitTypealiasDeclaration: aTypealiasDeclaration [
	^ self visitParse: aTypealiasDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitVariableDeclaration: aVariableDeclaration [
	^ self visitParse: aVariableDeclaration
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitLoopStatement: aWhileStatement
]

{ #category : #generated }
SwiftParseNodeVisitor >> visitWildcardExpression: aWildcardExpression [
	^ self visitParse: aWildcardExpression
]
