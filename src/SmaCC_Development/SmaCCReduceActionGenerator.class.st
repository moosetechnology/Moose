Class {
	#name : #SmaCCReduceActionGenerator,
	#superclass : #Object,
	#instVars : [
		'rhs',
		'index',
		'generator',
		'variableName',
		'currentIndex',
		'currentSymbol'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCReduceActionGenerator class >> generate: aSmaCCRHS pullUp: anInteger on: aCodeGenerator [
	^ self new generate: aSmaCCRHS pullUp: anInteger on: aCodeGenerator
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> compileAddToVariable: aSmaCCVariableDefinition from: argument collection: isCollection [
	^ aSmaCCVariableDefinition isCollection
		ifTrue:
			[ | selector var |
			var := rhs nodeType
				variableDefinitionNamed: aSmaCCVariableDefinition variableName.
			selector := 'add'.
			currentIndex < index
				ifTrue: [ selector := selector , 'First' ].
			selector := selector
				,
					(var isBaseNodeType
						ifTrue: [ 'Node' ]
						ifFalse: [ var isBaseTokenType
								ifTrue: [ 'Token' ]
								ifFalse: [ 'Object' ] ]).
			isCollection
				ifTrue: [ selector := selector , 's' ].
			selector := (selector , ':to:') asSymbol.
			generator
				send: selector
				to: 'result'
				with: argument
				with: (generator send: var getterMethodName to: 'result') ]
		ifFalse:
			[ generator
				send: aSmaCCVariableDefinition setterMethodName
				to: 'result'
				with: argument ]
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> connectChild [
	| variableDefinition argument symbol isCollection |
	variableDefinition := rhs nodeType
		variableDefinitionNamed: variableName.
	argument := generator
		cast: (generator argumentIndex: currentIndex)
		to: variableDefinition baseType name.
	isCollection := false.
	symbol := rhs at: currentIndex.
	symbol returnsSingleVariable
		ifTrue: [ isCollection := symbol isCollection: symbol variableName ].
	^ self
		compileAddToVariable: variableDefinition
		from: argument
		collection: isCollection
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> generate: aSmaCCRHS pullUp: anInteger on: aCodeGenerator [
	rhs := aSmaCCRHS.
	index := anInteger.
	generator := aCodeGenerator.
	rhs collection
		keysAndValuesDo:
			[ :i :each | 
			currentIndex := i.
			currentSymbol := each.
			index ~= currentIndex
				ifTrue:
					[ variableName := rhs variableNameForIndex: currentIndex.
					variableName notNil
						ifTrue:
							[ currentSymbol returnsVariableCollection
								ifTrue: [ rhs
										generateNamedVariableCollectionWarningFor: currentIndex ].
							generator nextPutStatement: self connectChild ]
						ifFalse: [ self pullUpChildren ] ] ]
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> getSubIndex: subIndex ofType: collectionType [
	^ generator
		cast: (generator argumentIndex: currentIndex subIndex: subIndex)
		to: collectionType
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> pullUpChildren [
	currentSymbol returnsVariableCollection
		ifTrue: [ ^ self pullUpVariableArray ].
	currentSymbol returnsSingleVariable
		ifTrue: [ ^ self pullUpVariable ].
	currentSymbol modelType = (generator model classFor: nil class)
		ifFalse: [ rhs generateUnnamedSymbolWarningFor: currentIndex ]
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> pullUpVariable [
	currentSymbol variableDefinitions
		keysAndValuesDo:
			[ :subIndex :var | 
			generator
				nextPutStatement:
					(var isCollection
						ifTrue:
							[ self
								compileAddToVariable: var
								from:
									(generator
										cast: (generator argumentIndex: currentIndex)
										to: generator collectionType)
								collection: true ]
						ifFalse:
							[ | nodesVariable |
							nodesVariable := rhs nodeType
								variableDefinitionNamed: var variableName.
							nodesVariable isCollection
								ifTrue:
									[ self
										compileAddToVariable: nodesVariable
										from:
											(generator
												cast: (generator argumentIndex: currentIndex)
												to: nodesVariable type name)
										collection: false ]
								ifFalse:
									[ generator
										send: nodesVariable setterMethodName
										to: 'result'
										with:
											(generator
												cast: (generator argumentIndex: currentIndex)
												to: nodesVariable type name) ] ]) ]
]

{ #category : #'reduction table' }
SmaCCReduceActionGenerator >> pullUpVariableArray [
	currentSymbol variableDefinitions
		keysAndValuesDo:
			[ :subIndex :var | 
			generator
				nextPutStatement:
					(var isCollection
						ifTrue:
							[ | collectionType |
							collectionType := generator collectionType.
							self
								compileAddToVariable: var
								from: (self getSubIndex: subIndex ofType: collectionType)
								collection: true ]
						ifFalse:
							[ | nodesVariable |
							nodesVariable := rhs nodeType
								variableDefinitionNamed: var variableName.
							nodesVariable isCollection
								ifTrue:
									[ self
										compileAddToVariable: nodesVariable
										from: (self getSubIndex: subIndex ofType: nodesVariable type name)
										collection: false ]
								ifFalse:
									[ generator
										send: nodesVariable setterMethodName
										to: 'result'
										with:
											(generator
												cast: (generator argumentIndex: currentIndex subIndex: subIndex)
												to: nodesVariable type name) ] ]) ]
]
