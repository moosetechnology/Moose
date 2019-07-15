Class {
	#name : #DudeDetector,
	#superclass : #Object,
	#instVars : [
		'strategy',
		'observer',
		'codeBase',
		'fragments',
		'mooseModel'
	],
	#category : #'SmallDude-Core'
}

{ #category : #'initialize-release' }
DudeDetector class >> new: entitySpecie from: entities andObserver: anObserver inModel: aModel [
	^ self
		new: entitySpecie
		from: entities
		withStrategy: [ :string1 :string2 | string1 notEmpty and: [ string1 = string2 ] ]
		andObserver: anObserver
		inModel: aModel
]

{ #category : #'initialize-release' }
DudeDetector class >> new: entitySpecie from: entities inModel: aModel [
	^ self
		new: entitySpecie
		from: entities
		withStrategy: [ :string1 :string2 | string1 notEmpty and: [ string1 = string2 ] ]
		andObserver: DudeObserver default
		inModel: aModel
]

{ #category : #'initialize-release' }
DudeDetector class >> new: entitySpecie from: entities withStrategy: strategyBlock andObserver: anObserver inModel: aModel [
	| result |
	result := (self new
		mooseModel: aModel;
		compareStrategy: strategyBlock;
		observer: anObserver;
		yourself) initialize: entitySpecie from: entities.
	^ result
]

{ #category : #'initialize-release' }
DudeDetector class >> new: entitySpecie from: entities withStrategy: strategyBlock inModel: aModel [ 
	 
	^self 
		new: entitySpecie 
		from: entities 
		withStrategy: strategyBlock 
		andObserver: DudeObserver default 
		inModel: aModel
]

{ #category : #accessing }
DudeDetector >> codeBase [ 
	 
	^codeBase
]

{ #category : #'engine-parsing' }
DudeDetector >> codeLinesFor: anEntity withCleaner: aCleaner [
	"retrieves source code for anEntity, then splits it in lines (keeping empty lines), then cleans it, then creates DudeSourceCodeLine for each non empty line.
	a DudeSourceCodeLine knows its entity, the text of its line, and its line number in the original source code"
	| iline |

	iline := 0. "is incremented before being used, so actually starts at 1"
	^(aCleaner clean: ((anEntity sourceText asString) subStringsKeepingEmptyFields: (String cr , String lf))) 
		collect: [:aLine |
			iline := iline + 1.
			aLine isEmpty
				ifTrue: [ nil ] "must do the collect: before the thenSelect: so that line number (iline) are correct"
				ifFalse:	[DudeSourceCodeLine newText: aLine lineno: iline inEntity: anEntity]
		]
		thenSelect: [ :aDudeLine | aDudeLine notNil ]
]

{ #category : #'initialize-release' }
DudeDetector >> compareStrategy: aBlock [ 
	 
	strategy := aBlock
]

{ #category : #'engine-private' }
DudeDetector >> dupMatrixFor: rowLines and: colLines onlyUpperHalf: onlyHalf [ 
	 
	| rows cols matrix startCol | 
	rows := rowLines size. 
	cols := colLines size. 
	startCol := 1. 
	matrix := DudeBooleanMatrix 
		rows: rowLines size 
		columns: colLines size. 
	1 
		to: rows 
		do: 
			[:row |  
			| rowLine | 
			rowLine := rowLines at: row. 
			onlyHalf ifTrue: [startCol := startCol + 1]. 
			startCol 
				to: cols 
				do: 
					[:column |  
					(strategy 
						value: rowLine 
						value: (colLines at: column)) 
						ifTrue: [matrix putTrueAt: row and: column]]]. 
	^matrix
]

{ #category : #accessing }
DudeDetector >> entities [ 
	^ self codeBase keys asOrderedCollection
]

{ #category : #'engine-private' }
DudeDetector >> exactDupFor: rowEntity and: colEntity withLength: minDupLen [
	| matrix duplications startNo |
	duplications := OrderedCollection new: 50.
	matrix := self
		dupMatrixFor: (self textLinesFor: rowEntity)
		and: (self textLinesFor: colEntity)
		onlyUpperHalf: rowEntity = colEntity.
	rowEntity = colEntity
		ifTrue: [ startNo := matrix rowSize + 1 ]
		ifFalse: [ startNo := 1 ].
	matrix
		withDiagonalsStartingAt: startNo
		do: [ :diagonal :diagonalNo | 
			diagonal
				withContinuos: true
				fragmentsOfMinSize: minDupLen
				do: [ :start :end | 
					| startRow startCol endRow endCol len |
					matrix
						transformDiagNo: diagonalNo
						andDiagIndex: start
						andDo: [ :row :col | 
							startRow := row.
							startCol := col ].
					len := end - start.
					endRow := startRow + len.
					endCol := startCol + len.
					duplications
						addLast:
							(DudeDuplication newExactFrom: rowEntity
								start: (self findRealLineNumber: startRow for: rowEntity)
								end: (self findRealLineNumber: endRow for: rowEntity)
								and: colEntity
								start: (self findRealLineNumber: startCol for: colEntity)
								end: (self findRealLineNumber: endCol for: colEntity)
								onDiagonal: diagonalNo
								numberOfDuplicatedLines: endRow - startRow + 1) ] ].
	^ duplications
]

{ #category : #private }
DudeDetector >> findNumberOfNonCleanedLinesBetween: startLine and: endLine forEntity: anEntity [
	^ (self codeBase at: anEntity)
		count: [ :aDudeSourceCodeLine | aDudeSourceCodeLine lineno between: startLine and: endLine ]
]

{ #category : #private }
DudeDetector >> findRealLineNumber: aPositionInMatrix for: anEntity [
	^ ((self codeBase at: anEntity) at: aPositionInMatrix) lineno
]

{ #category : #private }
DudeDetector >> forEntitiesDo: aBlock [ 
	 
	^self codeBase keys do: aBlock
]

{ #category : #accessing }
DudeDetector >> forEntityPairsDo: block [ 
	 
	| size entitiess | 
	entitiess := self codeBase keys asOrderedCollection. 
	size := entitiess size. 
	observer start: (size * size + size) // 2. 
	1 
		to: size 
		do: 
			[:row |  
			| rowEntity | 
			rowEntity := entitiess at: row. 
			row 
				to: size 
				do: 
					[:col |  
					| colEntity | 
					observer increment. 
					colEntity := entitiess at: col. 
					block value: rowEntity value: colEntity]]. 
	observer stop
]

{ #category : #accessing }
DudeDetector >> forEntityPairsDo: block displayingProgressWithDescription: descriptionString [ 
	 
	| size entitiess | 
	entitiess := self codeBase keys asOrderedCollection. 
	size := entitiess size. 
	observer start: (size * size + size) // 2. 
	MooseCustomTask 
		runWithProgress: [: bar | 
			1 
			to: size 
			do: 
				[:row |  
					| rowEntity | 
					rowEntity := entitiess at: row. 
					row 
						to: size 
						do: 
							[:col |  
							| colEntity | 
							observer increment. 
							colEntity := entitiess at: col. 
							block value: rowEntity value: colEntity].
							bar increment.	
					]. 
				]
		 description: descriptionString
		 length: size.
	
	observer stop
]

{ #category : #deprecation }
DudeDetector >> getExactDuplications: minDupLen [ 
	 
	| duplications | 
	duplications := OrderedCollection new.	"self halt." 
	self 
		forEntityPairsDo: 
			[:rowEntity :colEntity |  
			duplications 
				addAll: 
					(self exactDupFor: rowEntity and: colEntity withLength: minDupLen)]. 
	^duplications
]

{ #category : #engine }
DudeDetector >> getMultiplicationsDisplayingProgressWith: minSizeDupChain withSizeOfExactChunk: minSizeExactChunk withLineBias: maxLineBias [ 
	| temp |
	fragments := Dictionary new.
	
	self forEntityPairsDo: [:rowEntity :colEntity |
		self multisFor: rowEntity and: colEntity withChainLen: minSizeDupChain
		withSizeOfExactChunk: minSizeExactChunk withLineBias: maxLineBias.
			] displayingProgressWithDescription: 'computing duplications'.
				
	MooseCustomTask 
		runWithProgress: [:bar |
			temp := (fragments values asSet collect: [:aMulti |
			self mooseModel add: aMulti.
			bar increment.
			aMulti
			]) asOrderedCollection.
			] 
		description:  'adding multiplications to the model'
		length: fragments size.
	
	fragments := nil.
	^temp
]

{ #category : #engine }
DudeDetector >> getMultiplicationsWith1032 [ 
	 
	^self getMultiplicationsWith: 10 withSizeOfExactChunk: 3 withLineBias: 2
]

{ #category : #engine }
DudeDetector >> getMultiplicationsWith1032DisplayingProgress [ 
	 
	^self getMultiplicationsDisplayingProgressWith: 10 withSizeOfExactChunk: 3 withLineBias: 2
]

{ #category : #engine }
DudeDetector >> getMultiplicationsWith732 [ 
	 
	^self getMultiplicationsWith: 7 withSizeOfExactChunk: 3 withLineBias: 2
]

{ #category : #engine }
DudeDetector >> getMultiplicationsWith: minSizeDupChain withSizeOfExactChunk: minSizeExactChunk withLineBias: maxLineBias [
	| temp |
	fragments := Dictionary new.
	self forEntityPairsDo: [:rowEntity :colEntity |
			self multisFor: rowEntity and: colEntity withChainLen: minSizeDupChain
				withSizeOfExactChunk: minSizeExactChunk withLineBias: maxLineBias].
	temp := (fragments values asSet collect: [:aMulti |
			self mooseModel add: aMulti.
			aMulti]) asOrderedCollection.
	fragments := nil.
	^temp
]

{ #category : #'initialize-release' }
DudeDetector >> initialize: entitySpecie from: entityList [ 
	 
	| aCleaner | 
	codeBase := IdentityDictionary new. 
	observer start: entityList size. 
	aCleaner := entitySpecie cleaners. 
	entityList 
		do: 
			[:entity |  
			| codeLines | 
			observer increment. 
			codeLines := self codeLinesFor: entity withCleaner: aCleaner. 
			entitySpecie 
				attachInformationTo: codeLines 
				from: self mooseModel. 
			codeBase at: entity put: codeLines]. 
	observer stop. 
	^self
]

{ #category : #'initialize-release' }
DudeDetector >> initialize: entitySpecie from: entityList and: strategyBlock andObserver: anObserver inModel: aModel [ 
	 
	self compareStrategy: strategyBlock. 
	self observer: anObserver. 
	^self initialize: entitySpecie from: entityList
]

{ #category : #accessing }
DudeDetector >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
DudeDetector >> mooseModel: anObject [
	mooseModel := anObject
]

{ #category : #'engine-private' }
DudeDetector >> multisFor: rowEntity and: colEntity withChainLen: minSizeDupChain withSizeOfExactChunk: minSizeExactChunk withLineBias: maxLineBias [
	| exacts |
	(self codeBase at: rowEntity) ifEmpty: [ ^ nil ].
	(self codeBase at: colEntity) ifEmpty: [ ^ nil ].
	exacts := self exactDupFor: rowEntity and: colEntity withLength: minSizeExactChunk.
	[ exacts notEmpty ]
		whileTrue: [ 
			| chunk freshChain index |
			chunk := exacts removeLast.
			index := exacts size.
			[ index >= 1 ]
				whileTrue: [ 
					| e crtDiag |
					e := exacts at: index.
					freshChain := chunk tryChainWith: e withLineBias: maxLineBias forDetector: self.
					freshChain isNil
						ifTrue: [ freshChain := e tryChainWith: chunk withLineBias: maxLineBias forDetector: self ].
					freshChain notNil
						ifTrue: [ 
							chunk := freshChain.
							exacts removeAtIndex: index.
							index := exacts size + 1 ].
					crtDiag := chunk headDiagonal min: chunk tailDiagonal.
					crtDiag - e tailDiagonal > maxLineBias
						ifTrue: [ index := 1 ].
					index := index - 1 ].
			chunk realLength >= minSizeDupChain
				ifTrue: [ self recordDuplication: chunk ] ]
]

{ #category : #'initialize-release' }
DudeDetector >> observer: anObserver [ 
	 
	observer := anObserver
]

{ #category : #'engine-private' }
DudeDetector >> recordDuplication: aDup [ 
	 
	| survivor | 
	"eliminate redundant code fragments" 
	aDup dupCode: (self recordFragment: aDup duplicateCode). 
	aDup refCode: (self recordFragment: aDup referenceCode). 
	self mooseModel add: aDup. 
	fragments 
		at: aDup duplicateCode 
		ifPresent: 
			[:aMulti |  
			survivor := aMulti. 
			fragments 
				at: aDup referenceCode 
				ifAbsent: 
					[fragments 
						at: aDup referenceCode 
						put: survivor. 
					survivor absorb: aDup. 
					^nil]. 
			survivor 
				absorb: aDup; 
				absorbAll: (fragments at: aDup referenceCode). 
			(fragments at: aDup referenceCode) fragments 
				do: [:fragment | fragments at: fragment put: survivor]. 
			^nil]. 
	fragments 
		at: aDup referenceCode 
		ifPresent: 
			[:aMulti |  
			fragments 
				at: aDup duplicateCode 
				put: aMulti. 
			aMulti absorb: aDup. 
			^nil]. 
	survivor := DudeMultiplication newFrom: aDup. 
	fragments 
		at: aDup referenceCode 
		put: survivor. 
	fragments 
		at: aDup duplicateCode 
		put: survivor
]

{ #category : #'engine-private' }
DudeDetector >> recordFragment: aCodeFragment [ 
	"eliminate redundant code fragments" 
	 
	^fragments keys 
		detect: [:each | each = aCodeFragment] 
		ifNone: 
			["AbstractEntity register: aCodeFragment inModel: self mooseModel." 
			aCodeFragment]
]

{ #category : #private }
DudeDetector >> textLinesFor: anEntity [ 
	 
	^(self codeBase at: anEntity) collect: [:sourceLine | sourceLine text]
]
