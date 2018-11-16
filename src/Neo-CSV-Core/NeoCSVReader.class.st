"
I am NeoCSVReader.

I read a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, records will become Arrays of Strings.

By specifiying a recordClass and fields with optional converters most objects can be read and instanciated correctly.

MIT License.

"
Class {
	#name : #NeoCSVReader,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'charBuffer',
		'separator',
		'stringStream',
		'fieldCount',
		'recordClass',
		'recordClassIsIndexable',
		'fieldAccessors',
		'emptyFieldValue'
	],
	#category : 'Neo-CSV-Core'
}

{ #category : #'instance creation' }
NeoCSVReader class >> on: readStream [
	"Initialize on readStream, which should be a character stream that 
	implements #next, #atEnd and (optionally) #close."

	^ self new
		on: readStream;
		yourself
]

{ #category : #'initialize-release' }
NeoCSVReader >> addField [
	"Add the next indexable field with a pass through converter"
	
	self
		recordClassIsIndexable: true; 
		addFieldAccessor: [ :string | string ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addField: accessor [
	"Add a field based on a mutator accessor accepting a field 
	String as argument to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: string ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addField: accessor converter: converter [
	"Add a field based on a mutator accessor accepting the result of 
	applying the converter block on the field String read as argument 
	to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: (converter value: string) ]
]

{ #category : #private }
NeoCSVReader >> addFieldAccessor: block [
	fieldAccessors 
		ifNil: [
			fieldAccessors := Array with: block ]
		ifNotNil: [
			fieldAccessors := fieldAccessors copyWith: block ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addFieldAt: key [
	"Add a field that will be stored under key in recordClass as String"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: string ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addFieldAt: key converter: converter [
	"Add a field that will be stored under key in recordClass as the result of 
	applying the converter block on the field String read as argument"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: (converter value: string) ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addFieldConverter: converter [
	"Add the next indexable field with converter block, 
	accepting a String and returning a specific object"

	self
		recordClassIsIndexable: true; 
		addFieldAccessor: converter
]

{ #category : #convenience }
NeoCSVReader >> addFields: accessors [
	"Add fields based on a collection of accessors, not doing any conversions."
	
	accessors do: [ :each |
		self addField: each ]
]

{ #category : #convenience }
NeoCSVReader >> addFieldsAt: keys [
	"Add fields based on a collection of keys for #at:put: not doing any conversions"

	keys do: [ :each |
		self addFieldAt: each ]
]

{ #category : #convenience }
NeoCSVReader >> addFloatField [
	"Add a field for indexable records parsed as Float"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addFloatField: accessor [
	"Add a field with accessor parsed as Float"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addFloatFieldAt: key [
	"Add a field for key for #at:put: parsed as Float"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addFloatFieldRadixPointComma [
	"Add a field for indexable records parsed as Float using a comma as radix point"

	self addFieldConverter: [ :string | (NeoNumberParser on: string) radixPoint: $, ; next ]
]

{ #category : #convenience }
NeoCSVReader >> addFloatFieldRadixPointCommaAt: key [
	"Add a field for key for #at:put: parsed as Float using a comma as radix point"

	self 
		addFieldAt: key 
		converter: [ :string | (NeoNumberParser on: string) radixPoint: $, ; next ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> addIgnoredField [
	"Add a field that should be ignored, should not become part of the record"

	self addFieldAccessor: nil
]

{ #category : #'initialize-release' }
NeoCSVReader >> addIgnoredFields: count [
	"Add a count of consecutive ignored fields to receiver."

	count timesRepeat: [ self addIgnoredField ]
]

{ #category : #convenience }
NeoCSVReader >> addIntegerField [
	"Add a field for indexable records parsed as Integer"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addIntegerField: accessor [
	"Add a field with accessor parsed as Integer"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addIntegerFieldAt: key [
	"Add a field for key for #at:put: parsed as Integer"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]
]

{ #category : #convenience }
NeoCSVReader >> addSymbolField [
	"Add a field for indexable records read as Symbol"

	self addFieldConverter: [ :string | string asSymbol ]
]

{ #category : #convenience }
NeoCSVReader >> addSymbolField: accessor [
	"Add a field with accessor read as Symbol"

	self 
		addField: accessor 
		converter: [ :string | string asSymbol ]
]

{ #category : #convenience }
NeoCSVReader >> addSymbolFieldAt: key [
	"Add a field for key for #at:put: read as Symbol"

	self 
		addFieldAt: key 
		converter: [ :string | string asSymbol ]
]

{ #category : #private }
NeoCSVReader >> applyAccessor: accessor on: object with: value [
	"Use accessor to assign value on a property of object.
	Accessor can be a block or mutator symbol."
	
	"If Symbol implemented #value:value: this could be implemented more elegantly."
	
	accessor isBlock
		ifTrue: [ accessor value: object value: value ] 
		ifFalse: [ object perform: accessor with: value ]
]

{ #category : #testing }
NeoCSVReader >> atEnd [
	^ charBuffer == nil and: [ readStream atEnd ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> close [
	readStream ifNotNil: [
		readStream close.
		readStream := nil ]
]

{ #category : #accessing }
NeoCSVReader >> do: block [
	"Execute block for each record until I am at end."
	
	[ self atEnd ]
		whileFalse: [ 
			block value: self next ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> emptyFieldValue: object [
	"Set the value to be used when reading empty or missing fields.
	The default is nil. Empty or missing fields are never set 
	when the record class is non-indexeabe, nor are they passed to converters.
	The special #passNil can be set to force that in the case of 
	an empty or missing field nil *is* passed to a converter block
	so that per field empty values or specific behavior are possible."
	
	emptyFieldValue := object
]

{ #category : #'initialize-release' }
NeoCSVReader >> fieldCount: anObject [
	"Set the field count up front.
	This will be used when reading records as Arrays.
	This instance variable will be set and used automatically based on the first record seen.
	If set, the fieldAccessors collection defines (overrides) the fieldCount."

	fieldCount := anObject
]

{ #category : #'initialize-release' }
NeoCSVReader >> initialize [
	super initialize.
	recordClass := Array.
	recordClassIsIndexable := true.
	separator := $,
]

{ #category : #convenience }
NeoCSVReader >> namedColumnsConfiguration [
	"Assuming there is a header row that has not yet been read,
	configure the receiver to read each row as a Dictionary where
	each field is stored under a column name.
	Note that each field is read as a string."
	
	self recordClass: Dictionary.
	self addFieldsAt: (self readHeader collect: [ :each | each asSymbol ])
]

{ #category : #accessing }
NeoCSVReader >> next [
	"Read the next record.
	I will return an instance of recordClass."
	
	^ recordClassIsIndexable
		ifTrue: [ self readNextRecordAsArray ] 
		ifFalse: [ self readNextRecordAsObject ]
]

{ #category : #private }
NeoCSVReader >> nextChar [
	^ charBuffer 
		ifNil: [ 
			readStream next ]
		ifNotNil: [ | char |
			char := charBuffer.
			charBuffer := nil.
			^ char ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> on: aReadStream [
	"Initialize on aReadStream, which should be a character stream that 
	implements #next, #atEnd and (optionally) #close."
	
	readStream := aReadStream
]

{ #category : #private }
NeoCSVReader >> peekChar [
	^ charBuffer 
		ifNil: [ 
			charBuffer := readStream next ]
]

{ #category : #private }
NeoCSVReader >> peekEndOfLine [
	| char |
	char := self peekChar codePoint.
	^ (char == 10 "Character lf" ) or: [ char == 13 "Character cr" ]
]

{ #category : #private }
NeoCSVReader >> peekFor: character [
	self peekChar == character
		ifTrue: [ 
			self nextChar. 
			^ true ].
	^ false
]

{ #category : #private }
NeoCSVReader >> peekQuote [
	^ self peekChar == $"
]

{ #category : #private }
NeoCSVReader >> peekSeparator [
	^ self peekChar == separator
]

{ #category : #private }
NeoCSVReader >> readAtEndOrEndOfLine [
	^ self atEnd or: [ self readEndOfLine ]

]

{ #category : #private }
NeoCSVReader >> readEndOfLine [
	| char |
	char := self peekChar codePoint.
	char == 10 "Character lf"
		ifTrue: [ 
			self nextChar. 
			^ true ].
	char == 13 "Character cr"
		ifTrue: [
			self nextChar.
			(self atEnd not and: [ self peekChar codePoint == 10 "Character lf" ])
				ifTrue: [ 
					self nextChar ]. 
			^ true  ].
	^ false

]

{ #category : #private }
NeoCSVReader >> readEndOfQuotedField [	
	"A double quote inside a quoted field is an embedded quote (escaped)"
	
	^ self readQuote and: [ self peekQuote not ]
]

{ #category : #'private - reading' }
NeoCSVReader >> readField [
	^ self peekQuote
		ifTrue: [
			self readQuotedField ]
		ifFalse: [
			self readUnquotedField ]
]

{ #category : #'private - reading' }
NeoCSVReader >> readFieldAndSeparator [
	| field |
	field := self readField.
	self readSeparator.
	^ field
]

{ #category : #'private - reading' }
NeoCSVReader >> readFirstRecord [ 
	"This is only used for array based records when there are no field accessors or 
	when there is no field count, to obtain a field count based on the first record"
	
	^ recordClass streamContents: [ :stream |
		[ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				stream nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ stream nextPut: emptyFieldValue ] ] ]
]

{ #category : #accessing }
NeoCSVReader >> readHeader [
	"Read a record, presumably a header and return the header field names.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	| names |
	names := Array streamContents: [ :out |
		 [ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				out nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ out nextPut: emptyFieldValue ] ] ].
	fieldCount := names size.
	^ names
]

{ #category : #'private - reading' }
NeoCSVReader >> readNextRecord [
	| record |
	record := recordClass new: fieldCount.
	fieldAccessors
		ifNil: [ self readNextRecordWithoutFieldAccessors: record ]
		ifNotNil: [ self readNextRecordWithFieldAccessors: record ].
	self readAtEndOrEndOfLine.
	^ record
]

{ #category : #'private - reading' }
NeoCSVReader >> readNextRecordAsArray [
	fieldAccessors ifNotNil: [ 
		fieldCount := fieldAccessors count: [ :each | each notNil ] ].
	^ fieldCount 
		ifNil: [ | record |
			record := self readFirstRecord.
			fieldCount := record size.
			record ] 
		ifNotNil: [
			self readNextRecord ]
]

{ #category : #'private - reading' }
NeoCSVReader >> readNextRecordAsObject [
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"nil field accessors are used to ignore fields"
		each 
			ifNotNil: [  
				rawValue = emptyFieldValue
					ifTrue: [ 
						emptyFieldValue = #passNil 
							ifTrue: [ each value: object value: nil ] ]
					ifFalse: [ each value: object value: rawValue ] ] ].
	self readAtEndOrEndOfLine.
	^ object
]

{ #category : #'private - reading' }
NeoCSVReader >> readNextRecordWithFieldAccessors: record [
	| fieldIndex |
	fieldIndex := 1.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"nil field accessors are used to ignore fields"
		each
			ifNotNil: [ 
				rawValue = emptyFieldValue
					ifTrue: [ 
						emptyFieldValue = #passNil
							ifTrue: [ record at: fieldIndex put: (each value: nil) ]
							ifFalse: [ record at: fieldIndex put: emptyFieldValue ] ]
					ifFalse: [ record at: fieldIndex put: (each value: rawValue) ].
				fieldIndex := fieldIndex + 1 ] ]
]

{ #category : #'private - reading' }
NeoCSVReader >> readNextRecordWithoutFieldAccessors: record [
	1 to: fieldCount do: [ :each |
		record at: each put: self readFieldAndSeparator ]
]

{ #category : #private }
NeoCSVReader >> readQuote [
	^ self peekFor: $"
]

{ #category : #'private - reading' }
NeoCSVReader >> readQuotedField [
	| field |
	self readQuote.
	field := self stringStreamContents: [ :stream |
		[ self atEnd or: [ self readEndOfQuotedField ] ]
			whileFalse: [
				stream nextPut: self nextChar ] ].
	^ field isEmpty
		ifTrue: [ emptyFieldValue ]
		ifFalse: [ field ]
]

{ #category : #private }
NeoCSVReader >> readSeparator [
	^ self peekFor: separator
]

{ #category : #'private - reading' }
NeoCSVReader >> readUnquotedField [
	(self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ])
		ifTrue: [ ^ emptyFieldValue ].
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ] ]
			whileFalse: [ 
				stream nextPut: self nextChar ] ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> recordClass: anObject [
	"Set the object class to instanciate while reading records.
	Unless the objets are integer indexable, you have to specify fields as well."
	
	recordClass := anObject
]

{ #category : #'initialize-release' }
NeoCSVReader >> recordClassIsIndexable: boolean [
	"Set whether recordClass should be treated as an indexable sequenceable collection
	class that implements #new: and #streamContents and whose instances implement #at:put: 
	If false, fields accessors have to be provided. The default is true.
	Will be set automatically when field accessors or converters are set."
	
	recordClassIsIndexable := boolean 
]

{ #category : #accessing }
NeoCSVReader >> select: filter [
	"Read and collect records that satisfy filter into an Array until there are none left.
	Return the array."

	^ Array streamContents: [ :stream | 
		self 
			select: filter 
			thenDo: [ :each | stream nextPut: each ] ]
]

{ #category : #accessing }
NeoCSVReader >> select: filter thenDo: block [
	"Execute block for each record that satisfies filter until I am at end."

	[ self atEnd ]
		whileFalse: [ 
			| record |
			record := self next.
			(filter value: record)
				ifTrue: [ block value: record ] ]
]

{ #category : #'initialize-release' }
NeoCSVReader >> separator: character [
	"Set the field separator character to use, defaults to comma"
	
	self assert: character isCharacter.
	separator := character 
]

{ #category : #convenience }
NeoCSVReader >> skipHeader [
	"Read a record, presumably a header, with the intention of skipping it.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	self readHeader
]

{ #category : #private }
NeoCSVReader >> stringStreamContents: block [
	"Like String streamContents: block
	but reusing the underlying buffer for improved efficiency"
	
	stringStream 
		ifNil: [ 
			stringStream := (String new: 32) writeStream ].
	stringStream reset.
	block value: stringStream.
	^ stringStream contents
]

{ #category : #accessing }
NeoCSVReader >> upToEnd [ 
	"Read and collect records into an Array until there are none left.
	Return the array."
	
	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]
]
