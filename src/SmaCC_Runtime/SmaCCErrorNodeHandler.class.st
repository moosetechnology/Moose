Class {
	#name : #SmaCCErrorNodeHandler,
	#superclass : #SmaCCErrorHandler,
	#category : #'SmaCC_Runtime'
}

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> errorHandlerStates [
	^ self stateStack collect: [ :each | self errorShiftActionsForState: each ]
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> errorShiftActionsForState: stateIndex [
	^ self nodeShiftActionsFor: stateIndex
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> errorSortValueFor: stateIndex [
	| count hasCurrentTokenAction |
	count := 0.
	hasCurrentTokenAction := false.
	self
		allActionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			count := count + 1.
			hasCurrentTokenAction := hasCurrentTokenAction or: [ self currentToken ids includes: symbol ] ].
	^ hasCurrentTokenAction
		ifTrue: [ count bitShift: 16 ]
		ifFalse: [ count ]
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> findErrorHandlerIfNoneUseErrorNumber: anInteger [
	| handlerStates index startingErrorToken stackContents dismissedTokens newState |
	dismissedTokens := OrderedCollection new.
	handlerStates := self errorHandlerStates reverse.
	startingErrorToken := self currentToken.
	[ self isEOFToken
		ifTrue: [ self finishErrorParse: startingErrorToken dismissed: dismissedTokens.
			^ true ].
	handlerStates size to: 1 by: -1 do: [ :i | 
		| states newStack |
		states := handlerStates at: i.
		states
			do: [ :each | 
				newStack := parser stateStack copyFrom: 1 to: handlerStates size - i + 1.
				newStack addLast: each.
				(self willShift: newStack)
					ifTrue: [ index := i.
						newState := each ] ] ].
	index isNil ] whileTrue: [ dismissedTokens add: self dismissErrorToken ].
	stackContents := self dismissStackTopForErrorRecovery: index - 1.
	self stateStack addLast: newState.
	self nodeStack
		addLast:
			(SmaCCError new
				stackContents: stackContents;
				dismissedTokens: dismissedTokens;
				errorToken: startingErrorToken;
				yourself).
	^ true
]

{ #category : #'error handling' }
SmaCCErrorNodeHandler >> finishErrorParse: errorToken dismissed: dismissedTokens [
	| handlerStates |
	handlerStates := self nodeErrorHandlerStates reverse.
	(self finishErrorParse: errorToken dismissed: dismissedTokens handlerStates: handlerStates)
		ifFalse: [ self reportError: 0 ]
]

{ #category : #'error handling' }
SmaCCErrorNodeHandler >> finishErrorParse: errorToken dismissed: dismissedTokens handlerStates: handlerStates [
	| newStack stackContents |
	1 to: handlerStates size do: [ :i | 
		(handlerStates at: i)
			reverseDo: [ :each | 
				newStack := parser stateStack copyFrom: 1 to: handlerStates size - i + 1.
				newStack addLast: each.
				(self willAccept: newStack)
					ifTrue: [ stackContents := self dismissStackTopForErrorRecovery: i - 1.
						self stateStack addLast: each.
						self nodeStack
							addLast:
								(SmaCCError new
									stackContents: stackContents;
									dismissedTokens: dismissedTokens;
									errorToken: errorToken;
									yourself).
						^ true ] ] ].
	^ false
]

{ #category : #'error handling' }
SmaCCErrorNodeHandler >> handleError: anInteger [
	self markErrorToken.
	self performErrorReductions.
	self isEOFToken
		ifTrue: [ self finishErrorParse: self currentToken dismissed: OrderedCollection new.
			^ true ].
	^ self findErrorHandlerIfNoneUseErrorNumber: anInteger
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> nodeErrorHandlerStates [
	^ self stateStack collect: [ :each | self nodeShiftActionsFor: each ]
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> nodeShiftActionsFor: stateIndex [
	| potentialNewStates |
	potentialNewStates := Set new.
	self
		allActionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			((action bitAnd: self actionMask) = self shiftAction and: [ self isNodeType: (self symbolTypes at: symbol ifAbsent: [ #Object ]) ])
				ifTrue: [ potentialNewStates add: (action bitShift: -2) ] ].
	^ potentialNewStates asSortedCollection: [ :a :b | (self errorSortValueFor: a) < (self errorSortValueFor: b) ]
]

{ #category : #'private-error handling' }
SmaCCErrorNodeHandler >> performErrorReductions [
	self subclassResponsibility
]
