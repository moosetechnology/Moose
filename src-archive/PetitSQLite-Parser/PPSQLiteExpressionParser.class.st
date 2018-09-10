Class {
	#name : #PPSQLiteExpressionParser,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'operators'
	],
	#category : #'PetitSQLite-Parser'
}

{ #category : #private }
PPSQLiteExpressionParser >> build: aParser left: aChoiceParser [
	^ self fold: (aParser separatedBy: aChoiceParser) left: [ :a :op :b | op first value: a value: op second value: b ]
]

{ #category : #private }
PPSQLiteExpressionParser >> build: aParser postfix: aChoiceParser [
	^ aParser , aChoiceParser star map: [ :term :ops | ops inject: term into: [ :result :operator | operator first value: result value: operator second ] ]
]

{ #category : #private }
PPSQLiteExpressionParser >> build: aParser prefix: aChoiceParser [
	^ aChoiceParser star , aParser map: [ :ops :term | ops reverse inject: term into: [ :result :operator | operator first value: operator second value: result ] ]
]

{ #category : #private }
PPSQLiteExpressionParser >> build: aParser right: aChoiceParser [
	^ self fold: (aParser separatedBy: aChoiceParser) right: [ :a :op :b | op first value: a value: op second value: b ]
]

{ #category : #private }
PPSQLiteExpressionParser >> buildOn: aParser [
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
								inject: PP2ChoiceNode new
								into: [ :choice :each | choice / (each first ==> [ :operator | Array with: each second with: operator ]) ] ]) ] ]
]

{ #category : #private }
PPSQLiteExpressionParser >> buildSelectors [
	^ #(build:prefix: build:postfix: build:right: build:left:)
]

{ #category : #private }
PPSQLiteExpressionParser >> fold: parser left: aBlock [
	"Answer a new parser that that folds the result of the receiver from left-to-right into aBlock. The argument aBlock must take two or more arguments."
	
	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ parser ==> [ :nodes |
		args at: 1 put: nodes first.
		2 to: nodes size by: size - 1 do: [ :index |
			args
				replaceFrom: 2 to: size with: nodes startingAt: index;
				at: 1 put: (aBlock valueWithArguments: args) ].
		args first ]
]

{ #category : #private }
PPSQLiteExpressionParser >> fold: parser right: aBlock [
	"Answer a new parser that that folds the result of the receiver from right-to-left into aBlock. The argument aBlock must take two or more arguments."

	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ parser ==> [ :nodes |
		args at: size put: nodes last.
		nodes size - size + 1 to: 1 by: 1 - size do: [ :index |
			args
				replaceFrom: 1 to: size - 1 with: nodes startingAt: index;
				at: size put: (aBlock valueWithArguments: args) ].
		args at: size ]
]

{ #category : #specifying }
PPSQLiteExpressionParser >> group: aOneArgumentBlock [
	"Defines a priority group by evaluating aOneArgumentBlock."
	
	operators := Dictionary new.
	child := [ 
		aOneArgumentBlock value: self.
	 	self buildOn: child ]
			ensure: [ operators := nil ]
]

{ #category : #specifying }
PPSQLiteExpressionParser >> left: aParser do: aThreeArgumentBlock [
	"Define an operator aParser that is left-associative. Evaluate aThreeArgumentBlock with the first term, the operator, and the second term."
	
	self operator: #build:left: parser: aParser do: aThreeArgumentBlock
]

{ #category : #private }
PPSQLiteExpressionParser >> operator: aSymbol parser: aParser do: aBlock [
	child isNil
		ifTrue: [ ^ self error: 'You did not specify a term when creating the receiver.' ].
	operators isNil
		ifTrue: [ ^ self error: 'Use #group: to define precedence groups in descending order.' ].
	(operators at: aSymbol ifAbsentPut: [ OrderedCollection new ])
		addLast: (Array with: aParser asPParser with: aBlock)
]

{ #category : #specifying }
PPSQLiteExpressionParser >> postfix: aParser do: aTwoArgumentBlock [
	"Define a postfix operator aParser. Evaluate aTwoArgumentBlock with the term and the operator."

	self operator: #build:postfix: parser: aParser do: aTwoArgumentBlock
]

{ #category : #specifying }
PPSQLiteExpressionParser >> prefix: aParser do: aTwoArgumentBlock [
	"Define a prefix operator aParser. Evaluate aTwoArgumentBlock with the operator and the term."
	self operator: #build:prefix: parser: aParser do: aTwoArgumentBlock
]

{ #category : #specifying }
PPSQLiteExpressionParser >> right: aParser do: aThreeArgumentBlock [
	"Define an operator aParser that is right-associative. Evaluate aThreeArgumentBlock with the first term, the operator, and the second term."
	
	self operator: #build:right: parser: aParser do: aThreeArgumentBlock
]

{ #category : #specifying }
PPSQLiteExpressionParser >> term: aParser [
	"Defines the initial term aParser of the receiver."
	
	child isNil
		ifTrue: [ child := aParser ]
		ifFalse: [ self error: 'Unable to redefine the term.' ]
]
