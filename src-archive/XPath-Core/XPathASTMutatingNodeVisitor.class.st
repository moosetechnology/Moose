"
This class is a rewriting node visitor that can replace any node in the tree with the result of its #visit*: message.
"
Class {
	#name : #XPathASTMutatingNodeVisitor,
	#superclass : #XPathASTNodeVisitor,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'visiting - location paths' }
XPathASTMutatingNodeVisitor >> visitFilterable: aFilterable [
	aFilterable hasPredicates
		ifTrue: [| oldPredicateIterator  predicates |
			oldPredicateIterator := predicateIterator.
			predicateIterator :=
				XPathASTNodeVisitorIterator on: aFilterable predicates.
			predicates := OrderedCollection new: aFilterable totalPredicates.
			[predicateIterator atEnd]
				whileFalse: [| predicate |
					(predicate := predicateIterator visitNextWith: self) isNull
						ifFalse: [predicates addLast: predicate]].
			aFilterable predicates: predicates.
			predicateIterator := oldPredicateIterator].
	^ aFilterable.
]

{ #category : #'visiting - functions' }
XPathASTMutatingNodeVisitor >> visitFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [| oldArgumentIterator arguments |
			oldArgumentIterator := argumentIterator.
			argumentIterator :=
				XPathASTNodeVisitorIterator on: aFunctionCall arguments.
			arguments := OrderedCollection new: aFunctionCall totalArguments.
			[argumentIterator atEnd]
				whileFalse: [| argument |
					(argument := argumentIterator visitNextWith: self) isNull
						ifFalse: [arguments addLast: argument]].
			aFunctionCall arguments: arguments.
			argumentIterator := oldArgumentIterator].
	^ aFunctionCall.
]

{ #category : #'visiting - location paths' }
XPathASTMutatingNodeVisitor >> visitLocationPath: aLocationPath [
	aLocationPath hasSteps
		ifTrue: [| oldStepIterator steps |
			oldStepIterator := stepIterator.
			stepIterator := XPathASTNodeVisitorIterator on: aLocationPath steps.
			steps := OrderedCollection new: aLocationPath totalSteps.
			[stepIterator atEnd]
				whileFalse: [| step |
					(step := stepIterator visitNextWith: self) isNull
						ifFalse: [steps addLast: step]].
			aLocationPath steps: steps.
			stepIterator := oldStepIterator].
	^ aLocationPath.
]

{ #category : #visiting }
XPathASTMutatingNodeVisitor >> visitNodeWithExpression: aNodeWithExpression [
	aNodeWithExpression expression:
		(aNodeWithExpression expression acceptNodeVisitor: self).
	^ aNodeWithExpression.
]

{ #category : #visiting }
XPathASTMutatingNodeVisitor >> visitNodeWithOtherExpression: aNodeWithOtherExpression [
	self visitNodeWithExpression: aNodeWithOtherExpression.
	aNodeWithOtherExpression otherExpression:
		(aNodeWithOtherExpression otherExpression acceptNodeVisitor: self).
	^ aNodeWithOtherExpression.
]

{ #category : #'visiting - steps' }
XPathASTMutatingNodeVisitor >> visitStep: aStep [
	aStep nodeTest: (aStep nodeTest acceptNodeVisitor: self).
	^ self visitFilterable: aStep.
]
