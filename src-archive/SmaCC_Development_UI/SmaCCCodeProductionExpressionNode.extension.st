Extension { #name : #SmaCCCodeProductionExpressionNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCCodeProductionExpressionNode >> buildASTNodeInterfaceIn: presentation [
	| index name label |
	index := parent expressions identityIndexOf: self.
	name := ('name' , index printString) asSymbol.
	label := ('label' , index printString) asSymbol.
	presentation
		row: [ :r | 
			r
				column: name size: 175;
				column: label ]
		size: 30.
	presentation transmit
		to: name;
		andShow: [ :a | a label display: '***CODE***' ].
	presentation transmit
		to: label;
		andShow: [ :a | a label display: self source ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCCodeProductionExpressionNode >> productionLabel [
	^ self completeSource copyFrom: self startPosition to: code startPosition - 1
]
