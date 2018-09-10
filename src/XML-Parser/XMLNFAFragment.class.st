"
This class implements NFA fragments for an XMLNFABuilder. It stores a first state and either a single terminal state or a collection of terminal states (using an OrderedCollection instead of an XMLNFAStateSet), and it can be connected to a state or another fragment.
"
Class {
	#name : #XMLNFAFragment,
	#superclass : #Object,
	#instVars : [
		'firstState',
		'terminalStateOrStates'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #'instance creation' }
XMLNFAFragment class >> firstState: aFirstState [
	^ self new
		setFirstState: aFirstState
		terminalStateOrStates: aFirstState
]

{ #category : #'instance creation' }
XMLNFAFragment class >> firstState: aFirstState terminalState: aTerminalState [
	^ self new
		setFirstState: aFirstState
		terminalStateOrStates: aTerminalState
]

{ #category : #'instance creation' }
XMLNFAFragment class >> firstState: aFirstState terminalStates: aTerminalStateCollection [
	^ self new
		setFirstState: aFirstState
		terminalStateOrStates: aTerminalStateCollection
]

{ #category : #private }
XMLNFAFragment >> connectTerminalStatesToState: aState [
	terminalStateOrStates isCollection
		ifTrue: [
			"use #to:do: for speed"
			1 to: terminalStateOrStates size do: [:i |
				(terminalStateOrStates at: i) connectToState: aState]]
		ifFalse: [terminalStateOrStates connectToState: aState]
]

{ #category : #connecting }
XMLNFAFragment >> connectToFragment: aFragment [
	self connectTerminalStatesToState: aFragment firstState.
	terminalStateOrStates := aFragment terminalStateOrStates.
]

{ #category : #connecting }
XMLNFAFragment >> connectToState: aState [
	self connectTerminalStatesToState: aState.
	terminalStateOrStates := aState.
]

{ #category : #accessing }
XMLNFAFragment >> firstState [
	^ firstState
]

{ #category : #accessing }
XMLNFAFragment >> firstState: aFirstState [
	firstState := aFirstState
]

{ #category : #private }
XMLNFAFragment >> newTerminalStatesWith: aFirstTerminalState and: aSecondTerminalState [
	"avoid #with:with: to control the capacity"
	^ (OrderedCollection new: 4)
		addLast: aFirstTerminalState;
		addLast: aSecondTerminalState;
		yourself
]

{ #category : #initialization }
XMLNFAFragment >> setFirstState: aFirstState terminalStateOrStates: aTerminalStateOrStateCollection [
	firstState := aFirstState.
	terminalStateOrStates := aTerminalStateOrStateCollection.
]

{ #category : #accessing }
XMLNFAFragment >> terminalState: aTerminalState [
	terminalStateOrStates := aTerminalState
]

{ #category : #private }
XMLNFAFragment >> terminalStateOrStates [
	^ terminalStateOrStates
]

{ #category : #accessing }
XMLNFAFragment >> terminalStates [
	^ terminalStateOrStates isCollection
		ifTrue: [terminalStateOrStates]
		ifFalse: [OrderedCollection with: terminalStateOrStates]
]

{ #category : #accessing }
XMLNFAFragment >> terminalStates: aTerminalStateCollection [
	terminalStateOrStates := aTerminalStateCollection
]

{ #category : #private }
XMLNFAFragment >> terminalStatesAddedTo: aTerminalStateCollection [
	terminalStateOrStates isCollection
		ifTrue: [
			"#to:do: for speed"
			1 to: terminalStateOrStates size do: [:i |
				aTerminalStateCollection addLast: (terminalStateOrStates at: i)]]
		ifFalse: [aTerminalStateCollection addLast: terminalStateOrStates].
	^ aTerminalStateCollection.
]

{ #category : #converting }
XMLNFAFragment >> terminalStatesWith: aTerminalState [
	terminalStateOrStates isCollection
		ifTrue: [
			terminalStateOrStates addLast: aTerminalState.
			^ terminalStateOrStates]
		ifFalse: [
			^ self
				newTerminalStatesWith: terminalStateOrStates
				and: aTerminalState]
]

{ #category : #converting }
XMLNFAFragment >> terminalStatesWithAllFrom: aFragment [
	terminalStateOrStates isCollection
		ifTrue: [^ aFragment terminalStatesAddedTo: terminalStateOrStates].
	aFragment terminalStateOrStates isCollection
		ifTrue: [^ self terminalStatesAddedTo: aFragment terminalStateOrStates].
	^ self
		newTerminalStatesWith: terminalStateOrStates
		and: aFragment terminalStateOrStates.
]
