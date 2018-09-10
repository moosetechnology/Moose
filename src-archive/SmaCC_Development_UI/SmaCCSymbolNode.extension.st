Extension { #name : #SmaCCSymbolNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCSymbolNode >> buildVariableNameInterfaceIn: tabulator index: index [
	| name label expression |
	expression := self lookupNode: [ :node | (node isKindOf: SmaCCProductionExpressionNode) and: [ node parent isKindOf: SmaCCProductionRuleNode ] ].
	expression isNil
		ifTrue: [ ^ self ].
	name := ('name' , index printString) asSymbol.
	label := ('label' , index printString) asSymbol.
	tabulator
		row: [ :r | 
			r
				column: name size: 175;
				column: label ]
		size: 35.
	tabulator transmit
		to: name;
		andShow: [ :a | 
			a text
				display: self variableName;
				onChangeOfPort: #text act: [ :text | self variableName: text text asString ] ].
	tabulator transmit
		to: label;
		andShow: [ :a | 
			| text |
			text := expression source asText.
			text makeBoldFrom: self startPosition - parent startPosition + 1 to: self stopPosition - parent startPosition + 1.
			a label format: text ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCSymbolNode >> updateSource: aSmaCCString [
	| name |
	name := self attributeNamed: #variableName ifAbsent: [ ^ self ].
	name isEmpty
		ifTrue: [ variableNameToken notNil
				ifTrue: [ aSmaCCString deleteFrom: variableNameToken startPosition to: variableNameToken stopPosition ] ]
		ifFalse: [ variableNameToken notNil
				ifTrue: [ aSmaCCString deleteFrom: variableNameToken startPosition to: variableNameToken stopPosition.
					aSmaCCString insert: '''' , name , '''' at: variableNameToken startPosition ]
				ifFalse: [ aSmaCCString insert: ' ''' , name , '''' at: (aSmaCCString nextIndex: self name stopPosition) ] ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCSymbolNode >> variableName [
	^ self
		attributeNamed: #variableName
		ifAbsent: [ variableNameToken isNil
				ifTrue: [ '' ]
				ifFalse: [ variableNameToken value copyFrom: 2 to: variableNameToken value size - 1 ] ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCSymbolNode >> variableName: aString [
	^ self attributeNamed: #variableName put: aString
]
