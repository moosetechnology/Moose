Class {
	#name : #PPListsParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'list',
		'item',
		'numbering',
		'line',
		'content',
		'itemStarts',
		'itemEnds',
		'contentElement',
		'aligns',
		'blank',
		'emptyLine',
		'lineEnd',
		'paragraph'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPListsParser >> aligns [
	^ #aligns asParser
]

{ #category : #'as yet unclassified' }
PPListsParser >> blank [

	^ #blank asParser
]

{ #category : #'as yet unclassified' }
PPListsParser >> content [
	^ contentElement, 
	 (contentElement trimAlign nonEmpty) star
	
	map: [ :_first :_rest |
		(OrderedCollection with: _first)
			addAll: _rest;
			reject: [ :e | e isNil ]
	]
]

{ #category : #'as yet unclassified' }
PPListsParser >> contentElement [
	^ (list / paragraph / emptyLine)
]

{ #category : #'as yet unclassified' }
PPListsParser >> emptyLine [
	^ #startOfLine asParser, blank star, lineEnd ==> [ :e | nil ]
]

{ #category : #'as yet unclassified' }
PPListsParser >> item [
	^ itemStarts, content, itemEnds 

	map:[:_start :_content :_end |
		_content
	]
]

{ #category : #'as yet unclassified' }
PPListsParser >> itemEnds [
	^ #restoreIl asParser
]

{ #category : #'as yet unclassified' }
PPListsParser >> itemStarts [
	^ numbering, blank plus, #setIl asParser

	map: [ :_numbering :_ws :_setIl |
		_numbering
	]
]

{ #category : #'as yet unclassified' }
PPListsParser >> line [
	^ #newline asParser negate plus flatten
]

{ #category : #'as yet unclassified' }
PPListsParser >> lineEnd [
	^ #eof asParser / #newline asParser
]

{ #category : #'as yet unclassified' }
PPListsParser >> list [
	^ item,
	(item trimAlign) star
	
	map: [ :_first :_rest |
		(OrderedCollection with: _first)
			addAll: _rest;
			yourself
	]
]

{ #category : #'as yet unclassified' }
PPListsParser >> numbering [
	^ #digit asParser plus, 
	   ($. asParser, #digit asParser plus) star,
	   $) asParser optional
]

{ #category : #'as yet unclassified' }
PPListsParser >> paragraph [
	^ line, lineEnd ==> #first
]

{ #category : #'as yet unclassified' }
PPListsParser >> start [
	^ #setIl asParser, (list trim end), #restoreIl asParser ==> #second
]
