Class {
	#name : #DudeWhiteSpaceCleaner,
	#superclass : #DudeCleaningDecorator,
	#category : #'SmallDude-Text'
}

{ #category : #'instance creation' }
DudeWhiteSpaceCleaner class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new initialize
]

{ #category : #white }
DudeWhiteSpaceCleaner class >> standardSpace [ 
	 
	^String 
		with: Character space 
		with: Character tab 
		with: Character cr 
		with: Character lf
]

{ #category : #white }
DudeWhiteSpaceCleaner class >> tabSpace [ 
	 
	^Character tab
]

{ #category : #actions }
DudeWhiteSpaceCleaner >> specificClean: text [ 
	 
	| whiteSpaces crtLine crtSpace | 
	whiteSpaces := DudeWhiteSpaceCleaner standardSpace. 
	1 
		to: text size 
		do: 
			[:lineNo |  
			crtLine := text at: lineNo. 
			1 
				to: whiteSpaces size 
				do: 
					[:spaceNo |  
					crtSpace := (whiteSpaces at: spaceNo) asSymbol asString. 
					crtLine := crtLine copyReplaceAll: crtSpace with: ''. 
					text at: lineNo put: crtLine]]. 
	^text
]
