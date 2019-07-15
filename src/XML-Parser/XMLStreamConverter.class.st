"
An abstract class for stream converters.

Subclasses need to implement #nextFromStream: to use #basicNext on the argument to read byte characters and decode them, and implement #nextPut:toStream: to use #basicNextPut:/#basicNextPutByte: on the second argument to encode the first.

The class #basicEncodingNames method should return a basic list of names for the encoding handled by the class, and #byteOrderMarkBytes can return the bytes of a BOM if the encoding has one.
"
Class {
	#name : #XMLStreamConverter,
	#superclass : #Object,
	#classVars : [
		'EncodingNamesAndClassesCache',
		'PreferredClasses'
	],
	#classInstVars : [
		'encodingNames'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #defaults }
XMLStreamConverter class >> abstractClass [
	^ XMLStreamConverter
]

{ #category : #basic }
XMLStreamConverter class >> basicByteOrderMarkBytes [
	^ #[]
]

{ #category : #basic }
XMLStreamConverter class >> basicCanConvertEncoding: anEncodingName [
	^ self encodingNames includes: anEncodingName
]

{ #category : #basic }
XMLStreamConverter class >> basicEncodingNames [
	"encodingNames will have these names + upper/lowercase versions"
	^ #()
]

{ #category : #accessing }
XMLStreamConverter class >> byteOrderMark [
	"avoid #asString and #newFrom: for GS portability"
	^ String streamContents: [:stream |
		self byteOrderMarkBytes do: [:each |
			stream nextPut: each asCharacter]]
]

{ #category : #accessing }
XMLStreamConverter class >> byteOrderMarkBytes [
	^ self basicByteOrderMarkBytes asByteArray
]

{ #category : #testing }
XMLStreamConverter class >> canConvertEncoding: anEncodingName [
	"Returns true if the receiver can decode the encoding anEncodingName.
	Lookup is case-insensitive."

	"we could remove whitespace from anEncodingName too, but the
	production rule for <?xml ...?> 'encoding' attributes disallows
	whitespace, and the HTML parser removes it from <meta> charset
	attributes before converting, so we just convert it to lowercase"
	^ self isAbstractClass not
		and: [self basicCanConvertEncoding: anEncodingName asLowercase]
]

{ #category : #accessing }
XMLStreamConverter class >> classForEncoding: anEncodingName [
	"avoid #at:ifAbsent: and #at:ifAbsentPut: so the cache isn't locked
	during the class lookup, which could stall other processes"
	self encodingNamesAndClassesCache
		at: anEncodingName
		ifPresent: [:classForEncoding | ^ classForEncoding].

	"this will store the class as nil if it wasn't found to prevent future lookup"
	^ self encodingNamesAndClassesCache
		at: anEncodingName
		put: (self findClassForEncoding: anEncodingName).
]

{ #category : #convenience }
XMLStreamConverter class >> decode: aStringOrByteArray [
	^ self new decode: aStringOrByteArray
]

{ #category : #convenience }
XMLStreamConverter class >> decodingOn: aReadStream [
	^ self new decodingOn: aReadStream
]

{ #category : #'instance creation' }
XMLStreamConverter class >> default [
	^ self defaultClass new
]

{ #category : #defaults }
XMLStreamConverter class >> defaultClass [
	^ XMLImplicitUTF8StreamConverter
]

{ #category : #defaults }
XMLStreamConverter class >> defaultEncoding [
	^ self defaultClass primaryEncodingName
]

{ #category : #convenience }
XMLStreamConverter class >> encode: aString [
	^ self new encode: aString
]

{ #category : #accessing }
XMLStreamConverter class >> encodingNames [
	^ encodingNames
		ifNil: [
			"assign the fully initialized object with #yourself to avoid
			possible race conditions when reinitialization the class"
			encodingNames :=
				Set new
					addAll: self basicEncodingNames;
					addAll:
						(self basicEncodingNames collect: [:each | each asLowercase]);
					addAll:
						(self basicEncodingNames collect: [:each | each asUppercase]);
					yourself]
]

{ #category : #accessing }
XMLStreamConverter class >> encodingNames: aCollectionOrNil [
	encodingNames :=
		aCollectionOrNil
			ifNotNil: [aCollectionOrNil asSet]
]

{ #category : #private }
XMLStreamConverter class >> encodingNamesAndClassesCache [
	"a class variable so it's shared by all subclasses, but lazy initialized
	so it isn't initialized unless needed"
	^ EncodingNamesAndClassesCache
		ifNil: [EncodingNamesAndClassesCache := XMLKeyValueCache maxSize: 128]
]

{ #category : #convenience }
XMLStreamConverter class >> encodingOn: aReadStream [
	^ self new encodingOn: aReadStream
]

{ #category : #private }
XMLStreamConverter class >> findClassForEncoding: anEncodingName [
	"check preferred classes first"
	self preferredClasses do: [:each |
		(each canConvertEncoding: anEncodingName)
			ifTrue: [^ each]].

	"avoid #withAllSubclassesDo: because it does not enumerate the receiver first"
	(self isNonPreferredClassForEncoding: anEncodingName)
		ifTrue: [^ self].
	self allSubclassesDo: [:each |
		(each isNonPreferredClassForEncoding: anEncodingName)
			ifTrue: [^ each]].

	^ nil.
]

{ #category : #'class initialization' }
XMLStreamConverter class >> initialize [
	"self initialize"

	PreferredClasses := nil.
	"reset to nil instead of just clearing to get full reinitialization"
	EncodingNamesAndClassesCache := nil.
]

{ #category : #testing }
XMLStreamConverter class >> isAbstractClass [
	^ self == self abstractClass
]

{ #category : #testing }
XMLStreamConverter class >> isDefaultClass [
	^ self == self defaultClass
]

{ #category : #testing }
XMLStreamConverter class >> isImplicit [
	^ false
]

{ #category : #testing }
XMLStreamConverter class >> isNonPreferredClassForEncoding: anEncoding [
	^ self isPreferredClass not
		and: [self canConvertEncoding: anEncoding]
]

{ #category : #testing }
XMLStreamConverter class >> isPreferredClass [
	^ self preferredClasses includes: self
]

{ #category : #'instance creation' }
XMLStreamConverter class >> newForEncoding: anEncodingName [
	(self classForEncoding: anEncodingName)
		ifNil: [^ self null]
		ifNotNil: [:converterClass |
			^ converterClass new initializeForEncoding: anEncodingName]
]

{ #category : #'instance creation' }
XMLStreamConverter class >> null [
	^ self nullClass new
]

{ #category : #defaults }
XMLStreamConverter class >> nullClass [
	^ XMLNullStreamConverter
]

{ #category : #accessing }
XMLStreamConverter class >> preferredClasses [
	"A class var because it should be shared by all subclasses.
	Assign the fully initialized object with #yourself to avoid
	possible race conditions when reinitialization the class."
	^ PreferredClasses
		ifNil: [
			PreferredClasses :=
				IdentitySet new
					addAll:
						(XMLUTFStreamConverter allSubclasses reject: [:each |
							each isAbstractClass
								or: [each isImplicit]]);
					add: XMLLatin1StreamConverter;
					add: XMLASCIIStreamConverter;
					yourself]
]

{ #category : #accessing }
XMLStreamConverter class >> preferredClasses: aCollectionOrNil [
	PreferredClasses :=
		aCollectionOrNil
			ifNotNil: [aCollectionOrNil asSet]
]

{ #category : #accessing }
XMLStreamConverter class >> primaryEncodingName [
	^ self basicEncodingNames
		at: 1
		ifAbsent: ['']
]

{ #category : #converting }
XMLStreamConverter >> asXMLStreamConverter [
	^ self
]

{ #category : #convenience }
XMLStreamConverter >> decode: aStringOrByteArray [
	^ (XMLDecodingReadStreamAdapter
		on: aStringOrByteArray readStream
		streamConverter: self)
			contents
]

{ #category : #convenience }
XMLStreamConverter >> decodingOn: aReadStream [
	^ XMLDecodingReadStreamAdapter
		on: aReadStream
		streamConverter: self
]

{ #category : #convenience }
XMLStreamConverter >> encode: aString [
	^ (self encodingOn: (ByteArray new: aString size) writeStream)
		nextPutAll: aString;
		contents
]

{ #category : #accessing }
XMLStreamConverter >> encoding [
	^ self class primaryEncodingName
]

{ #category : #convenience }
XMLStreamConverter >> encodingOn: aWriteStream [
	^ (XMLEncodingWriteStreamAdapter
		on: aWriteStream
		streamConverter: self)
			nextPutByteOrderMark;
			yourself
]

{ #category : #private }
XMLStreamConverter >> errorBadCharacterEncoding [
	XMLEncodingException
		formatSignal: 'Invalid {1} encoding for character'
		with: self encoding
]

{ #category : #private }
XMLStreamConverter >> errorBadCharacterValue: aValue [
	XMLEncodingException
		formatSignal: 'Invalid character 0x{1} for {2} encoding'
		with: aValue printStringHex
		with: self encoding
]

{ #category : #initialization }
XMLStreamConverter >> initializeForEncoding: anEncodingName [
]

{ #category : #testing }
XMLStreamConverter >> isDefault [
	^ self class isDefaultClass
]

{ #category : #testing }
XMLStreamConverter >> isImplicit [
	^ self class isImplicit
]

{ #category : #testing }
XMLStreamConverter >> isNull [
	^ false
]

{ #category : #decoding }
XMLStreamConverter >> nextFromStream: aStream [
	self subclassResponsibility
]

{ #category : #encoding }
XMLStreamConverter >> nextPut: aCharacter toStream: aStream [
	self subclassResponsibility
]

{ #category : #encoding }
XMLStreamConverter >> nextPutByteOrderMarkToStream: aStream [
	self class byteOrderMarkBytes do: [:each |
		aStream nextPut: each]
]

{ #category : #printing }
XMLStreamConverter >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self encoding;
		nextPut: $).
]

{ #category : #printing }
XMLStreamConverter >> printWithConvertableStream: aConvertableStream on: aPrintStream [
	aPrintStream
		print: self;
		nextPut: $(;
		print: aConvertableStream;
		nextPut: $)
]
