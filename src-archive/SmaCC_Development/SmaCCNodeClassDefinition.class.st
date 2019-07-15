"
SmaCCNodeClassDefinition represents a class to compile.

Instance Variables
	extraAttributes	<Collection of: SmaCCVariableDefinition>	extra variables that should be added to the class
	productions	<Collection of: SmaCCRHS>	all of the rhs that return/create this class
	variables	<Collection of: SmaCCVariableDefinition>	the variables defined by the grammar for this class

"
Class {
	#name : #SmaCCNodeClassDefinition,
	#superclass : #SmaCCClassDefinition,
	#instVars : [
		'productions',
		'variables',
		'extraAttributes'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCNodeClassDefinition class >> named: aSymbol grammar: aSmaCCGrammar [
	^ self new
		name: aSymbol;
		grammar: aSmaCCGrammar;
		yourself
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> addProduction: aSmaCCRHS [
	productions add: aSmaCCRHS.
	aSmaCCRHS nodeClassDefinition: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> addVariable: aSmaCCVariableDefinition [
	self codeGenerator
		addVariable: aSmaCCVariableDefinition
		forDefinition: self
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> baseTypeOf: aVariableName [
	| allTypes aRBRootNamespace |
	aRBRootNamespace := class model.
	allTypes := self modelTypesForVariable: aVariableName.
	allTypes
		remove: (aRBRootNamespace classFor: nil class)
		ifAbsent: [ nil ].
	allTypes isEmpty
		ifTrue: [ ^ aRBRootNamespace classFor: Object ].
	allTypes := allTypes asOrderedCollection.
	^ allTypes
		inject: allTypes first
		into:
			[ :sum :each | 
			| current |
			current := sum.
			[ current notNil and: [ (each includesClass: current) not ] ]
				whileTrue: [ current := current superclass ].
			current ]
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> calculateCommonSubclassVariables [
	| allSubclassVars includedVariables |
	allSubclassVars := Bag new.
	subclasses
		do: [ :each | allSubclassVars addAll: each variableDefinitions ].
	includedVariables := allSubclassVars asSet
		select: [ :each | (allSubclassVars occurrencesOf: each) = subclasses size ].
	^ self subclassProductionVariables
		select: [ :each | includedVariables includes: each ]
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> collectionVariableDefinitions [
	^ self variableDefinitions select: [ :each | each isCollection ]
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileChildrenMethod [
	self codeGenerator compileChildrenMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileCopyInContextMethod [
	self codeGenerator compileCopyInContextMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileEqualMethod [
	self codeGenerator compileEqualMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileGetterAndSetter: aSmaCCVariableDefinition [
	self codeGenerator
		compileGetterAndSetter: aSmaCCVariableDefinition
		forDefinition: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileHashMethod [
	self codeGenerator compileHashMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileInitializeMethod [
	self codeGenerator compileInitializeMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileMatchInContextMethod [
	self codeGenerator compileMatchInContextMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileMethodsAndVariables [
	self
		compileVariablesAndAccessors;
		compileInitializeMethod;
		compileHashMethod;
		compileEqualMethod;
		compilePostCopyMethod;
		compileChildrenMethod;
		compileCopyInContextMethod;
		compileMatchInContextMethod;
		compileVariablesMethods
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compilePostCopyMethod [
	self codeGenerator compilePostCopyMethod: self
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileVariableAndAccessor: aSmaCCVariableDefinition [
	aSmaCCVariableDefinition
		baseType: (self baseTypeOf: aSmaCCVariableDefinition variableName).
	aSmaCCVariableDefinition
		isAlwaysAssigned: (self isAlwaysAssigned: aSmaCCVariableDefinition variableName).
	self addVariable: aSmaCCVariableDefinition.
	self compileGetterAndSetter: aSmaCCVariableDefinition
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileVariablesAndAccessors [
	self variableDefinitions
		do: [ :each | self compileVariableAndAccessor: each ].
	self extraAttributes
		do: [ :each | self compileVariableAndAccessor: each ]
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> compileVariablesMethods [
	self codeGenerator compileVariablesMethods: self
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> extraAttributes [
	^ extraAttributes
]

{ #category : #'initialize-release' }
SmaCCNodeClassDefinition >> extraAttributes: aCollection [
	extraAttributes := aCollection
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> fullName [
	^ self codeGenerator namespaceName , grammar prefix , name
		, grammar suffix
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> grammar [
	^ grammar
]

{ #category : #'initialize-release' }
SmaCCNodeClassDefinition >> initialize [
	super initialize.
	productions := OrderedCollection new.
	extraAttributes := OrderedCollection new
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> instanceVariableNames [
	^ self variableDefinitions collect: [ :each | each variableName ]
]

{ #category : #testing }
SmaCCNodeClassDefinition >> isAlwaysAssigned: aString [
	^ ((self modelTypesForVariable: aString)
		includes: (class model classFor: nil class))
		and:
			[ self withAllSubclasses
				allSatisfy:
					[ :sub | 
					sub productions
						allSatisfy: [ :each | each locallyDefinesVariable: aString ] ] ]
]

{ #category : #testing }
SmaCCNodeClassDefinition >> isCollectionVariable: aVariableName [
	| definition |
	definition := self variableDefinitionNamed: aVariableName.
	definition notNil
		ifTrue: [ ^ definition isCollection ].
	^ superclass notNil
		and: [ superclass isCollectionVariable: aVariableName ]
]

{ #category : #testing }
SmaCCNodeClassDefinition >> isLocalVariable: aSmaCCVariableDefinition [
	^ superclass isNil
		or:
			[ (superclass
				variableDefinitionNamed: aSmaCCVariableDefinition variableName)
				isNil ]
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> modelTypesForVariable: aVariableName [
	| allTypes |
	allTypes := Set new.
	self withAllSubclasses
		do:
			[ :each | 
			each productions
				do:
					[ :production | allTypes addAll: (production modelTypesForVariable: aVariableName) ] ].
	^ allTypes
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> nodeVariableDefinitions [
	^ self variableDefinitions
		select: [ :each | each isBasePossibleNodeType ]
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> productionVariables [
	| vars |
	vars := productions collect: [ :each | each variableDefinitions ].
	^ SmaCCSymbol mergeOrderedVariableDefinitions: vars
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> productions [
	^ productions
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> removeDuplicateSubclassVariables [
	variables
		do:
			[ :each | 
			self withAllSubclasses
				do:
					[ :sub | 
					sub == self
						ifFalse: [ sub removeInstanceVariable: each variableName ] ] ]
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> removeInstanceVariable: aString [
	| variable |
	variable := self variableDefinitions
		detect: [ :each | each variableName = aString ]
		ifNone: [ nil ].
	variable isNil
		ifTrue: [ ^ self ].
	variables remove: variable.
	SmaCCVariableDefinition assignIndices: variables
]

{ #category : #private }
SmaCCNodeClassDefinition >> rootClassName [
	^ SmaCCParseNode name
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> subclassProductionVariables [
	| vars |
	vars := self withAllSubclasses
		collect: [ :sub | sub productionVariables ].
	^ SmaCCSymbol mergeOrderedVariableDefinitions: vars
]

{ #category : #compiling }
SmaCCNodeClassDefinition >> tempNodeName [
	^ self temporaryNameFor: grammar rootDefinition name
]

{ #category : #'private-variables' }
SmaCCNodeClassDefinition >> variableDefinitionNamed: aString [
	^ self variableDefinitions
		detect: [ :each | each variableName = aString ]
		ifNone:
			[ superclass isNil
				ifTrue: [ nil ]
				ifFalse: [ superclass variableDefinitionNamed: aString ] ]
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> variableDefinitions [
	variables isNil
		ifTrue:
			[ variables := productions isEmpty
				ifTrue: [ self calculateCommonSubclassVariables ]
				ifFalse: [ self productionVariables ].
			self removeDuplicateSubclassVariables.
			SmaCCVariableDefinition assignIndices: variables ].
	^ variables
]

{ #category : #accessing }
SmaCCNodeClassDefinition >> variables [
	^ superclass isNil
		ifTrue: [ self instanceVariableNames copy ]
		ifFalse:
			[ superclass variables
				addAll: self instanceVariableNames;
				yourself ]
]
