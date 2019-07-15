Class {
	#name : #CSVParseNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_CSV_Parser'
}

{ #category : #generated }
CSVParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
