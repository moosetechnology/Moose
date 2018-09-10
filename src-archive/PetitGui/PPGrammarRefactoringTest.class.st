"
Tests for grammar refactorings
"
Class {
	#name : #PPGrammarRefactoringTest,
	#superclass : #TestCase,
	#instVars : [
		'refactoring'
	],
	#category : #'PetitGui-Tests'
}

{ #category : #accessing }
PPGrammarRefactoringTest >> change [
	^ self refactoring changes
]

{ #category : #accessing }
PPGrammarRefactoringTest >> changes [
	^ self change changes
]

{ #category : #utilities }
PPGrammarRefactoringTest >> performRefactoring: aRefactoring [
	refactoring := aRefactoring.
	aRefactoring primitiveExecute
]

{ #category : #accessing }
PPGrammarRefactoringTest >> refactoring [
	^ refactoring
]

{ #category : #'testing-parsers' }
PPGrammarRefactoringTest >> testAddParser [
	self performRefactoring: (PPAddParserRefactoring name: #PPMockParser category: #'PetitGui-Mock').
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddClassChange.
	self assert: self changes first definitionClass equals: PPCompositeParser.
	self assert: self changes first changeClassName equals: #PPMockParser.
	self assert: self changes first category equals: #'PetitGui-Mock'.
	self assert: self changes last class equals: RBAddMethodChange.
	self assert: self changes last parseTree equals: (RBParser parseMethod: 'start ^ self shouldBeImplemented')
]

{ #category : #'testing-parsers' }
PPGrammarRefactoringTest >> testAddParserWithSuperclass [
	self
		performRefactoring:
			(PPAddParserRefactoring name: #PPMockParser category: #'PetitGui-Mock' superclass: PPArithmeticParser).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddClassChange.
	self assert: self changes first definitionClass equals: PPArithmeticParser.
	self assert: self changes first changeClassName equals: #PPMockParser.
	self assert: self changes first category equals: #'PetitGui-Mock'.
	self assert: self changes last class equals: RBAddMethodChange.
	self assert: self changes last parseTree equals: (RBParser parseMethod: 'start ^ self shouldBeImplemented')
]

{ #category : #'testing-productions' }
PPGrammarRefactoringTest >> testDefineProduction [
	self
		performRefactoring:
			(PPDefineProductionRefactoring
				onClass: PPArithmeticParser
				source: 'function ^ #any plus , $( , $) ==> [ :e | 0 ]'
				protocols: (Array with: #productions)).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'function'.
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals: (RBParser parseMethod: 'function ^ #any asParser plus , $( asParser , $) asParser ==> [ :e | 0 ]')
]

{ #category : #'testing-productions' }
PPGrammarRefactoringTest >> testExtractProduction [
	self
		performRefactoring:
			(PPExtractProductionRefactoring
				onClass: PPArithmeticParser
				production: #addition
				interval: (36 to: 60)
				to: #plusOrMinus).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'plusOrMinus'.
	self assert: self changes second class equals: RBAddMethodChange.
	self assert: self changes second parseTree equals: (RBParser parseMethod: 'plusOrMinus ^ $+ asParser / $- asParser').
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals:
			(RBParser
				parseMethod:
					'addition ^ (factors separatedBy: plusOrMinus trim) foldLeft: [ :a :op :b | a perform: op asSymbol with: b ]')
]

{ #category : #'testing-parsers' }
PPGrammarRefactoringTest >> testRemoveParser [
	self performRefactoring: (PPRemoveParserRefactoring onClass: PPArithmeticParser).
	self assert: self changes size equals: 1.
	self assert: self changes first class equals: RBRemoveClassChange.
	self assert: self changes first changeClassName equals: 'PPArithmeticParser'
]

{ #category : #'testing-productions' }
PPGrammarRefactoringTest >> testRemoveProduction [
	self performRefactoring: (PPRemoveProductionRefactoring onClass: PPArithmeticParser production: #addition).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBRemoveMethodChange.
	self assert: self changes first selector equals: #addition.
	self assert: self changes last class equals: RBRemoveInstanceVariableChange.
	self assert: self changes last variable equals: 'addition'
]

{ #category : #'testing-productions' }
PPGrammarRefactoringTest >> testRenameProduction [
	self performRefactoring: (PPRenameProdcutionRefactoring onClass: PPArithmeticParser rename: #addition to: #add).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBRenameInstanceVariableChange.
	self assert: self changes first oldName equals: 'addition'.
	self assert: self changes first newName equals: 'add'.
	self assert: self changes second class equals: RBAddMethodChange.
	self
		assert: self changes second parseTree
		equals:
			(RBParser
				parseMethod:
					'add ^ (factors separatedBy: ($+ asParser / $- asParser) trim) foldLeft: [ :a :op :b | a perform: op asSymbol with: b ]').
	self assert: self changes last class equals: RBRemoveMethodChange.
	self assert: self changes last selector equals: #addition
]
