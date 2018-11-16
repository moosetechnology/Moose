"
SmaCCDefaultNodeReduceCode represents a reduce action that returns an item in the rhs. It returns the first symbol that is a non-terminal. If all symbols are terminals, then it returns the first terminal symbol. If there aren't any symbols, then it returns nil.

Instance Variables
	index	<Integer>	the index in the rhs to return; if 0 then return nil

"
Class {
	#name : #SmaCCDefaultNodeReduceCode,
	#superclass : #SmaCCReduceCode,
	#instVars : [
		'index'
	],
	#classVars : [
		'IsCaching'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'class initialization' }
SmaCCDefaultNodeReduceCode class >> initialize [
	IsCaching := false
]

{ #category : #comparing }
SmaCCDefaultNodeReduceCode >> = anObject [
	^ super = anObject and: [ self index = anObject index ]
]

{ #category : #private }
SmaCCDefaultNodeReduceCode >> basicModelTypes: aSet [
	^ self index = 0
		ifTrue: [ Array with: (self model classFor: nil class) ]
		ifFalse: [ self basicModelTypes: aSet forIndex: self index ]
]

{ #category : #accessing }
SmaCCDefaultNodeReduceCode >> index [
	index isNil
		ifTrue:
			[ rhs size to: 1 by: -1 do: [ :i | 
				(rhs at: i) isTerminal
					ifFalse: [ index := i ] ].
			index isNil
				ifTrue: [ index := 1 min: rhs size ].
			(rhs size = index and: [ index <= 1 ])
				ifFalse: [ self signalNodeCreationWarning ] ].
	^ index
]

{ #category : #public }
SmaCCDefaultNodeReduceCode >> modelTypes: anIdentitySet [
	"Yes, I know it is a hack"

	IsCaching
		ifTrue: [ ^ self basicModelTypes: anIdentitySet ].
	IsCaching := true.
	^ [ super modelTypes: anIdentitySet ]
		ensure: [ IsCaching := false ]
]

{ #category : #private }
SmaCCDefaultNodeReduceCode >> returnedNodeIndex [
	self index = 0
		ifTrue: [ ^ nil ].
	^ self index
]

{ #category : #accessing }
SmaCCDefaultNodeReduceCode >> signalNodeCreationWarning [
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: 'Unable to determine what should be returned from the production. ';
		nextPutAll:
			(index > 0
				ifTrue: [ 'A default item has been chosen, and all other ' ]
				ifFalse: [ 'All ' ]);
		nextPutAll: 'values will be dropped from the AST:';
		cr;
		cr;
		nextPutAll: rhs productionSymbol name;
		nextPutAll: ' : '.
	1 to: rhs size do:
		[ :i | 
		i == index
			ifTrue: [ stream nextPutAll: '>>>' ].
		stream nextPutAll: (rhs at: i) name.
		i == index
			ifTrue: [ stream nextPutAll: '<<<' ].
		stream space ].
	SmaCCCompilationNotification new
		messageText: 'Node creation';
		tag: stream contents;
		signal
]

{ #category : #accessing }
SmaCCDefaultNodeReduceCode >> source [
	^ self codeGenerator defaultNodeReductionSource: self
]
