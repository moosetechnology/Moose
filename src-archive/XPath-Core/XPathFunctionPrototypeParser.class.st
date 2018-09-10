"
This class parses XPath function prototypes to extract the name, return type, and the number and type of arguments.
"
Class {
	#name : #XPathFunctionPrototypeParser,
	#superclass : #XPathParser,
	#instVars : [
		'hasOptionalArgument',
		'hasUnboundedArgument'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #private }
XPathFunctionPrototypeParser >> errorArgumentAfterUnboundedArgument [
	XPathSyntaxException signal: 'Argument after unbounded "*" argument'
]

{ #category : #private }
XPathFunctionPrototypeParser >> errorNonOptionalArgumentAfterOptional [
	XPathSyntaxException signal: 'Non-optional argument afer optional "?" argument'
]

{ #category : #private }
XPathFunctionPrototypeParser >> errorUnboundedArgumentAfterOptional [
	XPathSyntaxException signal: 'Unbounded "*" argument after optional "?" argument'
]

{ #category : #parsing }
XPathFunctionPrototypeParser >> nextArgument [
	hasUnboundedArgument
		ifTrue: [self errorArgumentAfterUnboundedArgument].

	readStream skipSeparators.
	self nextModifierForArgument: self nextName.
]

{ #category : #parsing }
XPathFunctionPrototypeParser >> nextFunctionName [
	readStream skipSeparators.
	handler handleFunctionName: self nextName.
]

{ #category : #parsing }
XPathFunctionPrototypeParser >> nextModifierForArgument: anArgument [
	readStream skipSeparators.
	(readStream peekFor: $*)
		ifTrue: [
			hasOptionalArgument
				ifTrue: [self errorUnboundedArgumentAfterOptional].
			hasUnboundedArgument := true.
			handler handleUnboundedArgument: anArgument]
		ifFalse: [
			(readStream peekFor: $?)
				ifTrue: [
					hasOptionalArgument := true.
					handler handleOptionalArgument: anArgument]
				ifFalse: [
					hasOptionalArgument
						ifTrue: [self errorNonOptionalArgumentAfterOptional].
					handler handleArgument: anArgument]].
]

{ #category : #parsing }
XPathFunctionPrototypeParser >> nextReturnType [
	readStream skipSeparators.
	handler handleReturnType: self nextName.
]

{ #category : #parsing }
XPathFunctionPrototypeParser >> parseInput [
	hasOptionalArgument := false.
	hasUnboundedArgument := false.

	self
		nextReturnType;
		nextFunctionName;
		nextArgumentList.
]
