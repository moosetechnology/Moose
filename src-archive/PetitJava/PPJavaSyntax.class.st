"
Parses Java code into lots of arrays. This parser has a full java gramar coverage
"
Class {
	#name : #PPJavaSyntax,
	#superclass : #PPJavaLexicon,
	#instVars : [
		'compilationUnit',
		'annotations',
		'packageDeclaration',
		'importDeclaration',
		'typeDeclaration',
		'qualifiedName',
		'annotation',
		'classOrInterfaceDeclaration',
		'classDeclaration',
		'interfaceDeclaration',
		'normalClassDeclaration',
		'enumDeclaration',
		'classModifiers',
		'typeParameters',
		'type',
		'typeList',
		'classBody',
		'jsuper',
		'interfaces',
		'typeParameter',
		'typeBound',
		'enumBody',
		'enumConstants',
		'enumBodyDeclarations',
		'enumConstant',
		'arguments',
		'classBodyDeclaration',
		'normalInterfaceDeclaration',
		'annotationTypeDeclaration',
		'interfaceModifiers',
		'interfaceBody',
		'interfaceBodyDeclaration',
		'block',
		'fieldDeclaration',
		'methodDeclaration',
		'methodModifiers',
		'formalParameters',
		'throws',
		'qualifiedNameList',
		'explicitConstructorInvocation',
		'blockStatement',
		'fieldModifiers',
		'variableDeclarators',
		'variableDeclarator',
		'variableInitializer',
		'interfaceFieldDeclaration',
		'interfaceMethodDeclaration',
		'classOrInterfaceType',
		'primitiveType',
		'typeArguments',
		'typeArgument',
		'formalParameterDecls',
		'ellipsisParameterDecl',
		'normalParameterDecl',
		'variableModifiers',
		'nonWildcardTypeArguments',
		'primary',
		'elementValuePairs',
		'elementValue',
		'elementValuePair',
		'conditionalExpression',
		'elementValueArrayInitializer',
		'annotationTypeBody',
		'annotationTypeElementDeclaration',
		'annotationMethodDeclaration',
		'localVariableDeclarationStatement',
		'statement',
		'localVariableDeclaration',
		'expression',
		'parExpression',
		'ifStatement',
		'assertStatement',
		'basicForStatement',
		'enhancedForStatement',
		'forInit',
		'expressionList',
		'forStatement',
		'whileStatement',
		'catches',
		'catchClause',
		'formalParameter',
		'doStatement',
		'tryStatement',
		'switchBlockStatementGroup',
		'switchLabel',
		'switchStatement',
		'synchronizedStatement',
		'returnStatement',
		'throwStatement',
		'breakStatement',
		'continueStatement',
		'expressionStatement',
		'labeledStatement',
		'emptyStatement',
		'assignmentOperator',
		'conditionalOrExpression',
		'conditionalAndExpression',
		'inclusiveOrExpression',
		'exclusiveOrExpression',
		'andExpression',
		'equalityExpression',
		'instanceofExpression',
		'relationalExpression',
		'shiftExpression',
		'relationalOperator',
		'additiveExpression',
		'shiftOperator',
		'multiplicativeExpression',
		'unaryExpression',
		'unaryExpressionNotPlusMinus',
		'castExpression',
		'selector',
		'innerCreator',
		'superSuffix',
		'identifierSuffix',
		'creator',
		'classCreatorRest',
		'arrayCreator',
		'createdName',
		'arrayInitializer',
		'constructorDeclaration',
		'constructorModifiers',
		'methodNotConstructorDeclaration',
		'wildcard',
		'emptySquaredParenthesis',
		'methodModifierNotAnnotation',
		'classModifierNotAnnotation',
		'unaryNegationExpression',
		'unaryPostfixExpression',
		'primaryWithselectors',
		'startMethodDeclaration',
		'identifierWithAccessors',
		'normalParametersWithElipsisDecls',
		'normalParametersDecls',
		'blockStatements',
		'statementWithoutTrailingSubstatement',
		'integralType',
		'floatingPointType',
		'numericType',
		'finally',
		'initializerDeclaration'
	],
	#category : #'PetitJava-Core'
}

{ #category : #'as yet unclassified' }
PPJavaSyntax class >> parseMethod: aString [
	^ self new parseMethod: aString
]

{ #category : #'as yet unclassified' }
PPJavaSyntax class >> parseMethod: aString onError: aBlock [
	^ self new parseMethod: aString onError: aBlock
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> additiveExpression [

	^ multiplicativeExpression , 
	(( (self tokenFor: '+') / (self tokenFor: '-') ) , multiplicativeExpression ) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> andExpression [

	^ equalityExpression , ((self tokenFor: '&') , equalityExpression) star
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotation [ 

	^(self tokenFor: '@') , qualifiedName ,
	((self tokenFor: '(') , 
		(elementValuePairs / elementValue) optional , 
		(self tokenFor: ')') ) optional
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotationMethodDeclaration [
	self flag: 'check whether method modifiers are the right modifiers to use'.
	
	^ methodModifiers ,
	type ,
	identifier ,
	(self tokenFor: '('), (self tokenFor: ')'),
	((self tokenFor: 'default'), elementValue ) optional ,
	(self tokenFor: ';')
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotationTypeBody [

	^ (self tokenFor: '{')  ,
	(annotationTypeElementDeclaration star),
	(self tokenFor: '}')
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotationTypeDeclaration [ 

	^ interfaceModifiers , (self tokenFor: '@'),
	(self tokenFor: 'interface') ,
	identifier ,
	annotationTypeBody
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotationTypeElementDeclaration [
	
	^ annotationMethodDeclaration
	/ interfaceFieldDeclaration 
	/ normalClassDeclaration
	/ enumDeclaration 
	/ annotationTypeDeclaration 
	/ (self tokenFor: ';')
]

{ #category : #'grammar-annotations' }
PPJavaSyntax >> annotations [ 
	
	^ annotation plus
]

{ #category : #grammar }
PPJavaSyntax >> arguments [ 

	^(self tokenFor: '('),
		expressionList optional,
	(self tokenFor: ')')
]

{ #category : #grammar }
PPJavaSyntax >> arrayCreator [

	^ 	(	(self tokenFor: 'new') , createdName ,
			emptySquaredParenthesis plus,
			arrayInitializer)
			
		/(	(self tokenFor: 'new'), createdName ,
			((self tokenFor: '['), expression , (self tokenFor: ']')) plus,
			emptySquaredParenthesis star)
]

{ #category : #grammar }
PPJavaSyntax >> arrayInitializer [ 

	^ (self tokenFor: '{'),
		(variableInitializer , ((self tokenFor: ','), variableInitializer ) star) optional,
		(self tokenFor: ',') optional,
	   (self tokenFor: '}')
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> assertStatement [ 

	^ (self tokenFor: 'assert') , expression , 
	((self tokenFor: ':'), expression ) optional ,
	(self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> assignmentOperator [ 

	^ (self tokenFor: '=')
	/ (self tokenFor: '>>>=')
	/	(self tokenFor: '>>=')
	/	(self tokenFor: '<<=')
	/	(self tokenFor: '&=')
	/	(self tokenFor: '^=')
	/	(self tokenFor: '|=')
	/	(self tokenFor: '-=')
	/	(self tokenFor: '+=')
	/	(self tokenFor: '%=')
	/	(self tokenFor: '/=')
	/	(self tokenFor: '*=')
		
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> basicForStatement [

	^ (self tokenFor: 'for') ,
	(self tokenFor: '('),
		forInit optional, (self tokenFor: ';'),
		expression , (self tokenFor: ';'),
		expressionList optional,
	(self tokenFor: ')'),
	statement
		
]

{ #category : #grammar }
PPJavaSyntax >> block [ 

	^ (self tokenFor: '{') ,
		blockStatements,
	 (self tokenFor: '}')
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> blockStatement [  

	^ localVariableDeclarationStatement
	/ classOrInterfaceDeclaration 
	/ statement
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> blockStatements [

	^ (blockStatement star).
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> breakStatement [ 

	^ (self tokenFor: 'break') , identifier optional , (self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> castExpression [

	^ ((self tokenFor: '('), 
			primitiveType ,
		(self tokenFor: ')'), unaryExpression )
		
	/ ((self tokenFor: '('),
			type,
		(self tokenFor: ')'), unaryExpressionNotPlusMinus )
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> catchClause [

	^ (self tokenFor: 'catch') ,
	(self tokenFor: '(') ,
		formalParameter ,
	(self tokenFor: ')'), 
	block
	
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> catches [  

		^ catchClause plus
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> classBody [ 

	^ (self tokenFor: '{') , classBodyDeclaration star , (self tokenFor: '}')
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> classBodyDeclaration [ 

	^ (self tokenFor: ';')
	/ initializerDeclaration
	/ fieldDeclaration
	/ methodDeclaration
	/ classDeclaration 
	/ interfaceDeclaration 
	
]

{ #category : #grammar }
PPJavaSyntax >> classCreatorRest [ 

	^	arguments , classBody optional
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> classDeclaration [ 

	^ normalClassDeclaration 
	/ enumDeclaration
]

{ #category : #'grammar-modifiers' }
PPJavaSyntax >> classModifierNotAnnotation [

	^	(self tokenFor: 'abstract') 
	/	(self tokenFor: 'final') 
	/	(self tokenFor: 'protected') 
	/	(self tokenFor: 'private') 
	/	(self tokenFor: 'public') 
	/	(self tokenFor: 'static')
	/	(self tokenFor: 'strictfp') 
		
]

{ #category : #'grammar-modifiers' }
PPJavaSyntax >> classModifiers [

	^ (classModifierNotAnnotation 
		/annotation) star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> classOrInterfaceDeclaration [

	^ classDeclaration 
	/ interfaceDeclaration
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> classOrInterfaceType [ 

	^ identifier ,
	typeArguments optional,
	((self tokenFor: '.'), identifier , typeArguments optional ) star
]

{ #category : #grammar }
PPJavaSyntax >> compilationUnit [ 

	^ (annotations optional, packageDeclaration) optional , importDeclaration star , typeDeclaration plus
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> conditionalAndExpression [ 

	^inclusiveOrExpression ,
	((self tokenFor: '&&'), inclusiveOrExpression ) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> conditionalExpression [ 

	^conditionalOrExpression ,
	((self tokenFor: '?'), expression , (self tokenFor: ':'), conditionalExpression ) optional
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> conditionalOrExpression [ 

	^conditionalAndExpression ,
	((self tokenFor: '||'), conditionalAndExpression ) star
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> constructorDeclaration [

	^ constructorModifiers optional , 
	   typeParameters optional , 
	   identifier,
	   formalParameters ,
	   throws optional , 
	   (self tokenFor: '{' ) , 
			explicitConstructorInvocation optional ,
			blockStatement star ,
	   (self tokenFor: '}')
	
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> constructorModifiers [ 

	^ ((self tokenFor: 'protected')
		/ (self tokenFor: 'private')
		/ (self tokenFor: 'public')
		/ annotation) plus
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> continueStatement [ 

	^ (self tokenFor: 'continue') , identifier optional , (self tokenFor: ';')
]

{ #category : #grammar }
PPJavaSyntax >> createdName [ 

	^ classOrInterfaceType 
	/	primitiveType 
]

{ #category : #grammar }
PPJavaSyntax >> creator [
		
	^	(	(self tokenFor: 'new'), nonWildcardTypeArguments optional , classOrInterfaceType , classCreatorRest)
		/	arrayCreator
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> doStatement [

	^(self tokenFor: 'do') , statement ,
	(self tokenFor: 'while') , parExpression ,
	(self tokenFor: ';')
]

{ #category : #grammar }
PPJavaSyntax >> elementValue [ 

	^conditionalExpression
	/ annotation 
	/ elementValueArrayInitializer
]

{ #category : #grammar }
PPJavaSyntax >> elementValueArrayInitializer [

	^ (self tokenFor: '{') ,
		(elementValue , 
			((self tokenFor: ',') , elementValue ) star
		) optional ,
		((self tokenFor: ',') optional ),
	  (self tokenFor: '}')
]

{ #category : #grammar }
PPJavaSyntax >> elementValuePair [ 

	^ identifier , (self tokenFor: '=') , elementValue 
]

{ #category : #grammar }
PPJavaSyntax >> elementValuePairs [ 

	^ elementValuePair , ((self tokenFor: ',') , elementValuePair ) star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> ellipsisParameterDecl [

	^ variableModifiers ,
	type ,
	('...' asPParser token trim) ,
	identifier
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> emptyStatement [ 

	^ (self tokenFor: ';')
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> enhancedForStatement [

	^ (self tokenFor: 'for') , 
	(self tokenFor: '(') , 
		variableModifiers , 
		type , 
		identifier , 
		(self tokenFor: ':'),
		expression,
	(self tokenFor: ')'),
	statement
]

{ #category : #'grammar-classes-enum' }
PPJavaSyntax >> enumBody [ 

	^ (self tokenFor: '{') ,
		enumConstants optional ,
		(self tokenFor: ',') optional ,
		enumBodyDeclarations optional ,
		(self tokenFor: '}')
]

{ #category : #'grammar-classes-enum' }
PPJavaSyntax >> enumBodyDeclarations [ 

	^ (self tokenFor: ';') , classBodyDeclaration star
]

{ #category : #'grammar-classes-enum' }
PPJavaSyntax >> enumConstant [

	^ annotations optional , identifier , arguments optional , classBody optional 
]

{ #category : #'grammar-classes-enum' }
PPJavaSyntax >> enumConstants [ 

	^ enumConstant , ((self tokenFor: ',') , enumConstant) star
]

{ #category : #'grammar-classes-enum' }
PPJavaSyntax >> enumDeclaration [ 

	^ classModifiers ,
	   (self tokenFor: 'enum'),
	   identifier ,
	   interfaces optional,
	   enumBody
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> equalityExpression [

	^ instanceofExpression , 
	(((self tokenFor: '!=') / (self tokenFor: '==')) , instanceofExpression) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> exclusiveOrExpression [

	^ andExpression , ((self tokenFor: '^') , andExpression) star
]

{ #category : #grammar }
PPJavaSyntax >> explicitConstructorInvocation [

	^ (
		(	nonWildcardTypeArguments optional,
			((self tokenFor: 'this') / (self tokenFor: 'super')))
		
		/	(primary ,
			(self tokenFor: '.') ,
			nonWildcardTypeArguments optional,
			(self tokenFor: 'super'))) ,
		
		arguments , 
		(self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> expression [ 

	^ conditionalExpression , 
	(assignmentOperator , expression) optional
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> expressionList [ 

	^ expression , ((self tokenFor: ','), expression ) star
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> expressionStatement [ 

	^ expression , (self tokenFor: ';')
]

{ #category : #'as yet unclassified' }
PPJavaSyntax >> fieldAccessExpression [ 


	^(
" Primary.Identifier"
	(primary , (self tokenFor: '.'), identifier)
"Super.Identifier"
	/((self tokenFor: 'super'), superSuffix )
"ClassName.super.Identifier"
	/(identifier,(self tokenFor: '.'),(self tokenFor: 'super'),superSuffix)
	)plus.
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> fieldDeclaration [
		
		^ fieldModifiers , type , variableDeclarators , (self tokenFor: ';')
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> fieldModifiers [

	^ ((self tokenFor: 'volatile') /
		(self tokenFor: 'final') /
		(self tokenFor: 'protected') /
		(self tokenFor: 'private') /
		(self tokenFor: 'public') /
		(self tokenFor: 'static') /
		(self tokenFor: 'transient') /
		annotation) star
]

{ #category : #'as yet unclassified' }
PPJavaSyntax >> finally [
^ ((self tokenFor: 'finally'), block).
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> floatingPointType [
	^ (self tokenFor: 'float')
		/ (self tokenFor: 'double').
		
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> forInit [

	^ localVariableDeclaration 
	/ expressionList 
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> forStatement [

	^ enhancedForStatement 
	/ basicForStatement
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> formalParameter [ 

	^ variableModifiers ,
	type ,
	identifier ,
	emptySquaredParenthesis star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> formalParameterDecls [
	
	^ ellipsisParameterDecl
	/  normalParametersWithElipsisDecls 
	/  normalParametersDecls 
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> formalParameters [ 

	^ (self tokenFor: '(') ,
	formalParameterDecls optional ,
	(self tokenFor: ')')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> identifierSuffix [ 

	^ (		emptySquaredParenthesis plus , (self tokenFor: '.'), (self tokenFor: 'class'))
		/	(((self tokenFor: '[') , expression , (self tokenFor: ']')) plus)
		/	arguments 
		/	((self tokenFor: '.'),
			(	(self tokenFor: 'class')
			/	(self tokenFor: 'this')
			/	((self tokenFor: 'super'), arguments)
			/	(nonWildcardTypeArguments , identifier , arguments)))
		/	innerCreator
]

{ #category : #grammar }
PPJavaSyntax >> identifierWithAccessors [
	^ identifier,
	((self tokenFor: '.'), identifier ) star,
	identifierSuffix optional
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> ifStatement [

	^(self tokenFor: 'if') , parExpression , statement , 
	((self tokenFor: 'else'), statement ) optional
]

{ #category : #grammar }
PPJavaSyntax >> importDeclaration [ 

^	((self tokenFor: 'import') , (self tokenFor: 'static') optional , identifier),
	(	(	(self tokenFor: '.') , (self tokenFor: '*'))
		/(	((self tokenFor: '.') , identifier) plus , ((self tokenFor: '.') , (self tokenFor: '*')) optional)
	),
	(self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> inclusiveOrExpression [

	^ exclusiveOrExpression , 
	((self tokenFor: '|') , exclusiveOrExpression) star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> initializerDeclaration [

	^ ((self tokenFor: 'static') optional , block)	
]

{ #category : #grammar }
PPJavaSyntax >> innerCreator [ 

	^	(self tokenFor: '.'), (self tokenFor: 'new'),
		nonWildcardTypeArguments optional,
		identifier ,
		typeArguments optional,
		classCreatorRest 
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> instanceofExpression [

	^  relationalExpression , 
	((self tokenFor: 'instanceof') , type) optional
]

{ #category : #'as yet unclassified' }
PPJavaSyntax >> integralType [
	^ (self tokenFor: 'byte')
		/ (self tokenFor: 'short')
		/ (self tokenFor: 'int')
		/ (self tokenFor: 'long')
		/ (self tokenFor: 'char')
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceBody [

	^ (self tokenFor: '{') , interfaceBodyDeclaration star , (self tokenFor: '}')
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceBodyDeclaration [ 

	^ interfaceFieldDeclaration
	/ interfaceMethodDeclaration
	/ interfaceDeclaration 
	/ classDeclaration 
	/ (self tokenFor: ';')
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceDeclaration [ 

	^normalInterfaceDeclaration 
	/ annotationTypeDeclaration
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceFieldDeclaration [ 

	^ fieldModifiers , 
	type ,
	variableDeclarators ,
	(self tokenFor: ';')
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceMethodDeclaration [ 

	^ methodModifiers ,
	typeParameters optional,
	((self tokenFor: 'void') / type) ,
	identifier ,
	formalParameters ,
	emptySquaredParenthesis star ,
	throws optional ,
	(self tokenFor: ';')
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> interfaceModifiers [

	^ ((self tokenFor: 'abstract')
		/(self tokenFor: 'protected') 
		/(self tokenFor: 'private') 
		/(self tokenFor: 'public') 
		/(self tokenFor: 'static')
		/(self tokenFor: 'strictfp') 
		/annotation) star
]

{ #category : #grammar }
PPJavaSyntax >> interfaces [

	^ (self tokenFor: 'implements') , typeList
]

{ #category : #grammar }
PPJavaSyntax >> jsuper [

	^ (self tokenFor: 'extends') , type
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> labeledStatement [ 

	^ identifier , (self tokenFor: ':') , statement 
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> localVariableDeclaration [

	^ variableModifiers , type , variableDeclarators 
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> localVariableDeclarationStatement [

	^ localVariableDeclaration , (self tokenFor: ';')
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> methodDeclaration [

	^ constructorDeclaration 
	/ methodNotConstructorDeclaration
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> methodModifierNotAnnotation [

	^ (self tokenFor: 'abstract')
		/ (self tokenFor: 'final')
		/ (self tokenFor: 'native')
		/ (self tokenFor: 'protected')
		/ (self tokenFor: 'private')
		/ (self tokenFor: 'public')
		/ (self tokenFor: 'static')
		/ (self tokenFor: 'strictfp') 
		/ (self tokenFor: 'synchronized') 
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> methodModifiers [ 

	^ (	methodModifierNotAnnotation
		/ annotation) star
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> methodNotConstructorDeclaration [

	^ methodModifiers,
	   typeParameters optional,
	   ((self tokenFor: 'void') / type),
	   identifier,
	   formalParameters ,
	   emptySquaredParenthesis star ,
	   throws optional,
	   (block / (self tokenFor: ';'))
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> multiplicativeExpression [

	^ unaryExpression , 
	(( (self tokenFor: '*') 
	   / (self tokenFor: '/') 
	   / (self tokenFor: '%') ) , unaryExpression ) star
]

{ #category : #grammar }
PPJavaSyntax >> nonWildcardTypeArguments [ 

	^(self tokenFor: '<'),
		typeList ,
	(self tokenFor: '>')
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> normalClassDeclaration [ 

	^ classModifiers , (self tokenFor: 'class') , identifier ,
		typeParameters optional,
		jsuper optional,
		interfaces optional ,
		classBody
]

{ #category : #'grammar-classes-interface' }
PPJavaSyntax >> normalInterfaceDeclaration [

	^ interfaceModifiers , 
	(self tokenFor: 'interface') , 
	identifier , 
	typeParameters optional , 
	((self tokenFor: 'extends') , typeList ) optional ,
	interfaceBody
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> normalParameterDecl [

	^ variableModifiers ,
	type ,
	identifier ,
	emptySquaredParenthesis star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> normalParametersDecls [
	
	^ normalParameterDecl , 
		((self tokenFor: ',') , normalParameterDecl) star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> normalParametersWithElipsisDecls [
	
	^ (normalParameterDecl , 
		(self tokenFor: ',')) plus , 
		ellipsisParameterDecl
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> numericType [ 
	^  integralType / floatingPointType
]

{ #category : #grammar }
PPJavaSyntax >> packageDeclaration [ 

	^ (self tokenFor: 'package') , qualifiedName , (self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> parExpression [

	^ (self tokenFor: '(') , expression , (self tokenFor: ')')
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> parseMethod: aString [ 
	^ self parseMethod: aString onError: [ :msg :pos | self error: msg ]
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> parseMethod: aString onError: aBlock [
	^ startMethodDeclaration parse: aString onError: aBlock
]

{ #category : #grammar }
PPJavaSyntax >> primary [ 

	^		parExpression 
		/(	(self tokenFor: 'this'),
			((self tokenFor: '.'), identifier ) star,
			identifierSuffix optional)
		/	identifierWithAccessors
		/(	(self tokenFor: 'super'), superSuffix )
		/	literal
		/	creator
		/(	primitiveType,
			emptySquaredParenthesis star,
			(self tokenFor: '.'), (self tokenFor: 'class'))
		/(	(self tokenFor: 'void'), (self tokenFor: '.'), (self tokenFor: 'class'))
			
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> primaryWithselectors [
	^ primary, selector star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> primitiveType [ 

	^ (self tokenFor: 'boolean')  / numericType
		
]

{ #category : #grammar }
PPJavaSyntax >> qualifiedName [ 

	^ identifier , ((self tokenFor: '.'), identifier ) star
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> qualifiedNameList [ 

	^ qualifiedName , ((self tokenFor: ',') , qualifiedName ) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> relationalExpression [

	^  shiftExpression , 
	(relationalOperator , shiftExpression) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> relationalOperator [

	^ (self tokenFor: '<=')
	/ (self tokenFor: '>=')
	/	(self tokenFor: '<')
	/	(self tokenFor: '>')
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> returnStatement [ 

	^ (self tokenFor: 'return') , expression optional , (self tokenFor: ';')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> selector [ 

	^	(	(self tokenFor: '.') , identifier, arguments optional )
		/(	(self tokenFor: '.'), (self tokenFor: 'this'))
		/(	(self tokenFor: '.'), (self tokenFor: 'super'), superSuffix)
		/	innerCreator 
		/(	(self tokenFor: '['), expression , (self tokenFor: ']'))
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> shiftExpression [

	^ additiveExpression,
	(shiftOperator , additiveExpression) star
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> shiftOperator [ 
	self flag: 'maybe it should be detokenized, check the behavior with javac'.

	^ (self tokenFor: '<<')
	/ (self tokenFor: '>>>')
	/	(self tokenFor: '>>')
]

{ #category : #accessing }
PPJavaSyntax >> start [
	"Default start production."

	^ compilationUnit end
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> startMethodDeclaration [

	^ methodDeclaration end
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> statement [ 

	^ statementWithoutTrailingSubstatement
	/ ifStatement
	/ forStatement
	/ whileStatement
	/ tryStatement
	/ synchronizedStatement
	/ returnStatement
	/ throwStatement
	/ continueStatement
	/ labeledStatement
	
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> statementWithoutTrailingSubstatement [ 

	^ (block/ emptyStatement/ expressionStatement/assertStatement/switchStatement/ doStatement/ breakStatement).
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> superSuffix [ 

	^ arguments 
	/ (	(self tokenFor: '.'), typeArguments optional ,
		identifier ,
		arguments optional)
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> switchBlockStatementGroup [
	
	^ switchLabel , blockStatement star
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> switchLabel [ 

	^ ((self tokenFor: 'case') , expression , (self tokenFor: ':'))
	/ ((self tokenFor: 'default'), (self tokenFor: ':'))
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> switchStatement [

	^(self tokenFor: 'switch') , parExpression , 
	(self tokenFor: '{'),
		switchBlockStatementGroup star ,
	(self tokenFor: '}')
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> synchronizedStatement [ 

	^ (self tokenFor: 'synchronized') , parExpression , block
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> throwStatement [ 

	^ (self tokenFor: 'throw') , expression , (self tokenFor: ';')
]

{ #category : #'grammar-classes-method' }
PPJavaSyntax >> throws [ 

	^ (self tokenFor: 'throws') , qualifiedNameList
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> tryStatement [ 

	^ (self tokenFor: 'try') , block ,
	(	(catches , (self tokenFor: 'finally') , block)
		/ catches
		/ finally 
	).
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> type [ 

	^ (	classOrInterfaceType 
		/ primitiveType
	), 
	emptySquaredParenthesis star
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> typeArgument [ 

	^ type
	/ wildcard
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> typeArguments [ 

	^ (self tokenFor: '<') , 
		(typeArgument , ((self tokenFor: ','), typeArgument) star ) , 
	(self tokenFor: '>')
]

{ #category : #grammar }
PPJavaSyntax >> typeBound [ 

	^ type , ((self tokenFor: '&') , type) star
]

{ #category : #grammar }
PPJavaSyntax >> typeDeclaration [

	^ (self tokenFor: ';') / classOrInterfaceDeclaration
]

{ #category : #grammar }
PPJavaSyntax >> typeList [ 

	^ type , ((self tokenFor: ','), type) star
]

{ #category : #grammar }
PPJavaSyntax >> typeParameter [ 

	^ identifier , ((self tokenFor: 'extends') , typeBound) optional
]

{ #category : #grammar }
PPJavaSyntax >> typeParameters [ 

	^ (self tokenFor: '<') , 
			typeParameter , 
			((self tokenFor: ',') , typeParameter) star , 
		(self tokenFor: '>')
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> unaryExpression [ 

	^ (((self tokenFor: '++')
		/(self tokenFor: '+')
		/(self tokenFor: '--')
		/(self tokenFor: '-')),
			unaryExpression)
	/unaryExpressionNotPlusMinus
]

{ #category : #grammar }
PPJavaSyntax >> unaryExpressionNotPlusMinus [ 
	
	^ unaryNegationExpression
	 /castExpression
	 /unaryPostfixExpression
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> unaryNegationExpression [
	^ ((self tokenFor: '~') / (self tokenFor: '!')), unaryExpression
]

{ #category : #'grammar-expressions' }
PPJavaSyntax >> unaryPostfixExpression [
	^ primaryWithselectors,
	  ( (self tokenFor: '++')
	   /(self tokenFor: '--')) optional
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> variableDeclarator [ 

	^ identifier ,
	((self tokenFor: '[') , (self tokenFor: ']')) star ,
	((self tokenFor: '=') , variableInitializer) optional
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> variableDeclarators [

	^ variableDeclarator , ((self tokenFor: ','), variableDeclarator) star
]

{ #category : #grammar }
PPJavaSyntax >> variableInitializer [ 

	^	arrayInitializer 
	/	expression	
]

{ #category : #'grammar-modifiers' }
PPJavaSyntax >> variableModifiers [ 

	^((self tokenFor: 'final') 
	  / annotation) star
]

{ #category : #'grammar-statements' }
PPJavaSyntax >> whileStatement [

	^(self tokenFor: 'while') , parExpression , statement
]

{ #category : #'grammar-classes' }
PPJavaSyntax >> wildcard [ 

	^ (self tokenFor: '?') ,
		(	((self tokenFor: 'extends')/(self tokenFor: 'super')), 
			type 
		) optional
]
