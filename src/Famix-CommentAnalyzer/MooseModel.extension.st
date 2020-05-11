Extension { #name : #MooseModel }

{ #category : #'*Famix-CommentAnalyzer' }
MooseModel >> commentedCodeRate [
	^ self allModelBehaviourals average: #commentedCodeCommentsPercentage
]

{ #category : #'*Famix-CommentAnalyzer' }
MooseModel >> documentationRate [
	^ self
		lookUpPropertyNamed: #documentationRate
		computedAs: [ self allComments ifEmpty: [ ^ 0 ].
			(self allComments sum: #numberOfLinesOfCode) / self numberOfLinesOfCode ]
]
