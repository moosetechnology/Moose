"
A class for XML URIs. Instances are immutable and support combining with other XMLURIs or URI strings using / (to resolve relative URIs in the context of the receiver), accessing URI components, creating copies with replaced components, and retrieving the contents of http:// and file:// URLs using XMLHTTPRequest and XMLFileHandle.

Uses XMLURIParser to parse URIs lazily (for example, when a URI compoenent is accessed with an ""accessing"" message) when created from a string and eagerly when created from a stream.

URI components are stored internally in encoded form and decoded only when needed, because the XML standard requires delaying decoding for as long as possible.
"
Class {
	#name : #XMLURI,
	#superclass : #Object,
	#instVars : [
		'uriString',
		'scheme',
		'hasAuthorityPrefix',
		'rawUserInfo',
		'rawHost',
		'port',
		'rawPathSegments',
		'rawQuery',
		'rawFragment'
	],
	#classVars : [
		'UnreservedCharacters'
	],
	#category : #'XML-Parser-URI'
}

{ #category : #'instance creation' }
XMLURI class >> fromStream: aStream [
	"streams must be parsed eagerly (because the stream might be read from
	or closed after), unlike strings"
	^ self basicNew initialize parseURIStream: aStream
]

{ #category : #'instance creation' }
XMLURI class >> fromString: aString [
	^ self basicNew initialize uriString: aString
]

{ #category : #'class initialization' }
XMLURI class >> initialize [
	"self initialize"

	"Assign the fully initialized object with #yourself to avoid
	possible race conditions when reinitialization the class."
	UnreservedCharacters :=
		BitmapCharacterSet new
			addRangeFrom: $a to: $z;
			addRangeFrom: $A to: $Z;
			addRangeFrom: $0 to: $9;
			addAll: '-._~';
			yourself
]

{ #category : #'instance creation' }
XMLURI class >> new [
	^ self fromString: ''
]

{ #category : #'instance creation' }
XMLURI class >> readFrom: aStringOrStream [
	aStringOrStream isStream
		ifTrue: [^ self fromStream: aStringOrStream]
		ifFalse: [^ self fromString: aStringOrStream]
]

{ #category : #combining }
XMLURI >> / aURIOrURIString [
	"Returns the argument URI if it is absolute or the argument resolved in the
	context of the receiver if it is relative, to do relative path resolution
	or replace hosts, query strings, and other components."

	^ self combinedWith: aURIOrURIString
]

{ #category : #comparing }
XMLURI >> = anObject [
	self == anObject
		ifTrue: [^ true].

	self species == anObject species
		ifFalse: [^ false].

	self scheme = anObject scheme
		ifFalse: [^ false].

	"#has* tests are used as an optimization to skip direclty comparing
	components unless needed when doing so would require additional
	decoding of the raw components"
	self hasUserInfo
		ifTrue: [
			(anObject hasUserInfo
				and: [self userInfo = anObject userInfo])
				ifFalse: [^ false]]
		ifFalse: [
			anObject hasUserInfo
				ifTrue: [^ false]].

	self hasHost
		ifTrue: [
			(anObject hasHost
				and: [self host = anObject host])
				ifFalse: [^ false]]
		ifFalse: [
			anObject hasHost
				ifTrue: [^ false]].

	self port = anObject port
		ifFalse: [^ false].

	self hasPath
		ifTrue: [
			(anObject hasPath
				and: [self pathSegments = anObject pathSegments])
				ifFalse: [^ false]]
		ifFalse: [
			anObject hasPath
				ifTrue: [^ false]].

	self hasQuery
		ifTrue: [
			(anObject hasQuery
				and: [self query = anObject query])
				ifFalse: [^ false]]
		ifFalse: [
			anObject hasQuery
				ifTrue: [^ false]].

	self hasFragment
		ifTrue: [
			(anObject hasFragment
				and: [self fragment = anObject fragment])
				ifFalse: [^ false]]
		ifFalse: [
			anObject hasFragment
				ifTrue: [^ false]].

	^ true.
]

{ #category : #private }
XMLURI >> addRawDotPathSegment [
	self hasNonDirectoryPath
		ifTrue: [self haveDirectoryPath]
]

{ #category : #private }
XMLURI >> addRawDoubleDotPathSegment [
	self hasPath
		ifFalse: [^ self].

	self hasRootPath
		ifTrue: [self removeRawPathSegments]
		ifFalse: [| hadAbsolutePath |
			hadAbsolutePath := self hasAbsolutePath.
			self hasDirectoryPath
				ifTrue: [self removeLastRawPathSegment].
			self hasPath
				ifTrue: [
					self removeLastRawPathSegment.
					(self hasPath
						or: [hadAbsolutePath])
						ifTrue: [self haveDirectoryPath]]].
]

{ #category : #private }
XMLURI >> addRawPathSegment: aString [
	aString = '.'
		ifTrue: [^ self addRawDotPathSegment].
	aString = '..'
		ifTrue: [^ self addRawDoubleDotPathSegment].

	self hasPath
		ifTrue: [
			(self hasDirectoryPath
				and: [self rawPathSegments size > 1])
				ifTrue: [self removeLastRawPathSegment]]
		ifFalse: [
			self hasHost
				ifTrue: [self rawPathSegments addLast: '']].

	self rawPathSegments addLast: aString.
]

{ #category : #private }
XMLURI >> addRawPathSegmentsFrom: aURI [
	"copy before modifying"
	self rawPathSegments: self rawPathSegments copy.

	aURI hasAbsolutePath
		ifTrue: [self removeRawPathSegments]
		ifFalse: [
			self hasNonDirectoryPath
				ifTrue: [
					self removeLastRawPathSegment.
					self hasPath
						ifTrue: [self haveDirectoryPath]]].

	aURI rawPathSegments do: [:each | self addRawPathSegment: each].
]

{ #category : #converting }
XMLURI >> asRetrievableResource [
	^ self isLocal
		ifTrue: [self asXMLFileHandle]
		ifFalse: [self asXMLHTTPRequest]
]

{ #category : #converting }
XMLURI >> asString [
	"Returns the full, untruncated URI string, unlike #printString, which
	may truncate"

	^ self uriString
		ifNil: [| writeStream |
			writeStream := (String new: 64) writeStream.
			self
				printSchemeOn: writeStream;
				printAuthorityPrefixOn: writeStream;
				printAuthorityOn: writeStream;
				printPathPrefixOn: writeStream;
				printPathOn: writeStream;
				printQueryOn: writeStream;
				printFragmentOn: writeStream;
				uriString: writeStream contents;
				uriString]
]

{ #category : #converting }
XMLURI >> asXMLFileHandle [
	self isLocal
		ifFalse: [self errorCannotConvertURIToFileHandle].
	^ self path asXMLFileHandle.
]

{ #category : #converting }
XMLURI >> asXMLHTTPRequest [
	(self isHTTP
		or: [self isHTTPS
			or: [self isRelative]])
		ifFalse: [self errorCannotConvertURIToHTTPRequest].
	^ self asString asXMLHTTPRequest.
]

{ #category : #converting }
XMLURI >> asXMLURI [
	^ self
]

{ #category : #combining }
XMLURI >> combinedWith: aURIOrURIString [
	"Returns the argument URI if it is absolute or the argument resolved in the
	context of the receiver if it is relative, to do relative path resolution
	or replace hosts, query strings, and other components."

	| uriToCombineWith |

	(uriToCombineWith := aURIOrURIString asXMLURI) isEmpty
		ifFalse: [
			(uriToCombineWith isRelative)
				ifTrue: [^ self combinedWithRelativeURI: uriToCombineWith]
				ifFalse: [^ uriToCombineWith]]
]

{ #category : #private }
XMLURI >> combinedWithRelativeURI: aRelativeURI [
	| copy |

	copy := self copy.
	aRelativeURI hasUserInfo
		ifTrue: [
			^ copy
				rawUserInfo: aRelativeURI rawUserInfo;
				rawHost: aRelativeURI rawHost;
				port: aRelativeURI port;
				rawPathSegments: aRelativeURI rawPathSegments;
				rawQuery: aRelativeURI rawQuery;
				rawFragment: aRelativeURI rawFragment].
	aRelativeURI hasHost
		ifTrue: [
			^ copy
				rawHost: aRelativeURI rawHost;
				port: aRelativeURI port;
				rawPathSegments: aRelativeURI rawPathSegments;
				rawQuery: aRelativeURI rawQuery;
				rawFragment: aRelativeURI rawFragment].
	aRelativeURI hasPort
		ifTrue: [
			^ copy
				port: aRelativeURI port;
				rawPathSegments: aRelativeURI rawPathSegments;
				rawQuery: aRelativeURI rawQuery;
				rawFragment: aRelativeURI rawFragment].
	aRelativeURI hasPath
		ifTrue: [
			^ copy
				addRawPathSegmentsFrom: aRelativeURI;
				rawQuery: aRelativeURI rawQuery;
				rawFragment: aRelativeURI rawFragment].
	aRelativeURI hasQuery
		ifTrue: [
			^ copy
				rawQuery: aRelativeURI rawQuery;
				rawFragment: aRelativeURI rawFragment].
	aRelativeURI hasFragment
		ifTrue: [^ copy rawFragment: aRelativeURI rawFragment].
]

{ #category : #copying }
XMLURI >> copyWithFragment: aString [
	^ self copy rawFragment: (self percentEncode: aString)
]

{ #category : #copying }
XMLURI >> copyWithHost: aString [
	| copy |

	copy := self copy.
	(aString size > 0
		and: [aString first == $[
			and: [aString last == $]]])
		ifTrue: [copy rawHost: aString]
		ifFalse: [copy rawHost: (self percentEncode: aString)].
	^ copy.
]

{ #category : #copying }
XMLURI >> copyWithPath: aString [
	| newRawPathSegments |

	newRawPathSegments := self rawPathSegments copyEmpty.
	$/
		xmlSplit: aString
		do: [:each |
			newRawPathSegments addLast: (self percentEncode: each)].
	^ self copy rawPathSegments: newRawPathSegments.
]

{ #category : #copying }
XMLURI >> copyWithPathSegments: aCollection [
	| newRawPathSegments |

	newRawPathSegments := self rawPathSegments copyEmpty.
	aCollection do: [:each |
		newRawPathSegments addLast: (self percentEncode: each)].
	^ self copy rawPathSegments: newRawPathSegments.
]

{ #category : #copying }
XMLURI >> copyWithPort: anInteger [
	^ self copy port: anInteger
]

{ #category : #copying }
XMLURI >> copyWithQuery: anAssociationCollection [
	| newRawQuery |

	newRawQuery := OrderedCollection new: anAssociationCollection size.
	anAssociationCollection associationsDo: [:each |
		newRawQuery addLast:
			(self percentAndPlusEncode: each key) ->
				(self percentAndPlusEncode: each value)].
	^ self copy rawQuery: newRawQuery.
]

{ #category : #copying }
XMLURI >> copyWithScheme: aString [
	^ self copy
		scheme: aString;
		hasAuthorityPrefix:
			(self hasAuthorityPrefix
				or: [self hasScheme not])
]

{ #category : #copying }
XMLURI >> copyWithUserInfo: aString [
	^ self copy rawUserInfo: (self percentEncode: aString)
]

{ #category : #private }
XMLURI >> errorCannotConvertURIToFileHandle [
	XMLFileException
		formatSignal: 'Cannot convert non-local URI to file handle: {1}'
		with: self asString
]

{ #category : #private }
XMLURI >> errorCannotConvertURIToHTTPRequest [
	XMLHTTPException
		formatSignal: 'Cannot convert URI to HTTP request: {1}'
		with: self asString
]

{ #category : #accessing }
XMLURI >> fragment [
	"Returns the percent-decoded URI fragment (everything after the '#') or
	an empty string if there isn't one"

	^ self percentDecode: self rawFragment
]

{ #category : #resolving }
XMLURI >> get [
	^ self asRetrievableResource get
]

{ #category : #resolving }
XMLURI >> getUpToLimit: aMaxSize decoding: aBoolean [
	^ self asRetrievableResource
		getUpToLimit: aMaxSize
		decoding: aBoolean
]

{ #category : #testing }
XMLURI >> hasAbsolutePath [
	^ self hasPath
		and: [self rawPathSegments first isEmpty]
]

{ #category : #testing }
XMLURI >> hasAuthority [
	^ self hasUserInfo
		or: [self hasHost
			or: [self hasPort]]
]

{ #category : #testing }
XMLURI >> hasAuthorityPrefix [
	self parseURIStringIfUnparsed.
	^ hasAuthorityPrefix.
]

{ #category : #private }
XMLURI >> hasAuthorityPrefix: aBoolean [
	hasAuthorityPrefix := aBoolean
]

{ #category : #testing }
XMLURI >> hasDirectoryPath [
	^ self hasPath
		and: [self rawPathSegments last isEmpty]
]

{ #category : #testing }
XMLURI >> hasFragment [
	^ self rawFragment notEmpty
]

{ #category : #testing }
XMLURI >> hasHost [
	^ self rawHost notEmpty
]

{ #category : #testing }
XMLURI >> hasIPv6Host [
	^ self hasHost
		and: [self rawHost first == $[
			and: [self rawHost last == $]]]
]

{ #category : #testing }
XMLURI >> hasNonDirectoryPath [
	^ self hasPath
		and: [self hasDirectoryPath not]
]

{ #category : #testing }
XMLURI >> hasPath [
	^ self rawPathSegments notEmpty
]

{ #category : #testing }
XMLURI >> hasPort [
	^ self port notNil
]

{ #category : #testing }
XMLURI >> hasQuery [
	^ self rawQuery notEmpty
]

{ #category : #testing }
XMLURI >> hasRootPath [
	^ self rawPathSegments size = 2
		and: [self rawPathSegments allSatisfy: [:each | each isEmpty]]
]

{ #category : #testing }
XMLURI >> hasScheme [
	^ self scheme notEmpty
]

{ #category : #testing }
XMLURI >> hasUserInfo [
	^ self rawUserInfo notEmpty
]

{ #category : #comparing }
XMLURI >> hash [
	"ignores user-info and ports"
	^ ((((self species hash bitXor:
		self scheme hash) bitXor:
			self host hash) bitXor:
				self pathSegments hash) bitXor:
					self query hash) bitXor:
						self fragment hash
]

{ #category : #private }
XMLURI >> haveDirectoryPath [
	self hasPath
		ifFalse: [self rawPathSegments addLast: ''].
	self rawPathSegments addLast: ''.
]

{ #category : #accessing }
XMLURI >> host [
	"Returns the percent-decoded host or IPv6-style host or an empty string
	if there isn't one"

	self hasIPv6Host
		ifTrue: [^ self rawHost]
		ifFalse: [^ (self percentDecode: self rawHost) asLowercase]
]

{ #category : #testing }
XMLURI >> isEmpty [
	self hasScheme
		ifTrue: [^ false].
	self hasAuthority
		ifTrue: [^ false].
	self hasPath
		ifTrue: [^ false].
	self hasQuery
		ifTrue: [^ false].
	self hasFragment
		ifTrue: [^ false].

	^ true.
]

{ #category : #testing }
XMLURI >> isFile [
	^ self scheme = 'file'
]

{ #category : #deprecated }
XMLURI >> isFileURI [
	self deprecated: 'use #isFile instead'.
	^ self isFile.
]

{ #category : #testing }
XMLURI >> isHTTP [
	^ self scheme = 'http'
]

{ #category : #testing }
XMLURI >> isHTTPS [
	^ self scheme = 'https'
]

{ #category : #testing }
XMLURI >> isLocal [
	^ self isFile
		or: [self isRelative
			and: [self hasHost not]]
]

{ #category : #deprecated }
XMLURI >> isLocalURI [
	self deprecated: 'use #isLocal instead'.
	^ self isLocal.
]

{ #category : #testing }
XMLURI >> isRelative [
	^ self hasScheme not
]

{ #category : #testing }
XMLURI >> notEmpty [
	^ self isEmpty not
]

{ #category : #private }
XMLURI >> parseURIStream: aStream [
	| parser |

	parser := XMLURIParser on: aStream.
	self
		scheme: parser parseScheme;
		hasAuthorityPrefix: parser parseAuthorityPrefix.
	(self hasScheme
		or: [self hasAuthorityPrefix])
		ifTrue: [
			self
				rawUserInfo: parser parseUserInfo;
				rawHost: parser parseHost;
				port: parser parsePort]
		ifFalse: [
			self
				rawUserInfo: '';
				rawHost: ''].
	self
		rawPathSegments: parser parsePathSegments;
		rawQuery: parser parseQuery;
		rawFragment: parser parseFragment.
]

{ #category : #private }
XMLURI >> parseURIStringIfUnparsed [
	scheme
		ifNil: [self parseURIStream: self uriString readStream]
]

{ #category : #accessing }
XMLURI >> path [
	"Returns the percent-decoded path as a string"

	self hasPath
		ifTrue: [| writeStream |
			writeStream := (String new: self rawPathSegments size * 10) writeStream.
			self rawPathSegments
				do: [:each | writeStream nextPutAll: (self percentDecode: each)]
				separatedBy: [writeStream nextPut: $/].
			^ writeStream contents]
		ifFalse: [^ '']
]

{ #category : #accessing }
XMLURI >> pathSegments [
	"Returns a temporary OrderedCollection of percent-decoded path segments"

	^ self rawPathSegments collect: [:each | self percentDecode: each]
]

{ #category : #enumerating }
XMLURI >> pathSegmentsDo: aBlock [
	self rawPathSegments do: [:each |
		aBlock value: (self percentDecode: each)]
]

{ #category : #private }
XMLURI >> percentAndPlusDecode: aString [
	| readStream writeStream |

	((aString includes: $%)
		or: [aString includes: $+])
		ifFalse: [^ aString].

	readStream := aString readStream.
	writeStream := (String new: aString size) writeStream.
	[readStream atEnd]
		whileFalse: [
			readStream peek == $%
				ifTrue: [
					self
						percentDecodeNextFrom: readStream
						on: writeStream]
				ifFalse: [| nextChar |
					(nextChar := readStream next) == $+
						ifTrue: [writeStream nextPut: Character space]
						ifFalse: [writeStream nextPut: nextChar]]].
	^ writeStream contents.
]

{ #category : #private }
XMLURI >> percentAndPlusEncode: aString [
	| writeStream |

	writeStream := (String new: aString size) writeStream.
	"use #to:do: for speed"
	1 to: aString size do: [:i | | nextChar |
		(UnreservedCharacters includes: (nextChar := aString at: i))
			ifTrue: [	
				nextChar asciiValue = 32 "Character space asciiValue"
					ifTrue: [writeStream nextPut: $+]
					ifFalse: [writeStream nextPut: nextChar]]
			ifFalse: [
				(XMLEncodingWriteStreamAdapter on:
					(XMLPercentEncodingWriteStreamAdapter on: writeStream))
						nextPut: nextChar]].
	^ writeStream contents.
]

{ #category : #private }
XMLURI >> percentDecode: aString [
	| readStream writeStream |

	(aString includes: $%)
		ifFalse: [^ aString].

	readStream := aString readStream.
	writeStream := (String new: aString size) writeStream.
	[readStream atEnd]
		whileFalse: [
			readStream peek == $%
				ifTrue: [
					self
						percentDecodeNextFrom: readStream
						on: writeStream]
				ifFalse: [writeStream nextPut: readStream next]].
	^ writeStream contents.
]

{ #category : #private }
XMLURI >> percentDecodeNextFrom: aReadStream on: aWriteStream [
	| readStreamAdapter |

	readStreamAdapter :=
		XMLDecodingReadStreamAdapter
			on: (XMLPercentDecodingReadStreamAdapter on: aReadStream).
	[readStreamAdapter atEnd]
		whileFalse: [aWriteStream nextPut: readStreamAdapter next].
]

{ #category : #private }
XMLURI >> percentEncode: aString [
	| writeStream |

	writeStream := (String new: aString size) writeStream.
	"use #to:do: for speed"
	1 to: aString size do: [:i | | nextChar |
		(UnreservedCharacters includes: (nextChar := aString at: i))
			ifTrue: [writeStream nextPut: nextChar]
			ifFalse: [
				(XMLEncodingWriteStreamAdapter on:
					(XMLPercentEncodingWriteStreamAdapter on: writeStream))
					nextPut: nextChar]].
	^ writeStream contents.
]

{ #category : #accessing }
XMLURI >> port [
	"Returns the integer port or nil if there isn't one"

	self parseURIStringIfUnparsed.
	^ port.
]

{ #category : #private }
XMLURI >> port: anInteger [
	port := anInteger
]

{ #category : #copying }
XMLURI >> postCopy [
	"the copyWith* methods modify copies, so any URI string of a copy must be parsed
	if it hasn't been already and then cleared because it will be obsolete after a
	URI component is changed"
	self
		parseURIStringIfUnparsed;
		uriString: nil
]

{ #category : #printing }
XMLURI >> printAuthorityOn: aStream [
	self hasAuthority
		ifTrue: [
			self
				printUserInfoOn: aStream;
				printHostOn: aStream;
				printPortOn: aStream]
]

{ #category : #printing }
XMLURI >> printAuthorityPrefixOn: aStream [
	(self hasAuthorityPrefix
		or: [self hasScheme not and: [self hasAuthority]])
		ifTrue: [aStream nextPutAll: '//']
]

{ #category : #printing }
XMLURI >> printFragmentOn: aStream [
	self hasFragment
		ifTrue: [
			aStream
				nextPut: $#;
				nextPutAll: self rawFragment]
]

{ #category : #printing }
XMLURI >> printHostOn: aStream [
	self hasHost
		ifTrue: [aStream nextPutAll: self rawHost]
]

{ #category : #printing }
XMLURI >> printOn: aStream [
	aStream nextPutAll: self asString
]

{ #category : #printing }
XMLURI >> printPathOn: aStream [
	self rawPathSegments
		do: [:each | aStream nextPutAll: each]
		separatedBy: [aStream nextPut: $/]
]

{ #category : #printing }
XMLURI >> printPathPrefixOn: aStream [
	(self hasPath
		and: [self hasAbsolutePath not
			and: [self hasScheme or: [self hasAuthority]]])
		ifTrue: [aStream nextPut: $/]
]

{ #category : #printing }
XMLURI >> printPortOn: aStream [
	self hasPort
		ifTrue: [
			aStream nextPut: $:.
			port printOn: aStream]
]

{ #category : #printing }
XMLURI >> printQueryOn: aStream [
	| atBeginning |

	self hasQuery
		ifFalse: [^ self].
	
	aStream nextPut: $?.
	atBeginning := true.
	self rawQuery do: [:each |
		atBeginning
			ifTrue: [atBeginning := false]
			ifFalse: [aStream nextPut: $&].
		aStream
			nextPutAll: each key;
			nextPut: $=;
			nextPutAll: each value].
]

{ #category : #printing }
XMLURI >> printSchemeOn: aStream [
	self hasScheme
		ifTrue: [
			aStream
				nextPutAll: self scheme;
				nextPut: $:]
]

{ #category : #printing }
XMLURI >> printUserInfoOn: aStream [
	self hasUserInfo
		ifTrue: [
			aStream
				nextPutAll: self rawUserInfo;
				nextPut: $@]
]

{ #category : #accessing }
XMLURI >> query [
	"Returns a temporary OrderedCollection of percent/plus-decoded
	query string key=value pairs"

	^ self rawQuery collect: [:each |
		(self percentAndPlusDecode: each key) ->
			(self percentAndPlusDecode: each value)]
]

{ #category : #accessing }
XMLURI >> queryAt: aKey [
	"Returns the last percent/plus-decoded value of the query string
	parameter aKey or an empty string if there isn't one"

	^ self
		queryAt: aKey
		ifAbsent: ['']
]

{ #category : #accessing }
XMLURI >> queryAt: aKey ifAbsent: aBlock [
	"Returns the first percent/plus-decoded value of the query string
	parameter aKey or the value of aBlock if there isn't one"

	self rawQuery do: [:each |
		(self percentAndPlusDecode: each key) = aKey
			ifTrue: [^ self percentAndPlusDecode: each value]].
	^ aBlock value.
]

{ #category : #testing }
XMLURI >> queryIncludesKey: aKey [
	self
		queryAt: aKey
		ifAbsent: [^ false].
	^ true.
]

{ #category : #accessing }
XMLURI >> queryKeys [
	"Returns a SequenceableCollection of the unique percent/plus-decoded
	query string parameter keys"

	| keys |

	keys := OrderedCollection new: self rawQuery size.
	self queryKeysDo: [:each |
		keys addLast: each].
	^ keys.
]

{ #category : #enumerating }
XMLURI >> queryKeysAndValuesDo: aTwoArgumentBlock [
	self rawQuery do: [:each |
		aTwoArgumentBlock
			value: (self percentAndPlusDecode: each key)
			value: (self percentAndPlusDecode: each value)]
]

{ #category : #enumerating }
XMLURI >> queryKeysDo: aBlock [
	self rawQuery do: [:each |
		aBlock value: (self percentAndPlusDecode: each key)]
]

{ #category : #accessing }
XMLURI >> queryValuesAt: aKey [
	"Returns the percent/plus-decoded values of the query string parameter
	aKey or an empty collection if there aren't any"

	^ self
		queryValuesAt: aKey
		ifAbsent: [OrderedCollection new]
]

{ #category : #enumerating }
XMLURI >> queryValuesAt: aKey do: aBlock [
	self queryKeysAndValuesDo: [:key :value |
		key = aKey
			ifTrue: [aBlock value: value]]
]

{ #category : #accessing }
XMLURI >> queryValuesAt: aKey ifAbsent: aBlock [
	"Returns the percent/plus-decoded values of the query string parameter
	aKey or the value of aBlock if there aren't any"

	| values |

	self
		queryValuesAt: aKey
		do: [:each |
			"only initialize if needed"
			(values ifNil: [values := OrderedCollection new])
				addLast: each].
	^ values ifNil: [aBlock value].
]

{ #category : #accessing }
XMLURI >> rawFragment [
	"Returns the raw URI fragment (everything after the '#') without
	percent-decoding or an empty string if there isn't one"

	self parseURIStringIfUnparsed.
	^ rawFragment.
]

{ #category : #private }
XMLURI >> rawFragment: aString [
	rawFragment := aString
]

{ #category : #accessing }
XMLURI >> rawHost [
	"Returns the raw host without percent-decoding or the IPv6-style host
	or an empty string if there isn't one"

	self parseURIStringIfUnparsed.
	^ rawHost.
]

{ #category : #private }
XMLURI >> rawHost: aString [
	rawHost := aString
]

{ #category : #accessing }
XMLURI >> rawPathSegments [
	"Returns an OrderedCollection of raw path segments without
	percent-decoding"

	self parseURIStringIfUnparsed.
	^ rawPathSegments.
]

{ #category : #private }
XMLURI >> rawPathSegments: aPathSegmentCollection [
	rawPathSegments := aPathSegmentCollection
]

{ #category : #accessing }
XMLURI >> rawQuery [
	"Returns an OrderedCollection of raw query string key=value pairs
	without percent/plus-decoding"

	self parseURIStringIfUnparsed.
	^ rawQuery.
]

{ #category : #private }
XMLURI >> rawQuery: anOrderedCollection [
	rawQuery := anOrderedCollection
]

{ #category : #accessing }
XMLURI >> rawUserInfo [
	self parseURIStringIfUnparsed.
	^ rawUserInfo.
]

{ #category : #private }
XMLURI >> rawUserInfo: aString [
	rawUserInfo := aString
]

{ #category : #private }
XMLURI >> removeLastRawPathSegment [
	^ self rawPathSegments removeLast
]

{ #category : #private }
XMLURI >> removeRawPathSegments [
	self rawPathSegments removeAll
]

{ #category : #accessing }
XMLURI >> scheme [
	"Returns the URI scheme or an empty string if there isn't one"

	self parseURIStringIfUnparsed.
	^ scheme.
]

{ #category : #private }
XMLURI >> scheme: aString [
	scheme := aString
]

{ #category : #resolving }
XMLURI >> streamGet [
	^ self asRetrievableResource streamGet
]

{ #category : #resolving }
XMLURI >> streamGetUpToLimit: aMaxSize decoding: aBoolean [
	^ self asRetrievableResource
		streamGetUpToLimit: aMaxSize
		decoding: aBoolean
]

{ #category : #private }
XMLURI >> uriString [
	^ uriString
]

{ #category : #private }
XMLURI >> uriString: aString [
	uriString := aString
]

{ #category : #accessing }
XMLURI >> userInfo [
	^ self percentDecode: self rawUserInfo
]
