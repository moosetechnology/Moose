Class {
	#name : #DelphiFormParseNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitArray: anArray [
	^ self visitParse: anArray
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitBoolean: aBoolean [
	^ self visitLiteral: aBoolean
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitByteArray: aByteArray [
	^ self visitParse: aByteArray
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitCombinedString: aCombinedString [
	^ self visitParse: aCombinedString
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitFloat: aFloat [
	^ self visitLiteral: aFloat
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitInteger: anInteger [
	^ self visitLiteral: anInteger
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitItem: anItem [
	^ self visitParse: anItem
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitLiteral: aLiteral [
	^ self visitParse: aLiteral
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitNamedValue: aNamedValue [
	^ self visitParse: aNamedValue
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitObject: anObject [
	^ self visitParse: anObject
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitObjectArray: anObjectArray [
	^ self visitParse: anObjectArray
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitParse: aParse [
	^ self visitSmaCCParseNode: aParse
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitProperty: aProperty [
	^ self visitParse: aProperty
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitQualifiedName: aQualifiedName [
	^ self visitParse: aQualifiedName
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitSet: aSet [
	^ self visitParse: aSet
]

{ #category : #generated }
DelphiFormParseNodeVisitor >> visitString: aString [
	^ self visitLiteral: aString
]
