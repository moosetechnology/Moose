Class {
	#name : #Antlr4ElementNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'equal',
		'value',
		'suffix',
		'actionBlock',
		'questionMark'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ElementNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitElement: self
]

{ #category : #generated }
Antlr4ElementNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4ElementNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4ElementNode >> equal [
	^ equal
]

{ #category : #generated }
Antlr4ElementNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
Antlr4ElementNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4ElementNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ElementNode >> nodeVariables [
	^ #(#value #suffix #actionBlock)
]

{ #category : #generated }
Antlr4ElementNode >> questionMark [
	^ questionMark
]

{ #category : #generated }
Antlr4ElementNode >> questionMark: aSmaCCToken [
	questionMark := aSmaCCToken
]

{ #category : #generated }
Antlr4ElementNode >> suffix [
	^ suffix
]

{ #category : #generated }
Antlr4ElementNode >> suffix: anAntlr4EbnfSuffixNode [
	self suffix notNil
		ifTrue: [ self suffix parent: nil ].
	suffix := anAntlr4EbnfSuffixNode.
	self suffix notNil
		ifTrue: [ self suffix parent: self ]
]

{ #category : #generated }
Antlr4ElementNode >> tokenVariables [
	^ #(#nameToken #equal #questionMark)
]

{ #category : #generated }
Antlr4ElementNode >> value [
	^ value
]

{ #category : #generated }
Antlr4ElementNode >> value: anAntlr4GrammarNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := anAntlr4GrammarNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
