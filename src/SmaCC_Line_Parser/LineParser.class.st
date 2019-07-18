Class {
	#name : #LineParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_Line_Parser'
}

{ #category : #'generated-accessing' }
LineParser class >> cacheId [
	^'2019-04-15T17:15:41.487428-05:00'
]

{ #category : #generated }
LineParser class >> definitionComment [
"%root FileNode;

<line>
	: [^\r\n]+
	;
<newLine>
	: \r | \n | \r\n
	;

File
	: Lines {{FileNode}}
	;
Lines
	: Line
	| Lines <newLine> Line
	;
Line
	: 
	| <line> 'line'
	;"
]

{ #category : #generated }
LineParser class >> reduceTable [
^#(
	#(6 0 #nil 146433 false ) 
	#(6 1 #liftFirstValue: 146434 false ) 
	#(4 1 #reduceActionForFile1: 73729 false ) 
	#(5 1 #reduceActionForLines1: 104449 false ) 
	#(5 3 #reduceActionForLines2: 104450 false )
	).
]

{ #category : #'generated-accessing' }
LineParser class >> scannerClass [
	^LineScanner
]

{ #category : #generated }
LineParser class >> startingStateForFile [
	^ 1
]

{ #category : #generated }
LineParser class >> symbolNames [
	^ #('<line>' '<newLine>' 'B e g i n' 'File' 'Lines' 'Line' 'E O F' 'error')
]

{ #category : #generated }
LineParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #FileNode #FileNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
LineParser class >> transitionTable [
^#(
#[1 0 21 0 1 0 6 0 2 0 13 0 4 0 17 0 5 0 21 0 6 0 6 0 7] 
#[0 0 10 0 2 0 7] 
#[0 0 0 0 7] 
#[1 0 25 0 2 0 14 0 7] 
#[0 0 18 0 2 0 7] 
#[1 0 29 0 1 0 6 0 2 0 29 0 6 0 6 0 7] 
#[0 0 22 0 2 0 7]
	).
]

{ #category : #'generated-reduction actions' }
LineParser >> reduceActionForFile1: nodes [
	| result |
	result := FileNode new.
	result addTokens: (nodes at: 1) to: result lines.
	^ result
]

{ #category : #'generated-reduction actions' }
LineParser >> reduceActionForLines1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
LineParser >> reduceActionForLines2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 3) to: result.
	^ result
]
