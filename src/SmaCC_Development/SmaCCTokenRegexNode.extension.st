Extension { #name : #SmaCCTokenRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCTokenRegexNode >> asRegularExpression [
	^ (self topParent tokenNamed: name value)
		ifNotNil: [ :rule | rule regularExpression copy ]
		ifNil: [ (SmaCCGrammar implicitToken: name value) ifNil: [ self reportMissingTokenDefinition ] ]
]

{ #category : #'*SmaCC_Development' }
SmaCCTokenRegexNode >> reportMissingTokenDefinition [
	SmaCCParserError new
		messageText: 'Missing token definition';
		tag: name;
		signal
]
