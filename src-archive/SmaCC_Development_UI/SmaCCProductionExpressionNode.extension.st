Extension { #name : #SmaCCProductionExpressionNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> astNodeName [
	^ self attributeNamed: #astNodeName ifAbsent: [ self originalAstNodeName ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> astNodeName: aString [
	^ self attributeNamed: #astNodeName put: aString
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> buildASTNodeInterfaceIn: tabulator [
	| index check name label cb |
	index := parent expressions identityIndexOf: self.
	check := ('check' , index printString) asSymbol.
	name := ('name' , index printString) asSymbol.
	label := ('label' , index printString) asSymbol.
	tabulator
		row: [ :r | 
			r
				column: check size: 25;
				column: name size: 150;
				column: label ]
		size: 35.
	tabulator transmit
		to: check;
		andShow: [ :a | 
			a morph
				morph: [ cb := CheckboxButtonMorph checkBox.
					self hasNodeDefined
						ifTrue: [ cb state: #on ].
					cb
						on: #mouseUp
						send: #value
						to: [ self definesNode: cb isOn.
							cb isOn
								ifFalse: [ self removeAttributeNamed: #astNodeName ] ].
					cb ] ].
	tabulator transmit
		to: name;
		andShow: [ :a | 
			a text
				display: self astNodeName;
				onChangeOfPort: #text
					act: [ :text | 
					| astNode |
					astNode := text text asString.
					(astNode notEmpty and: [ cb notNil and: [ cb isOn not ] ])
						ifTrue: [ cb state: #on.
							self definesNode: true ].
					self astNodeName: astNode ] ].
	tabulator transmit
		to: label;
		andShow: [ :a | a label display: self productionLabel ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> definesNode: aBoolean [
	^ self attributeNamed: #hasNodeDefined put: aBoolean
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> hasNodeDefined [
	^ self attributeNamed: #hasNodeDefined ifAbsent: [ self class == SmaCCClassProductionExpressionNode ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> originalAstNodeName [
	^ ''
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> productionLabel [
	^ self source
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionExpressionNode >> updateSource: aSmaCCString [
	| position index |
	self hasNodeDefined
		ifFalse: [ ^ self ].
	self terms isEmpty
		ifTrue: [ index := self parent expressions identityIndexOf: self.
			position := index = 1
				ifTrue: [ aSmaCCString nextIndex: self parent colon stopPosition ]
				ifFalse: [ aSmaCCString nextIndex: (self parent barTokens at: index - 1) stopPosition ] ]
		ifFalse: [ position := aSmaCCString nextIndex: self stopPosition ].
	aSmaCCString insert: ' {{' , self astNodeName , '}}' at: position
]
