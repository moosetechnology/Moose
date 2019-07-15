Class {
	#name : #DudeBooleanSymetricMatrix,
	#superclass : #MalSymetricMatrix,
	#category : #'SmallDude-Utils'
}

{ #category : #accessing }
DudeBooleanSymetricMatrix >> at: row and: column [ 
	 
	^self 
		transformRow: row 
		andColumn: column 
		to: 
			[:vectorNo :vectorIndex | (partialColumns at: vectorNo) at: vectorIndex]
]

{ #category : #accessing }
DudeBooleanSymetricMatrix >> at: row and: column put: aBoolean [ 
	 
	^self 
		transformRow: row 
		andColumn: column 
		to: 
			[:vectorNo :vectorIndex | (partialColumns at: vectorNo) at: vectorIndex put: aBoolean]
]

{ #category : #enumerating }
DudeBooleanSymetricMatrix >> diagonalAt: diagonalNo [ 
	 
	^partialColumns at: diagonalNo
]

{ #category : #private }
DudeBooleanSymetricMatrix >> matrixColFormDiagNo: diagNo andDiagIndex: diagIx [ 
	 
	^partialColumns size + (diagIx - diagNo)
]

{ #category : #private }
DudeBooleanSymetricMatrix >> transformRow: row andColumn: col to: block [ 
	"we do not store partial columns but rather diagonals from the upper triangle 
	[ E11   E21   E31   E41   E51 ] 
	[	    E22   E32   E42   E52 ] 
	[		      E33   E43   E53 ]    <-- Symetric Matrix, vectors (with sizes) are: E1(1), E2(2), E3(3), E4(4), E5(5)  
	[				E44   E54 ] 
	[					  E55 ] 
 
	[ E51   E41   E31   E21   E11 ] 
	[	    E52   E42   E32   E22 ] 
	[		      E53   E43   E33 ]    <-- Boolean Symetric Matrix, vectors are: E1, E2, E3, E4, E5 
	[				E54   E44 ] 
	[					  E55 ] 
 
	so we need a coordinate transform 
" 
	 
	| rowNo colNo vectorNo vectorIndex | 
	col < row 
		ifTrue: 
			[rowNo := col. 
			colNo := row] 
		ifFalse: 
			[rowNo := row. 
			colNo := col]. 
	vectorNo := partialColumns size + (rowNo - colNo). 
	vectorIndex := rowNo. 
	^block value: vectorNo value: vectorIndex
]

{ #category : #'initialize-release' }
DudeBooleanSymetricMatrix >> vectorSpecies [ 
	 
	^MalBooleanVector
]

{ #category : #enumerating }
DudeBooleanSymetricMatrix >> withDiagonalsDo: block [ 
	 
	partialColumns doWithIndex: block
]

{ #category : #enumerating }
DudeBooleanSymetricMatrix >> withDiagonalsStartingAt: colNo do: block [ 
	 
	| diagStart | 
	diagStart := partialColumns size - colNo + 1. 
	diagStart 
		to: partialColumns size - 1 
		do: 
			[:i |  
			block 
				value: (partialColumns at: i) 
				value: i]
]
