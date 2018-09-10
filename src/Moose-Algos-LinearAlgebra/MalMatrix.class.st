"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrix,
	#superclass : #Object,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #accessing }
MalMatrix class >> browserIcon [
"Answer icon to be displayed with matrix classes."
	
	^ nil
]

{ #category : #'instance creation' }
MalMatrix class >> new [
	"Create a new matrix with dimension zero."
	
	^self new: Number zero
]

{ #category : #'instance creation' }
MalMatrix class >> new: numberOrPoint [
	"Create a new square matrix with the given dimension."
	
	| point |
	point := numberOrPoint asPoint.
	^self
		rows: point x
		columns: point y
]

{ #category : #'instance creation' }
MalMatrix class >> new: numberOrPoint withAll: value [
	
	^(self new: numberOrPoint)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
MalMatrix class >> readFromDenseText: aStream [
	
	| m n matrix tmp |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n.
	1
		to: m
		do:
			[:row | 
			1
				to: n
				do:
					[:column | 
					matrix
						at: row
						and: column
						"put: (tmp := (Number readSmalltalkAndCSyntaxFrom: aStream skipSeparators))."
						put: (tmp := (Number readFrom: aStream skipSeparators)).
						
						]].
	^matrix
]

{ #category : #'instance creation' }
MalMatrix class >> readFromSparseText: aStream [
	
	| m n matrix |
	n := Integer readFrom: aStream skipSeparators.
	m := Integer readFrom: aStream skipSeparators.
	Integer readFrom: aStream skipSeparators.
	matrix := self
		rows: m
		columns: n
		withAll: Number zero.
	1
		to: m
		do:
			[:rows | 
			1
				to: (Integer readFrom: aStream skipSeparators)
				do:
					[:unused | 
					matrix
						at: rows
						and: (Integer readFrom: aStream skipSeparators) + 1
						put: (Number readFrom: aStream skipSeparators)]].
	^matrix
]

{ #category : #'instance creation' }
MalMatrix class >> rows: m columns: n [
	"Create a new matrix with m rows and n columns."
	
	^(self basicNew)
		initializeRows: m columns: n;
		yourself
]

{ #category : #'instance creation' }
MalMatrix class >> rows: m columns: n withAll: value [
	
	^(self rows: m columns: n)
		atAllPut: value;
		yourself
]

{ #category : #private }
MalMatrix class >> switch: anObject caseMatrix: matrixBlock caseNestedCollection: nestedColletionBlock caseCollection: collectionBlock default: defaultBlock [
	
	(anObject isKindOf: MalMatrix) ifTrue: [^matrixBlock value].
	(anObject isKindOf: Collection)
		ifTrue:
			[(anObject isEmpty not
				and:
					[anObject
						allSatisfy:
							[:each | (each isKindOf: Collection) and: [each size = anObject first size]]])
				ifTrue: [^nestedColletionBlock value]
				ifFalse: [^collectionBlock value]].
	^defaultBlock value
]

{ #category : #'constants access' }
MalMatrix class >> unity [
	
	^MalMatrixCoercion with: 1
]

{ #category : #private }
MalMatrix class >> vectorSpecies [
	
	^MalArrayVector
]

{ #category : #'instance creation' }
MalMatrix class >> withAll: object [
	
	| dimension |
	dimension := self
		switch: object
		caseMatrix: [object dimension]
		caseNestedCollection: [object size @ object first size]
		caseCollection: [1 @ object size]
		default: [0].
	^(self new: dimension)
		atAllPut: object;
		yourself
]

{ #category : #'constants access' }
MalMatrix class >> zero [
	
	^MalMatrixCoercion with: 0
]

{ #category : #arithmetic }
MalMatrix >> * aNumber [
	
	^aNumber productFromMatrix: self
]

{ #category : #arithmetic }
MalMatrix >> *= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a * b]
]

{ #category : #'matrix functions' }
MalMatrix >> *~ aMatrix [
	"Answer the matrix multiplication of the reciever with the argument."
	
	| newMatrix |
	self columnSize = aMatrix rowSize ifFalse: [Array new noMatchError].
	newMatrix := self species
		rows: self rowSize
		columns: aMatrix columnSize.	"workaround: this should be done in a more generic way with double dispatch."
	newMatrix
		putWithIndices:
			((aMatrix isKindOf: MalDiagonalMatrix)
				ifTrue: [[:i :j | (self at: i and: j) * (aMatrix at: j and: j)]]
				ifFalse:
					[[:i :j | 
					(1 to: self columnSize)
						inject: 0
						into:
							[:sum :k | sum + ((self at: i and: k) * (aMatrix at: k and: j))]]]).
	^newMatrix
]

{ #category : #arithmetic }
MalMatrix >> + aNumber [
	
	^aNumber sumFromMatrix: self
]

{ #category : #arithmetic }
MalMatrix >> += aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a + b]
]

{ #category : #arithmetic }
MalMatrix >> - aNumber [
	
	^aNumber differenceFromMatrix: self
]

{ #category : #arithmetic }
MalMatrix >> -= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a - b]
]

{ #category : #arithmetic }
MalMatrix >> / aNumber [
	
	^aNumber quotientFromMatrix: self
]

{ #category : #arithmetic }
MalMatrix >> /= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a / b]
]

{ #category : #comparing }
MalMatrix >> = matrix [
	"Answer whether the dimension of the receiver is the same as otherMatrix' dimension,
	and each of the receiver's elements equal the corresponding element of otherMatrix."
	
	^self == matrix
		or:
			[(matrix isKindOf: MalMatrix)
				and:
					[(matrix hasDimension: self dimension)
						and:
							[self
								with: matrix
								do: [:a :b | a = b ifFalse: [^false]].
							true]]]
]

{ #category : #arithmetic }
MalMatrix >> adaptToNumber: rcvr andSend: selector [

	^ self perform: selector with: rcvr
]

{ #category : #arithmetic }
MalMatrix >> adaptToPoint: rcvr andSend: selector [

	^ self perform: selector with: rcvr
]

{ #category : #resizing }
MalMatrix >> addColumn [
	"Add a column. Must implement if isExtendable returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MalMatrix >> addColumnBeforeIndex: anIndex [
	"Insert a column before anIndex. Must implement if isResizebale returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MalMatrix >> addRow [
	"Add a row. Must implement if isExtendable returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MalMatrix >> addRowBeforeIndex: anIndex [
	"Insert a row before anIndex. Must implement if isResizebale returns true."
	
	self shouldNotImplement
]

{ #category : #converting }
MalMatrix >> asArray [
	
	| array stream |
	array := Array new: self rowSize * self columnSize.
	stream := WriteStream on: array.
	self do: [:each | stream nextPut: each].
	^array
]

{ #category : #accessing }
MalMatrix >> at: row and: column [
	"Answer the vakue at the given indices."
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MalMatrix >> at: row and: column add: aNumber [
	"Add aNumber to the element at row and column.  Answer the sum."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) + aNumber
]

{ #category : #arithmetic }
MalMatrix >> at: row and: column divide: aNumber [
	"Divide the element at row and column by aNumber.  Answer the quotient."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) / aNumber
]

{ #category : #arithmetic }
MalMatrix >> at: row and: column multiply: aNumber [
	"Multiply aNumber with the element at row and column.  Answer the product."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) * aNumber
]

{ #category : #accessing }
MalMatrix >> at: row and: column put: aNumber [
	"Store the vakue at the given indices."
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MalMatrix >> at: row and: column subtract: aNumber [
	"Subtract aNumber from the element at row and column.  Answer the difference."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) - aNumber
]

{ #category : #accessing }
MalMatrix >> atAllPut: object [
	
	self class
		switch: object
		caseMatrix:
			[self
				with: object
				affect: [:a :b | b]]
		caseNestedCollection:
			[object size = self rowSize
				ifTrue:
					[[object first size = self columnSize] assert.
					self putWithIndices: [:row :column | (object at: row) at: column]]
				ifFalse:
					[object size = self columnSize
						ifTrue:
							[[object first size = self rowSize] assert.
							self putWithIndices: [:row :column | (object at: column) at: row]]
						ifFalse: [Error raise]]]
		caseCollection:
			[| stream |
			[object size = (self rowSize * self columnSize)] assert.
			stream := ReadStream on: object.
			self
				withIndices:
					[:row :column | 
					self
						at: row
						and: column
						put: stream next]]
		default:
			[self withIndices: [:row :column | self at: row and: column put: object]].
	^object
]

{ #category : #accessing }
MalMatrix >> atPoint: rowColumnCoordinate [
	
	^self
		at: rowColumnCoordinate x
		and: rowColumnCoordinate y
]

{ #category : #accessing }
MalMatrix >> atPoint: rowColumnCoordinate put: aNumber [
	
	^self
		at: rowColumnCoordinate x
		and: rowColumnCoordinate y
		put: aNumber
]

{ #category : #private }
MalMatrix >> checkInvariant [
	
	^self subclassResponsibility
]

{ #category : #coercing }
MalMatrix >> coerce: aNumber [
	
	^MalMatrixCoercion with: aNumber
]

{ #category : #enumerating }
MalMatrix >> collect: aBlock [
	
	| newMatrix |
	newMatrix := self copyEmpty.
	self
		withIndices:
			[:row :column | 
			newMatrix
				at: row
				and: column
				put: (aBlock value: (self at: row and: column))].
	^newMatrix
]

{ #category : #'accessing vectorwise' }
MalMatrix >> columnAt: columnIndex [
	
	^MalMatrixPath column: columnIndex on: self
]

{ #category : #'accessing vectorwise' }
MalMatrix >> columnAt: columnIndex put: vector [
	
	vector doWithIndex: [:each :row | self at: row and: columnIndex put: each].
	^vector
]

{ #category : #accessing }
MalMatrix >> columnSize [
	
	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
MalMatrix >> columns [
	
	| array |
	array := Array new: self columnSize.
	1
		to: self columnSize
		do:
			[:index | 
			array
				at: index
				put: (self columnAt: index)].
	^array
]

{ #category : #copying }
MalMatrix >> copyEmpty [
	"Answer a copy of the receiver that contains no elements."
	
	^self copyEmpty: self dimension
]

{ #category : #copying }
MalMatrix >> copyEmpty: dimension [
	"Answer a copy of the receiver that contains no elements."
	
	^self species new: dimension
]

{ #category : #copying }
MalMatrix >> deepCopy [
	
	^self species withAll: self
]

{ #category : #accessing }
MalMatrix >> density [
	
	^self sparseSize / self size
]

{ #category : #arithmetic }
MalMatrix >> determinant [
	
	| a11 a12 a21 a22 |
	[self hasDimension: 2 @ 2] assert.
	a11 := self atPoint: 1 @ 1.
	a12 := self atPoint: 1 @ 2.
	a21 := self atPoint: 2 @ 1.
	a22 := self atPoint: 2 @ 2.
	^a11 * a22 - (a12 * a21)
]

{ #category : #'accessing vectorwise' }
MalMatrix >> diagonal [
	
	^MalMatrixPath diagonalOn: self
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromFixedPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromFloat: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromFraction: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromInteger: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a - b]
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromNumber: aNumber [
	
	^self collect: [:b | aNumber - b]
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> differenceFromSmallDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #accessing }
MalMatrix >> dimension [
	
	^self rowSize @ self columnSize
]

{ #category : #enumerating }
MalMatrix >> do: aBlock [
	
	self
		withIndices: [:row :column | aBlock value: (self at: row and: column)].
	^self
]

{ #category : #enumerating }
MalMatrix >> doSparseWithIndices: eachRowColumnBlock [
	
	self
		doWithIndices:
			[:each :row :column | 
			each isZero
				ifFalse: [eachRowColumnBlock value: each value: row value: column]].
	^self
]

{ #category : #enumerating }
MalMatrix >> doWithIndices: eachRowColumnBlock [
	
	self
		withIndices:
			[:row :column | 
			eachRowColumnBlock
				value: (self at: row and: column)
				value: row
				value: column]
]

{ #category : #accessing }
MalMatrix >> first [
	
	^self at: 1 and: 1
]

{ #category : #coercing }
MalMatrix >> generality [
	
	^240
]

{ #category : #testing }
MalMatrix >> hasDimension: aDimension [
	
	^self dimension = aDimension
]

{ #category : #comparing }
MalMatrix >> hash [
	
	^(self dimension hash bitXor: (self at: 1) hash)
		bitXor: (self at: self dimension) hash
]

{ #category : #'initialize-release' }
MalMatrix >> initializeRows: m columns: n [
	
	^self subclassResponsibility
]

{ #category : #enumerating }
MalMatrix >> inject: value into: aBlock [
	
	| result |
	result := value.
	self do: [:each | result := aBlock value: result value: each].
	^result
]

{ #category : #testing }
MalMatrix >> isComplex [
	
	^false
]

{ #category : #testing }
MalMatrix >> isDiagonal [
	"Answer if the reciever is a diagonal matrix."
	
	self isSquare ifFalse: [^false].
	self
		doSparseWithIndices:
			[:value :row :column | row = column ifFalse: [^false]].
	^true
]

{ #category : #testing }
MalMatrix >> isResizeable [
	
	^false
]

{ #category : #testing }
MalMatrix >> isSquare [
	"Answer if the reciever is a square matrix."
	
	^self rowSize = self columnSize
]

{ #category : #testing }
MalMatrix >> isSymetric [
	"Answer if the reciever is a symetric matrix."
	
	self isSquare ifFalse: [^false].
	1
		to: self columnSize
		do:
			[:column | 
			1
				to: column
				do:
					[:row | (self at: column and: row) = (self at: row and: column) ifFalse: [^false]]].
	^true
]

{ #category : #testing }
MalMatrix >> isZero [
	"Answer if the reciever contains no non-zero numbers."
	
	self doSparseWithIndices: [:value :row :column | ^false].
	^true
]

{ #category : #testing }
MalMatrix >> isZeroAt: row and: column [
	
	^(self at: row and: column) isZero
]

{ #category : #accessing }
MalMatrix >> last [
	
	^self
		at: self rowSize
		and: self columnSize
]

{ #category : #private }
MalMatrix >> noMatchError [
	
	Error raise
]

{ #category : #private }
MalMatrix >> noModificationError [
	
	Error raise
]

{ #category : #printing }
MalMatrix >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the matrix."
	
	| tooMany |
	tooMany := aStream position + 5000.
	aStream
		print: self class;
		space;
		print: self dimension;
		space;
		nextPut: $(.
	(1 to: self rowSize)
		do:
			[:row | 
			aStream nextPut: $(.
			(1 to: self columnSize)
				do:
					[:column | 
					aStream position > tooMany
						ifTrue:
							[aStream nextPutAll: (#etc << #dialogs >> '...etc...') asString , '))'.
							^self].
					aStream print: (self at: row and: column)]
				separatedBy: [aStream space].
			aStream nextPut: $)]
		separatedBy: [aStream space].
	aStream nextPut: $)
]

{ #category : #'double dispatching' }
MalMatrix >> productFromDouble: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromFixedPoint: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromFloat: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromFraction: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromInteger: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a * b]
]

{ #category : #'double dispatching' }
MalMatrix >> productFromNumber: aNumber [
	
	^self collect: [:b | aNumber * b]
]

{ #category : #'double dispatching' }
MalMatrix >> productFromPoint: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> productFromSmallDouble: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #enumerating }
MalMatrix >> putWithIndices: rowColumnBlock [
	
	self
		withIndices:
			[:row :column | 
			self
				at: row
				and: column
				put: (rowColumnBlock value: row value: column)].
	^self
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromFixedPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromFloat: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromFraction: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromInteger: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a / b]
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromNumber: aNumber [
	
	^self collect: [:b | aNumber / b]
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> quotientFromSmallDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #arithmetic }
MalMatrix >> reciprocal [
	
	^self
		collect:
			[:each | 
			each isZero
				ifTrue: [each]
				ifFalse: [each reciprocal]]
]

{ #category : #converting }
MalMatrix >> remap: mapping [
	
	^MalMappedMatrix on: self rowMap: mapping columnMap: mapping
]

{ #category : #resizing }
MalMatrix >> removeColumnAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #resizing }
MalMatrix >> removeRowAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #testing }
MalMatrix >> respondsToArithmetic [
	"We are arithmetic, yes."
	
	^true
]

{ #category : #arithmetic }
MalMatrix >> roundTo: aNumber [
	
	^self collect: [:each | each roundTo: aNumber]
]

{ #category : #'accessing vectorwise' }
MalMatrix >> rowAt: rowIndex [
	
	^MalMatrixPath row: rowIndex on: self
]

{ #category : #'accessing vectorwise' }
MalMatrix >> rowAt: rowIndex put: vector [
	
	vector
		doWithIndex: [:each :column | self at: rowIndex and: column put: each].
	^vector
]

{ #category : #accessing }
MalMatrix >> rowSize [
	
	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
MalMatrix >> rows [
	
	| array |
	array := Array new: self rowSize.
	1
		to: self rowSize
		do:
			[:index | 
			array
				at: index
				put: (self rowAt: index)].
	^array
]

{ #category : #accessing }
MalMatrix >> size [
	
	^self rowSize * self columnSize
]

{ #category : #accessing }
MalMatrix >> sparseSize [
	
	| tally |
	tally := 0.
	self do: [:each | each isZero ifTrue: [tally := tally + 1]].
	^tally
]

{ #category : #private }
MalMatrix >> species [
	
	^self class
]

{ #category : #printing }
MalMatrix >> storeDenseTextOn: aStream [
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."
	
	aStream
		print: self rowSize;
		space;
		print: self columnSize;
		cr.
	1
		to: self rowSize
		do:
			[:row | 
			(1 to: self columnSize)
				do: [:column | aStream print: (self at: row and: column)]
				separatedBy: [aStream space].
			aStream cr]
]

{ #category : #printing }
MalMatrix >> storeSparseTextOn: aStream [
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."
	
	aStream
		print: self columnSize;
		space;
		print: self rowSize;
		space;
		print: self sparseSize;
		cr.
	self rows
		do:
			[:row | 
			aStream
				print: row sparseSize;
				cr.
			row
				doSparseWithIndex:
					[:value :index | 
					aStream
						print: index - 1;
						space;
						print: value;
						cr]]
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromFixedPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromFloat: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromFraction: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromInteger: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a + b]
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromNumber: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalMatrix >> sumFromSmallDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'matrix functions' }
MalMatrix >> transposed [
	
	^MalMatrixView transposeOn: self
]

{ #category : #private }
MalMatrix >> vectorSpecies [
	
	^self class vectorSpecies
]

{ #category : #enumerating }
MalMatrix >> with: aMatrix affect: eachOtherBlock [
	
	[aMatrix hasDimension: self dimension] assert.
	self
		putWithIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)]
]

{ #category : #enumerating }
MalMatrix >> with: aMatrix collect: eachOtherBlock [
	
	| newMatrix |
	[aMatrix hasDimension: self dimension] assert.
	newMatrix := self copyEmpty: self dimension.
	newMatrix
		putWithIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)].
	^newMatrix
]

{ #category : #enumerating }
MalMatrix >> with: aMatrix do: eachOtherBlock [
	
	[aMatrix hasDimension: self dimension] assert.
	self
		withIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)]
]

{ #category : #enumerating }
MalMatrix >> withIndices: aBlock [
	
	1
		to: self rowSize
		do:
			[:row | 
			1
				to: self columnSize
				do: [:column | aBlock value: row value: column]]
]
