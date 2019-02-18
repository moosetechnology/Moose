Class {
	#name : #JavaProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaProgramNodeVisitor >> visitAbstractMethodDeclaration: anAbstractMethodDeclaration [
	^ self visitDeclaration: anAbstractMethodDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitAnnotation: anAnnotation [
	^ self visitProgram: anAnnotation
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitAnnotationInterface: anAnnotationInterface [
	^ self visitProgram: anAnnotationInterface
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitAnnotationMethodDeclaration: anAnnotationMethodDeclaration [
	^ self visitAbstractMethodDeclaration: anAnnotationMethodDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitArrayAccess: anArrayAccess [
	^ self visitExpression: anArrayAccess
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitArrayInitializer: anArrayInitializer [
	^ self visitProgram: anArrayInitializer
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitArrayMethodDeclarator: anArrayMethodDeclarator [
	^ self visitProgram: anArrayMethodDeclarator
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitArrayType: anArrayType [
	^ self visitType: anArrayType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitArrayVariableName: anArrayVariableName [
	^ self visitProgram: anArrayVariableName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitAssertStatement: anAssertStatement [
	^ self visitStatement: anAssertStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitAssignment: anAssignment [
	^ self visitExpression: anAssignment
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitBlock: aBlock [
	^ self visitStatement: aBlock
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitBooleanLiteral: aBooleanLiteral [
	^ self visitLiteral: aBooleanLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitBooleanType: aBooleanType [
	^ self visitPrimitiveType: aBooleanType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitStatement: aBreakStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitByteType: aByteType [
	^ self visitPrimitiveType: aByteType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitCastExpression: aCastExpression [
	^ self visitUnaryExpression: aCastExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitCatchClause: aCatchClause [
	^ self visitProgram: aCatchClause
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitCatchParameter: aCatchParameter [
	^ self visitProgram: aCatchParameter
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitCharType: aCharType [
	^ self visitPrimitiveType: aCharType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitCharacterLiteral: aCharacterLiteral [
	^ self visitLiteral: aCharacterLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitClassDeclaration: aClassDeclaration [
	^ self visitDeclaration: aClassDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitClassExpression: aClassExpression [
	^ self visitExpression: aClassExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitClassType: aClassType [
	^ self visitType: aClassType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitConditionalExpression: aConditionalExpression [
	^ self visitExpression: aConditionalExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitConstructorDeclaration: aConstructorDeclaration [
	^ self visitDeclaration: aConstructorDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitStatement: aContinueStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitDeclaration: aDeclaration [
	^ self visitProgram: aDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitDefaultLabel: aDefaultLabel [
	^ self visitProgram: aDefaultLabel
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitDimensionExpression: aDimensionExpression [
	^ self visitProgram: aDimensionExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitDoWhileStatement: aDoWhileStatement [
	^ self visitStatement: aDoWhileStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitDoubleType: aDoubleType [
	^ self visitPrimitiveType: aDoubleType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitElementArrayInitializer: anElementArrayInitializer [
	^ self visitProgram: anElementArrayInitializer
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitElementValuePair: anElementValuePair [
	^ self visitProgram: anElementValuePair
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitEmptyDeclaration: anEmptyDeclaration [
	^ self visitDeclaration: anEmptyDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitEmptyMethodBody: anEmptyMethodBody [
	^ self visitProgram: anEmptyMethodBody
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitEmptyStatement: anEmptyStatement [
	^ self visitStatement: anEmptyStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitEnumConstant: anEnumConstant [
	^ self visitProgram: anEnumConstant
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitEnumDeclaration: anEnumDeclaration [
	^ self visitDeclaration: anEnumDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitExpression: anExpression [
	^ self visitProgram: anExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitStatement: anExpressionStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitFieldAccess: aFieldAccess [
	^ self visitExpression: aFieldAccess
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitFieldDeclaration: aFieldDeclaration [
	^ self visitDeclaration: aFieldDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitFinallyClause: aFinallyClause [
	^ self visitProgram: aFinallyClause
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitFloatLiteral: aFloatLiteral [
	^ self visitLiteral: aFloatLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitFloatType: aFloatType [
	^ self visitPrimitiveType: aFloatType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitForEachStatement: aForEachStatement [
	^ self visitStatement: aForEachStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitForStatement: aForStatement [
	^ self visitStatement: aForStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitIfElseStatement: anIfElseStatement [
	^ self visitIfStatement: anIfElseStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitStatement: anIfStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitInitializedVariableDeclaration: anInitializedVariableDeclaration [
	^ self visitVariableDeclaration: anInitializedVariableDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitInitializer: anInitializer [
	^ self visitProgram: anInitializer
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitIntType: anIntType [
	^ self visitPrimitiveType: anIntType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitIntegerLiteral: anIntegerLiteral [
	^ self visitLiteral: anIntegerLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitInterfaceDeclaration: anInterfaceDeclaration [
	^ self visitDeclaration: anInterfaceDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLabeledStatement: aLabeledStatement [
	^ self visitStatement: aLabeledStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLambdaExpression: aLambdaExpression [
	^ self visitExpression: aLambdaExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLiteral: aLiteral [
	^ self visitExpression: aLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	^ self visitDeclaration: aLocalVariableDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLocalVariableDeclarationStatement: aLocalVariableDeclarationStatement [
	^ self visitStatement: aLocalVariableDeclarationStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitLongType: aLongType [
	^ self visitPrimitiveType: aLongType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitMethodDeclaration: aMethodDeclaration [
	^ self visitDeclaration: aMethodDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitMethodDeclarator: aMethodDeclarator [
	^ self visitProgram: aMethodDeclarator
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitMethodInvocation: aMethodInvocation [
	^ self visitExpression: aMethodInvocation
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitMethodReference: aMethodReference [
	^ self visitExpression: aMethodReference
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitModifier: aModifier [
	^ self visitProgram: aModifier
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitName: aName [
	^ self visitExpression: aName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitNew: aNew [
	^ self visitExpression: aNew
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitNewArray: aNewArray [
	^ self visitExpression: aNewArray
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitNewClass: aNewClass [
	^ self visitNew: aNewClass
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitNull: aNull [
	^ self visitLiteral: aNull
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitOuterThis: anOuterThis [
	^ self visitExpression: anOuterThis
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPackageDeclaration: aPackageDeclaration [
	^ self visitDeclaration: aPackageDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitParameter: aParameter [
	^ self visitProgram: aParameter
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPostDecrementExpression: aPostDecrementExpression [
	^ self visitUnaryExpression: aPostDecrementExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPostIncrementExpression: aPostIncrementExpression [
	^ self visitUnaryExpression: aPostIncrementExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPreDecrementExpression: aPreDecrementExpression [
	^ self visitUnaryExpression: aPreDecrementExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPreIncrementExpression: aPreIncrementExpression [
	^ self visitUnaryExpression: aPreIncrementExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitPrimitiveType: aPrimitiveType [
	^ self visitType: aPrimitiveType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitProgramFile: aProgramFile [
	^ self visitProgram: aProgramFile
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitQualifiedName: aQualifiedName [
	^ self visitName: aQualifiedName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitQualifiedTypeName: aQualifiedTypeName [
	^ self visitTypeName: aQualifiedTypeName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitStatement: aReturnStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitShortType: aShortType [
	^ self visitPrimitiveType: aShortType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSingleTypeImportDeclaration: aSingleTypeImportDeclaration [
	^ self visitDeclaration: aSingleTypeImportDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitStatementExpressionList: aStatementExpressionList [
	^ self visitProgram: aStatementExpressionList
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitStaticInitializer: aStaticInitializer [
	^ self visitInitializer: aStaticInitializer
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitLiteral: aStringLiteral
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSuperConstructorInvocation: aSuperConstructorInvocation [
	^ self visitStatement: aSuperConstructorInvocation
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSwitchBlock: aSwitchBlock [
	^ self visitProgram: aSwitchBlock
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSwitchBlockStatementGroup: aSwitchBlockStatementGroup [
	^ self visitProgram: aSwitchBlockStatementGroup
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSwitchLabel: aSwitchLabel [
	^ self visitProgram: aSwitchLabel
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitStatement: aSwitchStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitSynchronizedStatement: aSynchronizedStatement [
	^ self visitStatement: aSynchronizedStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitThisConstructorInvocation: aThisConstructorInvocation [
	^ self visitStatement: aThisConstructorInvocation
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitThrowStatement: aThrowStatement [
	^ self visitStatement: aThrowStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitThrows: aThrows [
	^ self visitProgram: aThrows
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTryStatement: aTryStatement [
	^ self visitStatement: aTryStatement
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitType: aType [
	^ self visitProgram: aType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTypeArgument: aTypeArgument [
	^ self visitProgram: aTypeArgument
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTypeImportOnDemandDeclaration: aTypeImportOnDemandDeclaration [
	^ self
		visitSingleTypeImportDeclaration: aTypeImportOnDemandDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTypeName: aTypeName [
	^ self visitProgram: aTypeName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTypeParameter: aTypeParameter [
	^ self visitProgram: aTypeParameter
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitTypeParameters: aTypeParameters [
	^ self visitProgram: aTypeParameters
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitUnaryAddition: anUnaryAddition [
	^ self visitUnaryExpression: anUnaryAddition
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitUnaryBitInvert: anUnaryBitInvert [
	^ self visitUnaryExpression: anUnaryBitInvert
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitUnaryExpression: anUnaryExpression [
	^ self visitExpression: anUnaryExpression
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitUnaryNot: anUnaryNot [
	^ self visitUnaryExpression: anUnaryNot
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitUnarySubtraction: anUnarySubtraction [
	^ self visitUnaryExpression: anUnarySubtraction
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitVariableArgumentParameter: aVariableArgumentParameter [
	^ self visitParameter: aVariableArgumentParameter
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitVariableDeclaration: aVariableDeclaration [
	^ self visitDeclaration: aVariableDeclaration
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitVariableName: aVariableName [
	^ self visitProgram: aVariableName
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitVoidType: aVoidType [
	^ self visitProgram: aVoidType
]

{ #category : #generated }
JavaProgramNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitStatement: aWhileStatement
]
