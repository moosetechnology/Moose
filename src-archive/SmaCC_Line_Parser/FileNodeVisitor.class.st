Class {
	#name : #FileNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Line_Parser'
}

{ #category : #generated }
FileNodeVisitor >> visitFileNode: aFileNode [
	^ self visitSmaCCParseNode: aFileNode
]
