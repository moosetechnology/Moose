"
I represent standart set of meta messages which used by tools to explore any objects state
"
Class {
	#name : #GHStandardMetaMessages,
	#superclass : #GHMinimalMetaMessages,
	#category : 'Ghost-ObjectGhost'
}

{ #category : #'Tool-Base' }
GHStandardMetaMessages >> basicInspect [
	^ Smalltalk tools basicInspector inspect: ghost
]

{ #category : #'Tool-Base' }
GHStandardMetaMessages >> inspect [
	"Create and schedule an Inspector in which the user can examine the receiver's variables."
	^ Smalltalk tools inspector inspect: ghost
]

{ #category : #introspection }
GHStandardMetaMessages >> instVarAt: index [
	^self ghostInstVarAt: index
]

{ #category : #'class membership' }
GHStandardMetaMessages >> isKindOf: aClass [ 
	^self ghostClass includesBehavior: aClass
]

{ #category : #'literal testing' }
GHStandardMetaMessages >> isSelfEvaluating [
	^false
]

{ #category : #printing }
GHStandardMetaMessages >> longPrintOn: aStream limitedTo: sizeLimit indent: indent [
	super longPrintOn: aStream limitedTo: sizeLimit indent: indent
]

{ #category : #printing }
GHStandardMetaMessages >> printOn: aStream [ 
	^aStream << self printGhost
]

{ #category : #printing }
GHStandardMetaMessages >> printString [
	^self printGhost
]

{ #category : #printing }
GHStandardMetaMessages >> printStringLimitedTo: limit [
	"Answer a String whose characters are a description of the receiver.
	If you want to print without a character limit, use fullPrintString."
	| limitedString |
	limitedString := String streamContents: [:s | s << self printGhost ] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	^ limitedString , '...etc...'
]

{ #category : #introspection }
GHStandardMetaMessages >> readSlot: aSlot [
	^super readSlot: aSlot
]

{ #category : #introspection }
GHStandardMetaMessages >> readSlotNamed: aName [
	^super readSlotNamed: aName
]

{ #category : #'literal testing' }
GHStandardMetaMessages >> shouldBePrintedAsLiteral [
	^false
]
