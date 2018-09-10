Class {
	#name : #DudeDuplication,
	#superclass : #FAMIXEntity,
	#instVars : [
		'referenceCode',
		'duplicateCode',
		'signature',
		'headDiagNo',
		'tailDiagNo'
	],
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeDuplication class >> annotation [
	<MSEClass: #Duplication super: #FAMIXEntity>
	<package: #Dude>
]

{ #category : #'instance creation - internal' }
DudeDuplication class >> newExactFrom: rowEntity start: startRow end: endRow and: colEntity start: startCol end: endCol onDiagonal: diagNo numberOfDuplicatedLines: fragmentLength [
	| rowFragment colFragment dup  |
	rowFragment := DudeSourceCodeFragment
		entity: rowEntity
		beginLine: startRow
		endLine: endRow
		fragmentLength: fragmentLength.
	rowEntity mooseModel silentlyAdd: rowFragment.
	colFragment := DudeSourceCodeFragment
		entity: colEntity
		beginLine: startCol
		endLine: endCol
		fragmentLength: fragmentLength.
	colEntity mooseModel silentlyAdd: colFragment.
	dup := self refCode: rowFragment dupCode: colFragment signature: 'E' , fragmentLength printString.
	dup
		headDiagonal: diagNo;
		tailDiagonal: diagNo.
	^ dup
]

{ #category : #'instance creation - internal' }
DudeDuplication class >> refCode: aCodeFragment dupCode: anotherCodeFragment signature: aString [ 
	 
	^self new refCode: aCodeFragment dupCode: anotherCodeFragment signature: 
			aString
]

{ #category : #'instance creation' }
DudeDuplication class >> refCode: aCodeFragment dupCode: anotherCodeFragment signature: aString inModel: aModel [ 
	 
	| result | 
	result := self new 
		refCode: aCodeFragment dupCode: anotherCodeFragment signature: aString; 
		yourself. 
	aModel add: result. 
	^result
]

{ #category : #ui }
DudeDuplication >> browseDuplicationText [
	<menuItem: 'Duplication text' category: 'Browse'> 
	| browser | 
	browser := GLMTabulator new.
	browser column: #diff.
	browser title: 'Duplication'.
	browser transmit to: #diff; andShow: [:a | 
		a diff display: [:dup | Array with: dup referenceText with: dup duplicateText ]].
	^ browser openOn: self
]

{ #category : #testing }
DudeDuplication >> containsFragment: frag [ 
	 
	^self referenceCode = frag or: [self duplicateCode = frag]
]

{ #category : #accessing }
DudeDuplication >> copiedLength [ 
	<MSEProperty: #copiedLength type: #Number>
	<derived>
	<MSEComment: 'The amount of duplicated lines'>
	
	| sig sep copy | 
	self flag: 'terrible code. We should store the signature in dedicated structure, not in a string'.
	sep := $.. 
	sig := signature , '.'. 
	copy := 0. 
	[sig notEmpty ] 
		whileTrue: 
			[| ePos sepPos | 
			ePos := sig indexOf: $E. 
			sepPos := ((sig sliceFrom: ePos + 1) indexOf: sep) + ePos. 
			copy := copy 
				+ 
					(sig 
						sliceFrom: ePos + 1 
						to: sepPos - 1) asNumber. 
			sig := sig sliceFrom: sepPos + 1]. 
	^copy
]

{ #category : #'initialize-release' }
DudeDuplication >> dupCode: aCodeFragment [ 
	 
	duplicateCode := aCodeFragment
]

{ #category : #accessing }
DudeDuplication >> duplicateCode [ 
	 
	^duplicateCode
]

{ #category : #accessing }
DudeDuplication >> duplicateText [
	^ Character cr asString join: self duplicateCode textLines 
]

{ #category : #accessing }
DudeDuplication >> duplicatingEntity [ 
	 
	^self duplicateCode entity
]

{ #category : #accessing }
DudeDuplication >> duplicatingEntityGroup [ 
	 
	<navigation: 'Duplicating entity'> 
	^MooseGroup 
		with: self duplicatingEntity 
		withDescription: 'Duplicating entity'
]

{ #category : #ui }
DudeDuplication >> duplicationText [ 
	 
	| source xsig inserted deleted eol | 
	eol := '\'. 
	inserted := 0. 
	deleted := 0. 
	xsig := self expandedSignature. 
	source := 'Duplication (' , signature , ') between:' , eol , eol 
		, referenceCode entity mooseName , ':' , eol , 'from line: ' 
		, referenceCode beginLine printString , ' to line: ' 
		, referenceCode endLine printString , ' (empty lines not counted)' , eol 
		, 
			'-----------------------------------------------------------------------------------' 
		, eol 
		, 
			(String 
				textForLines: referenceCode textLines 
				withPrefix: 
					[:lineNo |  
					[(xsig at: lineNo + inserted) = $I] whileTrue: [inserted := inserted + 1]. 
					(String with: (xsig at: lineNo + inserted)) , '     ']) , eol , eol , 
			'and' , eol , eol , eol , duplicateCode entity mooseName , ':' , eol , 
			'from line: ' , duplicateCode beginLine printString , ' to line: ' 
		, duplicateCode endLine printString , ' (empty lines not counted)' , eol 
		, 
			'-----------------------------------------------------------------------------------' 
		, eol 
		, 
			(String 
				textForLines: duplicateCode textLines 
				withPrefix: 
					[:lineNo |  
					[(xsig at: lineNo + deleted) = $D] whileTrue: [deleted := deleted + 1]. 
					(String with: (xsig at: lineNo + deleted)) , '     ']) , eol. 
	^source withCRs
]

{ #category : #printing }
DudeDuplication >> expandedSignature [
	| sig xsig sep |
	sep := $..
	sig := signature , '.'.
	xsig := ''.
	[ sig notEmpty ]
		whileTrue: [ 
			| sepPos dType dCount |
			dType := sig at: 1.
			sepPos := sig indexOf: sep.
			dCount := (sig copyFrom: 2 to: sepPos - 1) asNumber.
			1 to: dCount do: [ :index | xsig := xsig , (String with: dType) ].
			sig := sig copyFrom: sepPos + 1 to: sig size ].
	^ xsig
]

{ #category : #'accessing-private' }
DudeDuplication >> headDiagonal [ 
	 
	^headDiagNo
]

{ #category : #'accessing-private' }
DudeDuplication >> headDiagonal: diagNo [ 
	 
	headDiagNo := diagNo
]

{ #category : #testing }
DudeDuplication >> isDuplicationOf: modelEntity [ 
	 
	^self referenceCode entity == modelEntity 
		or: [self duplicateCode entity == modelEntity]
]

{ #category : #testing }
DudeDuplication >> isFromSameContextAs: otherDuplication [ 
	 
	^(self referenceCode entity = otherDuplication referenceCode entity 
		and: 
			[self duplicateCode entity = otherDuplication duplicateCode entity]) 
		or: 
			[self referenceCode entity = otherDuplication duplicateCode entity 
				and: 
					[self duplicateCode entity = otherDuplication referenceCode entity]]
]

{ #category : #testing }
DudeDuplication >> isSelfDuplication [ 
	 
	^self referenceCode entity == self duplicateCode entity
]

{ #category : #testing }
DudeDuplication >> isSelfDuplicationOf: modelEntity [ 
	 
	^self isSelfDuplication and: [self referenceCode entity == modelEntity]
]

{ #category : #accessing }
DudeDuplication >> makeInvert [ 
	"Makes the invert Duplication object starting with a Duplication" 
	 
	| invertSB invertSignature | 
	invertSB := '' , signature. 
	1 
		to: invertSB size 
		do: 
			[:i |  
			(invertSB at: i) = $D 
				ifTrue: [invertSB at: i put: $I] 
				ifFalse: [(invertSB at: i) = $I ifTrue: [invertSB at: i put: $D]]]. 
	invertSignature := '' , invertSB. 
	^DudeDuplication refCode: duplicateCode dupCode: referenceCode signature: 
			invertSignature
]

{ #category : #printing }
DudeDuplication >> mooseNameOn: stream [
	stream nextPutAll: 'Chain: '.
	signature ifNotNil: [ stream nextPutAll: signature ].
	referenceCode ifNotNil: [ stream nextPutAll: referenceCode mooseName ].
	stream nextPutAll: ' - '.
	duplicateCode ifNotNil: [ stream nextPutAll: duplicateCode mooseName ]
]

{ #category : #accessing }
DudeDuplication >> multiplicationInvolved [

	<MSEProperty: #multiplicationInvolved type: #DudeMultiplication opposite: #duplications>
	<MSEComment: 'The multiplications in which the current duplication is involved'>
	
	^ self privateState attributeAt: #multiplicationInvolved ifAbsent: [nil].
]

{ #category : #accessing }
DudeDuplication >> multiplicationInvolved: aMultiplication [

	self privateState attributeAt: #multiplicationInvolved put: (FMMultivalueLink 
		on: self
		update: #duplications
		from: self multiplicationInvolved
		to: aMultiplication).
]

{ #category : #testing }
DudeDuplication >> otherFragment: frag [ 
	 
	^self referenceCode = frag 
		ifTrue: [self duplicateCode] 
		ifFalse: [self referenceCode]
]

{ #category : #accessing }
DudeDuplication >> realLength [ 
	 
	^duplicateCode fragmentLength max: referenceCode fragmentLength
]

{ #category : #'initialize-release' }
DudeDuplication >> refCode: aCodeFragment [ 
	 
	referenceCode := aCodeFragment
]

{ #category : #'initialize-release' }
DudeDuplication >> refCode: aCodeFragment dupCode: anotherCodeFragment signature: aString [ 
	 
	signature := aString. 
	referenceCode := aCodeFragment. 
	duplicateCode := anotherCodeFragment. 
	self isSelfDuplication 
		ifTrue: 
			[referenceCode clonedInternally: true. 
			duplicateCode clonedInternally: true] 
		ifFalse: 
			[referenceCode clonedExternally: true. 
			duplicateCode clonedExternally: true]
]

{ #category : #accessing }
DudeDuplication >> referenceCode [ 
	^referenceCode
]

{ #category : #accessing }
DudeDuplication >> referenceEntity [ 
	 
	^self referenceCode entity
]

{ #category : #accessing }
DudeDuplication >> referenceEntityGroup [ 
	 
	<navigation: 'Reference entity'> 
	^MooseGroup 
		with: self referenceEntity 
		withDescription: 'Reference entity'
]

{ #category : #accessing }
DudeDuplication >> referenceText [
	^ Character cr asString join: self referenceCode textLines 
]

{ #category : #accessing }
DudeDuplication >> setSignature: aString [	 
	signature := aString
]

{ #category : #accessing }
DudeDuplication >> signature [ 
 	self flag: 'We should store the signature in dedicated structure, not in a string'.
	^ signature
]

{ #category : #'accessing-private' }
DudeDuplication >> tailDiagonal [ 
	 
	^tailDiagNo
]

{ #category : #'accessing-private' }
DudeDuplication >> tailDiagonal: diagNo [ 
	 
	tailDiagNo := diagNo
]

{ #category : #printing }
DudeDuplication >> toString [ 
	 
	| sb | 
	sb := '['. 
	sb := sb , referenceCode entityName , ',' 
		, referenceCode beginLine printString , ',' 
		, referenceCode endLine printString. 
	sb := sb , '] - ['. 
	sb := sb , duplicateCode entityName , ',' 
		, duplicateCode beginLine printString , ',' 
		, duplicateCode endLine printString. 
	sb := sb , ']'. 
	sb := sb , ' - copiedLength = ' , self copiedLength printString , 
			' (realLength = ' , self realLength printString , ') - signature = ' , 
			signature. 
	^sb
]

{ #category : #testing }
DudeDuplication >> tryChainWith: otherDuplication withLineBias: maxLineBias forDetector: aDudeDetector [
	| otherDup yBias otherRefCode otherDupCode xBias newDuplication newRefCode newDupCode newSignature separator |
	separator := '.'.
	otherDup := otherDuplication.
	(self referenceCode entity = otherDuplication referenceCode entity
		and: [ self duplicateCode entity = otherDuplication duplicateCode entity ])
		ifTrue: [  ]
		ifFalse: [ 
			(self referenceCode entity = otherDuplication duplicateCode entity
				and: [ self duplicateCode entity = otherDuplication referenceCode entity ])
				ifTrue: [ otherDup := otherDuplication makeInvert ]
				ifFalse: [ ^ nil ] ].
	otherRefCode := otherDup referenceCode.
	otherDupCode := otherDup duplicateCode.
	xBias := otherRefCode beginLine - self referenceCode endLine - 1.
	yBias := otherDupCode beginLine - self duplicateCode endLine - 1.
	((xBias <= maxLineBias and: [ yBias <= maxLineBias ]) and: [ xBias >= 0 and: [ yBias >= 0 ] ])
		ifTrue: [ 
			| auxSig |
			newRefCode := DudeSourceCodeFragment new
				entity: self referenceCode entity
				beginLine: self referenceCode beginLine
				endLine: otherRefCode endLine
				fragmentLength: (aDudeDetector findNumberOfNonCleanedLinesBetween: self referenceCode beginLine and: otherRefCode endLine forEntity: self referenceCode entity).
			self referenceCode entity mooseModel add: newRefCode.
			newDupCode := DudeSourceCodeFragment new
				entity: self duplicateCode entity
				beginLine: self duplicateCode beginLine
				endLine: otherDupCode endLine
				fragmentLength: (aDudeDetector findNumberOfNonCleanedLinesBetween: self duplicateCode beginLine and: otherDupCode endLine forEntity: self duplicateCode entity).
			self duplicateCode entity mooseModel add: newDupCode.
			xBias = yBias
				ifTrue: [ auxSig := 'M' , xBias printString ]
				ifFalse: [ 
					(xBias min: yBias) = xBias
						ifTrue: [ 
							auxSig := 'I' , (yBias - xBias) printString.
							xBias > 0
								ifTrue: [ auxSig := auxSig , separator , 'M' , xBias printString ] ]
						ifFalse: [ 
							auxSig := 'D' , (xBias - yBias) printString.
							yBias > 0
								ifTrue: [ auxSig := auxSig , separator , 'M' , yBias printString ] ] ].
			newSignature := self signature , separator , auxSig , separator , otherDup signature.
			newDuplication := DudeDuplication new refCode: newRefCode dupCode: newDupCode signature: newSignature.
			newDuplication
				headDiagonal: self headDiagonal;
				tailDiagonal: otherDuplication tailDiagonal ].
	^ newDuplication
]

{ #category : #testing }
DudeDuplication >> value: other [ 
	 
	^self = other
]
