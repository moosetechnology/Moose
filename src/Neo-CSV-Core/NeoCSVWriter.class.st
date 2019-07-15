"
I am NeoCSVWriter.

I write a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, I write record objects whose fields can be enumerated using #do: such as SequenceableCollections

By specifiying fields any object can be written converting and/or quoting each field as needed.

MIT License.
"
Class {
	#name : #NeoCSVWriter,
	#superclass : #Object,
	#instVars : [
		'writeStream',
		'separator',
		'fieldWriter',
		'lineEnd',
		'fieldAccessors',
		'emptyFieldValue'
	],
	#category : 'Neo-CSV-Core'
}

{ #category : #'instance creation' }
NeoCSVWriter class >> on: writeStream [
	"Initialize on writeStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	^ self new
		on: writeStream;
		yourself
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addConstantField: string [
	"Add a constant field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: string ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addEmptyField [
	"Add an empty field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: '' ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addField: accessor [
	"Add a field based on an accessor to be written using fieldWriter.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeField: (accessor value: object) ]
]

{ #category : #private }
NeoCSVWriter >> addFieldAccessor: block [
	fieldAccessors 
		ifNil: [
			fieldAccessors := Array with: block ]
		ifNotNil: [
			fieldAccessors := fieldAccessors copyWith: block ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addFieldAt: key [
	"Add a field based on a key to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: (object at: key ifAbsent: [ '' ]) ]
]

{ #category : #convenience }
NeoCSVWriter >> addFields: accessors [
	accessors do: [ :each |
		self addField: each ]
]

{ #category : #convenience }
NeoCSVWriter >> addFieldsAt: keys [
	keys do: [ :each |
		self addFieldAt: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addObjectField: accessor [
	"Add a field based on an accessor to be written as an #object field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeObjectField: (accessor value: object) ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addObjectFieldAt: key [
	"Add a field based on a key to be written as an #object field"

	self addFieldAccessor: [ :object |
		self writeObjectField: (object at: key) ]
]

{ #category : #convenience }
NeoCSVWriter >> addObjectFields: accessors [
	accessors do: [ :each |
		self addObjectField: each ]
]

{ #category : #convenience }
NeoCSVWriter >> addObjectFieldsAt: keys [
	keys do: [ :each |
		self addObjectFieldAt: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addOptionalQuotedField: accessor [
	"Add a field based on an accessor to be written as a #optionalQuoted field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeOptionalQuotedField: (accessor value: object) ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addOptionalQuotedFieldAt: key [
	"Add a field based on a key to be written as a #optionalQuoted field"

	self addFieldAccessor: [ :object |
		self writeOptionalQuotedField: (object at: key) ]
]

{ #category : #convenience }
NeoCSVWriter >> addOptionalQuotedFields: accessors [
	accessors do: [ :each |
		self addOptionalQuotedField: each ]
]

{ #category : #convenience }
NeoCSVWriter >> addOptionalQuotedFieldsAt: keys [
	keys do: [ :each |
		self addOptionalQuotedFieldAt: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addQuotedField: accessor [
	"Add a field based on an accessor to be written as a #quoted field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (accessor value: object) ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addQuotedFieldAt: key [
	"Add a field based on a key to be written as a #quoted field"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (object at: key) ]
]

{ #category : #convenience }
NeoCSVWriter >> addQuotedFields: accessors [
	accessors do: [ :each |
		self addQuotedField: each ]
]

{ #category : #convenience }
NeoCSVWriter >> addQuotedFieldsAt: keys [
	keys do: [ :each |
		self addQuotedFieldAt: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addRawField: accessor [
	"Add a field based on an accessor to be written as a #raw field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeRawField: (accessor value: object) ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> addRawFieldAt: key [
	"Add a field based on a key to be written as a #raw field"

	self addFieldAccessor: [ :object |
		self writeRawField: (object at: key) ]
]

{ #category : #convenience }
NeoCSVWriter >> addRawFields: accessors [
	accessors do: [ :each |
		self addRawField: each ]
]

{ #category : #convenience }
NeoCSVWriter >> addRawFieldsAt: keys [
	keys do: [ :each |
		self addRawFieldAt: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> close [
	writeStream ifNotNil: [
		writeStream close.
		writeStream := nil ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> emptyFieldValue: object [
	"Set the empty field value to object.
	When reading fields from records to be written out, 
	if the field value equals the emptyFieldValue,
	it will be considered an empty field and written as such."
	
	emptyFieldValue := object
]

{ #category : #accessing }
NeoCSVWriter >> fieldWriter: symbol [
	"Set the field write to be used, either #quoted (the default), #raw or #object.
	This determines how field values will be written in the general case.
	#quoted will wrap fields #asString in double quotes and escape embedded double quotes
	#raw will write fields #asString as such (no separator, double quote or end of line chars allowed)
	#optionalQuoted will write fields using #raw if possible (no separators, ...), and #quoted otherwise
	#object will #print: fields (no separator, double quote or end of line chars allowed)"
	
	self assert: (#(quoted raw object optionalQuoted) includes: symbol).
	fieldWriter := ('write', symbol capitalized, 'Field:') asSymbol
	
]

{ #category : #accessing }
NeoCSVWriter >> flush [
	writeStream flush
]

{ #category : #'initialize-release' }
NeoCSVWriter >> initialize [ 
	super initialize.
	lineEnd := String crlf.
	separator := $, .
	fieldWriter := #writeQuotedField: 

]

{ #category : #'initialize-release' }
NeoCSVWriter >> lineEndConvention: symbol [
	"Set the end of line convention to be used.
	Either #cr, #lf or #crlf (the default)."
	
	self assert: (#(cr lf crlf) includes: symbol).
	lineEnd := String perform: symbol
]

{ #category : #convenience }
NeoCSVWriter >> namedColumnsConfiguration: columns [
	"Configure the receiver to output the named columns as keyed properties.
	The objects to be written should respond to #at: like a Dictionary.
	Writes a header first. Uses the configured field writer."
	
	self writeHeader: columns.
	self addFieldsAt: columns
]

{ #category : #accessing }
NeoCSVWriter >> nextPut: anObject [
	"Write anObject as single record.
	Depending on configuration fieldAccessors or a #do: enumeration will be used."
	
	fieldAccessors 
		ifNil: [
			self writeFieldsUsingDo: anObject ]
		ifNotNil: [
			self writeFieldsUsingAccessors: anObject ].
	self writeEndOfLine 
]

{ #category : #accessing }
NeoCSVWriter >> nextPutAll: collection [
	"Write a collection of objects as records"
	
	collection do: [ :each | 
		self nextPut: each ]
]

{ #category : #'initialize-release' }
NeoCSVWriter >> on: aWriteStream [
	"Initialize on aWriteStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	writeStream := aWriteStream

]

{ #category : #'initialize-release' }
NeoCSVWriter >> separator: character [
	"Set character to be used as separator"
	
	self assert: character isCharacter.
	separator := character 
]

{ #category : #private }
NeoCSVWriter >> writeEndOfLine [
	writeStream nextPutAll: lineEnd 
]

{ #category : #private }
NeoCSVWriter >> writeField: object [
	self perform: fieldWriter with: object
]

{ #category : #private }
NeoCSVWriter >> writeFieldsUsingAccessors: anObject [
	| first |
	first := true.
	fieldAccessors do: [ :each | | fieldValue | 
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		fieldValue := each value: anObject ]
]

{ #category : #private }
NeoCSVWriter >> writeFieldsUsingDo: anObject [
	| first |
	first := true.
	anObject do: [ :each |
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		self writeField: each ]
]

{ #category : #accessing }
NeoCSVWriter >> writeHeader: fieldNames [
	"Write the header, a collection of field names.
	This should normally be called only at the beginning and only once."
	
	fieldNames 
		do: [ :each | self writeQuotedField: each ]
		separatedBy: [ self writeSeparator ].
	self writeEndOfLine
]

{ #category : #private }
NeoCSVWriter >> writeObjectField: object [
	object = emptyFieldValue
		ifFalse: [ object printOn: writeStream ]
]

{ #category : #writing }
NeoCSVWriter >> writeOptionalQuotedField: object [
	| string |
	object = emptyFieldValue
		ifTrue: [ ^ self ].
	string := object asString.
	({lineEnd asString.
	separator asString.
	'"'} anySatisfy: [ :each | string includesSubstring: each ])
		ifTrue: [ self writeQuotedField: object ]
		ifFalse: [ self writeRawField: object ]
]

{ #category : #private }
NeoCSVWriter >> writeQuotedField: object [
	object = emptyFieldValue
		ifTrue: [ writeStream nextPut: $" ; nextPut: $" ]
		ifFalse: [ | string |
			string := object asString.
			writeStream nextPut: $".
			string do: [ :each |
				each == $" 
					ifTrue: [ writeStream nextPut: $"; nextPut: $" ]
					ifFalse: [ writeStream nextPut: each ] ].
			writeStream nextPut: $" ]
]

{ #category : #private }
NeoCSVWriter >> writeRawField: object [
	object = emptyFieldValue 
		ifFalse: [ writeStream nextPutAll: object asString ]
]

{ #category : #private }
NeoCSVWriter >> writeSeparator [
	writeStream nextPut: separator 
]
