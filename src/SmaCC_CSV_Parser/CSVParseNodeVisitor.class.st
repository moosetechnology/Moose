Class {
	#name : #CSVParseNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_CSV_Parser'
}

{ #category : #generated }
CSVParseNodeVisitor >> visitFile: aFile [
	^ self visitParse: aFile
]

{ #category : #generated }
CSVParseNodeVisitor >> visitLine: aLine [
	^ self visitParse: aLine
]

{ #category : #generated }
CSVParseNodeVisitor >> visitParse: aParse [
	^ self visitSmaCCParseNode: aParse
]
