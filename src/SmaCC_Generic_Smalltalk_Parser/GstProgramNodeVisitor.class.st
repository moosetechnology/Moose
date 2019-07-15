Class {
	#name : #GstProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstProgramNodeVisitor >> visitArrayLiteral: anArrayLiteral [
	^ self visitLiteral: anArrayLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitAssignment: anAssignment [
	^ self visitValue: anAssignment
]

{ #category : #generated }
GstProgramNodeVisitor >> visitBinaryMessage: aBinaryMessage [
	^ self visitMessage: aBinaryMessage
]

{ #category : #generated }
GstProgramNodeVisitor >> visitBlock: aBlock [
	^ self visitValue: aBlock
]

{ #category : #generated }
GstProgramNodeVisitor >> visitBooleanLiteral: aBooleanLiteral [
	^ self visitLiteral: aBooleanLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitByteArrayLiteral: aByteArrayLiteral [
	^ self visitArrayLiteral: aByteArrayLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitCascade: aCascade [
	^ self visitValue: aCascade
]

{ #category : #generated }
GstProgramNodeVisitor >> visitCharacterLiteral: aCharacterLiteral [
	^ self visitLiteral: aCharacterLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitKeywordMessage: aKeywordMessage [
	^ self visitMessage: aKeywordMessage
]

{ #category : #generated }
GstProgramNodeVisitor >> visitLiteral: aLiteral [
	^ self visitValue: aLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitMessage: aMessage [
	^ self visitProgram: aMessage
]

{ #category : #generated }
GstProgramNodeVisitor >> visitMessageSend: aMessageSend [
	^ self visitValue: aMessageSend
]

{ #category : #generated }
GstProgramNodeVisitor >> visitMethod: aMethod [
	^ self visitProgram: aMethod
]

{ #category : #generated }
GstProgramNodeVisitor >> visitNilLiteral: aNilLiteral [
	^ self visitLiteral: aNilLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	^ self visitLiteral: aNumberLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
GstProgramNodeVisitor >> visitReturn: aReturn [
	^ self visitProgram: aReturn
]

{ #category : #generated }
GstProgramNodeVisitor >> visitSequence: aSequence [
	^ self visitProgram: aSequence
]

{ #category : #generated }
GstProgramNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitLiteral: aStringLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitSymbolLiteral: aSymbolLiteral [
	^ self visitLiteral: aSymbolLiteral
]

{ #category : #generated }
GstProgramNodeVisitor >> visitUnaryMessage: anUnaryMessage [
	^ self visitMessage: anUnaryMessage
]

{ #category : #generated }
GstProgramNodeVisitor >> visitValue: aValue [
	^ self visitProgram: aValue
]

{ #category : #generated }
GstProgramNodeVisitor >> visitVariable: aVariable [
	^ self visitValue: aVariable
]
