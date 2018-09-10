Class {
	#name : #SwiftEnumDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'_Tokens',
		'identifierTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBracketTokens',
		'rightBracketTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens',
		'lessThanTokens',
		'colonTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'protocolTokens',
		'whereTokens',
		'equalEqualTokens',
		'importTokens',
		'typealiasTokens',
		'structTokens',
		'classTokens',
		'enumTokens',
		'varTokens',
		'funcTokens',
		'mutatingTokens',
		'nonmutatingTokens',
		'overrideTokens',
		'staticTokens',
		'unownedTokens',
		'unownedLeftParensafeRightParenTokens',
		'unownedLeftParenunsafeRightParenTokens',
		'weakTokens',
		'letTokens',
		'inializers',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'blocks',
		'getTokens',
		'setTokens',
		'periodPeriodPeriodTokens',
		'equalTokens',
		'expressions',
		'willSetTokens',
		'didSetTokens',
		'deinitTokens',
		'extensionTokens',
		'caseTokens',
		'declarations',
		'convenienceTokens',
		'initTokens',
		'inoutTokens',
		'subscriptTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftEnumDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitEnumDeclaration: self
]

{ #category : #generated }
SwiftEnumDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> blocks [
	^ blocks
]

{ #category : #generated }
SwiftEnumDeclarationNode >> blocks: anOrderedCollection [
	self setParents: self blocks to: nil.
	blocks := anOrderedCollection.
	self setParents: self blocks to: self
]

{ #category : #generated }
SwiftEnumDeclarationNode >> caseTokens [
	^ caseTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> caseTokens: anOrderedCollection [
	caseTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> classTokens [
	^ classTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> classTokens: anOrderedCollection [
	classTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> compositeNodeVariables [
	^ #(#inializers #blocks #declarations)
]

{ #category : #generated }
SwiftEnumDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #whereTokens #equalEqualTokens #importTokens #typealiasTokens #structTokens #classTokens #enumTokens #varTokens #funcTokens #mutatingTokens #nonmutatingTokens #overrideTokens #staticTokens #unownedTokens #unownedLeftParensafeRightParenTokens #unownedLeftParenunsafeRightParenTokens #weakTokens #letTokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #typeTokens #getTokens #setTokens #equalTokens #willSetTokens #didSetTokens #periodPeriodPeriodTokens #convenienceTokens #initTokens #inoutTokens #deinitTokens #extensionTokens #subscriptTokens #caseTokens)
]

{ #category : #generated }
SwiftEnumDeclarationNode >> convenienceTokens [
	^ convenienceTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> convenienceTokens: anOrderedCollection [
	convenienceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
SwiftEnumDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
SwiftEnumDeclarationNode >> deinitTokens [
	^ deinitTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> deinitTokens: anOrderedCollection [
	deinitTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> didSetTokens [
	^ didSetTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> didSetTokens: anOrderedCollection [
	didSetTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> enumTokens [
	^ enumTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> enumTokens: anOrderedCollection [
	enumTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftEnumDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> extensionTokens [
	^ extensionTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> extensionTokens: anOrderedCollection [
	extensionTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> funcTokens [
	^ funcTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> funcTokens: anOrderedCollection [
	funcTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> getTokens [
	^ getTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> getTokens: anOrderedCollection [
	getTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> importTokens [
	^ importTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> importTokens: anOrderedCollection [
	importTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> inializers [
	^ inializers
]

{ #category : #generated }
SwiftEnumDeclarationNode >> inializers: anOrderedCollection [
	self setParents: self inializers to: nil.
	inializers := anOrderedCollection.
	self setParents: self inializers to: self
]

{ #category : #generated }
SwiftEnumDeclarationNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftEnumDeclarationNode >> initialize [
	super initialize.
	_Tokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	whereTokens := OrderedCollection new: 2.
	equalEqualTokens := OrderedCollection new: 2.
	importTokens := OrderedCollection new: 2.
	typealiasTokens := OrderedCollection new: 2.
	structTokens := OrderedCollection new: 2.
	classTokens := OrderedCollection new: 2.
	enumTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	funcTokens := OrderedCollection new: 2.
	mutatingTokens := OrderedCollection new: 2.
	nonmutatingTokens := OrderedCollection new: 2.
	overrideTokens := OrderedCollection new: 2.
	staticTokens := OrderedCollection new: 2.
	unownedTokens := OrderedCollection new: 2.
	unownedLeftParensafeRightParenTokens := OrderedCollection new: 2.
	unownedLeftParenunsafeRightParenTokens := OrderedCollection new: 2.
	weakTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	inializers := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	blocks := OrderedCollection new: 2.
	getTokens := OrderedCollection new: 2.
	setTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	willSetTokens := OrderedCollection new: 2.
	didSetTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
	convenienceTokens := OrderedCollection new: 2.
	initTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	deinitTokens := OrderedCollection new: 2.
	extensionTokens := OrderedCollection new: 2.
	subscriptTokens := OrderedCollection new: 2.
	caseTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftEnumDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> mutatingTokens [
	^ mutatingTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> mutatingTokens: anOrderedCollection [
	mutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> nonmutatingTokens [
	^ nonmutatingTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> nonmutatingTokens: anOrderedCollection [
	nonmutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftEnumDeclarationNode >> overrideTokens [
	^ overrideTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> overrideTokens: anOrderedCollection [
	overrideTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> setTokens [
	^ setTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> setTokens: anOrderedCollection [
	setTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> staticTokens [
	^ staticTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> staticTokens: anOrderedCollection [
	staticTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> structTokens [
	^ structTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> structTokens: anOrderedCollection [
	structTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> subscriptTokens [
	^ subscriptTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> subscriptTokens: anOrderedCollection [
	subscriptTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> typealiasTokens [
	^ typealiasTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> typealiasTokens: anOrderedCollection [
	typealiasTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedLeftParensafeRightParenTokens [
	^ unownedLeftParensafeRightParenTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedLeftParensafeRightParenTokens: anOrderedCollection [
	unownedLeftParensafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedLeftParenunsafeRightParenTokens [
	^ unownedLeftParenunsafeRightParenTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedLeftParenunsafeRightParenTokens: anOrderedCollection [
	unownedLeftParenunsafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedTokens [
	^ unownedTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> unownedTokens: anOrderedCollection [
	unownedTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> weakTokens [
	^ weakTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> weakTokens: anOrderedCollection [
	weakTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> whereTokens [
	^ whereTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> whereTokens: anOrderedCollection [
	whereTokens := anOrderedCollection
]

{ #category : #generated }
SwiftEnumDeclarationNode >> willSetTokens [
	^ willSetTokens
]

{ #category : #generated }
SwiftEnumDeclarationNode >> willSetTokens: anOrderedCollection [
	willSetTokens := anOrderedCollection
]
