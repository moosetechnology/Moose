Class {
	#name : #JSProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSProgramNodeVisitor >> visitArrayBindingPattern: anArrayBindingPattern [
	^ self visitProgram: anArrayBindingPattern
]

{ #category : #generated }
JSProgramNodeVisitor >> visitArrayLiteral: anArrayLiteral [
	^ self visitExpression: anArrayLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitArrowFunction: anArrowFunction [
	^ self visitExpression: anArrowFunction
]

{ #category : #generated }
JSProgramNodeVisitor >> visitAssignmentExpression: anAssignmentExpression [
	^ self visitExpression: anAssignmentExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBindingProperty: aBindingProperty [
	^ self visitProgram: aBindingProperty
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBlockStatement: aBlockStatement [
	^ self visitStatement: aBlockStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBooleanLiteral: aBooleanLiteral [
	^ self visitLiteral: aBooleanLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitStatement: aBreakStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCallExpression: aCallExpression [
	^ self visitExpression: aCallExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCaseClause: aCaseClause [
	^ self visitProgram: aCaseClause
]

{ #category : #generated }
JSProgramNodeVisitor >> visitClassExpression: aClassExpression [
	^ self visitExpression: aClassExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCommaExpression: aCommaExpression [
	^ self visitExpression: aCommaExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitComputedPropertyName: aComputedPropertyName [
	^ self visitProgram: aComputedPropertyName
]

{ #category : #generated }
JSProgramNodeVisitor >> visitConditionalExpression: aConditionalExpression [
	^ self visitExpression: aConditionalExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitStatement: aContinueStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDebuggerStatement: aDebuggerStatement [
	^ self visitStatement: aDebuggerStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDefaultClause: aDefaultClause [
	^ self visitProgram: aDefaultClause
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDoWhileStatement: aDoWhileStatement [
	^ self visitStatement: aDoWhileStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitEmptyStatement: anEmptyStatement [
	^ self visitStatement: anEmptyStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExportDeclaration: anExportDeclaration [
	^ self visitProgram: anExportDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExportSpecifier: anExportSpecifier [
	^ self visitProgram: anExportSpecifier
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExpression: anExpression [
	^ self visitProgram: anExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitStatement: anExpressionStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForInStatement: aForInStatement [
	^ self visitStatement: aForInStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForOfStatement: aForOfStatement [
	^ self visitStatement: aForOfStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForStatement: aForStatement [
	^ self visitStatement: aForStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitFunction: aFunction [
	^ self visitExpression: aFunction
]

{ #category : #generated }
JSProgramNodeVisitor >> visitGeneratorFunction: aGeneratorFunction [
	^ self visitFunction: aGeneratorFunction
]

{ #category : #generated }
JSProgramNodeVisitor >> visitGeneratorMethodDefinition: aGeneratorMethodDefinition [
	^ self visitMethodDefinition: aGeneratorMethodDefinition
]

{ #category : #generated }
JSProgramNodeVisitor >> visitGetMethodDefinition: aGetMethodDefinition [
	^ self visitMethodDefinition: aGetMethodDefinition
]

{ #category : #generated }
JSProgramNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitStatement: anIfStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitImportDeclaration: anImportDeclaration [
	^ self visitProgram: anImportDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitImportSpecifier: anImportSpecifier [
	^ self visitProgram: anImportSpecifier
]

{ #category : #generated }
JSProgramNodeVisitor >> visitIndexedPropertyExpression: anIndexedPropertyExpression [
	^ self visitExpression: anIndexedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitLabelledStatement: aLabelledStatement [
	^ self visitStatement: aLabelledStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitLexicalDeclaration: aLexicalDeclaration [
	^ self visitStatement: aLexicalDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitLiteral: aLiteral [
	^ self visitExpression: aLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitMethodDefinition: aMethodDefinition [
	^ self visitProgram: aMethodDefinition
]

{ #category : #generated }
JSProgramNodeVisitor >> visitModule: aModule [
	^ self visitProgram: aModule
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNameExpression: aNameExpression [
	^ self visitExpression: aNameExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNameSpaceImport: aNameSpaceImport [
	^ self visitProgram: aNameSpaceImport
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNamedImports: aNamedImports [
	^ self visitProgram: aNamedImports
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNamedPropertyExpression: aNamedPropertyExpression [
	^ self visitExpression: aNamedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNewExpression: aNewExpression [
	^ self visitExpression: aNewExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNewTargetExpression: aNewTargetExpression [
	^ self visitExpression: aNewTargetExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNullLiteral: aNullLiteral [
	^ self visitLiteral: aNullLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNumericLiteral: aNumericLiteral [
	^ self visitLiteral: aNumericLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitObjectBindingPattern: anObjectBindingPattern [
	^ self visitProgram: anObjectBindingPattern
]

{ #category : #generated }
JSProgramNodeVisitor >> visitObjectLiteral: anObjectLiteral [
	^ self visitExpression: anObjectLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitPostfixExpression: aPostfixExpression [
	^ self visitExpression: aPostfixExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitPrefixExpression: aPrefixExpression [
	^ self visitExpression: aPrefixExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
JSProgramNodeVisitor >> visitPropertyAssignment: aPropertyAssignment [
	^ self visitProgram: aPropertyAssignment
]

{ #category : #generated }
JSProgramNodeVisitor >> visitRegularExpressionLiteral: aRegularExpressionLiteral [
	^ self visitLiteral: aRegularExpressionLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitRestVariableDeclaration: aRestVariableDeclaration [
	^ self visitVariableDeclaration: aRestVariableDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitStatement: aReturnStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitScript: aScript [
	^ self visitProgram: aScript
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSetMethodDefinition: aSetMethodDefinition [
	^ self visitMethodDefinition: aSetMethodDefinition
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSpreadExpression: aSpreadExpression [
	^ self visitExpression: aSpreadExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitStaticMethodDefinition: aStaticMethodDefinition [
	^ self visitProgram: aStaticMethodDefinition
]

{ #category : #generated }
JSProgramNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitLiteral: aStringLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSuperCallExpression: aSuperCallExpression [
	^ self visitExpression: aSuperCallExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSuperIndexedPropertyExpression: aSuperIndexedPropertyExpression [
	^ self visitExpression: aSuperIndexedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSuperNamedPropertyExpression: aSuperNamedPropertyExpression [
	^ self visitExpression: aSuperNamedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitStatement: aSwitchStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitTaggedTemplateLiteral: aTaggedTemplateLiteral [
	^ self visitExpression: aTaggedTemplateLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitTemplateLiteral: aTemplateLiteral [
	^ self visitExpression: aTemplateLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitThisExpression: aThisExpression [
	^ self visitExpression: aThisExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitThrowStatement: aThrowStatement [
	^ self visitStatement: aThrowStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitTryStatement: aTryStatement [
	^ self visitStatement: aTryStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitUnaryExpression: anUnaryExpression [
	^ self visitExpression: anUnaryExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitVariableDeclaration: aVariableDeclaration [
	^ self visitProgram: aVariableDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitVariablePatternDeclaration: aVariablePatternDeclaration [
	^ self visitProgram: aVariablePatternDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitVariableStatement: aVariableStatement [
	^ self visitStatement: aVariableStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitStatement: aWhileStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitWithStatement: aWithStatement [
	^ self visitStatement: aWithStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitYieldExpression: aYieldExpression [
	^ self visitExpression: aYieldExpression
]
