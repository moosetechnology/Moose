Class {
	#name : #DudeBooleanMatrix,
	#superclass : #MalMatrix,
	#instVars : [
		'diagonals',
		'noRows',
		'noColumns'
	],
	#category : #'SmallDude-Utils'
}

{ #category : #accessing }
DudeBooleanMatrix >> at: row and: column [ 
	 
	^self 
		transformRow: row 
		andColumn: column 
		andDo: [:diagNo :diagIx | (diagonals at: diagNo) at: diagIx]
]

{ #category : #accessing }
DudeBooleanMatrix >> at: row and: column put: aBoolean [ 
	 
	^self 
		transformRow: row 
		andColumn: column 
		andDo: 
			[:diagNo :diagIx | (diagonals at: diagNo) at: diagIx put: aBoolean]
]

{ #category : #accessing }
DudeBooleanMatrix >> columnSize [ 
	 
	^noColumns
]

{ #category : #'initialize-release' }
DudeBooleanMatrix >> initializeRows: m columns: n [ 
	" 
	[ C1 D1 E1 F1 G1 ]	 
	[ B1 C2 D2 E2 F2	] 
	[ A1 B2 C3 D3 E3 ] 
 
	[ E1 F1 G1 
	[ D1 E2 F2 
	[ C1 D2 E3 
	[ B1 C2 D3 
	[ A1 B2 C3 
	" 
	 
	(m = 0 or: [n = 0]) ifTrue: [Array new noMatchError]. 
	noRows := m. 
	noColumns := n. 
	diagonals := Array new: noRows + noColumns - 1. 
	1 
		to: noRows 
		do: 
			[:index |  
			diagonals 
				at: index 
				put: (DudeBooleanVector new: (noColumns min: index))]. 
	2 
		to: noColumns 
		do: 
			[:index |  
			diagonals 
				at: index + noRows - 1 
				put: (DudeBooleanVector new: (noRows min: noColumns + 1 - index))]
]

{ #category : #accessing }
DudeBooleanMatrix >> putTrueAt: row and: column [ 
	 
	^self 
		transformRow: row 
		andColumn: column 
		andDo: [:diagNo :diagIx | (diagonals at: diagNo) putTrueAt: diagIx]
]

{ #category : #accessing }
DudeBooleanMatrix >> rowSize [ 
	 
	^noRows
]

{ #category : #'coord-transform' }
DudeBooleanMatrix >> transformDiagNo: diagNo andDiagIndex: diagIx andDo: aBlock [ 
	" 
	[ C1 D1 E1 F1 G1 ]	 
	[ B1 C2 D2 E2 F2	] 
	[ A1 B2 C3 D3 E3 ] 
 
	[ E1 F1 G1 ] 
	[ D1 E2 F2 ] 
	[ C1 D2 E3 ] 
	[ B1 C2 D3 ] 
	[ A1 B2 C3 ] 
	" 
	 
	| row col | 
	noRows >= diagNo 
		ifTrue: 
			[col := diagIx. 
			row := noRows - diagNo + diagIx] 
		ifFalse: 
			[row := diagIx. 
			col := diagNo + diagIx - noRows]. 
	^aBlock value: row value: col
]

{ #category : #'coord-transform' }
DudeBooleanMatrix >> transformRow: row andColumn: col andDo: aBlock [ 
	" 
	[ C1 D1 E1 F1 G1 ]	 
	[ B1 C2 D2 E2 F2	] 
	[ A1 B2 C3 D3 E3 ] 
 
	[ E1 F1 G1 ] 
	[ D1 E2 F2 ] 
	[ C1 D2 E3 ] 
	[ B1 C2 D3 ] 
	[ A1 B2 C3 ] 
	" 
	 
	| diagNo diagIx | 
	row >= col 
		ifTrue: 
			[diagNo := noRows - row + col. 
			diagIx := col] 
		ifFalse: 
			[diagNo := noRows + col - row. 
			diagIx := row]. 
	^aBlock value: diagNo value: diagIx
]

{ #category : #enumerating }
DudeBooleanMatrix >> withDiagonalsDo: block [ 
	 
	diagonals doWithIndex: block
]

{ #category : #enumerating }
DudeBooleanMatrix >> withDiagonalsStartingAt: diagNo do: block [ 
	 
	diagNo 
		to: diagonals size 
		do: 
			[:index |  
			block 
				value: (diagonals at: index) 
				value: index]
]
