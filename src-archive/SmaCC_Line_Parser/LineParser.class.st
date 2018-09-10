Class {
	#name : #LineParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_Line_Parser'
}

{ #category : #'generated-accessing' }
LineParser class >> cacheId [
	^'2018-03-19T12:40:59.524922-05:00'
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

{ #category : #'generated-accessing' }
LineParser class >> scannerClass [
	^LineScanner
]

{ #category : #generated }
LineParser class >> startingStateForFile [
	^ 1
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

{ #category : #generated }
LineParser >> reduceTable [
^#(
	#(6 0 #nil) 
	#(6 1 #liftFirstValue:) 
	#(4 1 #reduceActionForFile1:) 
	#(5 1 #reduceActionForLines1:) 
	#(5 3 #reduceActionForLines2:)
	).
]

{ #category : #generated }
LineParser >> symbolNames [
	^ #('<line>' '<newLine>' 'B e g i n' 'File' 'Lines' 'Line' 'E O F' 'error')
]

{ #category : #generated }
LineParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #FileNode #FileNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
LineParser >> transitionTable [
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
