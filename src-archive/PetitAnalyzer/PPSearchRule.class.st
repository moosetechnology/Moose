"
PPSearchRule is a rule that simply searches for matches to the rule. Every time a match is found, answerBlock is evaluated with the parser that matches and the current answer. This two-argument approach allows a collection to be formed from all of the matches, like with #inject:into:.

Instance Variables:
	answerBlock	<BlockClosure>	Block to evaluate with the matching node and the current answer.

"
Class {
	#name : #PPSearchRule,
	#superclass : #PPRule,
	#instVars : [
		'answerBlock'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPSearchRule class >> searchFor: aParser thenDo: aBlock [
	^ (self searchFor: aParser) setAnswerBlock: aBlock
]

{ #category : #matching }
PPSearchRule >> canMatch: aParser [
	owner setAnswer: (answerBlock cull: aParser cull: owner answer).
	^ super canMatch: aParser
]

{ #category : #matching }
PPSearchRule >> foundMatchFor: aParser [ 
	^ aParser
]

{ #category : #initialization }
PPSearchRule >> setAnswerBlock: aBlock [
	answerBlock := aBlock
]
