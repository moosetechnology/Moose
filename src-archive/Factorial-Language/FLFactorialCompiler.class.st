"
I define productions to create a Smalltalk AST from the FL source. The Smalltalk AST can be trivially transformed to Smalltalk bytecodes and executed using the infrastructure of the development environment.
"
Class {
	#name : #FLFactorialCompiler,
	#superclass : #FLFactorialGrammar,
	#category : #'Factorial-Language'
}

{ #category : #grammar }
FLFactorialCompiler >> apply [
	^ super apply ==> [ :node |
		RBMessageNode
			receiver: (RBVariableNode named: 'self')
			selector: (self
				selector: node second
				count: node third size) 
			arguments: node third ]
]

{ #category : #grammar }
FLFactorialCompiler >> binary [
	^ super binary ==> [ :node | 
		RBMessageNode
			receiver: node second
			selector: node third asSymbol
			arguments: (Array with: node fourth) ]
]

{ #category : #grammar }
FLFactorialCompiler >> condition [
	^ super condition ==> [ :node | 
		RBMessageNode 
			receiver: node second
			selector: #ifTrue:ifFalse:
			arguments: (Array 
				with: (RBBlockNode 
					arguments: #()
					body: (RBSequenceNode 
						statements: (Array with: node fourth)))
				with: (RBBlockNode 
					arguments: #()
					body: (RBSequenceNode 
						statements: (Array with: node sixth)))) ]
]

{ #category : #grammar }
FLFactorialCompiler >> function [
	^ super function ==> [ :node |
		RBMethodNode
			selector: (self
				selector: node first
				count: node second size)
			arguments: node second
			body: ((RBSequenceNode statements: (Array
				with: node fourth))
				addReturn;
				yourself) ]
]

{ #category : #grammar }
FLFactorialCompiler >> literal [
	^ super literal ==> [ :node | RBLiteralNode value: node asNumber ]
]

{ #category : #grammar }
FLFactorialCompiler >> operation [
	^ super operation ==> [ :node | node = '==' ifTrue: [ #= ] ifFalse: [ node asSymbol ] ]
]

{ #category : #private }
FLFactorialCompiler >> selector: aString count: anInteger [
	| stream |
	stream := WriteStream on: String new.
	stream nextPutAll: aString.
	1 to: anInteger do: [ :index |
		index > 1
			ifTrue: [ stream nextPutAll: 'with' ].
		stream nextPut: $: ].
	^ stream contents asSymbol
]

{ #category : #grammar }
FLFactorialCompiler >> variable [
	^ super variable ==> [ :node | RBVariableNode named: node ]
]
