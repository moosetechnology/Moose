Class {
	#name : #GstProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]

{ #category : #testing }
GstProgramNode >> isUsed [
	(parent isKindOf: GstValueNode)
		ifTrue: [ ^ true ].
	(parent isKindOf: GstReturnNode)
		ifTrue: [ ^ true ].
	(parent isKindOf: GstMessageNode)
		ifTrue: [ ^ true ].
	((parent isKindOf: GstSequenceNode)
		and:
			[ parent statements last == self
				and: [ parent parent isKindOf: GstBlockNode ] ])
		ifTrue:
			[ | node |
			node := parent parent parent.
			(node isKindOf: GstMessageNode)
				ifTrue:
					[ (#(#ifTrue: #ifTrue:ifFalse: #ifFalse: #ifFalse:ifTrue: #whileTrue: #whileFalse: #ifNil: #ifNil:ifNotNil: #ifNotNil: #ifNotNil:ifNil:)
						includes: node symbol)
						ifTrue: [ ^ node isUsed ] ].
			^ true ].
	^ false
]
