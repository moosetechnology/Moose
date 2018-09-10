"
This class is an optimizing mutating node visitor that does constant folding by eliminating operator expressions that can be evaluated at compile time, including arithmetic and boolean operator expressions with literal string or number operands, and optimizes location path steps, and eliminates redundant predicates.
"
Class {
	#name : #XPathASTOptimizingMutatingNodeVisitor,
	#superclass : #XPathASTMutatingNodeVisitor,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTOptimizingMutatingNodeVisitor >> newFunctionCallForBoolean: aBoolean [
	"the XPath string value of a boolean is 'true' or 'false', the names of
	the true() and false() functions, and since these are inlined by the
	translator, we can safely infer their type"
	^ (XPathASTFunctionCallNode name: aBoolean asXPathString)
		type: XPathBooleanValueType new
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitAdditionExpression: anAdditionExpression [
	"traverse in post-order"
	super visitAdditionExpression: anAdditionExpression.

	"addition of literals can be evaluated at compile time"
	anAdditionExpression hasNonLiteralExpression
		ifTrue: [^ anAdditionExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				anAdditionExpression expression asXPathNumber +
					anAdditionExpression otherExpression asXPathNumber].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitAndExpression: anAndExpression [
	"traverse in post-order"
	super visitAndExpression: anAndExpression.

	"the 'and' of literals can be evaluated at compile time"
	anAndExpression hasNonLiteralExpression
		ifTrue: [^ anAndExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				(anAndExpression expression asXPathBoolean
					and: [anAndExpression otherExpression asXPathBoolean])]
]

{ #category : #'visiting - steps' }
XPathASTOptimizingMutatingNodeVisitor >> visitDescendantOrSelfStep: aDescendantOrSelfStep [
	"traverse in post-order"
	super visitDescendantOrSelfStep: aDescendantOrSelfStep.

	"only optimize 'descendant-or-self::node()' steps"
	(aDescendantOrSelfStep nodeTest isAnyNodeTest
		and: [aDescendantOrSelfStep hasPredicates not])
		ifTrue: [
			"if the next step after this 'descendant-or-self::node()' step is
			'self::node()' or an identical 'descendant-or-self::node()' step,
			the next step is redundant"
			[(self peekStep isDescendantOrSelfStep
				or: [self peekStep isSelfStep])
				and: [self peekStep nodeTest isAnyNodeTest
					and: [self peekStep hasPredicates not]]]
				whileTrue: [self nextStep].

			"'descendant-or-self::node()/self::...' and
			'descendant-or-self::node()/descendant-or-self::...'
			are equivalent to 'descendant-or-self::...', regardless of the
			node test, as long as the second step also has no predicates"
			((self peekStep isDescendantOrSelfStep
				or: [self peekStep isSelfStep])
				and: [self peekStep hasPredicates not])
				ifTrue: [
					^ XPathASTDescendantOrSelfStepNode nodeTest:
						self nextStep nodeTest].

			"'descendant-or-self::node()/child::...' and
			'descendant-or-self::node()/descendant::...' are
			equivalent to 'descendant::...', regardless of the node test,
			as long as the second step also has no predicates"
			((self peekStep isChildStep
				or: [self peekStep isDescendantStep])
				and: [self peekStep hasPredicates not])
				ifTrue: [
					^ XPathASTDescendantStepNode nodeTest:
						self nextStep nodeTest]].

	^ aDescendantOrSelfStep.
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitDivisionExpression: aDivisionExpression [
	"traverse in post-order"
	super visitDivisionExpression: aDivisionExpression.

	"division of literals can be evaluated at compile time"
	aDivisionExpression hasNonLiteralExpression
		ifTrue: [^ aDivisionExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				(aDivisionExpression expression asXPathNumber xpathDivision:
					aDivisionExpression otherExpression asXPathNumber)].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitEqualsExpression: anEqualsExpression [
	"traverse in post-order"
	super visitEqualsExpression: anEqualsExpression.

	"equality comparisons of literals can be evaluated at compile time"
	anEqualsExpression hasNonLiteralExpression
		ifTrue: [
			"predicate expressions like 'position()=10' and '10=position()'
			can be replaced with number literals like '10' which are easier
			to optimize"
			(anEqualsExpression hasParent
				and: [anEqualsExpression parent isPredicate])
				ifTrue: [
					anEqualsExpression expression isNumberLiteral
						ifTrue: [
							(anEqualsExpression otherExpression isFunctionCall
								and: [
									anEqualsExpression otherExpression
										isPositionFunctionCall])
								ifTrue: [^ anEqualsExpression expression]]
						ifFalse: [
							anEqualsExpression otherExpression isNumberLiteral
								ifTrue: [
									(anEqualsExpression expression isFunctionCall
										and: [
											anEqualsExpression expression
												isPositionFunctionCall])
										ifTrue: [^ anEqualsExpression otherExpression]]]].
			^ anEqualsExpression]
		ifFalse: [
			"When neither object ... is a node-set and the operator is = or != ...
			if at least one object ... is a number, then each ... is converted to
			a number ... Otherwise, both ... are converted to strings"
			(anEqualsExpression hasNumberLiteralExpression
				ifTrue: [
					^ self newFunctionCallForBoolean:
						anEqualsExpression expression asXPathNumber =
							anEqualsExpression otherExpression asXPathNumber]
				ifFalse: [
					^ self newFunctionCallForBoolean:
						anEqualsExpression expression asXPathString =
							anEqualsExpression otherExpression asXPathString])].
]

{ #category : #'visiting - location paths' }
XPathASTOptimizingMutatingNodeVisitor >> visitFilterExpression: aFilterExpression [
	"traverse in post-order"
	super visitFilterExpression: aFilterExpression.

	aFilterExpression hasPredicates
		ifFalse: [
			aFilterExpression type:
				aFilterExpression expression type].
	^ aFilterExpression.
]

{ #category : #'visiting - location paths' }
XPathASTOptimizingMutatingNodeVisitor >> visitFilterExpressionLocationPath: aFilterExpressionLocationPath [
	"traverse in post-order"
	super visitFilterExpressionLocationPath: aFilterExpressionLocationPath.

	"if it has no steps, its type is the type of the expression being filtered"
	aFilterExpressionLocationPath hasSteps
		ifFalse: [
			aFilterExpressionLocationPath type:
				aFilterExpressionLocationPath expression type].
	^ aFilterExpressionLocationPath.
]

{ #category : #'visiting - functions' }
XPathASTOptimizingMutatingNodeVisitor >> visitFunctionCall: aFunctionCall [
	"traverse in post-order"
	super visitFunctionCall: aFunctionCall.

	"these function calls are inlined by the translator, so we can infer their
	types during compilation, but all other functions can be dynamically
	rebound at runtime with XPathContext objects, so we don't infer them"
	(aFunctionCall isTrueFunctionCall
		or: [aFunctionCall isFalseFunctionCall])
		ifTrue: [aFunctionCall type: XPathBooleanValueType new]
		ifFalse: [
			(aFunctionCall isPositionFunctionCall
				or: [aFunctionCall isLastFunctionCall])
				ifTrue: [aFunctionCall type: XPathNumberValueType new]].
	^ aFunctionCall.
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitGreaterThanExpression: aGreaterThanExpression [
	"traverse in post-order"
	super visitGreaterThanExpression: aGreaterThanExpression.

	"greater than comparisons of literals can be evaluated at compile time"
	aGreaterThanExpression hasNonLiteralExpression
		ifTrue: [^ aGreaterThanExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				aGreaterThanExpression expression asXPathNumber >
					aGreaterThanExpression otherExpression asXPathNumber].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitGreaterThanOrEqualToExpression: aGreaterThanOrEqualToExpression [
	"traverse in post-order"
	super visitGreaterThanOrEqualToExpression: aGreaterThanOrEqualToExpression.

	"greater than or equal to comparisons of literals can be evaluated at
	compile time"
	aGreaterThanOrEqualToExpression hasNonLiteralExpression
		ifTrue: [^ aGreaterThanOrEqualToExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				aGreaterThanOrEqualToExpression expression asXPathNumber >=
					aGreaterThanOrEqualToExpression otherExpression asXPathNumber].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitLessThanExpression: aLessThanExpression [
	"traverse in post-order"
	super visitLessThanExpression: aLessThanExpression.

	"less than comparisons of literals can be evaluated at compile time"
	aLessThanExpression hasNonLiteralExpression
		ifTrue: [^ aLessThanExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				aLessThanExpression expression asXPathNumber <
					aLessThanExpression otherExpression asXPathNumber].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitLessThanOrEqualToExpression: aLessThanOrEqualToExpression [
	"traverse in post-order"
	super visitLessThanOrEqualToExpression: aLessThanOrEqualToExpression.

	"less than or equal to comparisons of literals can be evaluated at
	compile time"
	aLessThanOrEqualToExpression hasNonLiteralExpression
		ifTrue: [^ aLessThanOrEqualToExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				aLessThanOrEqualToExpression expression asXPathNumber <=
					aLessThanOrEqualToExpression otherExpression asXPathNumber].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitModulusExpression: aModulusExpression [
	"traverse in post-order"
	super visitModulusExpression: aModulusExpression.

	"the modulus of literals can be evaluated at compile time"
	aModulusExpression hasNonLiteralExpression
		ifTrue: [^ aModulusExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				(aModulusExpression expression asXPathNumber xpathModulus:
					aModulusExpression otherExpression asXPathNumber)]
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitMultiplicationExpression: aMultiplicationExpression [
	"traverse in post-order"
	super visitMultiplicationExpression: aMultiplicationExpression.

	"multiplication of literals can be evaluated at compile time"
	aMultiplicationExpression hasNonLiteralExpression
		ifTrue: [^ aMultiplicationExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				aMultiplicationExpression expression asXPathNumber *
					aMultiplicationExpression otherExpression asXPathNumber]
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitNegationExpression: aNegationExpression [
	"traverse in post-order"
	super visitNegationExpression: aNegationExpression.

	"the negation of a literal can be evaluated at compile time"
	aNegationExpression hasNonLiteralExpression
		ifTrue: [^ aNegationExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				aNegationExpression expression asXPathNumber negated].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitNotEqualsExpression: anNotEqualsExpression [
	"traverse in post-order"
	super visitNotEqualsExpression: anNotEqualsExpression.

	"inequality comparisons of literals can be evaluated at compile time"
	anNotEqualsExpression hasNonLiteralExpression
		ifTrue: [^ anNotEqualsExpression]
		ifFalse: [
			"When neither object ... is a node-set and the operator is = or != ...
			if at least one object ... is a number, then each ... is converted to
			a number ... Otherwise, both ... are converted to strings"
			anNotEqualsExpression hasNumberLiteralExpression
				ifTrue: [
					^ self newFunctionCallForBoolean:
						anNotEqualsExpression expression asXPathNumber ~=
							anNotEqualsExpression otherExpression asXPathNumber]
				ifFalse: [
					^ self newFunctionCallForBoolean:
						anNotEqualsExpression expression asXPathString ~=
							anNotEqualsExpression otherExpression asXPathString]].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitOrExpression: anOrExpression [
	"traverse in post-order"
	super visitOrExpression: anOrExpression.

	"the 'or' of literals can be evaluated at compile time"
	anOrExpression hasNonLiteralExpression
		ifTrue: [^ anOrExpression]
		ifFalse: [
			^ self newFunctionCallForBoolean:
				(anOrExpression expression asXPathBoolean
					or: [anOrExpression otherExpression asXPathBoolean])]
]

{ #category : #'visiting - predicates' }
XPathASTOptimizingMutatingNodeVisitor >> visitPredicate: aPredicate [
	"traverse in post-order"
	super visitPredicate: aPredicate.

	"a predicate that is just [true()] can be ignored if it's not first"
	(self previousPredicate isNull not
		and: [aPredicate expression isFunctionCall
			and: [aPredicate expression isTrueFunctionCall]])
		ifTrue: [^ XPathASTNullNode new]
		ifFalse: [^ aPredicate].
]

{ #category : #'visiting - steps' }
XPathASTOptimizingMutatingNodeVisitor >> visitSelfStep: aSelfStep [
	"traverse in post-order"
	super visitSelfStep: aSelfStep.

	"steps like 'self::node()' or '.' can be eliminated if they're not
	the first step and the previous step is a forward axis step"
	(aSelfStep nodeTest isAnyNodeTest
		and: [aSelfStep hasPredicates not
			and: [self previousStep isNull not
				and: [self previousStep isForwardAxisStep]]])
		ifTrue: [^ XPathASTNullNode new]
		ifFalse: [^ aSelfStep].
]

{ #category : #'visiting - operators' }
XPathASTOptimizingMutatingNodeVisitor >> visitSubtractionExpression: aSubtractionExpression [
	"traverse in post-order"
	super visitSubtractionExpression: aSubtractionExpression.

	"subtraction of literals can be evaluated at compile time"
	aSubtractionExpression hasNonLiteralExpression
		ifTrue: [^ aSubtractionExpression]
		ifFalse: [
			^ XPathASTNumberLiteralNode number:
				aSubtractionExpression expression asXPathNumber -
					aSubtractionExpression otherExpression asXPathNumber].
]
