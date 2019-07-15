Class {
	#name : #SmaCCNodeCalculation,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'classes',
		'variableSymbols',
		'singleVariableSymbols'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCNodeCalculation class >> compileForGrammar: aSmaCCGrammar [
	self new
		grammar: aSmaCCGrammar;
		compileNodeClasses
]

{ #category : #private }
SmaCCNodeCalculation >> calculateReduceActions [
	variableSymbols
		do:
			[ :each | 
			each
				productionsDo: [ :rhs | rhs reduceAction: (SmaCCVariableReduceCode onRHS: rhs) ] ].
	singleVariableSymbols
		do:
			[ :each | 
			each
				productionsDo: [ :rhs | rhs reduceAction: (SmaCCSingleVariableReduceCode onRHS: rhs) ] ].
	grammar
		rhsDo:
			[ :each | 
			each hasNodeClassDefinition
				ifTrue: [ each
						reduceAction: (SmaCCCreateNodeReduceCode onRHS: each) ]
				ifFalse:
					[ each hasReduceAction
						ifFalse: [ each
								reduceAction: (SmaCCDefaultNodeReduceCode onRHS: each) ] ] ]
]

{ #category : #private }
SmaCCNodeCalculation >> calculateVariableSymbols [
	variableSymbols := Set new.
	grammar symbols
		do:
			[ :each | 
			each requiresNodeType
				ifTrue:
					[ each
						productionsDo:
							[ :rhs | rhs unnamedSymbolsDo: [ :sym | self calculateVariableSymbolsFor: sym ] ] ] ].
	variableSymbols := variableSymbols
		select: [ :each | self hasVariables: each seen: IdentitySet new ].
	singleVariableSymbols := variableSymbols
		select: [ :each | self hasSingleVariableName: each ].
	variableSymbols removeAll: singleVariableSymbols
]

{ #category : #private }
SmaCCNodeCalculation >> calculateVariableSymbolsFor: aSmaCCSymbol [
	aSmaCCSymbol isTerminal
		ifTrue: [ ^ self ].
	aSmaCCSymbol requiresNodeType
		ifTrue: [ ^ self ].
	(variableSymbols includes: aSmaCCSymbol)
		ifTrue: [ ^ self ].
	variableSymbols add: aSmaCCSymbol.
	aSmaCCSymbol
		productionsDo:
			[ :rhs | 
			rhs
				unnamedSymbolsDo: [ :each | self calculateVariableSymbolsFor: each ] ]
]

{ #category : #private }
SmaCCNodeCalculation >> calculateVariables [
	SmaCCVariableCalculation calculateVariablesForGrammar: grammar
]

{ #category : #private }
SmaCCNodeCalculation >> codeGenerator [
	^ grammar codeGenerator
]

{ #category : #private }
SmaCCNodeCalculation >> compileMethodsAndVariables [
	self sortedClasses do: [ :each | each compileMethodsAndVariables ]
]

{ #category : #private }
SmaCCNodeCalculation >> compileNodeClasses [
	self sortedClasses isEmpty
		ifTrue: [ ^ self ].
	self defineNodeClasses.
	self calculateVariableSymbols.
	self calculateReduceActions.
	self calculateVariables.
	self compileMethodsAndVariables.
	self compileVisitor.
	self compileTypes
]

{ #category : #private }
SmaCCNodeCalculation >> compileTypes [
	self codeGenerator compileSymbolTypes
]

{ #category : #private }
SmaCCNodeCalculation >> compileVisitor [
	| class |
	class := self codeGenerator
		defineClass: grammar rootDefinition fullName , 'Visitor'
		asSubclassOf: (self codeGenerator model classFor: SmaCCParseNodeVisitor).
	self codeGenerator removeOldMethodsFrom: class.
	self codeGenerator removeOldMethodsFrom: class theMetaClass.
	(SmaCCVisitorClassDefinition forClassDefinitions: self sortedClasses)
		grammar: grammar;
		modelClass: class;
		compileMethodsAndVariables
]

{ #category : #private }
SmaCCNodeCalculation >> defineNodeClasses [
	self sortedClasses
		do: [ :each | self codeGenerator compileNodeClassDefinition: each ]
]

{ #category : #private }
SmaCCNodeCalculation >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #private }
SmaCCNodeCalculation >> hasSingleVariableName: aSymbol [
	^ self
		hasSingleVariableName: aSymbol
		using: Set new
		seen: IdentitySet new
]

{ #category : #private }
SmaCCNodeCalculation >> hasSingleVariableName: aSymbol using: nameSet seen: seen [
	(seen includes: aSymbol)
		ifTrue: [ ^ true ].
	seen add: aSymbol.
	aSymbol
		productionsDo:
			[ :rhs | 
			nameSet addAll: rhs variableNames.
			nameSet size > 1
				ifTrue: [ ^ false ].
			rhs
				unnamedSymbolsDo:
					[ :sym | 
					(self hasSingleVariableName: sym using: nameSet seen: seen)
						ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : #private }
SmaCCNodeCalculation >> hasVariables: aSmaCCSymbol seen: aSet [
	aSmaCCSymbol requiresNodeType
		ifTrue: [ ^ false ].
	(aSet includes: aSmaCCSymbol)
		ifTrue: [ ^ false ].
	aSet add: aSmaCCSymbol.
	aSmaCCSymbol
		productionsDo:
			[ :each | 
			each hasNamedVariable
				ifTrue: [ ^ true ].
			each
				do: [ :symbol | 
					(self hasVariables: symbol seen: aSet)
						ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : #private }
SmaCCNodeCalculation >> sortedClasses [
	^ classes
		ifNil:
			[ classes := grammar classDefinitions
				asSortedCollection: [ :a :b | a isSortedBefore: b ] ]
]
