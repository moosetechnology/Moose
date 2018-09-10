"
A highlighting XPath expression text style decorator.
"
Class {
	#name : #GLMXPathHighlighterTextStylerDecorator,
	#superclass : #GLMXMLHighlighterTextStylerDecorator,
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #parsing }
GLMXPathHighlighterTextStylerDecorator >> highlightingParse: aString onError: aBlock [
	| highlightingParserHandler highlightingParser |

	highlightingParserHandler :=
		XPathHighlightingPositionExpressionParserHandler expressionSource:
			aString.
	highlightingParser :=
		XPathPositionExpressionParser
			on: aString
			for: highlightingParserHandler.
	[highlightingParser parse]
		on: XPathException
		do: [:error |
			aBlock cull: error.
			^ highlightingParserHandler
				asHighlightedTextColored: self errorColor
				startingAt:
					"increment the position by one to more accurately
					reflect where the error happaned, because the
					parser peeks for each kind of token"
					(self
						highlightStartPositionForErrorAt:
							highlightingParser currentPosition + 1
						in: aString)].
	^ highlightingParserHandler asHighlightedText.
]
