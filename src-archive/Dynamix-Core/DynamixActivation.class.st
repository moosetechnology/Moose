"
DynamixActivation represents one execution of a behavioural entity. For example, in the case of object-oriented systems, the behaviour is a FAMIXMethod and an activation represents one execution of this method, typically within the context of a larger execution trace. Multiple executions of the same behaviour is represented with multiple activation objects that will be linked to the same behaviour.

An activation also holds information regarding the objects involved in the execution, namely:
- receiver points to the reference of the object whithin whose context the activation happens
- arguments holds the actual exeuction values corresponding to the parameters of the behavioural entity
- return points to the reference of the object that is returned by the execution
"
Class {
	#name : #DynamixActivation,
	#superclass : #DynamixEvent,
	#instVars : [
		'receiver',
		'behaviour',
		'arguments',
		'return'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixActivation class >> annotation [
	<MSEClass: #Activation super: #DynamixEvent>
	<package: #Dynamix>
]

{ #category : #accessing }
DynamixActivation >> aliases [
	| aliases |
	aliases := self arguments select: [:each | each isAlias].
	self receiver isAlias ifTrue: [aliases add: self receiver].
	self return isAlias ifTrue: [aliases add: self return].
	^ aliases
]

{ #category : #accessing }
DynamixActivation >> arguments [
	<MSEProperty: #arguments type: #DynamixReference opposite: #activationsWithArgument> <multivalued> <derived>
	<MSEComment: 'The references passed as arguments to the activation'>

	^ arguments
]

{ #category : #accessing }
DynamixActivation >> arguments: anObject [
	arguments value: anObject
]

{ #category : #accessing }
DynamixActivation >> behaviour [
	<MSEProperty: #behaviour type: #FAMIXBehaviouralEntity opposite: #activations>
	<MSEComment: 'The behaviour that gets activated'>
	
	^ behaviour
]

{ #category : #accessing }
DynamixActivation >> behaviour: aBehaviouralEntity [
	behaviour := FMMultivalueLink 
		on: self
		update: #activations
		from: self behaviour
		to: aBehaviouralEntity
]

{ #category : #compressing }
DynamixActivation >> checkChildrenForNonContiguousSequence: aList [
"This is the algoritm"
	| maxlen i checkpos len found candidateSequence |
	found := false.
	len := aList size.
	i := 1.
	maxlen := (len/2) asInteger.
	[i < (len - 1 )]  whileTrue:[
		checkpos := i + 1. "start checking by comparing with element offset by one"
		candidateSequence := OrderedCollection new.
		candidateSequence addLast: (aList at: i). " set  the first element of a candidate sequence"
		[ checkpos < ( i + maxlen) and: [found not ] ] whileTrue: [
			((aList at: i ) isSameMethodAs: (aList at: checkpos)) 
				ifTrue: [ found := true.]
				ifFalse: [ candidateSequence addLast: (aList at:checkpos).
						    checkpos := checkpos + 1].
				].
				found 
					ifTrue: [ (aList at: i) sequence: 1. "Mark the first occurance"
							   (aList at: i) seqitemsAddList: candidateSequence.
							   i := self checkForMoreMatchesFrom: candidateSequence to: aList at: checkpos.
							   maxlen := ((len + 1 ) / 2) asInteger. ]
					ifFalse: [ i := i + 1.
							    maxlen := ((len - 1) / 2 ) asInteger.].
		]
]

{ #category : #compressing }
DynamixActivation >> checkChildrenForSequence: aList [ 
	| length i j startpos |
	length := aList size.
	length < 2 ifTrue: [^self].
	i := 1.
	j := 2.
	startpos := i.
	[j <= length] whileTrue: 
			[((aList at: i) isSameMethodAs: (aList at: j)) 
				ifFalse: 
					[j - startpos > 1 
						ifTrue: 
							[(aList at: startpos) sequence: j - i.
							startpos := j.
							i := startpos]
						ifFalse: 
							[i := i + 1.
							startpos := i]]
				ifTrue: [ (aList at: j ) sequence: 1.
						   (aList at: j) setSubtreeNotDisplayable ].
			j := j + 1].

	j - i > 1 ifTrue: [(aList at: startpos) sequence: j - i]
]

{ #category : #compressing }
DynamixActivation >> checkForMoreMatchesFrom: aCandidateSequence to: aOriginalList at: checkPosition [
	| currentPosition originalStartPosInList  |
		originalStartPosInList := checkPosition - ( aCandidateSequence size).
		currentPosition := checkPosition.
		"While not finished checking original sequence "
		[ currentPosition - 1 + aCandidateSequence size < aOriginalList size ] 
			whileTrue: [( self compare: aCandidateSequence with: aOriginalList from: currentPosition ) 
							ifTrue: [ (aOriginalList at: originalStartPosInList) sequence: (((aOriginalList at: originalStartPosInList) sequence) + 1 ).
									  (currentPosition = originalStartPosInList) 
										ifFalse: [(aOriginalList at: currentPosition) setNotdisplayable.].
										currentPosition := currentPosition + aCandidateSequence size.
									]
						].
		^currentPosition
]

{ #category : #compressing }
DynamixActivation >> checkForNonContiguousSequence [
	self allChildrenDo: [:each | each checkChildrenForNonContiguousSequence: (each children) ].
]

{ #category : #compressing }
DynamixActivation >> checkForSequence [
	self allChildrenDo: [:each | self checkChildrenForSequence: (each children) ].
]

{ #category : #'accessing-derived' }
DynamixActivation >> classOfMethod [
	^ self method belongsTo
]

{ #category : #'accessing-derived' }
DynamixActivation >> classOfReceiver [
	"If receiver is nil, fallback to the class of the method, which may be a superclass"

	^ self receiver isNil
		ifFalse: [ self receiver type ]
		ifTrue: [ self classOfMethod ]
]

{ #category : #compressing }
DynamixActivation >> compare: aCandidateSequence with: aList from: startpos [
	| i j |
	i := startpos.
	j := 1.
	[ (j <= aCandidateSequence size) and: [ (aList at: i) isSameMethodAs: (aCandidateSequence at: j)]]
		whileTrue: [ i := i + 1.
					   j := j + 1 ].
	^(j - 1 = aCandidateSequence size)
]

{ #category : #printing }
DynamixActivation >> gtDisplayOn: stream [ 
	self behaviour isNil 
		ifTrue: [stream nextPutAll: 'Unknown activation']
		ifFalse: [self behaviour gtDisplayOn: stream ].
	stream 
		nextPutAll: ' (';
		nextPutAll: self duration asString;
		nextPut: $)
]

{ #category : #testing }
DynamixActivation >> hasReturnValue [
	^self return notNil and: [ self return ~= self receiver ]
]

{ #category : #testing }
DynamixActivation >> hasSideEffect [
	^ self exported notEmpty
]

{ #category : #initialize }
DynamixActivation >> initialize [
	super initialize.
	arguments := FMMultiMultivalueLink on: self opposite: #activationsWithArgument
]

{ #category : #testing }
DynamixActivation >> isActivation [
	^ true
]

{ #category : #testing }
DynamixActivation >> isDelegatingMethod [
	^ self hasSideEffect not
		and: [ self imported isEmpty ]
		and: [ self children size = 1 ]
]

{ #category : #testing }
DynamixActivation >> isSameMethodAs: aActivation [ 
	^ self method = aActivation method and: [ self parent = aActivation parent ]
]

{ #category : #testing }
DynamixActivation >> isSelfMessage [
	"Test whether the current receiver reference is the same as the one which sent the message"

	^self sender = self receiver
]

{ #category : #testing }
DynamixActivation >> isStartOfSequence [

	^self sequence > 1
]

{ #category : #'accessing-derived' }
DynamixActivation >> leaves [
	"returns an ordered Collection of all the leaf nodes of a tree"
	| stream |
	stream := Array new writeStream.
	self allLeavesDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #'accessing-derived' }
DynamixActivation >> level [

	self parent ifNil: [^0].
	^self parent level + 1.

	"self parent ifNil: [^0].
	^self parent isSelfMessage
		ifFalse: [ 1 ]
		ifTrue: [ self parent level + 1 ]"
]

{ #category : #'accessing-derived' }
DynamixActivation >> maxDepth [
	| maxLevel max |
	maxDepth := 0.
	self children notEmpty 
		ifTrue: [
			maxLevel := 0.
			self allChildren do: [:ea | (ea level > maxLevel) ifTrue: [maxLevel := ea level]].
			max := maxLevel - self level ].
    ^ max
]

{ #category : #'accessing-derived' }
DynamixActivation >> method [
	^ self behaviour
]

{ #category : #'accessing-derived' }
DynamixActivation >> nodesAtLevel: aLevel [ 
	"returns an ordered Collection of all the nodes of a tree at a given level"

	^self sortedChildren select: [ :each | each level = aLevel ].
]

{ #category : #'accessing-derived' }
DynamixActivation >> nonleaves [
	"returns an ordered Collection of all the non leaf nodes of a tree"
	| stream |
	stream := Array new writeStream.
	self allNonleavesDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #'accessing-derived' }
DynamixActivation >> notdisplayable [

	^ (self properties includesKey: #notdisplayable )
]

{ #category : #printing }
DynamixActivation >> printOn: aStream [
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name;
		space.
	self method
		ifNotNil: [ 
			aStream
				nextPut: ${;
				nextPutAll: self method name;
				nextPut: $} ]
]

{ #category : #accessing }
DynamixActivation >> receiver [
	<MSEProperty: #receiver type: #DynamixReference opposite: #activationsWithReceiver>
	<MSEComment: 'The reference within whose context the activation takes place'>

	^ receiver
]

{ #category : #accessing }
DynamixActivation >> receiver: aReference [
	receiver := FMMultivalueLink 
		on: self
		update: #activationsWithReceiver
		from: self receiver
		to: aReference
]

{ #category : #accessing }
DynamixActivation >> return [
	<MSEProperty: #return type: #DynamixReference opposite: #activationsWithReturn>
	<MSEComment: 'The reference returned by the activation'>

	^ return
]

{ #category : #accessing }
DynamixActivation >> return: aReference [
	return := FMMultivalueLink 
		on: self
		update: #activationsWithReturn
		from: self return
		to: aReference
]

{ #category : #'accessing-derived' }
DynamixActivation >> returnAliases [
	"Aliases of object returned to this activation, not to be confused with the alias returned from this activation (#return)"

	^ self aliases select: [ :each | each isReturnAlias]
]

{ #category : #testing }
DynamixActivation >> returnsPureObject [
	| root |
	"self hasReturnValue ifFalse: [ ^ false ].
	(self return isKindOf: Alias) ifFalse: [ ^ false ].
	root := self return rootAlias.
	root isNil ifTrue: [ ^ false ]."
	^ self withAllChildren includes: root creator
]

{ #category : #'accessing-derived' }
DynamixActivation >> sender [
	"The reference which sent the message"

	^ self parent notNil ifTrue: [ self parent receiver ]
]

{ #category : #'accessing-derived' }
DynamixActivation >> seqitemsAddList: anItemList [
	"saves nodes belonging to the sequence"

	self propertyNamed: #seqitems put:  (self seqitems addAll: anItemList).
]

{ #category : #'accessing-derived' }
DynamixActivation >> sequence [
	"comment stating purpose of message"
	self propertyNamed: #seqsize
			ifNil:[^0].
	^self propertyNamed: #seqsize
]

{ #category : #'accessing-derived' }
DynamixActivation >> sequence: aLength [
	"comment stating purpose of message"
	self propertyNamed: #seqsize put:  aLength.
	"self propertyNamed: #seqsize ifAbsentPut: [ aLength ]."
]

{ #category : #'accessing-derived' }
DynamixActivation >> setNotdisplayable [
	"comment stating purpose of message"
	^(self propertyNamed: #notdisplayable ifAbsentPut: [1] )
]

{ #category : #displaying }
DynamixActivation >> setSubtreeNotDisplayable [
	self allChildren do: [:each | each setNotdisplayable].
]

{ #category : #'accessing-derived' }
DynamixActivation >> signature [
	"lazy evaluation (recursive) of signatures for nodes"
	| aSignature |
	self propertyNamed: #signature 
			ifNil: [ aSignature := self method printString.
					self children do: [:each | aSignature := aSignature, each signature ].
				  self signature: aSignature.
			].
	^self propertyNamed: #signature
]

{ #category : #'accessing-derived' }
DynamixActivation >> signature: aSignature [
	"sets the signature for a name"
	self propertyNamed: #signature put:  aSignature.
]

{ #category : #'accessing-derived' }
DynamixActivation >> stack [
	^self  parent isNil
		ifFalse: [ self parent stack copyWith: self ]
		ifTrue: [ Array with: self ]
]
