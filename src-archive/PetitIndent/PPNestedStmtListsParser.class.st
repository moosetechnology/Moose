Class {
	#name : #PPNestedStmtListsParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'list',
		'command',
		'indent',
		'dedent',
		'emptyLine',
		'contentElement',
		'lineEnd',
		'prefix',
		'_indent',
		'_dedent'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #indentation }
PPNestedStmtListsParser >> _dedent [
	^ 
	([ :context | context indentStack pop ] asParser,
	(prefix, #blank asParser not /
	 prefix not, #blank asParser star) flatten
	
	map: [ :__pop :__dedent |
		__dedent
	]) and, #pop asParser ==> #second
]

{ #category : #indentation }
PPNestedStmtListsParser >> _indent [
	^
	"
	 recognize prefix, than indent and return that indent.
	 Use 'and' in order to return back to the beginning of a line and than
	 push the indent
	"
	(prefix, #blank asParser plus flatten ==> #second) and pushAsParser
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> command [
	^ (#letter asParser, (#letter asParser / #digit asParser) star) flatten
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> contentElement [
	^ 
		list / 
		((prefix, command, lineEnd) ==> #second)

]

{ #category : #indentation }
PPNestedStmtListsParser >> dedent [
	^ _dedent, emptyLine star
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> emptyLine [
	^ (#startOfLine asParser, #blank asParser star, lineEnd) nonEmpty
]

{ #category : #indentation }
PPNestedStmtListsParser >> indent [
	^ (emptyLine star), _indent
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> lineEnd [
	^ #newline asParser / #eof asParser
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> list [
	^ 
	(indent,
		(contentElement) star,
	dedent) 
	
	map: [:_indent :_content :_dedent |
		_content 
	]
]

{ #category : #indentation }
PPNestedStmtListsParser >> prefix [
	^ #prefix asParser
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParser >> start [
	^ list end
]
