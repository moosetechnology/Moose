Class {
	#name : #PPLambdaParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #accessing }
PPLambdaParserTest >> parserClass [
	^ PPLambdaParser
]

{ #category : #testing }
PPLambdaParserTest >> testAbstraction [
	self assert: '\x.y' is: #('x' 'y').
	self assert: '\x.\y.z' is: #('x' ('y' 'z'))
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testAnd [
	self assert: self parserClass and equals: #('p' #('q' #(#('p' 'q') 'p')))
]

{ #category : #testing }
PPLambdaParserTest >> testApplication [
	self assert: '(x x)' is: #('x' 'x').
	self assert: '(x y)' is: #('x' 'y').
	self assert: '((x y) z)' is: #(('x' 'y') 'z').
	self assert: '(x (y z))' is: #('x' ('y' 'z'))
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testFalse [
	self assert: self parserClass false equals: #('x' #('y' 'y'))
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testIfThenElse [
	self assert: self parserClass ifthenelse equals: #('p' 'p')
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testNot [
	self assert: self parserClass not equals: #('p' #('a' #('b' #(#('p' 'b') 'a'))))
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testOr [
	self assert: self parserClass or equals: #('p' #('q' #(#('p' 'p') 'q')))
]

{ #category : #'testing-utilities' }
PPLambdaParserTest >> testParseOnError [
	| beenHere |
	result := self parserClass parse: '\x. y' onError: [ self fail ].
	self assert: result equals: #('x' 'y').
	beenHere := false.
	result := self parserClass parse: '\x.' onError: [ beenHere := true ].
	self assert: beenHere.
	beenHere := false.
	result := self parserClass
		parse: '\x. '
		onError: [ :fail | 
			beenHere := true.
			fail ].
	self assert: beenHere.
	self assert: result message includesSubstring: 'letter'.
	self assert: result message includesSubstring: 'expected'.
	self assert: result position equals: 4.
	beenHere := false.
	result := self parserClass
		parse: '\x. '
		onError: [ :msg :pos | 
			self assert: msg includesSubstring: 'letter'.
			self assert: msg includesSubstring: 'expected'.
			self assert: pos equals: 4.
			beenHere := true ].
	self assert: result.
	self assert: beenHere

]

{ #category : #'testing-utilities' }
PPLambdaParserTest >> testParseStartingAtOnError [
	| beenHere |
	result := self parserClass parse: 'x' startingAt: #variable onError: [ self fail ].
	self assert: result equals: 'x'.
	beenHere := false.
	result := self parserClass parse: '\' startingAt: #variable onError: [ beenHere := true ].
	self assert: beenHere.
	beenHere := false.
	result := self parserClass
		parse: '\ '
		startingAt: #variable
		onError: [ :fail | 
			beenHere := true.
			fail ].
	self assert: beenHere.
	self assert: result message equals: 'letter expected'.
	self assert: result position equals: 0.
	beenHere := false.
	result := self parserClass
		parse: '\ '
		startingAt: #variable
		onError: [ :msg :pos | 
			self assert: msg equals: 'letter expected'.
			self assert: pos equals: 0.
			beenHere := true ].
	self assert: beenHere

]

{ #category : #'testing-utilities' }
PPLambdaParserTest >> testProductionAt [
	self assert: (parser productionAt: #foo) isNil.
	self assert: (parser productionAt: #foo ifAbsent: [ true ]).
	
	self assert: (parser productionAt: #start) notNil.
	self assert: (parser productionAt: #start ifAbsent: [ true ]) notNil.
	
	self assert: (parser productionAt: #variable) notNil.
	self assert: (parser productionAt: #variable ifAbsent: [ true ]) notNil
]

{ #category : #'testing-curch' }
PPLambdaParserTest >> testTrue [
	self assert: self parserClass true equals: #('x' #('y' 'x'))
]

{ #category : #testing }
PPLambdaParserTest >> testVariable [
	self assert: 'x' is: 'x'.
	self assert: 'xy' is: 'xy'.
	self assert: 'x12' is: 'x12'
]
