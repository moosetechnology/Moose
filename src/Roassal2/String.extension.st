Extension { #name : #String }

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
