Extension { #name : #SmaCCTokenRuleNode }

{ #category : #'*SmaCC_Development' }
SmaCCTokenRuleNode >> regularExpression [
	| re |
	(self attributeNamed: #regularExpression ifAbsent: [ nil ]) ifNotNil: [ :each | ^ each ].
	(self attributeNamed: #buildingRegularExpression ifAbsent: [ false ])
		ifTrue: [ self reportCircularDefinitionError ].
	self attributeNamed: #buildingRegularExpression put: true.
	re := regex regularExpression.
	self attributeNamed: #regularExpression put: re.
	self removeAttributeNamed: #buildingRegularExpression.
	re position: self name startPosition.
	self states do: [ :each | re addState: each value asSymbol ].
	^ re
]

{ #category : #'*SmaCC_Development' }
SmaCCTokenRuleNode >> reportCircularDefinitionError [
	SmaCCParserError new
		messageText: 'Circular token definition';
		tag: name;
		signal
]
