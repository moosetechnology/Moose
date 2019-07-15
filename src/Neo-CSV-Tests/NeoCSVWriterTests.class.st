"
I am NeoCSVWriterTests, a suite of unit tests for NeoCSVWriter.

"
Class {
	#name : #NeoCSVWriterTests,
	#superclass : #TestCase,
	#category : 'Neo-CSV-Tests'
}

{ #category : #testing }
NeoCSVWriterTests >> testEmptyFieldValue [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(one two three);
						nextPutAll: #( (1 2 nil) (4 nil 6) (nil 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2",""' '"4","","6"' '"","8","9"' '')).
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						emptyFieldValue: #empty;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 empty) (4 empty 6) (empty 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2",""' '"4","","6"' '"","8","9"' '')).
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						emptyFieldValue: Object new;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 nil) (4 nil 6) (nil 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2","nil"' '"4","nil","6"' '"nil","8","9"' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testObjectFieldsTestObjects [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addObjectFields: #(x y z); 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testObjectFieldsTestObjectsExtra [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #raw;
						nextPut: #(x empty y constant z);
						addObjectField: #x;
						addEmptyField;
						addObjectField: #y;
						addConstantField: 'X';
						addObjectField: #z; 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( 
					'x,empty,y,constant,z' 
					'100,,200,X,300' 
					'100,,200,X,300' 
					'100,,200,X,300' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testObjectFieldsTestObjectsUsingBlockAccessors [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addObjectFields: { 
							[ :object | object x ].
							[ :object | object y ].
							[ :object | object z ] }; 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testOptionalQuotedFields [
	self
		assert:
			(String
				streamContents: [ :stream | 
					(NeoCSVWriter on: stream)
						fieldWriter: #optionalQuoted;
						nextPut:
							{'one'.
							't,wo'.
							't"hree'.
							'fo' , String crlf , 'ur'} ])
		equals: 'one,"t,wo","t""hree","fo' , String crlf , 'ur"', String crlf
]

{ #category : #testing }
NeoCSVWriterTests >> testRawFieldsDictionaries [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addRawFieldsAt: #(x y z); 
						nextPutAll: { 
							Dictionary newFromPairs: #(x 100 y 200 z 300).
							Dictionary newFromPairs: #(x 400 y 500 z 600). 
							Dictionary newFromPairs: #(x 700 y 800 z 900) } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '400,500,600' '700,800,900' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testRawFieldsTestObjects [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(x y z);
						addRawFields: #(x y z); 
						nextPutAll: { 
							NeoCSVTestObject example. 
							NeoCSVTestObject example. 
							NeoCSVTestObject example } ])
		equals: (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testSimple [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						nextPut: #(one two three);
						nextPutAll: #( (1 2 3) (4 5 6) (7 8 9)) ])
		equals: (String crlf join: #( '"one","two","three"' '"1","2","3"' '"4","5","6"' '"7","8","9"' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testSimpleOptionalQuoted [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #optionalQuoted;
						nextPut: #(one two 'thr,ee');
						nextPutAll: #( (1 2 3) (4 5 6) (7 8 9)) ])
		equals: (String crlf join: #( 'one,two,"thr,ee"' '1,2,3' '4,5,6' '7,8,9' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testSimpleRaw [
	self
		assert: (String streamContents: [ :stream |
					(NeoCSVWriter on: stream)
						fieldWriter: #raw;
						nextPut: #(one two three);
						nextPutAll: #( (1 2 3) (4 5 6) (7 8 9)) ])
		equals: (String crlf join: #( 'one,two,three' '1,2,3' '4,5,6' '7,8,9' ''))
]

{ #category : #testing }
NeoCSVWriterTests >> testWideOptionalQuoted [
	self
		assert: (String streamContents: [ :out |
			(NeoCSVWriter on: out) 
				fieldWriter: #optionalQuoted; 
				nextPut: { 1. 'foo "1" ', Character euro asString. true} ])
		equals: ('1,"foo ""1"" ', Character euro asString, '",true', String crlf)
]

{ #category : #testing }
NeoCSVWriterTests >> testWriteEmbeddedQuote [
	| header |
	header := String streamContents: [ :out |
		(NeoCSVWriter on: out)
			nextPut: #(foo 'x"y"z') ].
	self assert: header equals: '"foo","x""y""z"', String crlf
]

{ #category : #testing }
NeoCSVWriterTests >> testWriteHeader [
	| header |
	header := String streamContents: [ :out |
		(NeoCSVWriter on: out)
			writeHeader: #(foo bar) ].
	self assert: header equals: '"foo","bar"', String crlf
]
