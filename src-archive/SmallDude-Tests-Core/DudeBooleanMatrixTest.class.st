Class {
	#name : #DudeBooleanMatrixTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeBooleanMatrixTest >> testAccess [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 10 columns: 20.
	matrix at: 5 and: 10 put: true.
	matrix at: 5 and: 11 put: true.
	matrix at: 5 and: 12 put: true.
	matrix at: 6 and: 11 put: true.
	matrix at: 7 and: 12 put: true.
	self assert: (matrix at: 5 and: 10) equals: true.
	self assert: (matrix at: 6 and: 11) equals: true.
	self assert: (matrix at: 7 and: 12) equals: true.
	elemCount := 0.
	matrix
		withDiagonalsDo: [ :diag :diagNo | 
			diag
				do: [ :elem | 
					elem
						ifTrue: [ elemCount := elemCount + 1 ] ] ].
	self assert: elemCount equals: 5
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationOfColumn [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 100 columns: 1.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 100.
	self assert: matrix columnSize equals: 1.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 100
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationOfRow [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 1 columns: 100.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 1.
	self assert: matrix columnSize equals: 100.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 100
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationOfSingleElement [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 1 columns: 1.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 1.
	self assert: matrix columnSize equals: 1.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 1
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationOfSquare [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 11 columns: 11.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 11.
	self assert: matrix columnSize equals: 11.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 121
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationWithMoreColumns [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 10 columns: 20.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 10.
	self assert: matrix columnSize equals: 20.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 200
]

{ #category : #testing }
DudeBooleanMatrixTest >> testCreationWithMoreRows [
	| matrix elemCount |
	matrix := DudeBooleanMatrix rows: 20 columns: 10.
	self assert: matrix ~= nil.
	self assert: matrix rowSize equals: 20.
	self assert: matrix columnSize equals: 10.
	elemCount := 0.
	matrix withDiagonalsDo: [ :diag :diagNo | elemCount := elemCount + diag size ].
	self assert: elemCount equals: 200
]
