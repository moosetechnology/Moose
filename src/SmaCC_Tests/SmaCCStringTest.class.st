Class {
	#name : #SmaCCStringTest,
	#superclass : #TestCase,
	#category : #'SmaCC_Tests'
}

{ #category : #tests }
SmaCCStringTest >> testCombiningDeletedIntervals [
	| string intervalCount current |
	string := SmaCCString on: '12345'.
	#(3 2 4) do: [ :each | string deleteCharacter: each ].
	self assert: string asString = '15'.
	intervalCount := 0.
	current := (string instVarNamed: 'firstSentinel') next.
	[ current isSentinel ]
		whileFalse: [ intervalCount := intervalCount + 1.
			current := current next ].
	self assert: intervalCount = 3
]

{ #category : #tests }
SmaCCStringTest >> testCopyFromTo [
	| string |
	string := SmaCCString on: '1245'.
	string insert: '3' at: 3.
	self assert: (string copyFrom: 2 to: 3) asString = '234'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteAcrossInsert [
	| string |
	string := SmaCCString on: '1233345'.
	string insert: '234' at: 5.
	string deleteFrom: 4 to: 5.
	self assert: string asString = '12345'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteAcrossInserts [
	| string startIndex stopIndex |
	string := SmaCCString on: '16'.
	startIndex := string insert: '233' at: 2.
	stopIndex := string insert: '445' at: 2.
	string insert: 'asdf' at: stopIndex.
	string deleteFrom: startIndex + 2 to: stopIndex.
	self assert: string asString = '123456'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteAll [
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 1 to: 4.
	self assert: string asString = ''
]

{ #category : #tests }
SmaCCStringTest >> testDeleteFirst [
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 1 to: 1.
	self assert: string asString = 'sdf'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteLast [
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 4 to: 4.
	self assert: string asString = 'asd'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteUpTo [
	| string |
	string := SmaCCString on: '123456'.
	#(1 3) do: [ :each | string deleteCharacter: each ].
	string deleteUpTo: 5.
	self assert: string asString = '56'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteUpToEnd [
	| string |
	string := SmaCCString on: '123456'.
	#(1 5) do: [ :each | string deleteCharacter: each ].
	string deleteUpToEnd: 3.
	self assert: string asString = '2'
]

{ #category : #tests }
SmaCCStringTest >> testDeleteWhitespaceBeforeAfter [
	| string |
	string := SmaCCString on: '0 asdf 9'.
	string deleteWhitespaceBeforeIndex: 4.
	self assert: string asString = '0 asdf 9'.
	string deleteWhitespaceAfterIndex: 4.
	self assert: string asString = '0 asdf 9'.
	string deleteWhitespaceBeforeIndex: 3.
	self assert: string asString = '0asdf 9'.
	string deleteWhitespaceAfterIndex: 6.
	self assert: string asString = '0asdf9'
]

{ #category : #tests }
SmaCCStringTest >> testDoubleInsertInMiddle [
	| string index |
	string := SmaCCString on: '15'.
	index := string insert: '24' at: 2.
	string insert: '3' at: index + 1.
	self assert: string asString = '12345'
]

{ #category : #tests }
SmaCCStringTest >> testInsertAtBeginning [
	| string |
	string := SmaCCString on: '12345'.
	string insert: '0' at: 1.
	self assert: string asString = '012345'
]

{ #category : #tests }
SmaCCStringTest >> testInsertAtEnd [
	| string |
	string := SmaCCString on: '12345'.
	string insert: '6' at: 6.
	self assert: string asString = '123456'
]

{ #category : #tests }
SmaCCStringTest >> testInsertInMiddle [
	| string |
	string := SmaCCString on: '1245'.
	string insert: '3' at: 3.
	self assert: string asString = '12345'
]

{ #category : #tests }
SmaCCStringTest >> testInsertOnEmptyString [
	| string |
	string := SmaCCString on: ''.
	string insert: '123456' at: 1.
	self assert: string asString = '123456'
]

{ #category : #tests }
SmaCCStringTest >> testInsertWhitespace [
	| string |
	string := SmaCCString
		on:
			'1' , (String with: Character cr with: Character lf) , '2'
				, (String with: Character cr) , '3' , (String with: Character lf)
				, '4' , (String with: Character lf) , (String with: Character cr)
				, '5' , (String with: Character lf).
	string addNewLineWhitespace: ' ' from: 1 to: string size.
	self
		assert:
			string asString
				=
					('1' , (String with: Character cr with: Character lf) , ' 2'
						, (String with: Character cr) , ' 3'
						, (String with: Character lf) , ' 4'
						, (String with: Character lf) , ' '
						, (String with: Character cr) , ' 5'
						, (String with: Character lf) , ' ')
]

{ #category : #tests }
SmaCCStringTest >> testMoveAfter [
	| string |
	string := SmaCCString on: '123456'.
	string moveFrom: 1 to: 2 after: 3.
	self assert: string asString = '312456'.
	string deleteFrom: 1 to: 4.
	self assert: string asString = '356'.
	string := SmaCCString on: '123456'.
	string moveFrom: 1 to: 3 after: 6.
	self assert: string asString = '456123'
]

{ #category : #tests }
SmaCCStringTest >> testMoveBefore [
	| string |
	string := SmaCCString on: '123456'.
	string moveFrom: 4 to: 6 before: 3.
	self assert: string asString = '124563'.
	string deleteFrom: 5 to: 5.
	self assert: string asString = '12463'.
	string := SmaCCString on: '123456'.
	string moveFrom: 4 to: 6 before: 1.
	self assert: string asString = '456123'
]

{ #category : #tests }
SmaCCStringTest >> testMultipleDeleteAll [
	| string |
	string := SmaCCString on: 'asdf'.
	#(1 3 4 2) do: [ :each | string deleteCharacter: each ].
	self assert: string asString = ''
]

{ #category : #tests }
SmaCCStringTest >> testMultipleDeleteWhitespaceAfter [
	| string |
	string := SmaCCString on: '0 asdf 9'.
	6 to: 3 by: -1 do:
		[ :i | 
		string
			deleteWhitespaceAfterIndex: i;
			deleteCharacter: i ].
	self assert: '0 9' = string asString
]

{ #category : #tests }
SmaCCStringTest >> testMultipleDeleteWhitespaceBefore [
	| string |
	string := SmaCCString on: '0 asdf 9'.
	3 to: 6 do:
		[ :i | 
		string
			deleteWhitespaceBeforeIndex: i;
			deleteCharacter: i ].
	self assert: '0 9' = string asString
]

{ #category : #tests }
SmaCCStringTest >> testMultipleInserts [
	| string |
	string := SmaCCString on: '125'.
	string insert: '3' at: 3.
	string insert: '4' at: 3.
	self assert: string asString = '12345'
]

{ #category : #tests }
SmaCCStringTest >> testMultipleInsertsAndDeletes [
	| string indices last |
	string := SmaCCString on: ''.
	last := 0.
	indices := (1 to: 5)
		collect: [ :each | last := string insert: each printString , 'X' at: last + 1 ].
	string deleteFrom: last + 1 to: indices first + 1.
	self assert: string asString = '12345'
]

{ #category : #tests }
SmaCCStringTest >> testNoEdits [
	| string |
	string := SmaCCString on: 'asdf'.
	self assert: string asString = 'asdf'
]

{ #category : #tests }
SmaCCStringTest >> testReplaceInserted [
	| string index |
	string := SmaCCString on: '1245'.
	index := string insert: 'x' at: 3.
	string replaceFrom: index to: index with: '3'.
	self assert: string asString = '12345'
]
