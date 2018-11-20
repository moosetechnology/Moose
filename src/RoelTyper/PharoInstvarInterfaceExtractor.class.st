Class {
	#name : #PharoInstvarInterfaceExtractor,
	#superclass : #InstvarInterfaceExtractor,
	#instVars : [
		'blockTempsMapping',
		'blocksLimits'
	],
	#category : #'RoelTyper-Pharo'
}

{ #category : #block }
PharoInstvarInterfaceExtractor >> blockMapping [
	^ blockTempsMapping last
]

{ #category : #block }
PharoInstvarInterfaceExtractor >> blocksArgsBySize [
	^ blocksLimits ifNil: [ blocksLimits := OrderedCollection new ]
]

{ #category : #block }
PharoInstvarInterfaceExtractor >> blocksDecrement [

		blocksLimits := blocksLimits select: [:e | (e = input pc) ifTrue: [self removeBlockMapping.  false] ifFalse: [true] ]
	
]

{ #category : #extracting }
PharoInstvarInterfaceExtractor >> extractInterfacesFrom: m addTo: aTypeCollector [
	method := m.
	saveStacks := Dictionary new.
	stack := OrderedCollection new.
	"0 to: method numTemps - 1 do: [:i | stack add: #temp -> i ]."
	initialStack := stack copy.
	collector := aTypeCollector.
	input := InstructionStream on: method.
	blockTraversal := false.
	blocksLimits := OrderedCollection new.
	blockTempsMapping := OrderedCollection new.
	blockArgs := 0.
	[input atEnd]
		whileFalse:
			[self reloadStack.
			input interpretNextInstructionFor: self.
			self blocksDecrement.
			]
]

{ #category : #block }
PharoInstvarInterfaceExtractor >> inABlock [
	^ blockTempsMapping isNotEmpty
]

{ #category : #initialization }
PharoInstvarInterfaceExtractor >> initialize [
	super initialize.
	blockTempsMapping := OrderedCollection new.
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> methodReturnTop [
	^self pop
]

{ #category : #block }
PharoInstvarInterfaceExtractor >> newBlockMapping [
	blockTempsMapping add: OrderedCollection new.
	
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Remove Top Of Stack And Store Into Offset of Temp Vector bytecode."
	stack removeLast
	
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> popIntoTemporaryVariable: offset [
	"Remove Top Of Stack And Store Into Temporary Variable bytecode."

	"An empty stack => we are in a block"
	self inABlock ifFalse: [
	collector
		handleAssignment: stack removeLast
		forTmp: offset] ifTrue: [
			
		]
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize [
	self newBlockMapping.
	self blocksArgsBySize add: blockSize + input pc - 1.
	1 to: numArgs do: [:index | self blockMapping add: #blockArg->index.].
	numCopied timesRepeat: [ self blockMapping add: stack removeLast afterIndex: numArgs]. 
	stack addLast: #block.
	blockArgs := numArgs.
	
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> pushConsArrayWithElements: anArray [
	stack add: #instcreation->Array
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> pushNewArrayOfSize: numElements [ 
	"Push New Array of size numElements bytecode."
	stack addLast: #computed 
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	stack addLast: #computed
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> pushTemporaryVariable: offset [ 
	"Push Contents Of Temporary Variable Whose Index Is the 
	argument, offset, On Top Of Stack bytecode."
	self inABlock
		ifTrue: [stack
				add: (self blockMapping
						at: offset + 1
						ifAbsent: [#blockTemp -> (offset - self blockMapping size)])]
		ifFalse: [stack add: #temp -> offset]
]

{ #category : #removing }
PharoInstvarInterfaceExtractor >> removeBlockMapping [
	blockTempsMapping removeLast
]

{ #category : #'opcodes-control' }
PharoInstvarInterfaceExtractor >> send: selector numArgs: na [
	"selector = #shapeBoundsAt:ifPresent: ifTrue: [self halt]".
	^self nativeSend: selector numArgs: na 
]

{ #category : #'instruction decoding' }
PharoInstvarInterfaceExtractor >> storeIntoTemporaryVariable: offset [
	"Store Top Of Stack Into Temporary Variable Of Method bytecode."

	"Nothing to do,since I do not treat temporary variables for the moment."
	

	| rvalue |
  	stack isEmpty ifTrue: [
		self flag: 'bug here. For now just do nothing. uncomment the halt to run the example. 
		It seems that there is a general problem with this method, see also TypeCollector >> handleAssignment:forTmp: '.
		"Try for example: 
			TypeCollector typeInstvar:  #superclass ofClassWithLookup:   Behavior "
		"self halt."
		^ self.
		].
	collector
		handleAssignment: (rvalue := stack removeLast)
		forTmp: offset.
	stack add: rvalue
]
