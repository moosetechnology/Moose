"
XMLWriter generates well-formed XML documents using an API similar to Seaside's canvas and tag brushes.

Markup can be created with the messages under ""writing."" The ones that take no arguments return instances of XMLMarkupWriter subclasses that can be configured with messages like #name: or #attributeAt:put:. Sending them #write or #with: (if they can have embedded markup) causes the markup writer's configuration to be committed and its markup to be written.

For markup writers that can have embedded markup, the argument to #with: can be a string, a block, a collection (of strings and blocks), or nil. A block can optionally take an argument, the XMLWriter. Creating additional markup will cause any unwritten markup from a previous markup writer to be written, as will sending #write, #contents, #printOn:, #asString, or #close.

Here is an example (evaluate with cmd-p):
	| writer |
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml;
		comment: 'an example'.
	writer tag
		name: 'example:user';
		xmlnsAt: 'example' put: 'urn://example';
		with: [
			writer
				tag: 'username' with: 'jsmith';
				tag: 'real-name' with: 'John Smith';
				tag: 'age' with: '25';
				tag: 'id' with: '101']

If the last message sent isn't a writing message like #with: or #tag:with:, you may need to send #write to force writing any unwritten markup:
	String streamContents: [:stream |
		(XMLWriter on: stream)
			tag: 'first';
			tag: 'second';
			write].

The second tag forces the first to be written, but the second wouldn't be written if #write wasn't sent.

The #writeWith: message evaluates a block and automatically sends #write after, like how #fileNamed:do: automatically sends #close after:
	String streamContents: [:stream |
		(XMLWriter  on: stream)
			writeWith: [:writer |
				writer
					tag: 'first'
					with: [writer tag: 'second'].
				writer tag: 'third']].
"
Class {
	#name : #XMLWriter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'streamStartPosition',
		'markupWriterStack',
		'formatter',
		'lineBreak',
		'contentEscapes',
		'contentStringEscapes',
		'isEscaping',
		'isCanonical',
		'outputsSelfClosingTags',
		'omitsRedundantXMLNSDeclarations',
		'hadActiveTagWriter'
	],
	#classVars : [
		'CanonicalLineBreak',
		'ContentCanonicalEscapes',
		'ContentDefaultEscapes',
		'ContentNonEntityEscapes',
		'ContentStringCanonicalEscapes',
		'ContentStringDefaultEscapes',
		'ContentStringNonEntityEscapes',
		'DefaultLineBreak',
		'EntityValueEscapes',
		'PlatformSpecificLineBreak',
		'SpaceCharacter'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLWriter class >> canonicalLineBreak [
	^ CanonicalLineBreak
]

{ #category : #accessing }
XMLWriter class >> canonicalLineBreak: aCharacterOrString [
	CanonicalLineBreak := aCharacterOrString asString
]

{ #category : #accessing }
XMLWriter class >> contentCanonicalEscapes [
	^ ContentCanonicalEscapes
]

{ #category : #accessing }
XMLWriter class >> contentDefaultEscapes [
	^ ContentDefaultEscapes
]

{ #category : #accessing }
XMLWriter class >> contentNonEntityEscapes [
	^ ContentNonEntityEscapes
]

{ #category : #accessing }
XMLWriter class >> contentStringCanonicalEscapes [
	^ ContentStringCanonicalEscapes
]

{ #category : #accessing }
XMLWriter class >> contentStringDefaultEscapes [
	^ ContentStringDefaultEscapes
]

{ #category : #accessing }
XMLWriter class >> contentStringNonEntityEscapes [
	^ ContentStringNonEntityEscapes
]

{ #category : #private }
XMLWriter class >> copyXMLExtensionMethods [
	"
	self copyXMLExtensionMethods
	"
	
	"This generates XMLWriter String and Character extension methods
	from XMLParser String and Character extension methods.
	These could be placed in a shared .mcz they would both depend on,
	but this is simpler and loads faster."
	#(isXMLNameChar isXMLNameStartChar) do: [:each |
		Character
			compile:
				'isXMLWriter',
				((Character sourceCodeAt: each) allButFirst: 'isXML' size)
			classified: #'*XML-Writer-Core'].
	#(xmlPrefixBeforeLocalName xmlLocalNameAfterPrefix:) do: [:each |
		String
			compile:
				'xmlWriter',
				((String sourceCodeAt: each) allButFirst: 'xml' size)
			classified: #'*XML-Writer-Core'].
]

{ #category : #accessing }
XMLWriter class >> defaultLineBreak [
	^ DefaultLineBreak
]

{ #category : #accessing }
XMLWriter class >> defaultLineBreak: aCharacterOrString [
	DefaultLineBreak := aCharacterOrString asString
]

{ #category : #'class initialization' }
XMLWriter class >> initialize [
	"self initialize"

	self
		initializeDefaultLineBreak;
		initializeCanonicalLineBreak;
		initializePlatformSpecificLineBreak;
		initializeContentDefaultEscapes;
		initializeContentCanonicalEscapes;
		initializeContentNonEntityEscapes;
		initializeContentStringDefaultEscapes;
		initializeContentStringCanonicalEscapes;
		initializeContentStringNonEntityEscapes;
		initializeEntityValueEscapes;
		initializeSpaceCharacter.
]

{ #category : #'class initialization' }
XMLWriter class >> initializeCanonicalLineBreak [
	self canonicalLineBreak: Character lf
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentCanonicalEscapes [
	ContentCanonicalEscapes :=
		ContentDefaultEscapes copy
			at: 16rD put: '&#xD;'; "CR"
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentDefaultEscapes [
	"use an array instead of a dictionary for speed, and
	assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	ContentDefaultEscapes :=
		(Array new: 255)
			at: $& asciiValue put: '&amp;';
			at: $< asciiValue put: '&lt;';
			at: $> asciiValue put: '&gt;'; "required to escape ]]> in PCDATA"
			at: Character cr asciiValue put: #LineBreak;
			at: Character lf asciiValue put: #LineBreak;
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentNonEntityEscapes [
	"Like ContentDefaultEscapes, but allows entity references.
	Use an array instead of a dictionary for speed, and assign
	after with #yourself to avoid possible race conditions
	when reinitializing the class."
	ContentNonEntityEscapes :=
		ContentDefaultEscapes copy
			at: $& asciiValue put: nil;
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentStringCanonicalEscapes [
	ContentStringCanonicalEscapes :=
		ContentStringDefaultEscapes copy
			at: 16r9 put: '&#x9;'; "tab"
			at: 16rA put: '&#xA;'; "lf"
			at: 16rD put: '&#xD;'; "cr"
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentStringDefaultEscapes [
	"use an array instead of a dictionary for speed, and
	assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	ContentStringDefaultEscapes :=
		(Array new: 255)
			at: $& asciiValue put: '&amp;';
			at: $< asciiValue put: '&lt;'; "< is not allowed in attr values, but > is"
			at: $" asciiValue put: '&quot;';
			at: Character cr asciiValue put: #LineBreak;
			at: Character lf asciiValue put: #LineBreak;
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeContentStringNonEntityEscapes [
	"Like ContentStringDefaultEscapes, but allows entity references.
	Use an array instead of a dictionary for speed, and assign
	after with #yourself to avoid possible race conditions
	when reinitializing the class."
	ContentStringNonEntityEscapes :=
		ContentStringDefaultEscapes copy
			at: $& asciiValue put: nil;
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializeDefaultLineBreak [
	self defaultLineBreak: Character cr
]

{ #category : #'class initialization' }
XMLWriter class >> initializeEntityValueEscapes [
	"use an array instead of a dictionary for speed, and
	assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	EntityValueEscapes :=
		(Array new: 255)
			at: $" asciiValue put: '&#34;';
			at: $% asciiValue put: '&#37;';
			at: Character cr asciiValue put: #LineBreak;
			at: Character lf asciiValue put: #LineBreak;
			yourself
]

{ #category : #'class initialization' }
XMLWriter class >> initializePlatformSpecificLineBreak [
	"'Smalltalk os platformName' is used for compatibility with GS and Squeak
	which don't have the OSPlatform classes, and also instead of the shorter
	'Smalltalk platformName' which doesn't work in all Pharos"
	(Smalltalk os platformName asLowercase beginsWith: 'win')
		ifTrue: [self platformSpecificLineBreak: String crlf]
		ifFalse: [self platformSpecificLineBreak: String lf].
]

{ #category : #'class initialization' }
XMLWriter class >> initializeSpaceCharacter [
	SpaceCharacter := Character space
]

{ #category : #'instance creation' }
XMLWriter class >> new [
	^ self on: (String new: 512) writeStream
]

{ #category : #'instance creation' }
XMLWriter class >> on: aStream [
	^ self basicNew initialize on: aStream
]

{ #category : #'instance creation' }
XMLWriter class >> on: aStream formatter: aFormatter [
	^ (self on: aStream) formatter: aFormatter
]

{ #category : #accessing }
XMLWriter class >> platformSpecificLineBreak [
	^ PlatformSpecificLineBreak
]

{ #category : #accessing }
XMLWriter class >> platformSpecificLineBreak: aCharacterOrString [
	PlatformSpecificLineBreak := aCharacterOrString asString
]

{ #category : #writing }
XMLWriter class >> writeWith: aBlock [
	^ self new
		writeWith: aBlock;
		contents
]

{ #category : #writing }
XMLWriter >> % aParameterEntityReference [
	self paramEntityRef: aParameterEntityReference
]

{ #category : #writing }
XMLWriter >> & anEntityReference [
	self entityRef: anEntityReference
]

{ #category : #accessing }
XMLWriter >> activeMarkupWriter [
	| markupWriterStackSize |

	"optimized to avoid at:ifAbsent:/ifNotEmpty: closure"
	^ (markupWriterStackSize := markupWriterStack size) > 0
		ifTrue: [markupWriterStack at: markupWriterStackSize]
		ifFalse: [nil]
]

{ #category : #enumerating }
XMLWriter >> activeMarkupWriterAncestorsDo: aBlock [
	self markupWriterStack size - 1 to: 1 by: -1 do: [:i |
		 aBlock value: (self markupWriterStack at: i)]
]

{ #category : #accessing }
XMLWriter >> activeMarkupWriterParent [
	| markupWriterStackSize |

	(markupWriterStackSize := self markupWriterStack size) >= 2
		ifTrue: [^ self markupWriterStack at: markupWriterStackSize - 1]
		ifFalse: [^ nil]
]

{ #category : #private }
XMLWriter >> activeMarkupWriterWhileChangingDo: aBlock [
	"evaluate aBlock for the active (top) markup writer until there isn't
	one or it's the same (still active) writer after evaluating aBlock"

	| markupWriterStackSize activeMarkupWriter previousActiveMarkupWriter |

	"inlined from activeMarkupWriter for speed"
	[(markupWriterStackSize := markupWriterStack size) = 0
		or: [
			(activeMarkupWriter := markupWriterStack at: markupWriterStackSize) ==
				previousActiveMarkupWriter]]
		whileFalse: [
			aBlock value: activeMarkupWriter.
			previousActiveMarkupWriter := activeMarkupWriter]
]

{ #category : #enumerating }
XMLWriter >> activeMarkupWriterWithAncestorsDo: aBlock [
	self markupWriterStack reverseDo: aBlock
]

{ #category : #accessing }
XMLWriter >> activeTagWriter [
	self activeMarkupWriterWithAncestorsDo: [:each |
		each isTagWriter
			ifTrue: [^ each]].
	^ nil.
]

{ #category : #private }
XMLWriter >> ancestorsOfMarkupWriter: aMarkupWriter do: aBlock [
	| enumeratingAncestors |

	enumeratingAncestors := false.
	self markupWriterStack size to: 1 by: -1 do: [:i |
		enumeratingAncestors
			ifTrue: [aBlock value: (self markupWriterStack at: i)]
			ifFalse: [
				enumeratingAncestors :=
					(self markupWriterStack at: i) == aMarkupWriter]].
]

{ #category : #converting }
XMLWriter >> asString [
	"returns the full, untruncated output, unlike #printString, which may
	truncate"

	^ self contents
]

{ #category : #testing }
XMLWriter >> atBeginning [
	"On GS streams can be 0-based or 1-based, so saving the initial position
	to test the current position works for both types and also handles streams
	that were already written to when the XMLWriter was created"

	^ stream position = streamStartPosition
]

{ #category : #writing }
XMLWriter >> attributeDeclaration [
	^ self pushNewMarkupWriter: XMLAttributeDeclarationWriter
]

{ #category : #defaults }
XMLWriter >> canonicalLineBreak [
	^ CanonicalLineBreak
]

{ #category : #defaults }
XMLWriter >> canonicalWriterFormatterClass [
	^ XMLCanonicalWriterFormatter
]

{ #category : #writing }
XMLWriter >> cdata [
	^ self pushNewMarkupWriter: XMLCDataWriter
]

{ #category : #writing }
XMLWriter >> cdata: aString [
	self cdata
		string: aString;
		write
]

{ #category : #closing }
XMLWriter >> close [
	self write.
	stream close.
]

{ #category : #writing }
XMLWriter >> comment [
	^ self pushNewMarkupWriter: XMLCommentWriter
]

{ #category : #writing }
XMLWriter >> comment: aString [
	self comment
		string: aString;
		write
]

{ #category : #defaults }
XMLWriter >> contentCanonicalEscapes [
	^ ContentCanonicalEscapes
]

{ #category : #defaults }
XMLWriter >> contentDefaultEscapes [
	^ ContentDefaultEscapes
]

{ #category : #private }
XMLWriter >> contentEscapes [
	^ contentEscapes
]

{ #category : #private }
XMLWriter >> contentEscapes: aContentEscapesTable [
	contentEscapes := aContentEscapesTable
]

{ #category : #defaults }
XMLWriter >> contentNonEntityEscapes [
	^ ContentNonEntityEscapes
]

{ #category : #defaults }
XMLWriter >> contentStringCanonicalEscapes [
	^ ContentStringCanonicalEscapes
]

{ #category : #defaults }
XMLWriter >> contentStringDefaultEscapes [
	^ ContentStringDefaultEscapes
]

{ #category : #private }
XMLWriter >> contentStringEscapes [
	^ contentStringEscapes
]

{ #category : #private }
XMLWriter >> contentStringEscapes: aContentStringEscapesTable [
	contentStringEscapes := aContentStringEscapesTable
]

{ #category : #defaults }
XMLWriter >> contentStringNonEntityEscapes [
	^ ContentStringNonEntityEscapes
]

{ #category : #accessing }
XMLWriter >> contents [
	"returns the full, untruncated output, unlike #printString, which may
	truncate"

	self write.
	^ stream contents.
]

{ #category : #defaults }
XMLWriter >> defaultLineBreak [
	^ DefaultLineBreak
]

{ #category : #writing }
XMLWriter >> doctype [
	"an abbreviation"

	^ self doctypeDeclaration
]

{ #category : #writing }
XMLWriter >> doctypeDeclaration [
	^ self pushNewMarkupWriter: XMLDoctypeDeclarationWriter
]

{ #category : #writing }
XMLWriter >> elementDeclaration [
	^ self pushNewMarkupWriter: XMLElementDeclarationWriter
]

{ #category : #writing }
XMLWriter >> enablePlatformSpecificLineBreak [
	"use the correct line break (LF or CRLF) for this platform when writing"

	self lineBreak: self platformSpecificLineBreak
]

{ #category : #writing }
XMLWriter >> enablePrettyPrinting [
	"enables 'pretty printing' whitespace formatting to make nicer output"

	self formatter: self prettyPrintingWriterFormatterClass new
]

{ #category : #writing }
XMLWriter >> enablePrologPrettyPrinting [
	"enables 'pretty printing' whitespace formatting, but only for the prolog"

	self formatter: self prologPrettyPrintingWriterFormatterClass new
]

{ #category : #'writing - unsafe' }
XMLWriter >> endTag [
	"Returns a new XMLUnsafeEndTagWriter for writing an end tag to close an element
	started by a #startTag* message.

	Use the #tag* messages instead if possible."

	^ self pushNewMarkupWriter: XMLUnsafeEndTagWriter
]

{ #category : #'writing - unsafe' }
XMLWriter >> endTag: aName [
	"Returns a new XMLUnsafeEndTagWriter for writing an end tag with the specified
	name to close an element started by a #startTag* message.

	Use the #tag* messages instead if possible."

	^ self endTag name: aName
]

{ #category : #writing }
XMLWriter >> entityDeclaration [
	^ self pushNewMarkupWriter: XMLEntityDeclarationWriter
]

{ #category : #writing }
XMLWriter >> entityRef [
	^ self pushNewMarkupWriter: XMLEntityReferenceWriter
]

{ #category : #writing }
XMLWriter >> entityRef: aName [
	"output a general entity reference like &name;"

	self entityRef
		name: aName;
		write
]

{ #category : #defaults }
XMLWriter >> entityValueEscapes [
	^ EntityValueEscapes
]

{ #category : #testing }
XMLWriter >> escapesContentEntityReferences [
	^ self isEscaping
		and: [(contentEscapes at: $& asciiValue) notNil
			and: [(contentStringEscapes at: $& asciiValue) notNil]]
]

{ #category : #accessing }
XMLWriter >> escapesContentEntityReferences: aBoolean [
	self escapesContentEntityReferences = aBoolean
		ifTrue: [^ self].
	aBoolean
		ifTrue: [
			self
				isEscaping: true;
				contentEscapes: self contentDefaultEscapes;
				contentStringEscapes: self contentStringDefaultEscapes]
		ifFalse: [
			self
				contentEscapes: self contentNonEntityEscapes;
				contentStringEscapes: self contentStringNonEntityEscapes]
]

{ #category : #formatting }
XMLWriter >> formatAfterCData: aCDataWriter [
	formatter
		ifNotNil: [formatter formatAfterCData: aCDataWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterComment: aCommentWriter [
	formatter
		ifNotNil: [formatter formatAfterComment: aCommentWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterDeclaration: aDeclarationWriter [
	formatter
		ifNotNil: [formatter formatAfterDeclaration: aDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
	formatter
		ifNotNil: [formatter formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterEndTag: aTagWriter [
	formatter
		ifNotNil: [formatter formatAfterEndTag: aTagWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterEntityReference: anEntityReferenceWriter [
	formatter
		ifNotNil: [formatter formatAfterEntityReference: anEntityReferenceWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterInternalSubset: aDoctypeDeclarationWriter [
	formatter
		ifNotNil: [formatter formatAfterInternalSubset: aDoctypeDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterPI: aPIWriter [
	formatter
		ifNotNil: [formatter formatAfterPI: aPIWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterStartTag: aTagWriter [
	formatter
		ifNotNil: [formatter formatAfterStartTag: aTagWriter]
]

{ #category : #formatting }
XMLWriter >> formatAfterXMLDeclaration: anXMLDeclarationWriter [
	formatter
		ifNotNil: [formatter formatAfterXMLDeclaration: anXMLDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeCData: aCDataWriter [
	formatter
		ifNotNil: [formatter formatBeforeCData: aCDataWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeComment: aCommentWriter [
	formatter
		ifNotNil: [formatter formatBeforeComment: aCommentWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeDeclaration: aDeclarationWriter [
	formatter
		ifNotNil: [formatter formatBeforeDeclaration: aDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
	formatter
		ifNotNil: [formatter formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeEndTag: aTagWriter [
	formatter
		ifNotNil: [formatter formatBeforeEndTag: aTagWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeEntityReference: anEntityReferenceWriter [
	formatter
		ifNotNil: [formatter formatBeforeEntityReference: anEntityReferenceWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeInternalSubset: aDoctypeDeclarationWriter [
	formatter
		ifNotNil: [formatter formatBeforeInternalSubset: aDoctypeDeclarationWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforePI: aPIWriter [
	formatter
		ifNotNil: [formatter formatBeforePI: aPIWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeStartTag: aTagWriter [
	formatter
		ifNotNil: [formatter formatBeforeStartTag: aTagWriter]
]

{ #category : #formatting }
XMLWriter >> formatBeforeXMLDeclaration: anXMLDeclarationWriter [
	formatter
		ifNotNil: [formatter formatBeforeXMLDeclaration: anXMLDeclarationWriter]
]

{ #category : #accessing }
XMLWriter >> formatter [
	^ formatter
]

{ #category : #accessing }
XMLWriter >> formatter: aFormatter [
	(formatter := aFormatter)
		ifNotNil: [formatter writer: self]
]

{ #category : #testing }
XMLWriter >> hadActiveTagWriter [
	^ hadActiveTagWriter
]

{ #category : #testing }
XMLWriter >> hasActiveTagWriter [
	^ self activeTagWriter notNil
]

{ #category : #testing }
XMLWriter >> hasFormatter [
	^ formatter notNil
]

{ #category : #testing }
XMLWriter >> isCanonical [
	^ isCanonical
]

{ #category : #accessing }
XMLWriter >> isCanonical: aBoolean [
	"Should the output be canonical XML (http://www.w3.org/TR/xml-c14n)?
	(Not default)"

	self isCanonical = aBoolean
		ifTrue: [^ self].
	(isCanonical := aBoolean)
		ifTrue: [
			self
				formatter: self canonicalWriterFormatterClass new;
				lineBreak: self canonicalLineBreak;
				contentEscapes: self contentCanonicalEscapes;
				contentStringEscapes: self contentStringCanonicalEscapes;
				isEscaping: true;
				omitsRedundantXMLNSDeclarations: true]
		ifFalse: [
			self
				formatter: nil;
				lineBreak: self defaultLineBreak;
				contentEscapes: self contentDefaultEscapes;
				contentStringEscapes: self contentStringDefaultEscapes]
]

{ #category : #testing }
XMLWriter >> isEscaping [
	^ isEscaping
]

{ #category : #accessing }
XMLWriter >> isEscaping: aBoolean [
	"can be used to disable escaping of special characters and the
	replacement of CRs/LFs in attribute/entity values and strings
	with whatever #lineBreak is set to"

	isEscaping := aBoolean
]

{ #category : #private }
XMLWriter >> isRedundantActiveTagWriterXMLNSPrefix: aPrefix uri: aURI [
	self activeMarkupWriterAncestorsDo: [:each |
		(each isTagWriter
			and: [each hasXMLNSDeclarations])
			ifTrue: [
				each xmlnsDeclarations
					at: aPrefix
					ifPresent: [:uri | ^ uri = aURI]]].
	
	"declarations to reset the default namespace (like xmlns='') are
	considered redundant when there's no previous default namespace
	declaration being reset"
	^ aPrefix size = 0
		and: [aURI size = 0].
]

{ #category : #accessing }
XMLWriter >> lineBreak [
	^ lineBreak
]

{ #category : #accessing }
XMLWriter >> lineBreak: aCharacterOrString [
	"linebreak chars (CR/LF) in attribute/entity values and in args to
	the #string: and #with: messages are replaced with whatever char/string
	this is set to"

	lineBreak := aCharacterOrString asString
]

{ #category : #private }
XMLWriter >> markupWriterStack [
	^ markupWriterStack
]

{ #category : #private }
XMLWriter >> newStringMarkup [
	self activeMarkupWriterWhileChangingDo: [:each |
		each newStringMarkupBeingWritten]
]

{ #category : #private }
XMLWriter >> nextPut: aCharacter [
	^ stream nextPut: aCharacter
]

{ #category : #private }
XMLWriter >> nextPutAll: aString [
	^ stream nextPutAll: aString
]

{ #category : #writing }
XMLWriter >> notationDeclaration [
	^ self pushNewMarkupWriter: XMLNotationDeclarationWriter
]

{ #category : #testing }
XMLWriter >> omitsRedundantXMLNSDeclarations [
	^ omitsRedundantXMLNSDeclarations
]

{ #category : #accessing }
XMLWriter >> omitsRedundantXMLNSDeclarations: aBoolean [
	omitsRedundantXMLNSDeclarations := aBoolean
]

{ #category : #initialization }
XMLWriter >> on: aStream [
	stream := aStream.
	streamStartPosition := aStream position.
	markupWriterStack := OrderedCollection new.
	lineBreak := self defaultLineBreak.
	contentEscapes := self contentDefaultEscapes.
	contentStringEscapes := self contentStringDefaultEscapes.
	isEscaping := true.
	isCanonical := false.
	outputsSelfClosingTags := true.
	omitsRedundantXMLNSDeclarations := true.
	hadActiveTagWriter := false.
]

{ #category : #testing }
XMLWriter >> outputsSelfClosingTags [
	^ outputsSelfClosingTags
]

{ #category : #accessing }
XMLWriter >> outputsSelfClosingTags: aBoolean [
	"can be used to disable outputting empty elements as '<empty/>'
	instead of '<empty></empty>'"

	outputsSelfClosingTags := aBoolean
]

{ #category : #writing }
XMLWriter >> paramEntityRef [
	^ (self pushNewMarkupWriter: XMLEntityReferenceWriter) isParameter: true
]

{ #category : #writing }
XMLWriter >> paramEntityRef: aName [
	"output a parameter entity reference like %name;"

	self paramEntityRef
		name: aName;
		write
]

{ #category : #private }
XMLWriter >> parentOfMarkupWriter: aMarkupWriter [
	self markupWriterStack size to: 2 by: -1 do: [:i |
		(self markupWriterStack at: i) == aMarkupWriter
			ifTrue: [^ self markupWriterStack at: i - 1]].
	^ nil.
]

{ #category : #deprecated }
XMLWriter >> pcdata: aString [
	self deprecated: 'use #string: instead'.
	self string: aString.
]

{ #category : #writing }
XMLWriter >> pi [
	"returns a new processing instruction writer for writing"

	^ self pushNewMarkupWriter: XMLPIWriter
]

{ #category : #defaults }
XMLWriter >> platformSpecificLineBreak [
	^ PlatformSpecificLineBreak
]

{ #category : #private }
XMLWriter >> popActiveMarkupWriter [
	^ self markupWriterStack removeLast
]

{ #category : #accessing }
XMLWriter >> position [
	^ stream position
]

{ #category : #defaults }
XMLWriter >> prettyPrintingWriterFormatterClass [
	^ XMLPrettyPrintingWriterFormatter
]

{ #category : #printing }
XMLWriter >> printOn: aStream [
	aStream nextPutAll: self contents
]

{ #category : #defaults }
XMLWriter >> prologPrettyPrintingWriterFormatterClass [
	^ XMLPrologPrettyPrintingWriterFormatter
]

{ #category : #private }
XMLWriter >> pushNewMarkupWriter: aMarkupWriterClass [
	| newMarkupWriter |

	self activeMarkupWriterWhileChangingDo: [:each |
		each newMarkupWriterBeingPushed].
	newMarkupWriter :=
		self markupWriterStack addLast:
			(aMarkupWriterClass writer: self).
	hadActiveTagWriter
		ifFalse: [hadActiveTagWriter := newMarkupWriter isTagWriter].
	^ newMarkupWriter.
]

{ #category : #'writing - unsafe' }
XMLWriter >> raw: aString [
	"writes raw string content without doing any escaping of special
	characters, unlike #string:"

	aString size > 0
		ifTrue: [
			self
				newStringMarkup;
				nextPutAll: aString]
]

{ #category : #private }
XMLWriter >> resolveActiveTagWriterAttributePrefix: aPrefix [
	"attributes with empty prefixes have no namespace, not even the
	default, unlike elements"
	aPrefix size > 0 "optimization"
		ifTrue: [
			(aPrefix at: 1) == $x "optimization"
				ifTrue: [
					aPrefix = 'xml'
						ifTrue: [^ self xmlNamespaceURI].
					"this prefix shouldn't be used for attributes, but we
					resolve it anyway"
					aPrefix = 'xmlns'
						ifTrue: [^ self xmlnsNamespaceURI]].

			self activeMarkupWriterWithAncestorsDo: [:each |
				(each isTagWriter
					and: [each hasXMLNSDeclarations])
					ifTrue: [
						each xmlnsDeclarations
							at: aPrefix
							ifPresent: [:uri | ^ uri]]]].

	^ ''.
]

{ #category : #private }
XMLWriter >> space [
	"redefined for speed and portability"
	stream nextPut: SpaceCharacter
]

{ #category : #'writing - unsafe' }
XMLWriter >> startTag [
	"Returns a new XMLUnsafeStartTagWriter for writing a start tag that does
	not support embedding or automatic end tag generation.

	Use the #tag* messages instead if possible."

	^ self pushNewMarkupWriter: XMLUnsafeStartTagWriter
]

{ #category : #'writing - unsafe' }
XMLWriter >> startTag: aName [
	"Returns a new XMLUnsafeStartTagWriter for writing a start tag with the
	specified name that does not support embedding or automatic end tag generation.

	Use the #tag* messages instead if possible."

	^ self startTag name: aName
]

{ #category : #'writing - unsafe' }
XMLWriter >> startTag: aName attributes: aDictionaryOrArray [
	"Returns a new XMLUnsafeStartTagWriter for writing a start tag with the
	specified name and attributes that does not support embedding or automatic
	end tag generation.
	
	Use the #tag* messages instead if possible."

	^ (self startTag: aName)
		attributes: aDictionaryOrArray
]

{ #category : #private }
XMLWriter >> stream [
	^ stream
]

{ #category : #private }
XMLWriter >> stream: aStream [
	self on: aStream
]

{ #category : #writing }
XMLWriter >> string: aString [
	"writes string content while '&'-escaping any special characters"

	aString size > 0
		ifTrue: [
			self
				newStringMarkup;
				writeEscapedContent: aString]
]

{ #category : #writing }
XMLWriter >> tag [
	"returns a new XMLTagWriter for writing an element that supports embedding
	markup using #with: and automatic end tag generation"

	^ self pushNewMarkupWriter: XMLTagWriter
]

{ #category : #writing }
XMLWriter >> tag: aName [
	"returns a new XMLTagWriter for writing an element with the specified name
	that supports embedding markup using #with: and automatic end tag generation"

	^ self tag name: aName
]

{ #category : #writing }
XMLWriter >> tag: aName attributes: aDictionaryOrArray [
	"returns a new XMLTagWriter for writing an element with the specified name and
	attributes that supports embedding markup using #with: and automatic end tag
	generation"

	^ (self tag: aName)
		attributes: aDictionaryOrArray
]

{ #category : #writing }
XMLWriter >> tag: aName attributes: aDictionaryOrArray with: aStringOrCollectionOrBlock [
	"writes an element with the specified name, attributes, and embedded markup"

	^ (self tag: aName)
		attributes: aDictionaryOrArray;
		with: aStringOrCollectionOrBlock
]

{ #category : #writing }
XMLWriter >> tag: aName with: aStringOrCollectionOrBlock [
	"writes an element with the specified name and embedded markup"

	^ (self tag: aName) with: aStringOrCollectionOrBlock
]

{ #category : #writing }
XMLWriter >> write [
	"writes any unwritten markup, including any markup writer that hasn't
	been written yet"

	self activeMarkupWriterWhileChangingDo: [:each |
		each hasStartedWriting
			ifFalse: [each write]]
]

{ #category : #private }
XMLWriter >> write: aString escapedWith: anEscapeTable [
	| tableSize |

	tableSize := anEscapeTable size.
	"to:do: for performance"
	1 to: aString size do: [:i | | nextChar asciiValue |
		((asciiValue := (nextChar := aString at: i) asciiValue) > 0
			and: [asciiValue <= tableSize
				and: [(anEscapeTable at: asciiValue) notNil]])
			ifTrue: [| replacement |
				(replacement := anEscapeTable at: asciiValue) == #LineBreak
					ifTrue: [stream nextPutAll: self lineBreak]
					ifFalse: [
						formatter
							ifNil: [stream nextPutAll: replacement]
							ifNotNil: [
								formatter formatBeforeCharacterEscape:
									replacement.
								stream nextPutAll: replacement.
								formatter formatAfterCharacterEscape:
									replacement]]]
			ifFalse: [stream nextPut: nextChar]].
]

{ #category : #private }
XMLWriter >> writeAttributeName: aName unescapedValue: aValue [
	self
		space;
		writeStringName: aName;
		nextPut: $=;
		writeUnescapedString: aValue
]

{ #category : #private }
XMLWriter >> writeAttributeName: aName value: aValue [
	self
		space;
		writeStringName: aName;
		nextPut: $=;
		writeEscapedContentString: aValue
]

{ #category : #private }
XMLWriter >> writeAttributes: anAttributeCollection [
	self isCanonical
		ifTrue: [anAttributeCollection writeCanonicalAttributesOn: self]
		ifFalse: [anAttributeCollection writeAttributesOn: self]
]

{ #category : #private }
XMLWriter >> writeEscapedContent: aString [
	self isEscaping
		ifTrue: [
			self
				write: aString
				escapedWith: contentEscapes]
		ifFalse: [stream nextPutAll: aString]
]

{ #category : #private }
XMLWriter >> writeEscapedContentString: aString [
	stream nextPut: $".
	formatter
		ifNotNil: [formatter formatBeforeQuotedStringValue: aString].
	self isEscaping
		ifTrue: [
			self
				write: aString
				escapedWith: contentStringEscapes]
		ifFalse: [stream nextPutAll: aString].
	formatter
		ifNotNil: [formatter formatAfterQuotedStringValue: aString].
	stream nextPut: $".
]

{ #category : #private }
XMLWriter >> writeEscapedEntityString: aString [
	stream nextPut: $".
	formatter
		ifNotNil: [formatter formatBeforeQuotedStringValue: aString].
	self isEscaping
		ifTrue: [
			self
				write: aString
				escapedWith: self entityValueEscapes]
		ifFalse: [stream nextPutAll: aString].
	formatter
		ifNotNil: [formatter formatAfterQuotedStringValue: aString].
	stream nextPut: $".
]

{ #category : #private }
XMLWriter >> writeName: aName [
	formatter
		ifNil: [stream nextPutAll: aName]
		ifNotNil: [
			formatter formatBeforeName: aName.
			stream nextPutAll: aName.
			formatter formatAfterName: aName]
]

{ #category : #private }
XMLWriter >> writeStringName: aName [
	formatter
		ifNil: [stream nextPutAll: aName]
		ifNotNil: [
			formatter formatBeforeQuotedStringName: aName.
			stream nextPutAll: aName.
			formatter formatAfterQuotedStringName: aName]
]

{ #category : #private }
XMLWriter >> writeUnescapedString: aString [
	self
		writeUnescapedString: aString
		quotedBy:
			((aString includes: $")
				ifTrue: [$']
				ifFalse: [$"])
]

{ #category : #private }
XMLWriter >> writeUnescapedString: aString quotedBy: aQuote [
	stream nextPut: aQuote.
	formatter
		ifNotNil: [
			formatter formatBeforeQuotedStringValue: aString].
	1 to: aString size do: [:i | | nextChar |
		"delimiters are skipped because they can't be escaped here"
		(nextChar := aString at: i) == aQuote
			ifFalse: [stream nextPut: nextChar]].
	formatter
		ifNotNil: [
			formatter formatAfterQuotedStringValue: aString].
	stream nextPut: aQuote.
]

{ #category : #private }
XMLWriter >> writeUnwrittenMarkupWritersEmbeddedIn: aMarkupWriter [
	self activeMarkupWriterWhileChangingDo: [:each |
		each == aMarkupWriter
			ifTrue: [^ self].
		each hasStartedWriting
			ifFalse: [each write]]
]

{ #category : #writing }
XMLWriter >> writeWith: aBlock [
	"evaluates aBlock with the receiver as an optional argument and
	automatically sends #write after"

	aBlock cull: self.
	self write.
]

{ #category : #private }
XMLWriter >> writeXMLNS: aPrefix [
	self writeStringName:
		(aPrefix isEmpty
			ifTrue: ['xmlns']
			ifFalse: ['xmlns:', aPrefix])
]

{ #category : #private }
XMLWriter >> writeXMLNS: aPrefix uri: aURI [
	(self omitsRedundantXMLNSDeclarations
		and: [
			self
				isRedundantActiveTagWriterXMLNSPrefix: aPrefix
				uri: aURI])
		ifFalse: [
			self
				space;
				writeXMLNS: aPrefix;
				nextPut: $=;
				writeEscapedContentString: aURI]
]

{ #category : #private }
XMLWriter >> writeXMLNSDeclarations: aDictionary [
	self isCanonical
		ifTrue: [
			aDictionary keys
				sort;
				do: [:each |
					self
						writeXMLNS: each
						uri: (aDictionary at: each)]]
		ifFalse: [
			aDictionary keysDo: [:each |
				self
					writeXMLNS: each
					uri: (aDictionary at: each)]]
]

{ #category : #writing }
XMLWriter >> xml [
	"an abbreviation"

	^ self xmlDeclaration
]

{ #category : #writing }
XMLWriter >> xmlDeclaration [
	^ self pushNewMarkupWriter: XMLXMLDeclarationWriter
]

{ #category : #defaults }
XMLWriter >> xmlNamespaceURI [
	^ 'http://www.w3.org/XML/1998/namespace'
]

{ #category : #defaults }
XMLWriter >> xmlnsNamespaceURI [
	^ 'http://www.w3.org/2000/xmlns/'
]
