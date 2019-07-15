"
A ROCellMatrix is xxxxxxxxx.

Instance Variables
	contents:		<Object>
	ncols:		<Object>
	nrows:		<Object>

contents
	- xxxxx

ncols
	- xxxxx

nrows
	- xxxxx

"
Class {
	#name : #RTCellMatrix,
	#superclass : #RTObject,
	#instVars : [
		'nrows',
		'ncols',
		'contents'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #'as yet unclassified' }
RTCellMatrix class >> rows: rows columns: columns contents: contents [
	^self new rows: rows columns: columns contents: contents
]

{ #category : #'accessing rows/columns' }
RTCellMatrix >> atColumn: column [
	| p |
	p := (self indexForRow: 1 andColumn: column) - ncols.
	^ (1 to: nrows) collect: [ :row | contents at: (p := p+ncols) ]

]

{ #category : #'accessing rows/columns' }
RTCellMatrix >> atRow: row [
	(row between: 1 and: nrows)
		ifFalse: [ self error: '1st subscript out of range' ].
	^ contents copyFrom: (row - 1) * ncols + 1 to: row * ncols
]

{ #category : #accessing }
RTCellMatrix >> columnCount [
	^ ncols
]

{ #category : #private }
RTCellMatrix >> indexForRow: row andColumn: column [
	(row between: 1 and: nrows)
		ifFalse: [self error: '1st subscript out of range'].
	(column between: 1 and: ncols)
		ifFalse: [self error: '2nd subscript out of range'].
	^ (row - 1) * ncols + column
]

{ #category : #accessing }
RTCellMatrix >> rowCount [
	^ nrows
]

{ #category : #private }
RTCellMatrix >> rows: rows columns: columns contents: anArray [
	(((rows isInteger and: [rows >= 0]) and: 
		[columns isInteger and: [columns >= 0]]) and:
			[ rows * columns = anArray size ]) ifFalse: [ self error: 'Wrong parameters' ].
	nrows := rows.
	ncols := columns.
	contents := anArray
]
