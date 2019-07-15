Extension { #name : #String }

{ #category : #'*Roassal2' }
String >> cutCamelCase [
	"Breaks apart words written in camel case.
	
	It's not simply using piecesCutWhere: because we want
	to also deal with abbreviations and thus we need to 
	decide based on three characters, not just on two:
	 ('FOOBar') piecesCutWhereCamelCase asArray = #('FOO' 'Bar').
	('FOOBar12AndSomething') piecesCutWhereCamelCase asArray = #('FOO' 'Bar' '12' 'And' 'Something')	
	"
	
	| start previous current next pieces |
	self isEmpty ifTrue: [^self].
	start := 1.
	pieces := OrderedCollection new.
	3 to: self size do: [ :index |
		previous := self at: index - 2.
		current := self at: index - 1.
		next := self at: index.
		((previous isLowercase and: [current isUppercase]) or: [
			(previous isUppercase and: [current isUppercase and: [next isLowercase ]]) or: [
				(previous isDigit not and: [current isDigit]) or: [
					previous isDigit and: [current isDigit not] 
		]]]) ifTrue: [
			pieces add: (self copyFrom: start to: index - 2).
			start := index - 1].
	].
	pieces addAll: ((self copyFrom: start to: self size) piecesCutWhere: [:a :b | 
		(a isDigit and: [b isDigit not]) or: [a isDigit not and: [b isDigit ]]]).
	^pieces
]

{ #category : #'*Roassal2' }
String >> subStringsKeepingEmptyFields: separators [ 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	"In addition, it makes sure that double quote do not prevent from parsing"
	| result sourceStream subStringStream isInDoubleQuotes |
	isInDoubleQuotes := false.
	
	(separators isString or: [ separators allSatisfy: [ :element | element isCharacter ] ])
		ifFalse: [ ^ self error: 'separators must be Characters.' ].
	sourceStream := self readStream.
	result := OrderedCollection new.
	subStringStream := String new writeStream.
	[ sourceStream atEnd ] whileFalse: [
		| char |
		char := sourceStream next.
		(char = $") ifTrue: [
			isInDoubleQuotes := isInDoubleQuotes not ].
		
		isInDoubleQuotes 
			ifTrue: [ subStringStream nextPut: char ]
			ifFalse: [ 
				(separators includes: char)
					ifTrue: [
						result add: subStringStream contents.
						subStringStream := String new writeStream ]
					ifFalse: [
						subStringStream nextPut: char ] ] ].

	result add: subStringStream contents.
	^ result asArray
]
