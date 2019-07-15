Extension { #name : #PPPredicateObjectParser }

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> align [
	| aligns blank sol nl |
	"
		Consume blank characters up to the point when column aligns.	
		Empty lines are not consumed, only possible trailing blanks on a previous line.
	"
	
	aligns := #aligns asParser.
	blank := #blank asParser.
	sol := #startOfLine asParser.
	nl := #newline asParser.
	
	^ ((sol not, blank star, nl) optional, (aligns not, blank) star, aligns) flatten
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> aligns [
	"Return if the current column is the same as set by #setIl"
	^ (#top asParser)
		"JK: hackish, because of imprefect Push/Pop analysis"
		propertyAt: #changesContext put: false;
		yourself
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> alignsOL [
	^  PPAlignOLParser new
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> column [
	^ PPColumnParser new
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> dedentOL [
	| ws |
"	ws := #startOfLine asParser, (#alignsOL asParser not, #blank asParser) star."
	ws := #space asParser star.
	^ ws, #removeOL asParser, (#alignsOL asParser / #offsideOL asParser)  ==> [ :tokens | #dedent ]
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> indentOL [
	| ws |
	ws := #startOfLine asParser, (#alignsOL asParser not, #space asParser) star.
	^ ws, #space asParser plus, #setOL asParser ==> [ :tokens | #indent ]
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> offside [
	| aligns blank sol nl |
	"
		Consume blank characters and checks if the column is still in offside position
		(as set by #setIl).	
	"
	
	aligns := #aligns asParser.
	blank := #blank asParser.
	sol := #startOfLine asParser.
	nl := #newline asParser.
	
	^ ((sol not, blank star, nl), (aligns not, blank) star, aligns not) flatten
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> offsideOL [
	^ PPOffsideOLParser new
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> onside [
	| align blank |
	"
		Consume blank characters and checks, if the column is in the onside position 
		(as set by #setIl).
	"
	
	align := #align asParser.
	blank := #blank asParser.
	
	^ (align, blank plus) flatten
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> onsideOL [
	^ PPOnsideOLParser new
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> pop [
	"Restores to the previous indentation level"
"	^ [ :context | context indentStack pop ] asParser"
	^ PPPopParser new
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> prefix [
	| sol |
	"Consume the content as defined by IndentStack from the beginning of a line"

	sol := #startOfLine asParser.
	^ sol, ([ :context | context indentStack replay: context ] asParser
		propertyAt: #changesContext put: false;
		yourself
	)
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> removeOL [
	^ #pop asParser
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> restoreIl [
	"Restores to the previous indentation level"
	^ #pop asParser
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> setIl [
	"
		Sets the current indentation level to the current column by
			pushing a comparison expression on top of the stack.
		
		use #aligns asParser to verify, if column aligns
		use #restoreIl asParser to use previous indentation level
	"
	^ [ :context | 
		| level compare |
		level := context column.
	
		compare := PPCompareParser 
						on: [ :ctx | ctx column = level  ] 
						message: 'expected column: ', level asString.
	
		context indentStack push: compare.
	] asParser
]

{ #category : #'*PetitIndent-OffsideRule' }
PPPredicateObjectParser class >> setOL [
	^ #column asParser push
]

{ #category : #'*PetitIndent' }
PPPredicateObjectParser class >> top [
	"Evaluate top of the indent stack"
	^ [ :ctx | 
		ctx indentStack isEmpty ifFalse: [ 
			ctx indentStack top parseOn: ctx 
		] ifTrue: [ 
			PPFailure message: 'IndentStack is empty' context: ctx 
		]
	] asParser
]
