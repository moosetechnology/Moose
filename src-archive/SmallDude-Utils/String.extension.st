Extension { #name : #String }

{ #category : #'*SmallDude-Utils' }
String class >> eol [ 
	 
	^String 
		with: Character cr 
		with: Character lf
]

{ #category : #'*SmallDude-Utils' }
String class >> textForLines: aStringList [ 
	 
	| eol | 
	eol := String eol. 
	^aStringList 
		inject: '' 
		into: [:txt :line | txt , line , eol]
]

{ #category : #'*SmallDude-Utils' }
String class >> textForLines: aStringList withPrefix: aBlock [ 
	 
	| eol lineNo | 
	eol := '\'. 
	lineNo := 0. 
	^aStringList 
		inject: '' 
		into: 
			[:txt :line |  
			lineNo := lineNo + 1. 
			txt , (aBlock value: lineNo) , line , eol]
]

{ #category : #'*SmallDude-Utils' }
String class >> textLinesFor: aString [ 
	 
	| CR LF | 
	CR := Character cr. 
	LF := Character lf. 
	^aString runsFailing: [:each | each = CR or: [each = LF]]
]
