"
I am a model class representing a table within the Magritte framework. Internally I store my cells within a flat array, however users may access data giving ''row'' and ''column'' coordinates with ==#at:at:== and ==#at:at:put:==. I can support reshaping myself, but of course this might lead to loss of data-cells.
"
Class {
	#name : #MATableModel,
	#superclass : #MABasicObject,
	#instVars : [
		'rowCount',
		'columnCount',
		'contents'
	],
	#category : #'Magritte-Model-Models'
}

{ #category : #'instance creation' }
MATableModel class >> rows: aRowCount columns: aColumnCount [
	^ self rows: aRowCount columns: aColumnCount contents: (Array new: aRowCount * aColumnCount)
]

{ #category : #'instance creation' }
MATableModel class >> rows: aRowCount columns: aColumnCount contents: anArray [
	^ self new
		setRowCount: aRowCount;
		setColumnCount: aColumnCount;
		setContents: anArray;
		yourself
]

{ #category : #comparing }
MATableModel >> = aTable [
	^ self species = aTable species
		and: [ self rowCount = aTable rowCount
		and: [ self columnCount = aTable columnCount
		and: [ self contents = aTable contents ] ] ]
]

{ #category : #accessing }
MATableModel >> at: aRowIndex at: aColumnIndex [
	"Answer the contents of ==aRowIndex== and ==aColumnIndex==. Raises an error if the coordinates are out of bounds."

	self checkAt: aRowIndex at: aColumnIndex.
	^ self uncheckedAt: aRowIndex at: aColumnIndex
]

{ #category : #accessing }
MATableModel >> at: aRowIndex at: aColumnIndex put: aValue [
	"Set the contents of ==aRowIndex== and ==aColumnIndex==> to ==aValue==. Raises an error if the coordinates are out of bounds."

	self checkAt: aRowIndex at: aColumnIndex.
	^ self uncheckedAt: aRowIndex at: aColumnIndex put: aValue
]

{ #category : #private }
MATableModel >> checkAt: aRowIndex at: aColumnIndex [
	(aRowIndex between: 1 and: self rowCount)
		ifFalse: [ self error: 'Row subscript out of range.' ].
	(aColumnIndex between: 1 and: self columnCount)
		ifFalse: [ self error: 'Column subscript out of range.' ]
]

{ #category : #enumeration }
MATableModel >> collect: aBlock [
	| copy |
	copy := self copyEmpty.
	self do: [ :row :col :val |
		copy
			at: row at: col
			put: (aBlock value: row value: col value: val) ].
	^ copy
]

{ #category : #accessing }
MATableModel >> columnCount [
	"Answer the column count of the table."

	^ columnCount
]

{ #category : #accessing }
MATableModel >> contents [
	"Answer the contents array of the receiver."

	^ contents
]

{ #category : #copying }
MATableModel >> copyEmpty [
	^ self class rows: self rowCount columns: self columnCount
]

{ #category : #copying }
MATableModel >> copyRows: aRowCount columns: aColumnCount [
	| table |
	table := self class rows: aRowCount columns: aColumnCount.
	1 to: (self rowCount min: aRowCount) do: [ :row |
		1 to: (self columnCount min: aColumnCount) do: [ :col |
			table
				uncheckedAt: row at: col
				put: (self uncheckedAt: row at: col) ] ].
	^ table
]

{ #category : #enumeration }
MATableModel >> do: aBlock [
	1 to: self rowCount do: [ :row |
		1 to: self columnCount do: [ :col |
			aBlock
				value: row value: col
				value: (self uncheckedAt: row at: col) ] ]
]

{ #category : #comparing }
MATableModel >> hash [
	^ self contents hash
]

{ #category : #private }
MATableModel >> indexAt: aRowIndex at: aColumnIndex [
	^ (aRowIndex - 1) * self columnCount + aColumnIndex
]

{ #category : #private }
MATableModel >> pointAt: anIndex [
	^ Point x: (anIndex - 1 // self columnCount + 1) y: (anIndex - 1 \\ self columnCount + 1)
]

{ #category : #copying }
MATableModel >> postCopy [
	super postCopy.
	self setContents: self contents copy
]

{ #category : #operations }
MATableModel >> reshapeRows: aRowCount columns: aColumnCount [
	"Change the size of the receiving table to ==aRowCount== times ==aColumnCount==, throwing away elements that are cut off and initializing empty cells with ==nil==."

	self setContents: (self copyRows: aRowCount columns: aColumnCount) contents.
	self setRowCount: aRowCount; setColumnCount: aColumnCount
]

{ #category : #accessing }
MATableModel >> rowCount [
	"Answer the row count of the table."

	^ rowCount
]

{ #category : #initialization }
MATableModel >> setColumnCount: anInteger [
	columnCount := anInteger
]

{ #category : #initialization }
MATableModel >> setContents: anArray [
	contents := anArray
]

{ #category : #initialization }
MATableModel >> setRowCount: anInteger [
	rowCount := anInteger
]

{ #category : #accessing }
MATableModel >> uncheckedAt: aRowIndex at: aColumnIndex [
	^ self contents at: (self indexAt: aRowIndex at: aColumnIndex)
]

{ #category : #accessing }
MATableModel >> uncheckedAt: aRowIndex at: aColumnIndex put: aValue [
	^ self contents at: (self indexAt: aRowIndex at: aColumnIndex) put: aValue
]
