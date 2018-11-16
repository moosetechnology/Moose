Class {
	#name : #SwiftStatementNode,
	#superclass : #SwiftParseNode,
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitStatement: self
]
