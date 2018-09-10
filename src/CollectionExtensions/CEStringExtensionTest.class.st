Class {
	#name : #CEStringExtensionTest,
	#superclass : #TestCase,
	#category : #CollectionExtensions
}

{ #category : #tests }
CEStringExtensionTest >> testIntervalFromStartLineStartColumnToEndLineEndColumn [
	| string |
	string := '123
56
89'.
	self assert: (string intervalFromStartLine: 1 startColumn: 1 toEndLine: 1 endColumn: 2) = (1 to: 2).
	self assert: (string intervalFromStartLine: 2 startColumn: 2 toEndLine: 3 endColumn: 2) = (6 to: 9)
]

{ #category : #tests }
CEStringExtensionTest >> testIntervalOfLine [
	| string |
	string := '123
56
89'.
	self assert: (string intervalOfLine: 1) = (1 to: 4).
	self assert: (string intervalOfLine: 2) = (5 to: 7).
	self assert: (string intervalOfLine: 3) = (8 to: 9)
]

{ #category : #tests }
CEStringExtensionTest >> testIntervalOfLineCorrespondingToIndex [
	| string |
	string := '123
56
89'.
	self assert: (string intervalOfLineCorrespondingToIndex: 1) = (1 to: 4).
	self assert: (string intervalOfLineCorrespondingToIndex: 7) = (5 to: 7).
	self assert: (string intervalOfLineCorrespondingToIndex: 9) = (8 to: 9)
]

{ #category : #tests }
CEStringExtensionTest >> testPiecesCutWhereCamelCase [

	self assert: ('' piecesCutWhereCamelCase) isEmpty.
	self assert: ('fBar' piecesCutWhereCamelCase) asArray  = #('f' 'Bar').
	self assert: ('fooBar' piecesCutWhereCamelCase) asArray  = #('foo' 'Bar').
	self assert: ('FOOBar') piecesCutWhereCamelCase asArray = #('FOO' 'Bar').
	self assert: ('fooBar1' piecesCutWhereCamelCase) asArray  = #('foo' 'Bar' '1').
	self assert: ('FOOBar12AndSomething') piecesCutWhereCamelCase asArray = #('FOO' 'Bar' '12' 'And' 'Something').
]
