Class {
	#name : #DelphiBinaryExpressionVisitor,
	#superclass : #DelphiProgramNodeVisitor,
	#classInstVars : [
		'operators'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #private }
DelphiBinaryExpressionVisitor class >> operators [
	^ operators
		ifNil:
			[ operators := #('OR' 'AND' 'XOR' ',' '+' '-' 'DIV' 'MOD' 'SHL' 'SHR' '*' '/' '@' '.' '^')
				asSet ]
]

{ #category : #testing }
DelphiBinaryExpressionVisitor >> isLeftAssociative: aString [
	^ self class operators includes: aString asUppercase
]

{ #category : #testing }
DelphiBinaryExpressionVisitor >> isPrecedenceOf: op1String higherThan: op2String [
	| index1 index2 |
	index1 := self precedenceOf: op1String.
	index2 := self precedenceOf: op2String.
	^ index1 notNil
		and:
			[ index2 notNil
				and:
					[ index1 > index2
						or: [ index1 = index2 and: [ self isLeftAssociative: op1String ] ] ] ]
]

{ #category : #testing }
DelphiBinaryExpressionVisitor >> precedenceOf: aString [
	| string table |
	string := aString asUppercase.
	table := #(#(':=') #('OR') #('AND') #('XOR') #(',') #('<>' '>' '<' '=' '<=' '>=' 'IN') #('AS' 'IS' 'ABSOLUTE') #('+' '-') #('DIV' 'MOD' 'SHL' 'SHR' '*' '/') #('@') #('.' '^')).
	1 to: table size do: [ :i | 
		((table at: i) includes: string)
			ifTrue: [ ^ i ] ].
	^ nil
]

{ #category : #visiting }
DelphiBinaryExpressionVisitor >> visitBinaryExpression: aBinaryExpression [
	| pulledUp temp parent current |
	current := aBinaryExpression.
	[ (current rightExpression isKindOf: DelphiBinaryExpressionNode)
		and:
			[ current rightExpression leftParens isEmpty
				and:
					[ self
						isPrecedenceOf: current operator value
						higherThan: current rightExpression operator value ] ] ]
		whileTrue:
			[ parent := current parent.
			pulledUp := current rightExpression.
			temp := pulledUp leftExpression.
			pulledUp leftExpression: current.
			current rightExpression: temp.
			pulledUp parent: parent.
			temp := pulledUp leftParens.
			pulledUp leftParens: pulledUp leftExpression leftParens.
			pulledUp leftExpression leftParens: temp.
			temp := pulledUp rightParens.
			pulledUp rightParens: pulledUp leftExpression rightParens.
			pulledUp leftExpression rightParens: temp.
			pulledUp removePositions.
			pulledUp leftExpression removePositions.
			1 to: pulledUp parent class instSize do:
				[ :i | 
				| var index |
				var := pulledUp parent instVarAt: i.
				var == current
					ifTrue: [ pulledUp parent instVarAt: i put: pulledUp ].
				(var isKindOf: SequenceableCollection)
					ifTrue:
						[ index := var identityIndexOf: current.
						index > 0
							ifTrue: [ var at: index put: pulledUp ] ] ].
			pulledUp removeAttributeNamed: #startPosition.
			current removeAttributeNamed: #stopPosition.
			current := pulledUp ].
	self acceptNode: current leftExpression.
	self acceptNode: current rightExpression.
	^ current
]
