Class {
	#name : #DudeCommentsCleaner,
	#superclass : #DudeCleaningDecorator,
	#instVars : [
		'sStartComment',
		'sEndComment',
		'sLineComments',
		'sRegex'
	],
	#category : #'SmallDude-Text'
}

{ #category : #private }
DudeCommentsCleaner >> containsComments: aString wasOpenComment: aBoolean [ 
	 
	| aTempString | 
	aTempString := '' , aString. 
	aTempString := aTempString replaceAllRegex: sRegex with: ''. 
	(aTempString indexOfSubCollection: sLineComments startingAt: 1) > 0 
		ifTrue: [^True]. 
	(aTempString indexOfSubCollection: sStartComment startingAt: 1) > 0 
		ifTrue: [^True]. 
	((aTempString indexOfSubCollection: sEndComment startingAt: 1) > 0 
		and: [aBoolean = True]) ifTrue: [^True]. 
	^False
]

{ #category : #private }
DudeCommentsCleaner >> getIndexOf: aSubstring in: aString startingAt: startIndex [ 
	"Finds the first occurance of aSubstring in aString, except of those inside C-style strings" 
	 
	| finished lastIndex index | 
	finished := False. 
	lastIndex := startIndex - 1. 
	[finished = False] 
		whileTrue: 
			[index := aString 
				indexOfSubCollection: aSubstring 
				startingAt: lastIndex + 1. 
			index = 0 
				ifTrue: [finished := True] 
				ifFalse: 
					[(self 
						insideString: aString 
						startingAt: index 
						length: aSubstring size) = False 
						ifTrue: [^index] 
						ifFalse: [lastIndex := index]]]. 
	^0
]

{ #category : #'initialize-release' }
DudeCommentsCleaner >> initialize [ 
	"Initialize a newly created instance. This method must answer the receiver." 
	 
	super initialize.	" *** Edit the following to properly initialize instance variables ***" 
	sStartComment := '/*'. 
	sEndComment := '*/'. 
	sLineComments := '//'.	"This is used to eliminate strings like: 'some code "	"some string // some other string"	" some other code'" 
	sRegex := '".*[^//]"'.	" *** And replace this comment with additional initialization code *** " 
	^self
]

{ #category : #private }
DudeCommentsCleaner >> insideString: aString startingAt: index length: length [ 
	 
	| front back | 
	front := aString sliceFrom: 1 to: index. 
	back := aString sliceFrom: index + length. 
	front := front replaceAllRegex: sRegex with: ''. 
	back := back replaceAllRegex: sRegex with: ''. 
	((front indexOfSubCollection: '"' startingAt: 1) > 0 
		and: [(back indexOfSubCollection: '"' startingAt: 1) > 0]) 
		ifTrue: [^True] 
		ifFalse: [^False]
]

{ #category : #accessing }
DudeCommentsCleaner >> sEndComment [ 
	 
	^sEndComment
]

{ #category : #accessing }
DudeCommentsCleaner >> sLineComments [ 
	 
	^sLineComments
]

{ #category : #accessing }
DudeCommentsCleaner >> sStartComment [ 
	 
	^sStartComment
]

{ #category : #actions }
DudeCommentsCleaner >> specificClean: text [ 
	 
	| openComment iEndComment iStartComment iLineComment | 
	openComment := False. 
	1 
		to: text size 
		do: 
			[:i |  
			"check if I have openBraces form previous lines" 
			openComment = True 
				ifTrue: 
					[iEndComment := self 
						getIndexOf: sEndComment 
						in: (text at: i) 
						startingAt: 1. 
					iEndComment > 0 
						ifTrue: 
							[text 
								at: i 
								put: ((text at: i) sliceFrom: iEndComment + sEndComment size). 
							openComment := False] 
						ifFalse: [text at: i put: '']]. 
			[(self 
				containsComments: (text at: i) 
				wasOpenComment: openComment) = True] 
				whileTrue: 
					[iStartComment := self 
						getIndexOf: sStartComment 
						in: (text at: i) 
						startingAt: 1. 
					iLineComment := self 
						getIndexOf: sLineComments 
						in: (text at: i) 
						startingAt: 1. 
					iStartComment > 0 
						ifTrue: 
							[(iLineComment > 0 and: [iLineComment < iStartComment]) 
								ifTrue: 
									["situation:  ...//.../*" 
									text 
										at: i 
										put: 
											((text at: i) 
												sliceFrom: 1 
												to: iLineComment - 1)] 
								ifFalse: 
									["either I have no //, or it is after /*" 
									iEndComment := self 
										getIndexOf: sEndComment 
										in: (text at: i) 
										startingAt: iStartComment. 
									iEndComment > 0 
										ifTrue: 
											[text 
												at: i 
												put: 
													((text at: i) 
														sliceFrom: 1 
														to: iStartComment - 1) 
														, ((text at: i) sliceFrom: iEndComment + sEndComment size)] 
										ifFalse: 
											[openComment := True. 
											text 
												at: i 
												put: 
													((text at: i) 
														sliceFrom: 1 
														to: iStartComment - 1)]]] 
						ifFalse: 
							[text 
								at: i 
								put: 
									((text at: i) 
										sliceFrom: 1 
										to: iLineComment - 1)]]]. 
	^text
]
