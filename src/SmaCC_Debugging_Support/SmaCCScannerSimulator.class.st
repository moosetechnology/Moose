Class {
	#name : #SmaCCScannerSimulator,
	#superclass : #SmaCCScanner,
	#instVars : [
		'grammar',
		'nfa',
		'methodMap',
		'emptyId',
		'errorId'
	],
	#category : #'SmaCC_Debugging_Support-Simulation'
}

{ #category : #'instance creation' }
SmaCCScannerSimulator class >> forGrammar: aSmaCCGrammar nfa: aSmaCCNode [
	^ self new
		grammar: aSmaCCGrammar;
		nfa: aSmaCCNode;
		yourself
]

{ #category : #private }
SmaCCScannerSimulator >> buildMethodMap [
	methodMap := Dictionary new.
	grammar tokens
		keysDo: [ :each | 
			| selector |
			each first = $<
				ifTrue: [ selector := (each copyFrom: 2 to: each size - 1) asSymbol.
					((SmaCCScanner organization
						listAtCategoryNamed: #'default token handling')
						includes: selector)
						ifTrue: [ methodMap
								at: (grammar symbols identityIndexOf: (grammar symbolNamed: each))
								put: selector ] ] ]
]

{ #category : #accessing }
SmaCCScannerSimulator >> emptySymbolTokenId [
	^ emptyId
		ifNil: [ emptyId := grammar symbols identityIndexOf: grammar emptySymbol ]
]

{ #category : #accessing }
SmaCCScannerSimulator >> errorTokenId [
	^ errorId
		ifNil: [ errorId := grammar symbols identityIndexOf: grammar errorSymbol ]
]

{ #category : #private }
SmaCCScannerSimulator >> expandStates: aCollection [
	| todo ids |
	todo := aCollection copy.
	todo do: [ :each | self expandStates: aCollection from: each ].
	ids := Set new.
	aCollection
		do: [ :each | each action ifNotNil: [ :action | ids addAll: action ] ].
	ids notEmpty
		ifTrue: [ self recordMatch: ids asSortedCollection asArray ]
]

{ #category : #private }
SmaCCScannerSimulator >> expandStates: aCollection from: aSmaCCNode [
	aSmaCCNode transitions
		do: [ :each | 
			(each isEpsilonTransition
				or: [ each isCharacterTransition not
						and: [ each transitionObjects includes: scope ] ])
				ifTrue: [ (aCollection includes: each to)
						ifFalse: [ aCollection add: each to.
							self expandStates: aCollection from: each to ] ] ]
]

{ #category : #'initialize-release' }
SmaCCScannerSimulator >> grammar: smaccGrammar [
	grammar := smaccGrammar.
	self buildMethodMap
]

{ #category : #private }
SmaCCScannerSimulator >> moveFrom: currentStates [
	| newStates |
	newStates := IdentitySet new.
	currentStates
		do: [ :each | 
			each transitions
				do: [ :edge | 
					(edge isEpsilonTransition not
						and: [ edge isCharacterTransition
								and: [ edge transitionObjects includes: currentCharacter ] ])
						ifTrue: [ newStates add: edge to ] ] ].
	^ newStates
]

{ #category : #'initialize-release' }
SmaCCScannerSimulator >> nfa: aSmaCCNode [
	nfa := aSmaCCNode
]

{ #category : #private }
SmaCCScannerSimulator >> reportLastMatch: isError [
	matchActions isNil
		ifTrue: [ isError
				ifTrue: [ matchActions := #(0) ] ]
		ifFalse: [ (matchActions notEmpty
				and: [ methodMap includesKey: matchActions first ])
				ifTrue: [ matchActions := methodMap at: matchActions first ] ].
	^ self reportLastMatch
]

{ #category : #accessing }
SmaCCScannerSimulator >> scanForToken [
	| currentStates |
	currentStates := IdentitySet with: nfa.
	[ self expandStates: currentStates.
	currentStates notEmpty and: [ stream atEnd not ] ]
		whileTrue: [ self step.
			currentStates := self moveFrom: currentStates ].
	^ self reportLastMatch: currentStates isEmpty
]
