"
A PPExpressionParser is a parser to conveniently define an expression grammar with prefix, postfix, and left- and right-associative infix operators.

The following code initializes a parser for arithmetic expressions. First we instantiate an expression parser, a simple parser for expressions in parenthesis and a simple parser for integer numbers.

	expression := PPExpressionParser new.
	parens := $( asParser token trim , expression , $) asParser token trim 
		==> [ :nodes | nodes second ].
	integer := #digit asParser plus token trim
		==> [ :token | token value asInteger ].
	
Then we define on what term the expression grammar is built on:

	expression term: parens / integer.
	
Finally we define the operator-groups in descending precedence. Note, that the action blocks receive both, the terms and the parsed operator in the order they appear in the parsed input. 
	
	expression
		group: [ :g |
			g prefix: $- asParser token trim do: [ :op :a | a negated ] ];
		group: [ :g |
			g postfix: '++' asParser token trim do: [ :a :op | a + 1 ].
			g postfix: '--' asParser token trim do: [ :a :op | a - 1 ] ];
		group: [ :g |
			g right: $^ asParser token trim do: [ :a :op :b | a raisedTo: b ] ];
		group: [ :g |
			g left: $* asParser token trim do: [ :a :op :b | a * b ].
			g left: $/ asParser token trim do: [ :a :op :b | a / b ] ];
		group: [ :g |
			g left: $+ asParser token trim do: [ :a :op :b | a + b ].
			g left: $- asParser token trim do: [ :a :op :b | a - b ] ].
		
After evaluating the above code the 'expression' is an efficient parser that evaluates examples like:

	expression parse: '-8++'.
	expression parse: '1+2*3'.
	expression parse: '1*2+3'.
	expression parse: '(1+2)*3'.
	expression parse: '8/4/2'.
	expression parse: '8/(4/2)'.
	expression parse: '2^2^3'.
	expression parse: '(2^2)^3'.
	
Instance Variables:
	operators	<Dictionary>	The operators defined in the current group.
"
Class {
	#name : #PPExpressionParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'operators'
	],
	#category : #'PetitParser-Tools'
}

{ #category : #private }
PPExpressionParser >> build: aParser left: aChoiceParser [
	^ (aParser separatedBy: aChoiceParser) foldLeft: [ :a :op :b | op first value: a value: op second value: b ]
]

{ #category : #private }
PPExpressionParser >> build: aParser postfix: aChoiceParser [
	^ aParser , aChoiceParser star map: [ :term :ops | ops inject: term into: [ :result :operator | operator first value: result value: operator second ] ]
]

{ #category : #private }
PPExpressionParser >> build: aParser prefix: aChoiceParser [
	^ aChoiceParser star , aParser map: [ :ops :term | ops reverse inject: term into: [ :result :operator | operator first value: operator second value: result ] ]
]

{ #category : #private }
PPExpressionParser >> build: aParser right: aChoiceParser [
	^ (aParser separatedBy: aChoiceParser) foldRight: [ :a :op :b | op first value: a value: op second value: b ]
]

{ #category : #private }
PPExpressionParser >> buildOn: aParser [
	^ self buildSelectors inject: aParser into: [ :term :selector |
		| list |
		list := operators at: selector ifAbsent: [ #() ].
		list isEmpty
			ifTrue: [ term ]
			ifFalse: [
				self
					perform: selector with: term 
					with: (list size = 1
						ifTrue: [ list first first ==> [ :operator | Array with: list first second with: operator ] ]
						ifFalse: [ 
							list
								inject: PPChoiceParser new
								into: [ :choice :each | choice / (each first ==> [ :operator | Array with: each second with: operator ]) ] ]) ] ]
]

{ #category : #private }
PPExpressionParser >> buildSelectors [
	^ #(build:prefix: build:postfix: build:right: build:left:)
]

{ #category : #specifying }
PPExpressionParser >> group: aOneArgumentBlock [
	"Defines a priority group by evaluating aOneArgumentBlock."
	
	operators := Dictionary new.
	parser := [ 
		aOneArgumentBlock value: self.
	 	self buildOn: parser ]
			ensure: [ operators := nil ]
]

{ #category : #specifying }
PPExpressionParser >> left: aParser do: aThreeArgumentBlock [
	"Define an operator aParser that is left-associative. Evaluate aThreeArgumentBlock with the first term, the operator, and the second term."
	
	self operator: #build:left: parser: aParser do: aThreeArgumentBlock
]

{ #category : #private }
PPExpressionParser >> operator: aSymbol parser: aParser do: aBlock [
	parser isNil
		ifTrue: [ ^ self error: 'You did not specify a term when creating the receiver.' ].
	operators isNil
		ifTrue: [ ^ self error: 'Use #group: to define precedence groups in descending order.' ].
	(operators at: aSymbol ifAbsentPut: [ OrderedCollection new ])
		addLast: (Array with: aParser asParser with: aBlock)
]

{ #category : #specifying }
PPExpressionParser >> postfix: aParser do: aTwoArgumentBlock [
	"Define a postfix operator aParser. Evaluate aTwoArgumentBlock with the term and the operator."

	self operator: #build:postfix: parser: aParser do: aTwoArgumentBlock
]

{ #category : #specifying }
PPExpressionParser >> prefix: aParser do: aTwoArgumentBlock [
	"Define a prefix operator aParser. Evaluate aTwoArgumentBlock with the operator and the term."

	self operator: #build:prefix: parser: aParser do: aTwoArgumentBlock
]

{ #category : #specifying }
PPExpressionParser >> right: aParser do: aThreeArgumentBlock [
	"Define an operator aParser that is right-associative. Evaluate aThreeArgumentBlock with the first term, the operator, and the second term."
	
	self operator: #build:right: parser: aParser do: aThreeArgumentBlock
]

{ #category : #specifying }
PPExpressionParser >> term: aParser [
	"Defines the initial term aParser of the receiver."
	
	parser isNil
		ifTrue: [ parser := aParser ]
		ifFalse: [ self error: 'Unable to redefine the term.' ]
]
