Class {
	#name : #Antlr4CharacterRangeNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'from',
		'dotDot',
		'to'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4CharacterRangeNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitCharacterRange: self
]

{ #category : #generated }
Antlr4CharacterRangeNode >> dotDot [
	^ dotDot
]

{ #category : #generated }
Antlr4CharacterRangeNode >> dotDot: aSmaCCToken [
	dotDot := aSmaCCToken
]

{ #category : #generated }
Antlr4CharacterRangeNode >> from [
	^ from
]

{ #category : #generated }
Antlr4CharacterRangeNode >> from: aSmaCCToken [
	from := aSmaCCToken
]

{ #category : #generated }
Antlr4CharacterRangeNode >> to [
	^ to
]

{ #category : #generated }
Antlr4CharacterRangeNode >> to: aSmaCCToken [
	to := aSmaCCToken
]

{ #category : #generated }
Antlr4CharacterRangeNode >> tokenVariables [
	^ #(#from #dotDot #to)
]
