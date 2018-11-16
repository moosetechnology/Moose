Class {
	#name : #SmaCCDefinitionNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitAlternationRegex: anAlternationRegex [
	^ self visitRegex: anAlternationRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitAssociativeDirective: anAssociativeDirective [
	^ self visitDirective: anAssociativeDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitAttributeDirective: anAttributeDirective [
	^ self visitDirective: anAttributeDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitCharacterBlockRegex: aCharacterBlockRegex [
	^ self visitRegex: aCharacterBlockRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitCharacterRegex: aCharacterRegex [
	^ self visitRegex: aCharacterRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitClassProductionExpression: aClassProductionExpression [
	^ self visitProductionExpression: aClassProductionExpression
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitCodeProductionExpression: aCodeProductionExpression [
	^ self visitProductionExpression: aCodeProductionExpression
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitConcatenationRegex: aConcatenationRegex [
	^ self visitRegex: aConcatenationRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitDefinition: aDefinition [
	^ self visitSmaCCParseNode: aDefinition
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitDefinitionError: aDefinitionError [
	^ self visitDefinition: aDefinitionError
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitDirective: aDirective [
	^ self visitDefinition: aDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitErrorSymbol: anErrorSymbol [
	^ self visitSymbol: anErrorSymbol
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitFlagDirective: aFlagDirective [
	^ self visitDirective: aFlagDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitGrammarDefinition: aGrammarDefinition [
	^ self visitDefinition: aGrammarDefinition
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitGroupTerm: aGroupTerm [
	^ self visitDefinition: aGroupTerm
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitIdDirective: anIdDirective [
	^ self visitDirective: anIdDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitIgnoreVariableDirective: anIgnoreVariableDirective [
	^ self visitDirective: anIgnoreVariableDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitKeywordSymbol: aKeywordSymbol [
	^ self visitSymbol: aKeywordSymbol
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitNodeNameDirective: aNodeNameDirective [
	^ self visitDirective: aNodeNameDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitPostfixTerm: aPostfixTerm [
	^ self visitDefinition: aPostfixTerm
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitProductionExpression: aProductionExpression [
	^ self visitDefinition: aProductionExpression
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitProductionRule: aProductionRule [
	^ self visitDefinition: aProductionRule
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitProductionSymbol: aProductionSymbol [
	^ self visitSymbol: aProductionSymbol
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitRegex: aRegex [
	^ self visitDefinition: aRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitRepeatRegex: aRepeatRegex [
	^ self visitRegex: aRepeatRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitScopeDirective: aScopeDirective [
	^ self visitDirective: aScopeDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitStartDirective: aStartDirective [
	^ self visitDirective: aStartDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitSuperclassDirective: aSuperclassDirective [
	^ self visitDirective: aSuperclassDirective
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitSymbol: aSymbol [
	^ self visitDefinition: aSymbol
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitTokenRegex: aTokenRegex [
	^ self visitRegex: aTokenRegex
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitTokenRule: aTokenRule [
	^ self visitDefinition: aTokenRule
]

{ #category : #generated }
SmaCCDefinitionNodeVisitor >> visitTokenSymbol: aTokenSymbol [
	^ self visitSymbol: aTokenSymbol
]
