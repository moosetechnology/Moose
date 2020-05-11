"
I run through all the comments in a moosemodel, remove noise, and check for a minimum length and report the useful ones.
"
Class {
	#name : #FamixCAAnalyzer,
	#superclass : #Object,
	#instVars : [
		'model',
		'commentedCodeDetector'
	],
	#category : #'Famix-CommentAnalyzer'
}

{ #category : #public }
FamixCAAnalyzer class >> findCommentedCodeIn: aMooseModel [
	self new
		model: aMooseModel;
		findCommentedCode
]

{ #category : #public }
FamixCAAnalyzer class >> findUsefulCommentsIn: aMooseEntity [
	^ self new
		model: aMooseEntity;
		reportUsefulComments
]

{ #category : #accessing }
FamixCAAnalyzer >> commentClass [
	^ self mooseModel factory entityNamed: #Comment ifAbsent: [ self error: 'No entity Comment found in metamodel.' ]
]

{ #category : #accessing }
FamixCAAnalyzer >> commentedCodeDetector [
	^ commentedCodeDetector ifNil: [ commentedCodeDetector := FamixCACommentedCodeDetector with: self model sourceLanguage ]
]

{ #category : #public }
FamixCAAnalyzer >> findCommentedCode [
	"For each comment of the model, a pattern matching is applied to detect commented code.
	If 1/3 of the comment is real comment, then we still consider the complete comment as code because two lines are still non-code"

	self model allComments
		do: [ :comment | comment isCode: (self commentedCodeDetector commentedCodeLinesIn: comment) size / comment lines size > 0.66 ]
		displayingProgress: [ 'Looking for commented code in comments' ]
]

{ #category : #accessing }
FamixCAAnalyzer >> indexFileAnchorClass [
	^ self mooseModel factory entityNamed: #IndexedFileAnchor ifAbsent: [ self error: 'No entity IndexedFileAnchor found in metamodel.' ]
]

{ #category : #computation }
FamixCAAnalyzer >> mergeContiguousComments [
	"I try to find contiguous comments in a moose model and merge them into one comment."

	self flag: #todo.	"this does not work with all source anchros and should be generalized."
	^ self model comments asOrderedCollection
		ifNotEmpty: [ :comments | 
			| newComments |
			newComments := comments sorted: [ :comment | comment sourceAnchor startPos ] ascending.
			newComments := newComments piecesCutWhere: [ :current :next | (current sourceAnchor isContiguousWith: next sourceAnchor) not ].
			newComments := newComments collect: [ :aGroupOfComments | self mergedCommentFrom: aGroupOfComments ].
			self model mergedComments: newComments.
			newComments ]
]

{ #category : #computation }
FamixCAAnalyzer >> mergedCommentFrom: aCollectionOfContiguousComments [
	^ (self commentClass content: ((aCollectionOfContiguousComments collect: #sourceText) joinUsing: String lf))
		sourceAnchor:
			(self indexFileAnchorClass
				fileName: aCollectionOfContiguousComments anyOne sourceAnchor fileName
				startPos: aCollectionOfContiguousComments first sourceAnchor startPos
				endPos: aCollectionOfContiguousComments last sourceAnchor endPos);
		yourself
]

{ #category : #computation }
FamixCAAnalyzer >> mergedComments [
	^ self model mergedComments ifEmpty: [ self mergeContiguousComments ]
]

{ #category : #accessing }
FamixCAAnalyzer >> minimumNumberOfCharacters [
	"Make configurable later"

	^ 15
]

{ #category : #accessing }
FamixCAAnalyzer >> model [
	^ model
]

{ #category : #accessing }
FamixCAAnalyzer >> model: anObject [
	model := anObject
]

{ #category : #accessing }
FamixCAAnalyzer >> mooseModel [
	^ self model isMooseModel
		ifTrue: [ self model ]
		ifFalse: [ self model mooseModel ]
]

{ #category : #computation }
FamixCAAnalyzer >> reportUsefulComments [
	^ self mergedComments
		collect: [ :aMergedComment | self commentClass fromLines: (self useFulLinesIn: aMergedComment) ]
		thenSelect: [ :mergedComment | mergedComment lines isNotEmpty ]
]

{ #category : #computation }
FamixCAAnalyzer >> useFulLinesIn: aMergedComment [
	"number of meaningful lines in this comment after removing those that don't have a sufficient length and from those that are sufficiently long find those which are commented lines of code"

	^ (aMergedComment lines select: [ :aLine | aLine onlyLetters size >= self minimumNumberOfCharacters ])
		difference: (self commentedCodeDetector commentedCodeLinesIn: aMergedComment)
]
