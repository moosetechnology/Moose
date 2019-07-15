"
I am NeoCSVReaderTests, a suite of unit tests for NeoCSVReader.

"
Class {
	#name : #NeoCSVReaderTests,
	#superclass : #TestCase,
	#category : 'Neo-CSV-Tests'
}

{ #category : #testing }
NeoCSVReaderTests >> testEmbeddedQuotes [
	self 
		assert: (NeoCSVReader on: '1,"x""y""z",3' readStream) upToEnd
		equals: #(('1' 'x"y"z' '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyConversions [
	| input |
	input := (String crlf join: #( '1,2.5,foo' ',,' )).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addFloatField;
					addField;
					upToEnd)
		equals: { 
					#( 1 2.5 'foo' ). 
					#( nil nil nil ) }
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyConversionsTestObject [
	| input |
	input := (String crlf join: #( '1,2.5,foo' ',,' )).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addFloatField: #y: ;
					addField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject x: 1 y: 2.5 z: 'foo'. 
					NeoCSVTestObject new }
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldQuoted [
	self 
		assert: (NeoCSVReader on: '"1",,"3"' readStream) upToEnd
		equals: #(('1' nil '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldSecondRecordQuoted [
	self 
		assert: (NeoCSVReader on: '"foo","bar"\"100",' withCRs readStream) upToEnd
		equals: #(('foo' 'bar')('100' nil))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldSecondRecordUnquoted [
	self 
		assert: (NeoCSVReader on: 'foo,bar\100,' withCRs readStream) upToEnd
		equals: #(('foo' 'bar')('100' nil))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldUnquoted [
	self 
		assert: (NeoCSVReader on: '1,,3' readStream) upToEnd
		equals: #(('1' nil '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldValue [
	self 
		assert: ((NeoCSVReader on: '"1",,3,"","5"' readStream) 
						emptyFieldValue: #empty; 
						upToEnd)
		equals: #(('1' empty '3' empty '5')).
	self 
		assert: ((NeoCSVReader on: '"1",,3,"","5"' readStream) 
						emptyFieldValue: ''; 
						upToEnd)
		equals: #(('1' '' '3' '' '5')).
	self 
		assert: ((NeoCSVReader on: 'a,b,c\,,\"","",""\1,2,3\' withCRs readStream)
						emptyFieldValue: #empty;
						upToEnd)
		equals: #(('a' 'b' 'c')(empty empty empty)(empty empty empty)('1' '2' '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyFieldValuePassNil [
	| date1 date2 |
	date1 := '1900-01-01' asDate.
	date2 := '2000-12-31' asDate.
	self 
		assert: ((NeoCSVReader on: 
							'date1,date2\2018-01-01,2018-02-01\2018-01-01,\,2018-02-01\\' withCRs readStream) 
						emptyFieldValue: #passNil;
						addFieldConverter: [ :input | input ifNil: [ date1 ] ifNotNil: [ input asDate ] ];
						addFieldConverter: [ :input | input ifNil: [ date2 ] ifNotNil: [ input asDate ] ];
						skipHeader; 
						upToEnd)
		equals: (Array 
							with: (Array with: '2018-01-01' asDate with: '2018-02-01' asDate)
							with: (Array with: '2018-01-01' asDate with: date2)
							with: (Array with: date1 with: '2018-02-01' asDate)
							with: (Array with: date1 with: date2)).
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyLastFieldQuoted [
	self 
		assert: (NeoCSVReader on: '"1","2",""' readStream) upToEnd
		equals: #(('1' '2' nil))
]

{ #category : #testing }
NeoCSVReaderTests >> testEmptyLastFieldUnquoted [
	self 
		assert: (NeoCSVReader on: '1,2,' readStream) upToEnd
		equals: #(('1' '2' nil))
]

{ #category : #testing }
NeoCSVReaderTests >> testOneLineEmpty [
	self 
		assert: (NeoCSVReader on: '' readStream) upToEnd
		equals: #()
]

{ #category : #testing }
NeoCSVReaderTests >> testOneLineOneFieldQuoted [
	self 
		assert: (NeoCSVReader on: '"1"' readStream) upToEnd
		equals: #(('1'))
]

{ #category : #testing }
NeoCSVReaderTests >> testOneLineOneFieldUnquoted [
	self 
		assert: (NeoCSVReader on: '1' readStream) upToEnd
		equals: #(('1'))
]

{ #category : #testing }
NeoCSVReaderTests >> testOneLineQuoted [
	self 
		assert: (NeoCSVReader on: '"1","2","3"' readStream) upToEnd
		equals: #(('1' '2' '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testOneLineUnquoted [
	self 
		assert: (NeoCSVReader on: '1,2,3' readStream) upToEnd
		equals: #(('1' '2' '3'))
]

{ #category : #testing }
NeoCSVReaderTests >> testReadAsByteArrays [
	| input |
	input := (String crlf join: #( '1,2,3' '1,2,3' '1,2,3' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					recordClass: ByteArray;
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					upToEnd)
		equals: {
			#[1 2 3].
			#[1 2 3].
			#[1 2 3].}
]

{ #category : #testing }
NeoCSVReaderTests >> testReadAsIntegerArrays [
	| input |
	input := (String crlf join: #( '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					recordClass: IntegerArray;
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					upToEnd)
		equals: {
			#(100 200 300) asIntegerArray.
			#(100 200 300) asIntegerArray.
			#(100 200 300) asIntegerArray }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadDictionaries [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: Dictionary;
					addIntegerFieldAt: #x ;
					addIntegerFieldAt: #y ;
					addIntegerFieldAt: #z ;
					upToEnd)
		equals: { 
					Dictionary newFromPairs: #(x 100 y 200 z 300). 
					Dictionary newFromPairs: #(x 100 y 200 z 300). 
					Dictionary newFromPairs: #(x 100 y 200 z 300) }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadFloatsRadixPointComma [
	| input output |
	input := (String lf join: #( '"x";"y";"z"' '10,0;20,123;-30,5' '10,0;20,123;-30,5' '10,0;20,123;-30,5' '')).
	output := (NeoCSVReader on: input readStream) 
		separator: $; ;
		skipHeader;
		addFloatFieldRadixPointComma;
		addFloatFieldRadixPointComma;
		addFloatFieldRadixPointComma;
		upToEnd.
	output do: [ :record |
		#(10.0 20.123 -30.5) with: record do: [ :x :y | 
			self assert: (x closeTo: y) ] ]
]

{ #category : #testing }
NeoCSVReaderTests >> testReadHeader [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: (NeoCSVReader on: input readStream) readHeader
		equals: #('x' 'y' 'z')
]

{ #category : #testing }
NeoCSVReaderTests >> testReadIntegers [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					upToEnd)
		equals: #((100 200 300)(100 200 300)(100 200 300))
]

{ #category : #testing }
NeoCSVReaderTests >> testReadIntegersReadingHeaderAfterFieldDefinitions [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addIntegerField ;
					addIntegerField;
					skipHeader;
					upToEnd)
		equals: #((100 200 300)(100 200 300)(100 200 300))
]

{ #category : #testing }
NeoCSVReaderTests >> testReadTestsObjects [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadTestsObjectsUsingBlockAccessors [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '100,200,300' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: [ :object :value | object x: value ];
					addIntegerField: [ :object :value | object y: value ];
					addIntegerField: [ :object :value | object z: value ];
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadTestsObjectsWithEmptyFieldValue [
	| input |
	input := (String crlf join: #( '"x","y","z"' '100,200,300' '1,,3' '100,200,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject2;
					emptyFieldValue: #empty;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject2 example. 
					NeoCSVTestObject2 new x: 1; z: 3; yourself. "Note that y contains #y from #initialize and was NOT touched" 
					NeoCSVTestObject2 example }.
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject2;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject2 example. 
					NeoCSVTestObject2 new x: 1; z: 3; yourself. "Note that y contains #y from #initialize and was NOT touched" 
					NeoCSVTestObject2 example }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadTestsObjectsWithIgnoredField [
	| input |
	input := (String crlf join: #( '"x","y",''-'',"z"' '100,200,a,300' '100,200,b,300' '100,200,c,300' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					skipHeader;
					recordClass: NeoCSVTestObject;
					addIntegerField: #x: ;
					addIntegerField: #y: ;
					addIgnoredField;
					addIntegerField: #z: ;
					upToEnd)
		equals: { 
					NeoCSVTestObject example. 
					NeoCSVTestObject example. 
					NeoCSVTestObject example }
]

{ #category : #testing }
NeoCSVReaderTests >> testReadWithIgnoredField [
	| input |
	input := (String crlf join: #( '1,2,a,3' '1,2,b,3' '1,2,c,3' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					addIntegerField;
					addIntegerField;
					addIgnoredField;
					addIntegerField;
					upToEnd)
		equals: {
			#(1 2 3).
			#(1 2 3).
			#(1 2 3).}
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleCrLfQuoted [
	| input |
	input := (String crlf join: #('"1","2","3"' '"4","5","6"' '"7","8","9"' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleCrLfUnquoted [
	| input |
	input := (String crlf join: #('1,2,3' '4,5,6' '7,8,9' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleCrQuoted [
	| input |
	input := (String cr join: #('"1","2","3"' '"4","5","6"' '"7","8","9"' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleCrUnquoted [
	| input |
	input := (String cr join: #('1,2,3' '4,5,6' '7,8,9' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleLfQuoted [
	| input |
	input := (String lf join: #('"1","2","3"' '"4","5","6"' '"7","8","9"' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleLfUnquoted [
	| input |
	input := (String lf join: #('1,2,3' '4,5,6' '7,8,9' '')).
	self 
		assert: (NeoCSVReader on: input readStream) upToEnd
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleSemiColonDelimited [
	| input |
	input := (String crlf join: #('1;2;3' '4;5;6' '7;8;9' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					separator: $; ;
					upToEnd)
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSimpleTabDelimited [
	| input |
	input := (String crlf join: #('1	2	3' '4	5	6' '7	8	9' '')).
	self 
		assert: ((NeoCSVReader on: input readStream) 
					separator: Character tab ;
					upToEnd)
		equals: #(('1' '2' '3')('4' '5' '6')('7' '8' '9'))
]

{ #category : #testing }
NeoCSVReaderTests >> testSkippingEmptyRecords [
	| input output |
	input := '1,2,3\\4,5,6\,,\7,8,9' withCRs.
	output := (NeoCSVReader on: input readStream) 
		select: [ :each | each notEmpty and: [ (each allSatisfy: #isNil) not ] ].
	self assert: output equals: #(#('1' '2' '3') #('4' '5' '6') #('7' '8' '9')).
	output := (NeoCSVReader on: input readStream) 
		emptyFieldValue: '';
		select: [ :each | each notEmpty and: [ (each allSatisfy: #isEmpty) not ] ].
	self assert: output equals: #(#('1' '2' '3') #('4' '5' '6') #('7' '8' '9'))
]
