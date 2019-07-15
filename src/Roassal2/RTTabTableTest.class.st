Class {
	#name : #RTTabTableTest,
	#superclass : #RTTest,
	#instVars : [
		'tab',
		'data'
	],
	#category : #'Roassal2-Table'
}

{ #category : #running }
RTTabTableTest >> setUp [
	super setUp.
	tab := RTTabTable new
]

{ #category : #tests }
RTTabTableTest >> testAccessing [

	tab input: 'key	m1	m2	m3
A	1	2	5
B	2	5	4
C	1	7	4'.
	self assert: tab numberOfRows = 4.
	tab removeFirstRow.
	self assert: tab numberOfRows = 3.
]

{ #category : #tests }
RTTabTableTest >> testAccessing2 [

	tab input: 'key	m1	m2	m3

A	1	2	5

B	2	5	4

C	1	7	4'.
	self assert: tab numberOfRows = 4.
	tab removeFirstRow.
	self assert: tab numberOfRows = 3.
	self assert: tab numberOfColumns = 4.
	self assert: tab firstColumn = (Array with: 'A' with: 'B' with: 'C').

]

{ #category : #tests }
RTTabTableTest >> testCommasInsideQuotes [

	tab input:
  '2014-01-26 00:00:00+00,Boeing 737-3B7 (SF),ZK-TLC,"Airwork, NZ,opf. Pacific Air Express",0,Honiara-Henderson International Airport(HIR),Solomon Islands,-9.428056,160.053056,"Brisbane International Airport, QLD (BNE/YBBN), Australia","Honiara-Henderson International Airport (HIR/AGGH), Solomon Islands",Accident resulting in a total loss of the plane,0101000020E6100000691B7FA2B201644091B6F1272ADB22C0,7,2014-07-18 11:46:49.32676+00,2014-07-18 11:47:01.156893+00'
  usingDelimiter: $,.
  self assert: tab numberOfColumns equals: 16
]

{ #category : #tests }
RTTabTableTest >> testConvertAsDateAndTime [

	tab input: TRPlatform current dateTimeStringExample usingDelimiter: $,.
	tab convertColumnAsDateAndTime: 3.
	tab convertColumnAsDateAndTime: 4.
	self assert: tab values size equals: 3.
	
	self assert: tab values first third year equals: 2014.
	self assert: tab values last third year equals: 2008.
	self assert: tab values last fourth year equals: 2009.
	self assert: tab values last fourth month equals: 1.
]

{ #category : #tests }
RTTabTableTest >> testConvertAsFloats [

	tab input: '5.4,1.2,0,hello world' usingDelimiter: $,.
	tab convertColumnsAsFloat: #(1 2 3).
	self assert: tab values first equals: #(5.4 1.2 0 'hello world')
]

{ #category : #tests }
RTTabTableTest >> testConvertAsInteger [

	tab input: '5.4,1.2,0,hello world' usingDelimiter: $,.
	tab convertColumnsAsInteger: #(1 2 3).
	self assert: tab values first equals: #(5 1 0 'hello world')
]

{ #category : #tests }
RTTabTableTest >> testDetectDelimiter [
	data := 'm1	m2	m3
1	2	5
2	5	4
1	7	4'.
	self assert: (tab detectDelimiterIn: data) equals: Character tab
]

{ #category : #tests }
RTTabTableTest >> testDetectDelimiter1 [
	data := 'm1	m2	m3'.
	self assert: (tab detectDelimiterIn: data) equals: Character tab
]

{ #category : #tests }
RTTabTableTest >> testDetectDelimiter2 [
	data := 'm1,m2,m3'.
	self assert: (tab detectDelimiterIn: data) equals: $,
]

{ #category : #tests }
RTTabTableTest >> testDetectDelimiter3 [
	data := ''.
	self assert: (tab detectDelimiterIn: data) equals: Character tab
]

{ #category : #tests }
RTTabTableTest >> testDictionaryValues [
	tab
		input:
			'm1	m2	m3
A	1	2
B	4	9'.
	tab removeFirstRow.
	self
		assert: tab dictionaryValues
		equals:
			(Array with: (OrderedDictionary with: #m1 -> 'A' with: #m2 -> '1' with: #m3 -> '2') with: 
			(OrderedDictionary with: #m1 -> 'B' with: #m2 -> '4' with: #m3 -> '9'))
]

{ #category : #tests }
RTTabTableTest >> testEmptyAndReplaceColumn [

	tab input: ',,' usingDelimiter: $,.
	tab replaceEmptyValuesWith: 0 inColumns: #(1 2 3).
	self assert: tab numberOfColumns equals: 3.
	self assert: tab values first equals: #(0 0 0)
]

{ #category : #tests }
RTTabTableTest >> testEmptyColumn [

	tab input: ',,' usingDelimiter: $,.
	self assert: tab numberOfColumns equals: 3
]

{ #category : #tests }
RTTabTableTest >> testFiltering [

	tab input: 'abc,123,123
5,0,0
1,2,3' usingDelimiter: $,.

	self assert: tab numberOfRows equals: 3.
	tab rejectRow: [ :row | row first = 'abc' ]. 
	self assert: tab numberOfRows equals: 2.
	tab rejectRow: [ :row | row first = 'abc' ].
	self assert: tab numberOfRows equals: 2.
]

{ #category : #tests }
RTTabTableTest >> testFilteringPerColumn [

	tab input: 'abc,123,123
5,0,0
1,2,3' usingDelimiter: $,.

	tab convertColumnAsInteger: 2.
	self assert: tab numberOfRows equals: 3.
	tab rejectInColumn: 2 row: #isZero. 
	self assert: tab numberOfRows equals: 2.

	tab rejectInColumn: 2 row: #isZero. 
	self assert: tab numberOfRows equals: 2.

	tab rejectRow: [ :row | row first = 'abc' ].
	self assert: tab numberOfRows equals: 1.
]

{ #category : #tests }
RTTabTableTest >> testGathering [

	tab input: '1 A
2 B
1 A
1 A
5 B' usingDelimiter: $ .
	tab convertColumn: 1 to: #asInteger.
	tab gather: 2 using: [ :row1 :row2 | Array with: row1 first + row2 first with: row1 second ].
	self assert: (tab values asArray = #( #(3 'A') #(7 'B')))
]

{ #category : #tests }
RTTabTableTest >> testGrouped [
	tab
		input:
			'm1	m2	m3
A	1	2
A	3	7
B	2	5
B	4	9'.
	tab removeFirstRow.
	tab convertColumnsAsInteger: #(m2 m3).
	self
		assert: (tab valuesGroupedBy: #m1)
		equals:
			(Array with: ('A'
				->
					(Array
						with: (OrderedDictionary with: #m1 -> 'A' with: #m2 -> 1 with: #m3 -> 2)
						with: (OrderedDictionary with: #m1 -> 'A' with: #m2 -> 3 with: #m3 -> 7)))
			with: ('B'
				->
					(Array
						with: (OrderedDictionary with: #m1 -> 'B' with: #m2 -> 2 with: #m3 -> 5)
						with: (OrderedDictionary with: #m1 -> 'B' with: #m2 -> 4 with: #m3 -> 9))))
				asDictionary
]

{ #category : #tests }
RTTabTableTest >> testMassiveConversion [

	tab input: 'key	m1	m2	m3
A	1	2	5
B	2	5	4
C	1	7	4	'.
	tab removeFirstRow.
	self assert: tab values first second = '1'.
	self assert: tab values third third = '7'.
	
	tab convertColumns: (2 to: 4) to: [ :s | s asInteger ]. 
	self assert: tab values first second = 1.
	self assert: tab values third third = 7.
	
	self assert: tab minimum = 1.
	self assert: tab maximum = 7.
	
	self assert: (tab maxOfColumn: #second) = 2.
	self assert: (tab maxOfColumn: #fourth) = 5.
	self assert: (tab maxOfColumn: [ :row | row at: 3 ]) = 7.
]

{ #category : #tests }
RTTabTableTest >> testMinimumAndMaximum [

	tab input: 
'5.4,1.2,0,hello world
-56,1.2,100,bravo' usingDelimiters: ','.
	tab convertColumnsAsFloat: #(1 2 3).
	self assert: tab minimum equals: -56.0.
	self assert: tab maximum equals: 100.
	
	self assert: (tab maxOfColumn: #first) equals: 5.4.
	self assert: (tab maxOfColumn: #second) equals: 1.2.
	self assert: (tab maxOfColumn: #third) equals: 100.0.
	
	self assert: tab firstColumn equals: #(5.4 -56).
]

{ #category : #tests }
RTTabTableTest >> testProcessing [

	tab input: 'France	20
Germany	80'.
	tab convertColumn: 2 to: #asInteger.
	self assert: (tab values = #( #('France' 20) #('Germany' 80)))
]

{ #category : #tests }
RTTabTableTest >> testProcessingWithEmptyLines [

	tab input: 'France	20
Germany	80
'.
	tab convertColumn: 2 to: #asInteger.
	self assert: (tab values = #( #('France' 20) #('Germany' 80)))
]

{ #category : #tests }
RTTabTableTest >> testRemovingColumn [
	tab
		input:
			'Country	number	toremove
France	20	toremove
Germany	80	toremove'.
	tab removeFirstRow.
	tab removeColumn: 3.
	self assert: tab values equals: #(#('France' '20') #('Germany' '80')).
	self assert: tab firstRow equals: #('Country' 'number')
]

{ #category : #tests }
RTTabTableTest >> testUsingFirstRow [

	| tabString |
	tabString :=
'
x,y
4,1
2,6
1,3
1,5
'.
	tab := RTTabTable new input: tabString usingDelimiter: $,.
	tab removeFirstRow.
	tab convertColumnsAsInteger: #('x' 'y').
	
	self assert: (tab indexOfName: 'x') equals: 1.
	self assert: (tab indexOfName: 'y') equals: 2.
	
	self assert: (tab valuesOfColumn: 'x') equals: #(4 2 1 1).
	
	self assert: (tab convertFromNameToIndexIfNecessary: 1) equals: 1.
	self assert: (tab convertFromNameToIndexIfNecessary: 100) equals: 100.
	self assert: (tab convertFromNameToIndexIfNecessary: 'x') equals: 1.
	self assert: (tab convertFromNameToIndexIfNecessary: 'y') equals: 2.
]

{ #category : #tests }
RTTabTableTest >> testWithQuote [

	tab input: 'abc,def,"ghi,ijk"' usingDelimiter: $,.
	self assert: tab numberOfColumns equals: 3
]
