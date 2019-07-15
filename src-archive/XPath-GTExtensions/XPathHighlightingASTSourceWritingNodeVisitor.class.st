"
This class is a highlighting writing AST visitor that writes the AST as highlighted XPath source code that can be parsed by an XPathExpressionParser or converted to a Text object with #asHighlightedText.
"
Class {
	#name : #XPathHighlightingASTSourceWritingNodeVisitor,
	#superclass : #XPathASTSourceWritingNodeVisitor,
	#instVars : [
		'highlighter'
	],
	#category : #'XPath-GTExtensions-Highlighting-AST'
}

{ #category : #converting }
XPathHighlightingASTSourceWritingNodeVisitor >> asHighlightedText [
	| text |

	text := self contents asText.
	highlighter highlightText: text.
	^ text.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> emitArgumentSeparator [
	super emitArgumentSeparator.
	highlighter endFunctionCallHighlightPosition: self endPosition.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> emitAxisName: anAxisNameStringOrCharacter [
	highlighter startAxisHighlightPosition: self startPosition.
	super emitAxisName: anAxisNameStringOrCharacter.
	highlighter endAxisHighlightPosition: self endPosition.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> emitNodeTest: aNodeTest withNameTest: aNameTestString [
	highlighter startNodeTestHighlightPosition: self startPosition.
	super
		emitNodeTest: aNodeTest
		withNameTest: aNameTestString.
	highlighter endNodeTestHighlightPosition: self endPosition.
	^ aNodeTest.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> emitOperatorName: anOperatorNameStringOrCharacter [
	highlighter startOperatorHighlightPosition: self startPosition.
	super emitOperatorName: anOperatorNameStringOrCharacter.
	highlighter endOperatorHighlightPosition: self endPosition.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> emitTypeTest: aNodeTest withNameTest: aNameTestString [
	highlighter startFunctionCallHighlightPosition: self startPosition.
	self
		emitAll: aNodeTest nodeType name;
		emit: $(.
	highlighter endFunctionCallHighlightPosition: self endPosition.
	self emitAll: aNameTestString.
	highlighter startFunctionCallHighlightPosition: self startPosition.
	self emit: $).
	highlighter endFunctionCallHighlightPosition: self endPosition.
	^ aNodeTest
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> endPosition [
	^ stream position
]

{ #category : #accessing }
XPathHighlightingASTSourceWritingNodeVisitor >> highlighter [
	^ highlighter
]

{ #category : #initialization }
XPathHighlightingASTSourceWritingNodeVisitor >> on: aStream [
	super on: aStream.

	highlighter := XPathExpressionHighlighter new.
]

{ #category : #private }
XPathHighlightingASTSourceWritingNodeVisitor >> startPosition [
	^ stream position + 1
]

{ #category : #'visiting - functions' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitArgument: anArgument [
	super visitArgument: anArgument.
	highlighter startFunctionCallHighlightPosition: self startPosition.
	^ anArgument.
]

{ #category : #'visiting - functions' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitFunctionCall: aFunctionCall [
	highlighter startFunctionCallHighlightPosition: self startPosition.
	super visitFunctionCall: aFunctionCall.
	highlighter endFunctionCallHighlightPosition: self endPosition.
	^ aFunctionCall.
]

{ #category : #'visiting - literals' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	highlighter startNumberLiteralHighlightPosition: self startPosition.
	super visitNumberLiteral: aNumberLiteral.
	highlighter endNumberLiteralHighlightPosition: self endPosition.
	^ aNumberLiteral.
]

{ #category : #'visiting - predicates' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitPredicate: aPredicate [
	highlighter
		startPredicateHighlightPosition: self startPosition;
		endPredicateHighlightPosition: self startPosition;
		incrementPredicateColorLevel.
	super visitPredicate: aPredicate.
	highlighter
		decrementPredicateColorLevel;
		startPredicateHighlightPosition: self endPosition;
		endPredicateHighlightPosition: self endPosition.
	^ aPredicate.
]

{ #category : #'visiting - literals' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitStringLiteral: aStringLiteral [
	highlighter startStringLiteralHighlightPosition: self startPosition.
	super visitStringLiteral: aStringLiteral.
	highlighter endStringLiteralHighlightPosition: self endPosition.
	^ aStringLiteral.
]

{ #category : #'visiting - variables' }
XPathHighlightingASTSourceWritingNodeVisitor >> visitVariableReference: aVariableReference [
	highlighter startVariableReferenceHighlightPosition: self startPosition.
	super visitVariableReference: aVariableReference.
	highlighter endVariableReferenceHighlightPosition: self endPosition.
	^ aVariableReference.
]
