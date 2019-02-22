Class {
	#name : #RTCell,
	#superclass : #RTObject,
	#instVars : [
		'elements',
		'columns',
		'element',
		'number',
		'rowHeights',
		'columnWidths'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #public }
RTCell class >> elements: aCollection columns: anInteger [ 
	
	^ self new columns: anInteger; elements: aCollection; yourself
]

{ #category : #accessing }
RTCell >> column [

	^((number - 1) rem: columns) + 1
]

{ #category : #accessing }
RTCell >> columnWidthAt: index [
	"private"

	^ columnWidths at: index
]

{ #category : #accessing }
RTCell >> columns [
	^ columns
]

{ #category : #accessing }
RTCell >> columns: anObject [
	columns := anObject
]

{ #category : #accessing }
RTCell >> computeColumnWidths [

	columnWidths := Array new: elements columnCount.
	1 to: elements columnCount do: [ :columnIndex |
		columnWidths at: columnIndex put: ((elements atColumn: columnIndex) select: #notNil thenCollect: #width) max
	 ].
]

{ #category : #accessing }
RTCell >> computeRowHeights [

	rowHeights := Array new: elements rowCount.
	1 to: elements rowCount do: [ :rowIndex |
		rowHeights at: rowIndex put: ((elements atRow: rowIndex) select: #notNil thenCollect: #height) max
	 ].
]

{ #category : #accessing }
RTCell >> element [
	^ element
]

{ #category : #accessing }
RTCell >> element: anObject [
	element := anObject
]

{ #category : #accessing }
RTCell >> elements: aCollection [ 

	| rows  col |
	rows := (aCollection size / columns) ceiling rounded.
	col := Array new: rows * columns.
	1 to: aCollection size do: [ :i | col at: i put: (aCollection at: i)].
	elements := RTCellMatrix 
						rows: rows
						columns: columns 
						contents: col.
	self computeColumnWidths.
	self computeRowHeights.
]

{ #category : #accessing }
RTCell >> extent [

	^ self width @ self height
]

{ #category : #accessing }
RTCell >> height [

	^ self rowHeightAt: self row
]

{ #category : #accessing }
RTCell >> number [
	^ number
]

{ #category : #accessing }
RTCell >> number: anObject [
	number := anObject
]

{ #category : #accessing }
RTCell >> row [

	^((number - 1) quo: columns) + 1
]

{ #category : #accessing }
RTCell >> rowHeightAt: index [
	"private"

	^ rowHeights at: index
]

{ #category : #accessing }
RTCell >> width [

	^ self columnWidthAt: self column
]
