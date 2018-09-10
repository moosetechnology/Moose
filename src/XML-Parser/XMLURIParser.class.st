"
This class is a parser that can extract the scheme, user info, host, port, path segments, query (as an OrderedCollection of associations), and fragment of a URI. It does not handle percent decoding and raises no errors.
"
Class {
	#name : #XMLURIParser,
	#superclass : #XMLAbstractReadStreamParser,
	#classVars : [
		'HostDelimiters',
		'PathDelimiters',
		'QueryKeyDelimiters',
		'QueryValueDelimiters',
		'SchemeDelimiters',
		'UserInfoDelimiters'
	],
	#category : #'XML-Parser-URI'
}

{ #category : #'class initialization' }
XMLURIParser class >> initialize [
	"self initialize"

	self
		initializeSchemeDelimiters;
		initializeUserInfoDelimiters;
		initializeHostDelimiters;
		initializePathDelimiters;
		initializeQueryKeyDelimiters;
		initializeQueryValueDelimiters
]

{ #category : #'class initialization' }
XMLURIParser class >> initializeHostDelimiters [
	HostDelimiters := BitmapCharacterSet newFrom: ':/?#'
]

{ #category : #'class initialization' }
XMLURIParser class >> initializePathDelimiters [
	PathDelimiters := BitmapCharacterSet newFrom: '/?#'
]

{ #category : #'class initialization' }
XMLURIParser class >> initializeQueryKeyDelimiters [
	QueryKeyDelimiters := BitmapCharacterSet newFrom: '=&#'
]

{ #category : #'class initialization' }
XMLURIParser class >> initializeQueryValueDelimiters [
	QueryValueDelimiters := BitmapCharacterSet newFrom: '&#'
]

{ #category : #'class initialization' }
XMLURIParser class >> initializeSchemeDelimiters [
	"including % disallows percent encoding in schemes"
	SchemeDelimiters := BitmapCharacterSet newFrom: ':@/?#%'
]

{ #category : #'class initialization' }
XMLURIParser class >> initializeUserInfoDelimiters [
	UserInfoDelimiters := BitmapCharacterSet newFrom: '@/?#'
]

{ #category : #parsing }
XMLURIParser >> parseAuthorityPrefix [
	| oldPosition |

	oldPosition := readStream position.
	((readStream peekFor: $/)
		and: [readStream peekFor: $/])
		ifTrue: [^ true]
		ifFalse: [
			readStream position: oldPosition.
			^ false].
]

{ #category : #parsing }
XMLURIParser >> parseFragment [
	(readStream peekFor: $#)
		ifTrue: [^ readStream upToEnd]
		ifFalse: [^ '']
]

{ #category : #parsing }
XMLURIParser >> parseHost [
	| host |

	readStream peek == $[
		ifTrue: [
			host := (self nextDelimitedBy: $]) copyWith: $].
			readStream peekFor: $]]
		ifFalse: [host := self nextDelimitedByAny: HostDelimiters].
	^ host.
]

{ #category : #parsing }
XMLURIParser >> parsePathSegments [
	| pathSegments segment |

	pathSegments := OrderedCollection new.

	segment := self nextDelimitedByAny: PathDelimiters.
	[readStream peekFor: $/]
		whileTrue: [
			pathSegments addLast: segment.
			segment := self nextDelimitedByAny: PathDelimiters].
	(pathSegments isEmpty
		and: [segment isEmpty])
		ifFalse: [pathSegments addLast: segment].

	^ pathSegments.
]

{ #category : #parsing }
XMLURIParser >> parsePort [
	| port |

	(readStream peekFor: $:)
		ifTrue: [
			"do not limit the number of chars read, because port
			number literals can have an arbitrary number of
			leading zeros"
			port :=
				XMLSmallIntegerReader
					readFrom: readStream
					withBase: 10.
			[readStream atEnd
				or: [PathDelimiters includes: readStream peek]]
				whileFalse: [readStream next]].
	^ port.
]

{ #category : #parsing }
XMLURIParser >> parseQuery [
	"parse the query as an OrderedCollection of name=value associations
	to handle multiple values for the same key and different encoded keys
	that later percent/plus decode to the same key"

	| query key value |

	(readStream peekFor: $?)
		ifFalse: [^ OrderedCollection new: 0].

	query := OrderedCollection new.
	[readStream atEnd
		or: [(key := self nextDelimitedByAny: QueryKeyDelimiters) isEmpty
			and: [readStream peek == $#]]]
		whileFalse: [| hasValue |
			(hasValue := readStream peekFor: $=)
				ifTrue: [value := self nextDelimitedByAny: QueryValueDelimiters]
				ifFalse: [value := ''].
			(key notEmpty
				or: [hasValue])
				ifTrue: [query addLast: key -> value].
			readStream peekFor: $&].

	^ query.
]

{ #category : #parsing }
XMLURIParser >> parseScheme [
	| oldPosition scheme |

	oldPosition := readStream position.
	scheme := self nextDelimitedByAny: SchemeDelimiters.
	(readStream peekFor: $:)
		ifTrue: [^ scheme asLowercase]
		ifFalse: [
			readStream position: oldPosition.
			^ ''].
]

{ #category : #parsing }
XMLURIParser >> parseUserInfo [
	| userInfo oldPosition |

	oldPosition := readStream position.
	userInfo := self nextDelimitedByAny: UserInfoDelimiters.
	(readStream peekFor: $@)
		ifTrue: [^ userInfo]
		ifFalse: [
			readStream position: oldPosition.
			^ ''].
]
