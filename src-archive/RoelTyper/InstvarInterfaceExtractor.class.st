"
I am responsible for extracting the messages sent to an instance variable and the assignments done to an instance variable. I am supposed to work together with a TypeCollector.

Instance Variables:
	collector	<TypeCollector>	description of collector
	copied	<Array>	description of copied
	initialStack	<Collection | KeyBindingsList | MethodFilterAnd | MethodFilterOr>	description of initialStack
	input	<InstructionStream>	description of input
	method	<CompiledInitializer | CompiledMethod>	description of method
	saveStacks	<Dictionary>	description of saveStacks
	stack	<(OrderedCollection of: Object)>	description of stack


"
Class {
	#name : #InstvarInterfaceExtractor,
	#superclass : #InstructionClient,
	#instVars : [
		'stack',
		'copied',
		'initialStack',
		'method',
		'saveStacks',
		'input',
		'collector',
		'blockTraversal',
		'blockArgs'
	],
	#category : #'RoelTyper-Core'
}

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> blockReturnTop [
	"Return Top Of Stack bytecode."

	^self pop
]

{ #category : #private }
InstvarInterfaceExtractor >> copied: list [
	copied := list
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> doDup [
	"Duplicate Top Of Stack bytecode."

	self dupFirst
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> doPop [
	"Remove Top Of Stack bytecode."

	^self pop
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> dupFirst [
	stack add: stack last
]

{ #category : #extracting }
InstvarInterfaceExtractor >> extractInterfacesFrom: m addTo: aTypeCollector [
	method := m.
	saveStacks := Dictionary new.
	stack := OrderedCollection new.
	"0 to: method numTemps - 1 do: [:i | stack add: #temp -> i ]."
	initialStack := stack copy.
	collector := aTypeCollector.
	input := InstructionStream on: method.
	blockTraversal := false.
	blockArgs := 0.
	[input atEnd]
		whileFalse:
			[self reloadStack.
			input interpretNextInstructionFor: self]
]

{ #category : #private }
InstvarInterfaceExtractor >> initialize [
	super initialize.
	blockTraversal := false.
	blockArgs := 0.
]

{ #category : #private }
InstvarInterfaceExtractor >> input [
	^input
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> jump: delta [
	| currentPC |
	currentPC := self input pc.
	delta < 1 ifTrue: [^self].
	self saveStacks
		at: currentPC + delta
		put: stack copy.
	stack := OrderedCollection new.
	
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> jump: delta if: condition [
	|top|
	(top := stack last)
	 isInteger ifTrue: [
		collector addAssignment: Boolean to: top.
		]
	ifFalse: [
		(top isVariableBinding and: [top key = #temp]) ifTrue: [collector addAssignment: Boolean toTmp: top value]
		ifFalse: [
			(top isVariableBinding and: [top key = #return]) ifTrue: [collector addAssignment: Boolean toReturnOf: top value]
			]
		].
	self pop.	"receiver of ifTrue or ifFalse, according to condition"
	delta < 1 ifTrue: [^self].
	self saveStacks
		at: self input pc + delta
		put:
			(stack copy)
]

{ #category : #private }
InstvarInterfaceExtractor >> method: aMethod [
	method := aMethod.
	copied := #()
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> methodReturnConstant: value [
	"Return Constant bytecode."
	collector addAssignmentForReturn: value class.  
	^self
		pushConstant: value;
		sqReturnTop
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> methodReturnReceiver [
	"Return Self bytecode."
	collector addAssignmentForReturnSelf.  
	^self
		pushReceiver;
		sqReturnTop
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> methodReturnTop [
	"Return Top Of Stack bytecode."
	collector addAssignmentForReturn: stack last.
	^self sqReturnTop
]

{ #category : #'opcodes-control' }
InstvarInterfaceExtractor >> nativeSend: selector numArgs: na [ 
	| receiver args |
	args := stack removeLast: na.
	receiver := stack removeLast.
	receiver isInteger 
		ifTrue: 
			[ collector 
				addSend: selector
				to: receiver ]
		ifFalse: 
			[ receiver isVariableBinding ifTrue: 
				[ receiver key = #temp 
					ifTrue: 
						[ collector 
							addSend: selector
							toTmp: receiver value ]
					ifFalse: 
						[ receiver key = #return ifTrue: 
							[ collector 
								addSend: selector
								onReturnOfSelfMethod: receiver value ] ] ] ].
	(receiver = #self and: [ collector theClass methodDict includesKey: selector ]) ifTrue: 
		[ args doWithIndex: 
			[ :arg :index | 
			collector 
				handleAssignment: arg
				forTmp: index - 1
				in: collector theClass >> selector ] ].
	stack add: (collector 
			pushSendOf: selector
			to: receiver
			args: args)
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pop [
	stack removeLast
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> popIntoLiteralVariable: anAssociation [
	"Remove Top Of Stack And Store Into Literal Variable bytecode."

	^self pop
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> popIntoReceiverVariable: offset [
	"Remove Top Of Stack And Store Into Instance Variable bytecode."

	collector
		handleAssignment: stack removeLast
		for: offset
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> popIntoTemporaryVariable: offset [
	"Remove Top Of Stack And Store Into Temporary Variable bytecode."

	"An empty stack => we are in a block"
	
	blockTraversal ifTrue: [blockArgs > 0 ifTrue: [stack addLast: #temp -> offset. collector transformAsBlockArgTheTmpOffset: offset]. blockArgs := blockArgs - 1. blockTraversal := (blockArgs > 0) ].  
	collector
		handleAssignment: stack removeLast
		forTmp: offset
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> pushActiveContext [
	"Push Active Context On Top Of Its Own Stack bytecode."

	self pushContext
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pushConstant: value [
	value class == BlockClosure
		ifTrue:
			[self
				readBlock: value method
				copied: 0]
		ifFalse: [
			blockArgs := value.
			stack addLast: value class]
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pushContext [
	stack add: #context
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pushInst: index [
	stack add: index
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> pushLiteralVariable: anAssociation [
	"Push Contents Of anAssociation On Top Of Stack bytecode."

	self pushStatic: anAssociation
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pushReceiver [
	stack addLast: #self
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> pushReceiverVariable: offset [
	"Push Contents Of the Receiver's Instance Variable Whose Index 
	is the argument, offset, On Top Of Stack bytecode."

	self pushInst: offset
]

{ #category : #'opcodes-data movement' }
InstvarInterfaceExtractor >> pushStatic: assoc [
	"assoc can be an association OR a variable binding. I just push the complete association, since it does not interest me for the moment."

	stack addLast: assoc
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> pushTemporaryVariable: offset [
	"Push Contents Of Temporary Variable Whose Index Is the 
	argument, offset, On Top Of Stack bytecode."

	stack add: (#temp -> offset)
]

{ #category : #private }
InstvarInterfaceExtractor >> readBlock: block copied: count [
	| newCopied |
	newCopied := stack removeLast: count.
	stack add: #block.
	^(self class new)
		copied: newCopied;
		extractInterfacesFrom: block
			addTo: collector
]

{ #category : #private }
InstvarInterfaceExtractor >> reloadStack [
	stack isNil
		ifTrue:
			[stack := self saveStacks
				at: self input pc
				ifAbsent: [initialStack copy].
			^self].
	stack := self saveStacks
		at: self input pc
		ifAbsent: [stack]
]

{ #category : #private }
InstvarInterfaceExtractor >> saveStacks [
	saveStacks ifNil: [saveStacks := Dictionary new].
	^saveStacks
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> send: selector numArgs: na [
	
	self nativeSend: selector numArgs: na.
	(stack last = #block and: [blockArgs > 0])ifTrue: [blockTraversal := true]
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> send: selector super: supered numArgs: numberArguments [
	"Send Message With Selector, selector, bytecode. The argument, 
	supered, indicates whether the receiver of the message is specified with 
	'super' in the source method. The arguments of the message are found in 
	the top numArguments locations on the stack and the receiver just 
	below them."

	^supered
		ifTrue:
			[self
				sendSuper: selector
				numArgs: numberArguments]
		ifFalse:
			[self
				send: selector
				numArgs: numberArguments]
]

{ #category : #'opcodes-control' }
InstvarInterfaceExtractor >> sendSuper: selector numArgs: na [
	stack removeLast: na + 1.
	stack add: #computed
]

{ #category : #private }
InstvarInterfaceExtractor >> sqReturnTop [
	"In VW, method returnTop is inherited from instructionClient and does nothing."

	
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> storeIntoLiteralVariable: anAssociation [
	"Store Top Of Stack Into Literal Variable Of Method bytecode."

	"Nothing to do, since I do not do anything with literal variables. Just keep the right-hand side on the stack for further processing"

	
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> storeIntoReceiverVariable: offset [
	"Store Top Of Stack Into Instance Variable Of Method bytecode."

	| rvalue |
	collector
		handleAssignment: (rvalue := stack removeLast)
		for: offset.
	stack add: rvalue
]

{ #category : #'instruction decoding' }
InstvarInterfaceExtractor >> storeIntoTemporaryVariable: offset [
	"Store Top Of Stack Into Temporary Variable Of Method bytecode."

	"Nothing to do,since I do not treat temporary variables for the moment."
	

	| rvalue |
	blockTraversal ifTrue: [blockArgs > 0 ifTrue: [stack addLast: #temp -> offset. collector transformAsBlockArgTheTmpOffset: offset]. blockArgs := blockArgs - 1. blockTraversal := (blockArgs > 0) ].  
	collector
		handleAssignment: (rvalue := stack removeLast)
		forTmp: offset.
	stack add: rvalue
]
