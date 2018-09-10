Class {
	#name : #SmaCCParseTreeComparisonCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'SmaCC_Parse_Tree_Comparison'
}

{ #category : #accessing }
SmaCCParseTreeComparisonCommandLineHandler class >> commandName [
	^ 'SmaCCCompareParseTrees'
]

{ #category : #public }
SmaCCParseTreeComparisonCommandLineHandler >> activate [
	self arguments size ~= 2
		ifTrue: [ self exitFailure: 'Please supply two filenames to compare' ].
	self compareFile: self arguments first to: self arguments last
]

{ #category : #public }
SmaCCParseTreeComparisonCommandLineHandler >> compareFile: aString to: anotherString [
	| tree1 tree2 |
	tree1 := self parseTreeFor: aString.
	tree2 := self parseTreeFor: anotherString.
	tree1 = tree2
		ifFalse: [ self exitFailure: 'ASTs are different' ].
	self exitSuccess
]

{ #category : #public }
SmaCCParseTreeComparisonCommandLineHandler >> openFile: aString [
	^ [ FileStream readOnlyFileNamed: aString ]
		on: Error
		do: [ :ex | self exitFailure ]
]

{ #category : #public }
SmaCCParseTreeComparisonCommandLineHandler >> parseTreeFor: aString [
	| parserClass stream |
	parserClass := self parserClassFor: aString asFileReference extension.
	stream := self openFile: aString.
	^ [ [ parserClass parseStream: stream ]
		on: Error
		do: [ :ex | self exitFailure: ex description ] ]
		ensure: [ stream close ]
]

{ #category : #public }
SmaCCParseTreeComparisonCommandLineHandler >> parserClassFor: aString [
	^ SmaCCParser allSubclasses
		detect: [ :each | each fileExtension = ('.' , aString) ]
		ifNone: [ self exitFailure: 'Cannot find parser for file type: ' , aString ]
]
