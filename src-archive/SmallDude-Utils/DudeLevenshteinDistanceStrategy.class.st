Class {
	#name : #DudeLevenshteinDistanceStrategy,
	#superclass : #Object,
	#instVars : [
		'threshold'
	],
	#category : #'SmallDude-Utils'
}

{ #category : #'instance creation' }
DudeLevenshteinDistanceStrategy class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new initialize
]

{ #category : #'instance creation' }
DudeLevenshteinDistanceStrategy class >> threshold: aDouble [ 
	 
	^self new threshold: aDouble
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> delString: aString pos: anInt [ 
	 
	^1
]

{ #category : #accessing }
DudeLevenshteinDistanceStrategy >> getStrategyBlock [ 
	 
	| aBlock | 
	aBlock := [:string1 :string2 | self similarSource: string1 target: string2]. 
	^aBlock
]

{ #category : #'initialize-release' }
DudeLevenshteinDistanceStrategy >> initialize [ 
	"Initialize a newly created instance. This method must answer the receiver." 
	" *** Edit the following to properly initialize instance variables ***" 
	 
	threshold := nil.	" *** And replace this comment with additional initialization code *** " 
	^self
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> insString: aString pos: anInt [ 
	 
	^1
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> levenshteinDistanceSource: sourceString target: targetString [ 
	 
	| sourceSize targetSize aMatrix | 
	sourceSize := sourceString size. 
	targetSize := targetString size. 
	aMatrix := MalArrayMatrix new: (sourceSize + 1) @ (targetSize + 1). 
	aMatrix at: 1 and: 1 put: 0. 
	1 
		to: targetSize 
		do: 
			[:j |  
			aMatrix 
				at: 1 
				and: j + 1 
				put: (aMatrix at: 1 and: j) + (self insString: targetString pos: j)]. 
	1 
		to: sourceSize 
		do: 
			[:i |  
			aMatrix 
				at: i + 1 
				and: 1 
				put: (aMatrix at: i and: 1) + (self delString: sourceString pos: i). 
			1 
				to: targetSize 
				do: 
					[:j |  
					aMatrix 
						at: i + 1 
						and: j + 1 
						put: 
							(self 
								minFirst: 
									(aMatrix at: i and: j) 
										+ 
											(self subFirstString: sourceString firstPos: i secondString: targetString 
												secondPos: j) 
								second: 
									(aMatrix 
										at: i 
										and: j + 1) + (self delString: sourceString pos: i) 
								third: 
									(aMatrix 
										at: i + 1 
										and: j) + (self insString: targetString pos: j))]]. 
	^aMatrix 
		at: sourceSize + 1 
		and: targetSize + 1
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> minFirst: int1 second: int2 third: int3 [ 
	 
	^(int1 min: int2) min: int3
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> normalizedDistanceSource: sourceString target: targetString [ 
	 
	| sourceSize targetSize | 
	sourceSize := sourceString size. 
	targetSize := targetString size.
	^[(self levenshteinDistanceSource: sourceString target: targetString) 
		asFloat / (sourceSize max: targetSize)] on:ZeroDivide do: [ 0 ]
]

{ #category : #testing }
DudeLevenshteinDistanceStrategy >> similarSource: sourceString target: targetString [ 
	 
	^(self normalizedDistanceSource: sourceString target: targetString) <= 
			threshold
]

{ #category : #private }
DudeLevenshteinDistanceStrategy >> subFirstString: string1 firstPos: int1 secondString: string2 secondPos: int2 [ 
	 
	(string1 at: int1) = (string2 at: int2) 
		ifTrue: [^0] 
		ifFalse: [^1]
]

{ #category : #'initialize-release' }
DudeLevenshteinDistanceStrategy >> threshold: aDouble [ 
	 
	threshold := aDouble. 
	^self
]
