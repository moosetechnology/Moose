Class {
	#name : #SmaCCRegexSimulator,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'nfa',
		'actionMap'
	],
	#category : #'SmaCC_Debugging_Support-Simulation'
}

{ #category : #examples }
SmaCCRegexSimulator class >> example [
	<gtExample>
	^ self on: SmaCCDefinitionParser definitionAST tokenName: '<name>'
]

{ #category : #examples }
SmaCCRegexSimulator class >> matchingExample [
	<gtExample>
	self example
		matchesOn: 't_1'
		do: [ :i :nodes | self inform: 'Match at: ' , i printString , ' nodes: ' , nodes printString ]
]

{ #category : #'instance creation' }
SmaCCRegexSimulator class >> on: aSmaCCGrammarDefinitionNode tokenName: aString [
	^ self new
		grammar: aSmaCCGrammarDefinitionNode;
		tokenName: aString;
		yourself
]

{ #category : #private }
SmaCCRegexSimulator >> buildErrorNFA [
	nfa := SmaCCNode new
]

{ #category : #private }
SmaCCRegexSimulator >> expandEpsilonAndSymbolTransitions: aCollection [
	| todo |
	todo := OrderedCollection withAll: aCollection.
	[ todo notEmpty ]
		whileTrue: [ todo removeFirst transitions
				do: [ :each | 
					(each isEpsilonTransition or: [ each isCharacterTransition not ])
						ifTrue: [ (aCollection includes: each to)
								ifFalse: [ aCollection add: each to.
									todo add: each to ] ] ] ].
	^ aCollection
]

{ #category : #'initialize-release' }
SmaCCRegexSimulator >> grammar: aSmaCCGrammarDefinitionNode [
	grammar := aSmaCCGrammarDefinitionNode
]

{ #category : #private }
SmaCCRegexSimulator >> mapNodesToActionsFor: aNode [
	aNode
		allNodesDo: [ :each | 
			(each isKindOf: SmaCCTokenRegexNode)
				ifTrue: [ (aNode topParent tokenNamed: each name value)
						ifNotNil: [ :token | self mapNodesToActionsFor: token ] ].
			actionMap add: each.
			each regularExpression
				ifNotNil: [ :re | re action: actionMap size ] ]
]

{ #category : #private }
SmaCCRegexSimulator >> matchedNodesFrom: stateCollection [
	| indices |
	indices := IdentitySet new.
	stateCollection do: [ :each | indices addAll: (each action ifNil: [ #() ]) ].
	^ indices collect: [ :each | actionMap at: each ]
]

{ #category : #running }
SmaCCRegexSimulator >> matchesOn: aString do: aBlock [
	| states |
	states := self expandEpsilonAndSymbolTransitions: (IdentitySet with: nfa).
	aBlock value: 0 value: (self matchedNodesFrom: states).
	1 to: aString size do: [ :i | 
		states := self moveFrom: states on: (aString at: i).
		states isEmpty
			ifTrue: [ ^ aBlock value: i value: nil ].
		aBlock value: i value: (self matchedNodesFrom: states) ]
]

{ #category : #private }
SmaCCRegexSimulator >> moveFrom: stateCollection on: aCharacter [
	| newStates |
	newStates := IdentitySet new.
	stateCollection
		do: [ :each | 
			each transitions
				do: [ :edge | 
					(edge includes: aCharacter)
						ifTrue: [ newStates add: edge to ] ] ].
	^ self expandEpsilonAndSymbolTransitions: newStates
]

{ #category : #'initialize-release' }
SmaCCRegexSimulator >> tokenName: aString [
	| node regex |
	node := grammar tokenNamed: aString.
	node isNil
		ifTrue: [ ^ self buildErrorNFA ].
	actionMap := OrderedCollection new.
	[ regex := SmaCCSequenceRENode nodes: {node regularExpression}.
	actionMap add: node.
	regex action: 1.
	self mapNodesToActionsFor: node.
	nfa := regex asNFA ]
		ensure: [ grammar
				withAllNodesDo: [ :each | each removeAttributeNamed: #regularExpression ] ]
]
