"
A parser which creates an AST upor parsing the code
"
Class {
	#name : #PPJavaParser,
	#superclass : #PPJavaSyntax,
	#category : #'PetitJava-Core'
}

{ #category : #'grammar-literals-string' }
PPJavaParser >> additiveExpression [ 

	^ super additiveExpression ==> self infixOpProcessor  .
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> andExpression [ 

	^ super andExpression ==> self infixOpProcessor
]

{ #category : #accessing }
PPJavaParser >> annotation [ 

	^ super annotation ==> [:nodes | PJAnnotationNode typeName: nodes second]
]

{ #category : #'grammar-classes' }
PPJavaParser >> annotationTypeDeclaration [
	^ super annotationTypeDeclaration ==> [ :nodes | 
		PJTypeDeclarationNode new
			simpleName: nodes fourth name;
			"	
				actually, annotationType does not allow for methods declarations,
				Type declarations should be updated/refactored to support for interfaces/annotations/classes/enums...
			"
			methodDeclarations: nodes fifth second;
			yourself.
	]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> block [
	^ super block ==> [ :nodes | 
			| blockNode |
			blockNode := PJBlockNode new.
			blockNode statements: nodes second.
			blockNode]
]

{ #category : #'grammar-literals-boolean' }
PPJavaParser >> booleanLiteral [ 

 ^ super booleanLiteral trim ==> [:token | 
		| value |
		(token inputValue = 'false') 
			ifTrue:  [ value := false]
			ifFalse: [(token inputValue = 'true') 
				ifTrue: [value := true]
				ifFalse: [self error: 'A Boolean Literal must be either false or true']].
		PJBooleanLiteralNode booleanValue: value.]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> characterLiteral [ 
 ^super characterLiteral trim ==> [:token | PJCharacterLiteralNode literalValue: (token inputValue allButFirst allButLast)]
]

{ #category : #accessing }
PPJavaParser >> classModifierNotAnnotation [ 

	^super classModifierNotAnnotation ==> [:tokenKeyword | PJModifierNode keyword: tokenKeyword inputValue]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> classOrInterfaceType [ 
	self flag: 'NA: temporary hack, should interpret nodes instead of returning first'.
	^ super classOrInterfaceType ==> [ :nodes | nodes first ]

]

{ #category : #'grammar-literals-string' }
PPJavaParser >> conditionalAndExpression [ 

	^ super conditionalAndExpression ==> self infixOpProcessor
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> conditionalExpression [ 

 ^super conditionalExpression ==> [:node | node second ifNil: [node first] ifNotNil: [node]]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> conditionalOrExpression [ 

	^ super conditionalOrExpression ==> self infixOpProcessor
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> constructorDeclaration [ 

		^ super constructorDeclaration ==> [:nodes |
				|constructor|
				
				constructor := PJConstructorDeclarationNode named: nodes third name.
				constructor
						statements: (nodes at: 8);
						modifiers: nodes first;
						returnType: nodes second;
						parameters: nodes fourth.
				constructor]

	"Modified: / 21-04-2015 / 15:52:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'as yet unclassified' }
PPJavaParser >> endOfLineComment [ 
^ super endOfLineComment ==> [ :nodes | PJEndOfLineCommentsNode comment:  nodes second .].
]

{ #category : #'grammar-classes' }
PPJavaParser >> enumDeclaration [
	^ super enumDeclaration ==> [ :nodes | 
		PJTypeDeclarationNode new
			modifiers: nodes first;
			simpleName: nodes third name;
			superInterfaceTypes: nodes fourth;
			"	
				actually, enumType does not allow for methods declarations,
				Type declarations should be updated/refactored to support for interfaces/annotations/classes/enums...
			"
			methodDeclarations: nodes fifth second;
			yourself.
	]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> equalityExpression [ 

	^ super equalityExpression ==> self infixOpProcessor
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> exclusiveOrExpression [ 

	^ super exclusiveOrExpression ==> self infixOpProcessor
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> expression [ 

 ^super expression ==> [:node | node second ifNil: [node first] ifNotNil: [
		|operation| 
		operation := PJInfixOperationNode new.
		operation
			left: node first;
			operator: node second first inputValue asSymbol;
			right: node second second.
		operation]]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> expressionStatement [ 
	^ super expressionStatement ==> [ :nodes | 
			| expressionStatementNode |
			expressionStatementNode := PJExpressionStatementNode new.
			expressionStatementNode expression: nodes first.
			expressionStatementNode]
]

{ #category : #'as yet unclassified' }
PPJavaParser >> floatingPointLiteral [

	 ^super floatingPointLiteral trim ==> [ :token | PJFloatLiteralNode newFrom: token inputValue ]
]

{ #category : #accessing }
PPJavaParser >> formalParameters [ 

	^ super formalParameters ==> [:nodes | nodes second]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> identifier [ 

 ^super identifier ==> [:token | PJIdentifierNode newWithName: token inputValue]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> identifierWithAccessors [ 

	^ super identifierWithAccessors ==> [:node | node second isEmpty & node third isNil ifTrue: [node first] ifFalse: [node]]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> ifStatement [  

 ^super ifStatement ==> [:node |
	| statementNode |
	statementNode := PJIfStatementNode new.
	statementNode
		condition: node second;
		thenPart: node third.
	node fourth ifNotNil: [
		statementNode elsePart: node fourth second].
	statementNode]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> inclusiveOrExpression [ 

 ^super inclusiveOrExpression ==> self infixOpProcessor
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> infixOpProcessor [ 

	^ [:node |
		(node second asOrderedCollection addFirst: node first; yourself) fold: [:left :current |
			|operation| 
			operation := PJInfixOperationNode new.
			operation
			left: left;
			operator: current first inputValue asSymbol;
			right: current second.
			operation]]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> initializerDeclaration [ 

		^ super initializerDeclaration ==> [:nodes |
			| methodDeclarationNode |
			
			methodDeclarationNode := PJMethodDeclarationNode named: '<Initializer>'.
			methodDeclarationNode modifiers: #(). "I guess it is default visibility by default"
			methodDeclarationNode returnType: 'void'.
			methodDeclarationNode body: (nodes at: 2).
			methodDeclarationNode parameters: #().
			methodDeclarationNode
	]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> instanceofExpression [ 

 ^super instanceofExpression ==> [:node | node second ifNil: [node first] ifNotNil: [node]]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> integerLiteral [ 

 ^super integerLiteral trim ==> [ :token | PJIntegerLiteralNode newFrom: token value ]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> interfaceMethodDeclaration [ 

		^ super methodNotConstructorDeclaration ==> [:nodes |
			| methodDeclarationNode |
			
			methodDeclarationNode := PJMethodDeclarationNode named: nodes fourth name.
			methodDeclarationNode modifiers: nodes first.
			methodDeclarationNode returnType: nodes third.
			methodDeclarationNode body: (nodes at: 8).
			methodDeclarationNode parameters: nodes fifth.
			methodDeclarationNode
	]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> localVariableDeclaration [
	^ super localVariableDeclaration ==> [ :nodes | 
			| declarationNode |
			declarationNode := PJLocalVariableDeclarationStatementNode new.
			declarationNode
				type: nodes second;
				declarators: (nodes third second collect: [:each | each second]) asOrderedCollection.
			declarationNode declarators addFirst: nodes third first.
			declarationNode]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> localVariableDeclarationStatement [ 
	^ super localVariableDeclarationStatement ==> [ :nodes | nodes first]
]

{ #category : #accessing }
PPJavaParser >> methodModifierNotAnnotation [ 

	^super methodModifierNotAnnotation ==> [:tokenKeyword | PJModifierNode keyword: tokenKeyword inputValue]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> methodNotConstructorDeclaration [ 

		^ super methodNotConstructorDeclaration ==> [:nodes |
			| methodDeclarationNode |
			
			methodDeclarationNode := PJMethodDeclarationNode named: nodes fourth name.
			methodDeclarationNode modifiers: nodes first.
			methodDeclarationNode returnType: nodes third.
			methodDeclarationNode body: (nodes at: 8).
			methodDeclarationNode parameters: nodes fifth.
			methodDeclarationNode   
	]

	"Modified: / 21-04-2015 / 15:52:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> multiplicativeExpression [ 
	^ super multiplicativeExpression ==> self infixOpProcessor
]

{ #category : #private }
PPJavaParser >> nameFromQualified: aCollection [

	^(aCollection size = 1)
		ifTrue: [PJSimpleNameNode identifier: aCollection first]
          ifFalse: [
			PJQualifiedNameNode 
				name: (PJSimpleNameNode identifier: aCollection last)
				qualifier: (self nameFromQualified: aCollection allButLast ).]
]

{ #category : #'grammar-classes' }
PPJavaParser >> normalClassDeclaration [
	^ super normalClassDeclaration ==> [ :nodes | 
		PJTypeDeclarationNode new
			modifiers: nodes first;
			simpleName: nodes third name;
			methodDeclarations: nodes seventh second;
			"TODO"
			yourself.
	]
]

{ #category : #'grammar-classes' }
PPJavaParser >> normalInterfaceDeclaration [
	^ super normalInterfaceDeclaration ==> [ :nodes | 
		PJTypeDeclarationNode new
			modifiers: nodes first;
			simpleName: nodes third name;
			methodDeclarations: nodes sixth second;
			"TODO"
			yourself.
	]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> normalParameterDecl [  

	^ super normalParameterDecl ==> [:nodes |
		| declarator |
		
		declarator := PJParameterDeclaratorNode new.
		declarator
			modifiers: nodes first;
			type: nodes second;
			identifier: nodes third;
			arrayLevel: nodes fourth size.
		declarator]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> normalParametersDecls [
	^ super normalParametersDecls ==> [ :nodes | 
			| declarationNode |
			((nodes second collect: [ :element | element second ]) asOrderedCollection)
				addFirst: nodes first; yourself]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> nullLiteral [
	 ^super nullLiteral trim ==> [:token | PJNullLiteralNode literalValue: (token inputValue)]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> parExpression [ 

 ^super parExpression ==> [ :nodes | nodes second ]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> primaryWithselectors [ 
	^ super primaryWithselectors ==> [:node |
		"JK: I have no idea, what this fold is supposed to do, 
		 but #object: causes DNU, so I commented it out
		"
		node first ]
		"(node second asOrderedCollection addFirst: node first; yourself) fold: [:inner :outer | outer object: inner]]
		"
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> primitiveType [ 

 ^super primitiveType ==> [:token | PJPrimitiveTypeNode type: token inputValue]
]

{ #category : #accessing }
PPJavaParser >> qualifiedName [
	^ super qualifiedName
		==> [ :nodes | 
			nodes second notEmpty
				ifTrue: [ self nameFromQualified: (Array with: nodes first withAll: (nodes second collect: [ :e | e second value ])) ]
				ifFalse: [ PJSimpleNameNode identifier: nodes first value ] ]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> relationalExpression [ 

 ^super relationalExpression ==> self infixOpProcessor
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> returnStatement [
	^ super returnStatement ==> [ :nodes | 
			| returnNode |
			returnNode := PJReturnStatementNode new.
			returnNode expression: nodes second.
			returnNode]
]

{ #category : #'as yet unclassified' }
PPJavaParser >> separator [	

 ^super separator trim ==> [:token | PJSeparatorNode separatorValue: (token inputValue)]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> shiftExpression [ 

 ^super shiftExpression ==> [:node | node second ifEmpty: [node first] ifNotEmpty: [node]]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> stringLiteral [ 

 ^super stringLiteral trim ==> [:token | PJStringLiteralNode literalValue: (token inputValue allButFirst allButLast)]
]

{ #category : #'as yet unclassified' }
PPJavaParser >> traditionalComment [
^ super traditionalComment ==> [ :nodes | PJTraditionalCommentsNode comment:  (nodes second ).].
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> type [
	^ super type
		==> [ :nodes | 
			| pjtype |
			nodes second notEmpty
				ifTrue: [ pjtype := PJArrayTypeNode elementType: nodes first dimensions: nodes second size ]
				ifFalse: [ pjtype := nodes first ].
			pjtype ]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> unaryPostfixExpression [ 
	^ super unaryPostfixExpression ==> [:node | node second ifNil: [node first] ifNotNil: [node]]
]

{ #category : #'grammar-classes-method' }
PPJavaParser >> variableDeclarator [
	^ super variableDeclarator
		==> [ :nodes | 
			| declarator |
			declarator := PJVariableDeclaratorNode new.
			declarator
				variable: nodes first;
				arrayLevel: nodes second size.
			nodes third
				ifNotNil: [ :node | declarator initializer: node second ].
			declarator ]
]

{ #category : #'grammar-literals-string' }
PPJavaParser >> whileStatement [  

 ^super whileStatement ==> [ :nodes |
	| while | 
	while := PJWhileStatementNode new.
	while expression: nodes second.
	while statement: nodes third.
	while ]
]
