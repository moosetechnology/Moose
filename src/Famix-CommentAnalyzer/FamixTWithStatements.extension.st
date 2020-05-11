Extension { #name : #FamixTWithStatements }

{ #category : #'*Famix-CommentAnalyzer' }
FamixTWithStatements >> sourceCommentRateWithCleaning [
	^ self privateState cacheAt: #sourceCommentRateWithCleaning ifAbsentPut: [ self sourceCommentRateWithSelector: #numberOfUsefulCommentLines ]
]

{ #category : #'*Famix-CommentAnalyzer' }
FamixTWithStatements >> sourceCommentRateWithSelector: aSelector [
	^ (self cyclomaticComplexity < 5 or: [ self numberOfLinesOfCode < 30 ])
		ifTrue: [ 3 ]
		ifFalse: [ (self perform: aSelector) * 9 / self numberOfLinesOfCode / (1 - (10 raisedTo: self cyclomaticComplexity negated / 15)) round: 2 ]
]
