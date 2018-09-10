"
This class is a writing AST visitor that translates the AST to Smalltalk source code and an array of node test objects that can be compiled. The resulting XPathTranslatedExpression object can be accessed with #translatedExpression after sending #visitNode: to the AST root.
"
Class {
	#name : #XPathASTTranslatingWritingNodeVisitor,
	#superclass : #XPathASTWritingNodeVisitor,
	#instVars : [
		'contextBlockVariables',
		'contextBlockIndex',
		'nodeTests'
	],
	#classVars : [
		'InlinedFunctionNamesAndSelectors'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'class initialization' }
XPathASTTranslatingWritingNodeVisitor class >> initialize [
	"self initialize"

	InlinedFunctionNamesAndSelectors :=
		Dictionary new
			at: 'true' put: #emitInlinedTrueFunctionCall:;
			at: 'false' put: #emitInlinedFalseFunctionCall:;
			at: 'position' put: #emitInlinedPositionFunctionCall:;
			at: 'last' put: #emitInlinedLastFunctionCall:;
			yourself
]

{ #category : #testing }
XPathASTTranslatingWritingNodeVisitor >> canEmitAsPredicateStep: aStep [
	^ (self peekStep isNull
		and: [aStep hasPredicates not
			and: [aStep isPredicateLocationPathStep]])
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> contextBlockVariableAt: anIndex [
	^ (contextBlockVariables
		ifNil: [self generateNewContextBlockVariables])
			at: anIndex
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> contextNodeVariable [
	^ self contextBlockVariableAt: 1
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> contextPositionVariable [
	^ self contextBlockVariableAt: 2
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> contextSizeVariable [
	^ self contextBlockVariableAt: 3
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> contextVariable [
	"the XPathContext variable doesn't change during evaluation"
	^ 'c'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> documentRootVariable [
	"the document root variable doesn't change during evaluation"
	^ 'r'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitBinaryArithmeticExpression: aBinaryExpression withOperator: aSelectorString [
	self emit: $(.
	(aBinaryExpression expression
		acceptNodeVisitor: self;
		type) isNumberValueType
		ifFalse: [self emitNumberConversion].

	self
		emitSpace;
		emitAll: aSelectorString.

	(aBinaryExpression otherExpression
		acceptNodeVisitor: self;
		type) isNumberValueType
		ifFalse: [self emitNumberConversion].
	self emit: $).

	^ aBinaryExpression.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitBinaryEqualityExpression: aBinaryExpression withOperator: aSelectorString [
	| omitComparableConversions |

	"Smalltalk strings, numbers, and booleans have = and ~= selectors that behave
	like the XPath spec requires when the argument is the same type, so no
	comparable converion is needed, but cross-type comparisons and comparisons
	between node sets need to be handled with comparables"
	omitComparableConversions :=
		(aBinaryExpression expression type isNumberValueType
			or: [aBinaryExpression expression type isStringValueType
				or: [aBinaryExpression expression type isBooleanValueType]])
			and: [
				aBinaryExpression expression type =
					aBinaryExpression otherExpression type].

	self emit: $(.
	aBinaryExpression expression acceptNodeVisitor: self.
	omitComparableConversions
		ifFalse: [self emitComparableConversion].

	self
		emitSpace;
		emitAll: aSelectorString.

	aBinaryExpression otherExpression acceptNodeVisitor: self.
	omitComparableConversions
		ifFalse: [self emitComparableConversion].
	self emit: $).

	^ aBinaryExpression.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitBinaryRelationalExpression: aBinaryExpression withOperator: aSelectorString [
	| omitComparableConversions |

	"if neither subexpression is of node set type, then comparable
	conversions aren't needed, and converting non-numbers to numbers
	is enough."
	omitComparableConversions :=
		aBinaryExpression expression type isNodeSetValueType not
			and: [aBinaryExpression otherExpression type isNodeSetValueType not].

	self emit: $(.
	aBinaryExpression expression acceptNodeVisitor: self.
	omitComparableConversions
		ifTrue: [
			aBinaryExpression expression type isNumberValueType
				ifFalse: [self emitNumberConversion]]
		ifFalse: [self emitComparableConversion].

	self
		emitSpace;
		emitAll: aSelectorString.

	aBinaryExpression otherExpression acceptNodeVisitor: self.
	omitComparableConversions
		ifTrue: [
			aBinaryExpression otherExpression type isNumberValueType
				ifFalse: [self emitNumberConversion]]
		ifFalse: [self emitComparableConversion].
	self emit: $).

	^ aBinaryExpression.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitBinaryShortCircuitExpression: aBinaryExpression withOperator: aSelectorString [
	self emit: $(.
	(aBinaryExpression expression
		acceptNodeVisitor: self;
		type) isBooleanValueType
		ifFalse: [self emitBooleanConversion].

	self
		emitSpace;
		emitAll: aSelectorString;
		emit: $[.

	(aBinaryExpression otherExpression
		acceptNodeVisitor: self;
		type) isBooleanValueType
		ifFalse: [self emitBooleanConversion].
	self emitAll: '])'.

	^ aBinaryExpression.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitBooleanConversion [
	self emitAll: ' asXPathBoolean'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitComparableConversion [
	self emitAll: ' asXPathComparable'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitEndBlock [
	self emit: $]
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitInitializingDocumentRootVariableReference [
	self
		emit: $(;
		emitAll: self documentRootVariable;
		emitAll: ' ifNil:[';
		emitAll: self documentRootVariable;
		emitAll: ':=';
		emitAll: self contextNodeVariable;
		emitAll: ' documentRoot])'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitInlinedFalseFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [self errorFalseFunctionTakesNoArguments].
	self emitAll: '(false)'.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitInlinedLastFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [self errorLastFunctionTakesNoArguments].
	self
		emit: $(;
		emitAll: self contextSizeVariable;
		emitAll: ' ifNil:[1])'.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitInlinedPositionFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [self errorPositionFunctionTakesNoArguments].
	self
		emit: $(;
		emitAll: self contextPositionVariable;
		emitAll: ' ifNil:[1])'.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitInlinedTrueFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [self errorTrueFunctionTakesNoArguments].
	self emitAll: '(true)'.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitNodeSetSortForLocationPath: aLocationPath [
	(aLocationPath hasSteps
		and: [aLocationPath isPredicateLocationPath not])
		ifTrue: [self emitAll: ' sort']
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitNumberConversion [
	self emitAll: ' asXPathNumber'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitNumberLiteral: anIntegerOrFloatString [
	self
		emit: $(;
		emitAll: anIntegerOrFloatString;
		emit: $)
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitPredicateSeparator [
	self emit: $.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitQuotedString: aString [
	self emit: $'.
	"use #to:do: for speed"
	1 to: aString size do: [:i | | nextChar |
		"escape $' by outputting another $' before it"
		(nextChar := aString at: i) == $'
			ifTrue: [self emit: $'].
		self emit: nextChar].
	self emit: $'.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitStartContextBlock [
	self
		emitAll: '[:';
		emitAll: self contextNodeVariable;
		emitAll: ' :';
		emitAll: self contextVariable;
		emitAll: ' :';
		emitAll: self nodeTestsVariable;
		emitAll: '| |';
		emitAll: self contextPositionVariable;
		emitSpace;
		emitAll: self contextSizeVariable;
		emitSpace;
		emitAll: self documentRootVariable;
		emit: $|
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitStartGroupingsForLocationPath: aLocationPath [
	aLocationPath hasSteps
		ifTrue: [
			1 to: aLocationPath steps size do: [:i |
				self emit: $(]]
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitStartPredicateBlock [
	self
		emitAll: '[:';
		emitAll: self contextNodeVariable;
		emitAll: ' :';
		emitAll: self contextPositionVariable;
		emitAll: ' :';
		emitAll: self contextSizeVariable;
		emit: $|
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> emitUnionableConversion [
	self emitAll: ' asXPathUnionable'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> errorFalseFunctionTakesNoArguments [
	self errorFunctionTakesNoArguments: 'false'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> errorFunctionTakesNoArguments: aFunctionName [
	XPathArgumentNumberException
		formatSignal: 'The {1}() function takes no arguments'
		with: aFunctionName
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> errorLastFunctionTakesNoArguments [
	self errorFunctionTakesNoArguments: 'last'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> errorPositionFunctionTakesNoArguments [
	self errorFunctionTakesNoArguments: 'position'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> errorTrueFunctionTakesNoArguments [
	self errorFunctionTakesNoArguments: 'true'
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> generateNewContextBlockIndex [
	^ contextBlockIndex := contextBlockIndex + 1
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> generateNewContextBlockVariables [
	| indexString |

	indexString := self generateNewContextBlockIndex asString.
	^ contextBlockVariables :=
		Array
			with: (indexString copyWithFirst: $n) "node variable"
			with: (indexString copyWithFirst: $p) "position variable"
			with: (indexString copyWithFirst: $s). "size variable"
]

{ #category : #initialization }
XPathASTTranslatingWritingNodeVisitor >> initialize [
	super initialize.

	contextBlockIndex := 0.
	nodeTests := OrderedCollection new.
]

{ #category : #private }
XPathASTTranslatingWritingNodeVisitor >> nodeTestsVariable [
	^ 't'
]

{ #category : #accessing }
XPathASTTranslatingWritingNodeVisitor >> translatedExpression [
	^ XPathTranslatedExpression
		sourceCode: self contents
		nodeTests: nodeTests
]

{ #category : #'visiting - location paths' }
XPathASTTranslatingWritingNodeVisitor >> visitAbsoluteLocationPath: anAbsoluteLocationPath [
	self
		emit: $(;
		emitStartGroupingsForLocationPath: anAbsoluteLocationPath;
		emitInitializingDocumentRootVariableReference.
	super visitAbsoluteLocationPath: anAbsoluteLocationPath.
	self
		emit: $);
		emitNodeSetSortForLocationPath: anAbsoluteLocationPath.
	^ anAbsoluteLocationPath.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitAdditionExpression: anAdditionExpression [
	^ self
		emitBinaryArithmeticExpression: anAdditionExpression
		withOperator: '+'
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitAncestorOrSelfStep: anAncestorOrSelfStep [
	(self canEmitAsPredicateStep: anAncestorOrSelfStep)
		ifTrue: [self emitAll: ' ancestorOrSelfAxisAnySatisfy:']
		ifFalse: [self emitAll: ' ancestorOrSelfAxis:'].
	^ super visitAncestorOrSelfStep: anAncestorOrSelfStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitAncestorStep: anAncestorStep [
	(self canEmitAsPredicateStep: anAncestorStep)
		ifTrue: [self emitAll: ' ancestorAxisAnySatisfy:']
		ifFalse: [self emitAll: ' ancestorAxis:'].
	^ super visitAncestorStep: anAncestorStep.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitAndExpression: anAndExpression [
	^ self
		emitBinaryShortCircuitExpression: anAndExpression
		withOperator: 'and:'
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAnyNodeTest: anAnyNodeTest [
	nodeTests addLast: XPathAnyNodeTest new.
	^ super visitAnyNodeTest: anAnyNodeTest.
]

{ #category : #'visiting - functions' }
XPathASTTranslatingWritingNodeVisitor >> visitArgument: anArgument [
	super visitArgument: anArgument.
	self emit: $..
	^ anArgument.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTest: anAttributeNodeTest [
	nodeTests addLast: XPathAttributeNodeTest new.
	^ super visitAttributeNodeTest: anAttributeNodeTest.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForLocalName: anAttributeNodeTestForLocalName [
	nodeTests addLast:
		(XPathAttributeNodeTestForLocalName localName:
			anAttributeNodeTestForLocalName localName).
	^ super visitAttributeNodeTestForLocalName: anAttributeNodeTestForLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForName: anAttributeTestForName [
	nodeTests addLast:
		(XPathAttributeNodeTestForName name:
			anAttributeTestForName name).
	^ super visitAttributeNodeTestForName: anAttributeTestForName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForNamespaceURI: anAttributeNodeTestForNamespaceURI [
	nodeTests addLast:
		(XPathAttributeNodeTestForNamespaceURI namespaceURI:
			anAttributeNodeTestForNamespaceURI namespaceURI).
	^ super visitAttributeNodeTestForNamespaceURI:
		anAttributeNodeTestForNamespaceURI.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForNamespaceURIAndLocalName: anAttributeNodeTestForNamespaceURIAndLocalName [
	nodeTests addLast:
		(XPathAttributeNodeTestForNamespaceURIAndLocalName
			namespaceURI: anAttributeNodeTestForNamespaceURIAndLocalName namespaceURI
			localName: anAttributeNodeTestForNamespaceURIAndLocalName localName).
	^ super visitAttributeNodeTestForNamespaceURIAndLocalName:
		anAttributeNodeTestForNamespaceURIAndLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForPrefix: anAttributeNodeTestForPrefix [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' attributeTestForPrefix:''';
		emitAll: anAttributeNodeTestForPrefix prefix;
		emitAll: ''')'.
	^ super visitAttributeNodeTestForPrefix: anAttributeNodeTestForPrefix.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeNodeTestForPrefixAndLocalName: anAttributeNodeTestForPrefixAndLocalName [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' attributeTestForPrefix:''';
		emitAll: anAttributeNodeTestForPrefixAndLocalName prefix;
		emitAll: '''localName:''';
		emitAll: anAttributeNodeTestForPrefixAndLocalName localName;
		emitAll: ''')'.
	^ super visitAttributeNodeTestForPrefixAndLocalName:
		anAttributeNodeTestForPrefixAndLocalName.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitAttributeStep: anAttributeStep [
	(self canEmitAsPredicateStep: anAttributeStep)
		ifTrue: [self emitAll: ' attributeAxisAnySatisfy:']
		ifFalse: [self emitAll: ' attributeAxis:'].
	^ super visitAttributeStep: anAttributeStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitChildStep: aChildStep [
	(self canEmitAsPredicateStep: aChildStep)
		ifTrue: [self emitAll: ' childAxisAnySatisfy:']
		ifFalse: [self emitAll: ' childAxis:'].
	^ super visitChildStep: aChildStep.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitCommentNodeTest: aCommentNodeTest [
	nodeTests addLast: XPathCommentNodeTest new.
	^ super visitCommentNodeTest: aCommentNodeTest.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitDescendantOrSelfStep: aDescendantOrSelfStep [
	(self canEmitAsPredicateStep: aDescendantOrSelfStep)
		ifTrue: [self emitAll: ' descendantOrSelfAxisAnySatisfy:']
		ifFalse: [self emitAll: ' descendantOrSelfAxis:'].
	^ super visitDescendantOrSelfStep: aDescendantOrSelfStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitDescendantStep: aDescendantStep [
	(self canEmitAsPredicateStep: aDescendantStep)
		ifTrue: [self emitAll: ' descendantAxisAnySatisfy:']
		ifFalse: [self emitAll: ' descendantAxis:'].
	^ super visitDescendantStep: aDescendantStep.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitDivisionExpression: aDivisionExpression [
	^ self
		emitBinaryArithmeticExpression: aDivisionExpression
		withOperator: 'xpathDivision:'
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTest: anElementNodeTest [
	nodeTests addLast: XPathElementNodeTest new.
	^ super visitElementNodeTest: anElementNodeTest.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForLocalName: anElementNodeTestForLocalName [
	nodeTests addLast:
		(XPathElementNodeTestForLocalName localName:
			anElementNodeTestForLocalName localName).
	^ super visitElementNodeTestForLocalName: anElementNodeTestForLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForName: anElementNodeTestForName [
	nodeTests addLast:
		(XPathElementNodeTestForName name:
			anElementNodeTestForName name).
	^ super visitElementNodeTestForName: anElementNodeTestForName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForNamespaceURI: anElementNodeTestForNamespaceURI [
	nodeTests addLast:
		(XPathElementNodeTestForNamespaceURI namespaceURI:
			anElementNodeTestForNamespaceURI namespaceURI).
	^ super visitElementNodeTestForNamespaceURI:
		anElementNodeTestForNamespaceURI.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForNamespaceURIAndLocalName: anElementNodeTestForNamespaceURIAndLocalName [
	nodeTests addLast:
		(XPathElementNodeTestForNamespaceURIAndLocalName
			namespaceURI: anElementNodeTestForNamespaceURIAndLocalName namespaceURI
			localName: anElementNodeTestForNamespaceURIAndLocalName localName).
	^ super visitElementNodeTestForNamespaceURIAndLocalName:
		anElementNodeTestForNamespaceURIAndLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForPrefix: anElementNodeTestForPrefix [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' elementTestForPrefix:''';
		emitAll: anElementNodeTestForPrefix prefix;
		emitAll: ''')'.
	^ super visitElementNodeTestForPrefix: anElementNodeTestForPrefix.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitElementNodeTestForPrefixAndLocalName: anElementNodeTestForPrefixAndLocalName [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' elementTestForPrefix:''';
		emitAll: anElementNodeTestForPrefixAndLocalName prefix;
		emitAll: '''localName:''';
		emitAll: anElementNodeTestForPrefixAndLocalName localName;
		emitAll: ''')'.
	^ super visitElementNodeTestForPrefixAndLocalName:
		anElementNodeTestForPrefixAndLocalName.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitEqualsExpression: anEqualsExpression [
	^ self
		emitBinaryEqualityExpression: anEqualsExpression
		withOperator: '='
]

{ #category : #visiting }
XPathASTTranslatingWritingNodeVisitor >> visitExpressionRoot: anExpressionRoot [
	self
		generateNewContextBlockVariables;
		emitStartContextBlock.
	super visitExpressionRoot: anExpressionRoot.
	self emitEndBlock.
	^ anExpressionRoot.
]

{ #category : #'visiting - location paths' }
XPathASTTranslatingWritingNodeVisitor >> visitFilterExpression: aFilterExpression [
	self emit: $(.
	super visitFilterExpression: aFilterExpression.
	self emit: $).
	^ aFilterExpression.
]

{ #category : #'visiting - location paths' }
XPathASTTranslatingWritingNodeVisitor >> visitFilterExpressionLocationPath: aFilterExpressionLocationPath [
	self
		emit: $(;
		emitStartGroupingsForLocationPath: aFilterExpressionLocationPath.
	aFilterExpressionLocationPath expression acceptNodeVisitor: self.
	self
		emitAll: ' asXPathFilterExpressionLocationPathRoot';
		visitLocationPath: aFilterExpressionLocationPath;
		emit: $);
		emitNodeSetSortForLocationPath: aFilterExpressionLocationPath.
	^ aFilterExpressionLocationPath.
]

{ #category : #'visiting - location paths' }
XPathASTTranslatingWritingNodeVisitor >> visitFilterable: aFilterable [
	aFilterable hasPredicates
		ifTrue: [
			self emitAll:
				(aFilterable isFilterExpression
					ifTrue: [' asXPathFilterExpressionPredicateRoot filterWithAll:{']
					ifFalse: [' predicates:{']).
			super visitFilterable: aFilterable.
			self emit: $}]
		ifFalse: [super visitFilterable: aFilterable].
	^ aFilterable.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitFollowingSiblingStep: aFollowingSiblingStep [
	(self canEmitAsPredicateStep: aFollowingSiblingStep)
		ifTrue: [self emitAll: ' followingSiblingAxisAnySatisfy:']
		ifFalse: [self emitAll: ' followingSiblingAxis:'].
	^ super visitFollowingSiblingStep: aFollowingSiblingStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitFollowingStep: aFollowingStep [
	(self canEmitAsPredicateStep: aFollowingStep)
		ifTrue: [self emitAll: ' followingAxisAnySatisfy:']
		ifFalse: [self emitAll: ' followingAxis:'].
	^ super visitFollowingStep: aFollowingStep.
]

{ #category : #'visiting - functions' }
XPathASTTranslatingWritingNodeVisitor >> visitFunctionCall: aFunctionCall [
	InlinedFunctionNamesAndSelectors
		at: aFunctionCall name
		ifPresent: [:selector |
			self
				perform: selector
				with: aFunctionCall.
			^ aFunctionCall].

	self
		emitAll: '((';
		emitAll: self contextVariable;
		emitAll: ' resolveFunctionReference: ''';
		emitAll: aFunctionCall name;
		emitAll: ''' contextNode: ';
		emitAll: self contextNodeVariable;
		emitAll: ' arguments: {'.
	super visitFunctionCall: aFunctionCall.
	self emitAll: '})invoke)'.
	^ aFunctionCall.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitGreaterThanExpression: aGreaterThanExpression [
	^ self
		emitBinaryRelationalExpression: aGreaterThanExpression
		withOperator: '>'
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitGreaterThanOrEqualToExpression: aGreaterThanOrEqualToExpression [
	^ self
		emitBinaryRelationalExpression: aGreaterThanOrEqualToExpression
		withOperator: '>='
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitLessThanExpression: aLessThanExpression [
	^ self
		emitBinaryRelationalExpression: aLessThanExpression
		withOperator: '<'
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitLessThanOrEqualToExpression: aLessThanOrEqualToExpression [
	^ self
		emitBinaryRelationalExpression: aLessThanOrEqualToExpression
		withOperator: '<='
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitModulusExpression: aModulusExpression [
	^ self
		emitBinaryArithmeticExpression: aModulusExpression
		withOperator: 'xpathModulus:'
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitMultiplicationExpression: aMultiplicationExpression [
	^ self
		emitBinaryArithmeticExpression: aMultiplicationExpression
		withOperator: '*'
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTest: aNamespaceNodeTest [
	nodeTests addLast: XPathNamespaceTest new.
	^ super visitNamespaceNodeTest: aNamespaceNodeTest.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForLocalName: aNamespaceNodeTestForLocalName [
	nodeTests addLast:
		(XPathNamespaceTestForLocalName localName:
			aNamespaceNodeTestForLocalName localName).
	^ super visitNamespaceNodeTestForLocalName: aNamespaceNodeTestForLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForName: aNamespaceNodeTestForName [
	nodeTests addLast:
		(XPathNamespaceTestForName name:
			aNamespaceNodeTestForName name).
	^ super visitNamespaceNodeTestForName: aNamespaceNodeTestForName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForNamespaceURI: aNamespaceNodeTestForNamespaceURI [
	nodeTests addLast:
		(XPathNamespaceTestForNamespaceURI namespaceURI:
			aNamespaceNodeTestForNamespaceURI namespaceURI).
	^ super visitNamespaceNodeTestForNamespaceURI:
		aNamespaceNodeTestForNamespaceURI.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForNamespaceURIAndLocalName: aNamespaceNodeTestForNamespaceURIAndLocalName [
	nodeTests addLast:
		(XPathNamespaceTestForNamespaceURIAndLocalName
			namespaceURI: aNamespaceNodeTestForNamespaceURIAndLocalName namespaceURI
			localName: aNamespaceNodeTestForNamespaceURIAndLocalName localName).
	^ super visitNamespaceNodeTestForNamespaceURIAndLocalName:
		aNamespaceNodeTestForNamespaceURIAndLocalName.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForPrefix: aNamespaceNodeTestForPrefix [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' namespaceTestForPrefix:''';
		emitAll: aNamespaceNodeTestForPrefix prefix;
		emitAll: ''')'.
	^ super visitNamespaceNodeTestForPrefix: aNamespaceNodeTestForPrefix.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceNodeTestForPrefixAndLocalName: aNamespaceNodeTestForPrefixAndLocalName [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' namespaceTestForPrefix:''';
		emitAll: aNamespaceNodeTestForPrefixAndLocalName prefix;
		emitAll: '''localName:''';
		emitAll: aNamespaceNodeTestForPrefixAndLocalName localName;
		emitAll: ''')'.
	^ super visitNamespaceNodeTestForPrefixAndLocalName:
		aNamespaceNodeTestForPrefixAndLocalName.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitNamespaceStep: aNamespaceStep [
	(self canEmitAsPredicateStep: aNamespaceStep)
		ifTrue: [self emitAll: ' namespaceAxisAnySatisfy:']
		ifFalse: [self emitAll: ' namespaceAxis:'].
	^ super visitNamespaceStep: aNamespaceStep.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitNegationExpression: aNegationExpression [
	self emit: $(.
	super visitNegationExpression: aNegationExpression.
	aNegationExpression expression type isNumberValueType
		ifFalse: [self emitNumberConversion].
	self emitAll: ' negated)'.
	^ aNegationExpression.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitNodeTest: aNodeTest [
	(aNodeTest isAttributeNodeTestForPrefix
		or: [aNodeTest isElementNodeTestForPrefix
			or: [aNodeTest isNamespaceNodeTestForPrefix]])
		ifFalse: [
			self
				emit: $(;
				emitAll: self nodeTestsVariable;
				emitAll: ' at:';
				emitAll: nodeTests size asString;
				emit: $)]
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitNotEqualsExpression: aNotEqualsExpression [
	^ self
		emitBinaryEqualityExpression: aNotEqualsExpression
		withOperator: '~='
]

{ #category : #'visiting - literals' }
XPathASTTranslatingWritingNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	| number |

	"can't just use #asXPathString here because we don't want the XPath string
	representation, but a self-evaluating Smalltalk representation, so NaN
	is rendered like 'Float nan' and not 'NaN', and can't just use #asString
	either because older implementations aren't self-evaluating for NaN and
	inifinity"
	(number := aNumberLiteral number) isNaN
		ifTrue: [self emitNumberLiteral: 'Float nan']
		ifFalse: [
			number isInfinite
				ifTrue: [
					number negative
						ifTrue: [self emitNumberLiteral: 'Float xpathNegativeInfinity']
						ifFalse: [self emitNumberLiteral: 'Float infinity']]
				ifFalse: [
					number isZero
						ifTrue: [
							number isXPathNegativeZero
								ifTrue: [
									self emitNumberLiteral: 'Float xpathNegativeZero']
								ifFalse: [self emitNumberLiteral: '0.0']]
						ifFalse: [
							"#asString should be OK for all others"
							self emitNumberLiteral: number asString]]].
	^ aNumberLiteral.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitOrExpression: anOrExpression [
	^ self
		emitBinaryShortCircuitExpression: anOrExpression
		withOperator: 'or:'
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitPINodeTest: aPINodeTest [
	nodeTests addLast: XPathPINodeTest new.
	^ super visitPINodeTest: aPINodeTest.
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitPINodeTestForName: aPINodeTestForName [
	nodeTests addLast:
		(XPathPINodeTestForName name: aPINodeTestForName name).
	^ super visitPINodeTestForName: aPINodeTestForName.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitParentStep: aParentStep [
	(self canEmitAsPredicateStep: aParentStep)
		ifTrue: [self emitAll: ' parentAxisAnySatisfy:']
		ifFalse: [self emitAll: ' parentAxis:'].
	^ super visitParentStep: aParentStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitPrecedingSiblingStep: aPrecedingSiblingStep [
	(self canEmitAsPredicateStep: aPrecedingSiblingStep)
		ifTrue: [self emitAll: ' precedingSiblingAxisAnySatisfy:']
		ifFalse: [self emitAll: ' precedingSiblingAxis:'].
	^ super visitPrecedingSiblingStep: aPrecedingSiblingStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitPrecedingStep: aPrecedingStep [
	(self canEmitAsPredicateStep: aPrecedingStep)
		ifTrue: [self emitAll: ' precedingAxisAnySatisfy:']
		ifFalse: [self emitAll: ' precedingAxis:'].
	^ super visitPrecedingStep: aPrecedingStep.
]

{ #category : #'visiting - predicates' }
XPathASTTranslatingWritingNodeVisitor >> visitPredicate: aPredicate [
	"number predicates like [1] can be inlined without outputting a
	predicate block"
	aPredicate expression isNumberLiteral
		ifTrue: [super visitPredicate: aPredicate]
		ifFalse: [| oldContextBlockVariables |
			oldContextBlockVariables := contextBlockVariables.
			self
				generateNewContextBlockVariables;
				emitStartPredicateBlock.
			super visitPredicate: aPredicate.
			self emitEndBlock.
			contextBlockVariables := oldContextBlockVariables].
	self emitPredicateSeparator.
	^ aPredicate.
]

{ #category : #'visiting - location paths' }
XPathASTTranslatingWritingNodeVisitor >> visitRelativeLocationPath: aRelativeLocationPath [
	self
		emit: $(;
		emitStartGroupingsForLocationPath: aRelativeLocationPath;
		emitAll: self contextNodeVariable.
	super visitRelativeLocationPath: aRelativeLocationPath.
	self
		emit: $);
		emitNodeSetSortForLocationPath: aRelativeLocationPath.
	^ aRelativeLocationPath.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitSelfStep: aSelfStep [
	(self canEmitAsPredicateStep: aSelfStep)
		ifTrue: [self emitAll: ' selfAxisAnySatisfy:']
		ifFalse: [self emitAll: ' selfAxis:'].
	^ super visitSelfStep: aSelfStep.
]

{ #category : #'visiting - steps' }
XPathASTTranslatingWritingNodeVisitor >> visitStep: aStep [
	super visitStep: aStep.
	self emit: $).
	^ aStep.
]

{ #category : #'visiting - literals' }
XPathASTTranslatingWritingNodeVisitor >> visitStringLiteral: aStringLiteral [
	self emitQuotedString: aStringLiteral string.
	^ aStringLiteral.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitSubtractionExpression: aSubtractionExpression [
	^ self
		emitBinaryArithmeticExpression: aSubtractionExpression
		withOperator: '-'
]

{ #category : #'visiting - node tests' }
XPathASTTranslatingWritingNodeVisitor >> visitTextNodeTest: aTextNodeTest [
	nodeTests addLast: XPathTextNodeTest new.
	^ super visitTextNodeTest: aTextNodeTest.
]

{ #category : #'visiting - operators' }
XPathASTTranslatingWritingNodeVisitor >> visitUnionExpression: aUnionExpression [
	self emit: $(.
	(aUnionExpression expression
		acceptNodeVisitor: self;
		type) isNodeSetValueType
		ifFalse: [self emitUnionableConversion].

	self emit: $|.

	(aUnionExpression otherExpression
		acceptNodeVisitor: self;
		type) isNodeSetValueType
		ifFalse: [self emitUnionableConversion].
	self emit: $).

	^ aUnionExpression.
]

{ #category : #'visiting - variables' }
XPathASTTranslatingWritingNodeVisitor >> visitVariableReference: aVariableReference [
	self
		emit: $(;
		emitAll: self contextVariable;
		emitAll: ' resolveVariableReference: ''';
		emitAll: aVariableReference name;
		emitAll: ''')'.
	^ aVariableReference.
]
