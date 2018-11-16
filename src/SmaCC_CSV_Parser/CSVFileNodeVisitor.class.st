Class {
	#name : #CSVFileNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_CSV_Parser'
}

{ #category : #generated }
CSVFileNodeVisitor >> visitFile: aFile [
	^ self visitSmaCCParseNode: aFile
]

{ #category : #generated }
CSVFileNodeVisitor >> visitLine: aLine [
	^ self visitFile: aLine
]
