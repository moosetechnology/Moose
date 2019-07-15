"
A simple test case class. 
Please add more tests to it!
"
Class {
	#name : #XMLWriterTest,
	#superclass : #TestCase,
	#category : #'XML-Writer-Tests'
}

{ #category : #private }
XMLWriterTest class >> onCanonicalLineBreakJoin: aLineCollection [
	^ self
		onLineBreak: XMLWriter canonicalLineBreak
		join: aLineCollection
]

{ #category : #private }
XMLWriterTest class >> onLineBreak: aCharacterOrString join: aLineCollection [
	| printedFirstLine |

	"avoid join: for portability"
	printedFirstLine := false.
	^ String streamContents: [:stream |
		aLineCollection do: [:each |
			printedFirstLine
				ifTrue: [stream nextPutAll: aCharacterOrString asString]
				ifFalse: [printedFirstLine := true].
			stream nextPutAll: each]]
]

{ #category : #private }
XMLWriterTest >> onCanonicalLineBreakJoin: aLineCollection [
	^ self class onCanonicalLineBreakJoin: aLineCollection
]

{ #category : #private }
XMLWriterTest >> onLineBreak: aCharacterOrString join: aLineCollection [
	^ self class
		onLineBreak: aCharacterOrString
		join: aLineCollection
]

{ #category : #private }
XMLWriterTest >> prettyPrintedLines: anArrayOfLineArrays [
	"takes an array of arrays where the first element of each is the indent level
	and the rest are the lines with that indent level"

	| printedFirstLine |

	printedFirstLine := false.
	^ String streamContents: [:stream |
		anArrayOfLineArrays do: [:each | | indentLevel |
			indentLevel := XMLPrettyPrintingWriterFormatter defaultIndentLevel + each first.
			2 to: each size do: [:lineIndex |
				printedFirstLine
					ifTrue: [
						stream nextPutAll: XMLWriter defaultLineBreak.
						indentLevel timesRepeat: [
							stream nextPutAll:
								XMLPrettyPrintingWriterFormatter defaultIndentString]]
					ifFalse: [printedFirstLine := true].
				stream nextPutAll: (each at: lineIndex)]]]
]

{ #category : #asserting }
XMLWriterTest >> should: aBlock enumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated add: each].
	self assert: enumerated = aCollection asOrderedCollection.
]

{ #category : #tests }
XMLWriterTest >> testActiveMarkupWriterAncestorsDo [
	| writer enumerated oneTagWriter twoTagWriter threeTagWriter |

	writer := XMLWriter new.
	enumerated := OrderedCollection new.
	self
		should: [:block | writer activeMarkupWriterAncestorsDo: block]
		enumerate: enumerated.

	writer xml.
	self
		should: [:block | writer activeMarkupWriterAncestorsDo: block]
		enumerate: enumerated.

	oneTagWriter := writer tag: 'one'.
	self
		should: [:block | writer activeMarkupWriterAncestorsDo: block]
		enumerate: enumerated.

	oneTagWriter with: [
		twoTagWriter := writer tag: 'two'.
		enumerated addFirst: oneTagWriter.
		self
			should: [:block | writer activeMarkupWriterAncestorsDo: block]
			enumerate: enumerated.

		twoTagWriter with: [
			threeTagWriter := writer tag: 'three'.
			enumerated addFirst: twoTagWriter.
			self
				should: [:block | writer activeMarkupWriterAncestorsDo: block]
				enumerate: enumerated.
			
			threeTagWriter write.
			enumerated removeFirst.
			self
				should: [:block | writer activeMarkupWriterAncestorsDo: block]
				enumerate: enumerated]].

	enumerated removeFirst.
	self
		should: [:block | writer activeMarkupWriterAncestorsDo: block]
		enumerate: enumerated.
]

{ #category : #tests }
XMLWriterTest >> testActiveMarkupWriterParent [
	| writer xmlDeclarationWriter tagWriter |

	writer := XMLWriter new.
	self assert: writer activeMarkupWriterParent isNil.
	xmlDeclarationWriter := writer xml.
	self
		assert: writer activeMarkupWriterParent isNil;
		assert: xmlDeclarationWriter parent isNil;
		assert: (writer parentOfMarkupWriter: xmlDeclarationWriter) isNil.

	tagWriter := writer tag: 'one'.
	self
		assert: writer activeMarkupWriterParent isNil;
		assert: tagWriter parent isNil;
		assert: (writer parentOfMarkupWriter: tagWriter) isNil.

	tagWriter with: [| newTagWriter |
		newTagWriter := writer tag: 'two'.
		self
			assert: writer activeMarkupWriterParent == tagWriter;
			assert: newTagWriter parent == tagWriter;
			assert: (writer parentOfMarkupWriter: newTagWriter) == tagWriter].

	self
		assert: writer activeMarkupWriterParent isNil;
		assert: tagWriter parent isNil;
		assert: (writer parentOfMarkupWriter: tagWriter) isNil.
]

{ #category : #tests }
XMLWriterTest >> testActiveMarkupWriterWithAncestorsDo [
	| writer enumerated oneTagWriter twoTagWriter threeTagWriter |

	writer := XMLWriter new.
	enumerated := OrderedCollection new.
	self
		should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
		enumerate: enumerated.

	enumerated addFirst: writer xml.
	self
		should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
		enumerate: enumerated.

	oneTagWriter := writer tag: 'one'.
	enumerated
		removeFirst;
		addFirst: oneTagWriter.
	self
		should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
		enumerate: enumerated.

	oneTagWriter with: [
		twoTagWriter := writer tag: 'two'.
		enumerated addFirst: twoTagWriter.
		self
			should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
			enumerate: enumerated.

		twoTagWriter with: [
			threeTagWriter := writer tag: 'three'.
			enumerated addFirst: threeTagWriter.
			self
				should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
				enumerate: enumerated.
			
			threeTagWriter write.
			enumerated removeFirst.
			self
				should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
				enumerate: enumerated].

		enumerated removeFirst.
		self
			should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
			enumerate: enumerated].

	enumerated removeFirst.
	self
		should: [:block | writer activeMarkupWriterWithAncestorsDo: block]
		enumerate: enumerated.
]

{ #category : #tests }
XMLWriterTest >> testActiveTagWriter [
	| writer tagWriter |

	writer := XMLWriter new.
	self assert: writer activeTagWriter isNil.
	writer xml.
	self assert: writer activeTagWriter isNil.

	tagWriter := writer tag: 'one'.
	self assert: writer activeTagWriter == tagWriter.

	tagWriter with: [| newTagWriter |
		self assert: writer activeTagWriter == tagWriter.

		newTagWriter := writer startTag: 'three'.
		self assert: writer activeTagWriter == newTagWriter.
		newTagWriter write.
		self assert: writer activeTagWriter == tagWriter.
	
		newTagWriter := writer endTag: 'three'.
		self assert: writer activeTagWriter == newTagWriter.
		newTagWriter write.
		self assert: writer activeTagWriter == tagWriter].

	self assert: writer activeTagWriter isNil.
]

{ #category : #tests }
XMLWriterTest >> testAsString [
	self assert:
		(XMLWriter new
			tag: 'one';
			tag: 'two';
			asString) = '<one/><two/>'.
	self assert:
		(XMLWriter new
			tag: 'one';
			tag: 'two') asString = '<one/><two/>'.
]

{ #category : #tests }
XMLWriterTest >> testAtBeginning [
	"on GS #writeStream gives an ANSI 0-based position stream,
	but WriteStream on: doesn't, so both are tested, and we
	test to make sure anything written before creating the
	writer is ignored by atBeginning"

	(Array
		with: String new writeStream
		with: (WriteStream on: String new)
		with: (String withAll: 'test') writeStream
		with: (WriteStream on: (String withAll: 'test')))
		do: [:stream | | writer |
			writer := XMLWriter on: stream.
			self assert: writer atBeginning.

			stream nextPut: $<.
			self deny: writer atBeginning]
]

{ #category : #tests }
XMLWriterTest >> testAttributes [
	| writer tag |

	writer := XMLWriter new.
	tag := writer  tag: 'outer' attributes: (Array with: 'first' -> 'one').
	self
		assert: tag hasAttributes;
		assert: (tag attributeAt: 'first') = 'one';
		assert: (tag attributeAt: 'second' put: 'two') = 'two';
		assert: (tag attributeAt: 'third' ifAbsentPut: ['three']) = 'three';
		assert: (tag attributeAt: 'fourth' ifAbsent: [nil]) isNil;
		assert: (tag attributeAt: 'fourth') isEmpty;
		assert: (tag attributes at: 'fourth') isEmpty;
		deny: (tag includesAttribute: 'fourth').

	tag with: [
		writer
			tag: 'inner'
			attributes: (Dictionary with: 'fourth' -> 'four')
			with: 'test'].
	self assert:
		writer contents =
			'<outer first="one" second="two" third="three"><inner fourth="four">test</inner></outer>'.
]

{ #category : #tests }
XMLWriterTest >> testCDataSections [
	| writer |

	(writer := XMLWriter new)
		tag: 'cdata'
		with: [
			writer
				cdata: '<escaped name="&value;" />';
				cdata:
					(XMLWriter writeWith: [:w |
						w
							tag: 'escaped'
							with: [w & 'value']])].

	self assert:
		writer contents =
			('<cdata>',
			'<![CDATA[<escaped name="&value;" />]]>',
			'<![CDATA[<escaped>&value;</escaped>]]>',
			'</cdata>').
]

{ #category : #tests }
XMLWriterTest >> testCanonicalComments [
	| writer |

	(writer := XMLWriter new)
		isCanonical: true;
		comment: 'one';
		comment: 'two'.
	writer
		tag: 'three'
		with: [
			writer
				comment: 'four';
				comment: 'five';
				tag: 'six';
				comment: 'seven';
				comment: 'eight'].
	writer
		comment: 'nine';
		comment: 'ten'.

	self assert:
		writer contents =
			(self onCanonicalLineBreakJoin:
				#('<!--one-->'
					'<!--two-->'
					'<three><!--four--><!--five--><six></six><!--seven--><!--eight--></three>'
					'<!--nine-->'
					'<!--ten-->')).
]

{ #category : #tests }
XMLWriterTest >> testCanonicalDTDs [
	| writer |

	(writer := XMLWriter new)
		isCanonical: true;
		comment: 'before dtd'.
	writer doctype
		root: 'element';
		systemID: 'doc.dtd';
		with: [
			writer comment: 'ignored'.
			writer elementDeclaration
				name: 'ignored';
				contentModel: 'EMPTY'.
			writer entityDeclaration
				name: 'ignored';
				replacement: 'ignored'.
			writer attributeDeclaration
				element: 'ignored';
				attribute: 'ignored';
				type: 'CDATA';
				defaultPragma: '#REQUIRED'.
			writer notationDeclaration
				name: 'external';
				systemID: 'external.txt'.
			writer pi
				target: 'ignored';
				data: 'ignored'].
	writer
		comment: 'after dtd';
		tag: 'empty'.

	self assert:
		writer contents =
			(self onCanonicalLineBreakJoin:
				#('<!--before dtd-->'
					'<!--after dtd-->'
					'<empty></empty>')).
]

{ #category : #tests }
XMLWriterTest >> testCanonicalEscaping [
	| writer tag |

	"Attributes are changed 'by replacing all ampersands (&) with
	&amp;, all open angle brackets (<) with &lt;, all quotation mark
	characters with &quot;...'

	PCDATA is changed so 'all ampersands are replaced by &amp;,
	all open angle brackets (<) are replaced by &lt;, all closing
	angle brackets (>) are replaced by &gt;...'"
	(writer := XMLWriter new)
		isCanonical: true.
	(tag := writer tag: 'canonical')
		attributeAt: 'escaping'
		put: '<>"''&'.
	tag with: '<>"''&'.
	self assert:
		writer contents =
			'<canonical escaping="&lt;>&quot;''&amp;">&lt;&gt;"''&amp;</canonical>'.
]

{ #category : #tests }
XMLWriterTest >> testCanonicalEscapingWhitespace [
	| whitespace writer tag |

	"Attributes are changed by replacing 'the whitespace characters
	#x9, #xA, and #xD, with character references...'

	PCDATA is changed so 'all #xD characters are replaced by &#xD...'"
	whitespace :=
		String
			with: 16r9 asCharacter "tab"
			with: 16rA asCharacter "lf"
			with: 16rD asCharacter "cr"
			with: 16r20 asCharacter. "space"
	(writer := XMLWriter new)
		isCanonical: true.
	(tag := writer tag: 'canonical')
		attributeAt: 'whitespace'
		put: whitespace.
	tag with: whitespace.
	self assert:
		writer contents =
			('<canonical whitespace="&#x9;&#xA;&#xD;{4}">{1}{2}&#xD;{4}</canonical>'
				format: whitespace).
]

{ #category : #tests }
XMLWriterTest >> testCanonicalNonRedundantXMLNSDeclarations [
	| withBlock |

	withBlock := [:writer |
		(writer tag: 'one')
			xmlns: 'defaultNS';
			xmlnsAt: 'prefix' put: 'prefixNS';
			with: [
				(writer tag: 'two')
					xmlns: 'newDefaultNS';
					xmlnsAt: 'prefix' put: 'newPrefixNS';
					with: [
						"skip one tag"
						writer
							tag: 'three'
							with: [
								"then add more non-reundant xmlns declarations"
								(writer tag: 'four')
									xmlns: '';
									xmlnsAt: 'prefix' put: 'prefixNS']]]].
	self assert:
		(XMLWriter new
			isCanonical: true;
			writeWith: withBlock;
			contents) =
				('<one xmlns="defaultNS" xmlns:prefix="prefixNS">',
				'<two xmlns="newDefaultNS" xmlns:prefix="newPrefixNS">',
				'<three>',
				'<four xmlns="" xmlns:prefix="prefixNS"></four>',
				'</three>',
				'</two>',
				'</one>').
]

{ #category : #tests }
XMLWriterTest >> testCanonicalPIs [
	| writer |

	(writer := XMLWriter new)
		isCanonical: true.
	writer pi
		target: 'one';
		data: 'one'.
	writer pi target: 'two'.
	writer
		tag: 'three'
		with: [
			writer pi
				target: 'four';
				data: 'four'.
			writer pi target: 'five'.
			writer tag: 'six'.
			writer pi target: 'seven'.
			writer pi
				target: 'eight';
				data: 'eight'].
	writer pi target: 'nine'.
	writer pi
		target: 'ten';
		data: 'ten'.

	self assert:
		writer contents =
			(self onCanonicalLineBreakJoin:
				#('<?one one?>'
					'<?two?>'
					'<three><?four four?><?five?><six></six><?seven?><?eight eight?></three>'
					'<?nine?>'
					'<?ten ten?>')).
]

{ #category : #tests }
XMLWriterTest >> testCanonicalRedundantXMLNSDeclarations [
	| withBlock |

	withBlock := [:writer |
		(writer tag: 'one')
			xmlns: 'defaultNS';
			xmlnsAt: 'prefix' put: 'prefixNS';
			with: [
				(writer tag: 'two')
					xmlns: 'defaultNS';
					xmlnsAt: 'prefix' put: 'prefixNS';
					with: [
						"skip one tag"
						writer
							tag: 'three'
							with: [
								"then add more reundant xmlns declarations"
								(writer tag: 'four')
									xmlns: 'defaultNS';
									xmlnsAt: 'prefix' put: 'prefixNS']]]].
	self assert:
		(XMLWriter new
			isCanonical: true;
			writeWith: withBlock;
			contents) =
				('<one xmlns="defaultNS" xmlns:prefix="prefixNS">',
				'<two><three><four></four></three></two>',
				'</one>').

	self assert:
		(XMLWriter new
			isCanonical: true;
			writeWith: [:writer | (writer tag: 'empty') xmlns: ''];
			contents) = '<empty></empty>'.
]

{ #category : #tests }
XMLWriterTest >> testCanonicalTags [
	| writer |

	(writer := XMLWriter new)
		isCanonical: true.
	(writer tag: 'tags')
		attributeAt: 'b:d' put: '5';
		attributeAt: 'b:c' put: '4';
		attributeAt: 'a' put: '1';
		attributeAt: 'a:b' put: '3';
		attributeAt: 'xml:d' put: '2';
		xmlnsAt: 'b' put: 'ns2';
		xmlnsAt: 'a' put: 'ns1';
		xmlns: 'default';
		with: [
			(writer tag: 'cdata')
				attributeAt: 'a:a' put: '2';
				attributeAt: 'undeclared:a' put: '1';
				with: [writer cdata: '<escaped name="&value;" />'].
			writer
				tag: 'empty'
				with: nil].

	self assert:
		writer contents =
			('<tags xmlns="default" xmlns:a="ns1" xmlns:b="ns2" a="1" xml:d="2" a:b="3" b:c="4" b:d="5">',
			'<cdata undeclared:a="1" a:a="2">&lt;escaped name="&amp;value;" /&gt;</cdata>',
			'<empty></empty>',
			'</tags>').
]

{ #category : #tests }
XMLWriterTest >> testCanonicalXMLDeclarationsAndPIs [
	| writer |

	(writer := XMLWriter new)
		isCanonical: true;
		xml;
		comment: 'start of pi'.
	writer pi
		target: 'pi';
		data: 'preserved'.
	writer
		comment: 'end of pi';
		tag: 'empty'.

	self assert:
		writer contents =
			(self onCanonicalLineBreakJoin:
				#('<!--start of pi-->'
					'<?pi preserved?>'
					'<!--end of pi-->'
					'<empty></empty>')).
]

{ #category : #tests }
XMLWriterTest >> testClose [
	self assert:
		(String streamContents: [:stream |
			(XMLWriter on: stream)
				tag: 'one';
				tag: 'two';
				close]) = '<one/><two/>'.
	self assert:
		(String streamContents: [:stream |
			((XMLWriter on: stream)
				tag: 'one';
				tag: 'two') close]) = '<one/><two/>'.
]

{ #category : #tests }
XMLWriterTest >> testContentEntityReferenceEscaping [
	self assert:
		(XMLWriter writeWith: [:writer |
			(writer
				escapesContentEntityReferences: false;
				tag: 'one')
				attributeAt: 'two' put: '<"&three;">';
				with: '<"&four;">']) =
			'<one two="&lt;&quot;&three;&quot;>">&lt;"&four;"&gt;</one>'.

	self assert:
		(XMLWriter writeWith: [:writer |
			(writer
				escapesContentEntityReferences: true;
				tag: 'one')
				attributeAt: 'two' put: '<"&three;">';
				with: '<"&four;">']) =
			'<one two="&lt;&quot;&amp;three;&quot;>">&lt;"&amp;four;"&gt;</one>'.
]

{ #category : #tests }
XMLWriterTest >> testContentEscaping [
	| writer |

	(writer := XMLWriter new)
		tag
			name: 'test';
			attributeAt: 'escaped' put: '& " < >';
			xmlns: '& " < >';
			with: '& " < >'.
	self assert:
		writer contents =
			'<test xmlns="&amp; &quot; &lt; >" escaped="&amp; &quot; &lt; >">&amp; " &lt; &gt;</test>'.

	((writer := XMLWriter new)
		isEscaping: false;
		tag)
			name: 'test';
			xmlns: '& " < >';
			attributeAt: 'unescaped' put: '& " < >';
			with: '& " < >'.
	self assert: writer contents = '<test xmlns="& " < >" unescaped="& " < >">& " < ></test>'.
]

{ #category : #tests }
XMLWriterTest >> testContents [
	self assert:
		(XMLWriter new
			tag: 'one';
			tag: 'two';
			contents) = '<one/><two/>'.
	self assert:
		(XMLWriter new
			tag: 'one';
			tag: 'two') contents = '<one/><two/>'.
]

{ #category : #tests }
XMLWriterTest >> testEmbedInMarkupWriter [
	(Array
		with: 'one<two/>three'
		with: #('one' nil '<two/>' 'three')
		with: #($o $n $e $< $t $w $o $/ $> nil $t $h $r $e $e)
		with:
			(Array
				with: [:w | w string: 'one']
				with: [:w | w string: '<two/>']
				with: [:w | w string: 'three']
				with: nil))
		do: [:each |
			self assert:
				(XMLWriter writeWith: [:writer |
					writer
						tag: 'test'
						with: each]) = '<test>one&lt;two/&gt;three</test>'].

	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'test'
				with: $<]) = '<test>&lt;</test>'.
		
	(Array with: nil with: '' with: #() with: []) do: [:each |
		self assert:
			(XMLWriter writeWith: [:writer |
				writer
					tag: 'test'
					with: each]) = '<test/>'].
]

{ #category : #tests }
XMLWriterTest >> testEnablePlatformSpecificLineBreak [
	| writer |

	writer := XMLWriter new.
	self
		assert: writer enablePlatformSpecificLineBreak == writer;
		assert: writer lineBreak = writer platformSpecificLineBreak.
]

{ #category : #tests }
XMLWriterTest >> testEnablePrettyPrinting [
	| writer |

	(writer := XMLWriter new)
		enablePrettyPrinting;
		comment: 'an example'.
	writer tag
		name: 'example:user';
		xmlnsAt: 'example' put: 'urn://example';
		with: [
			writer
				tag: 'username' with: [
					writer
						comment: 'id';
						string: 'jsmith'];
				tag: 'real-name' with: [
					writer tag: 'last-name' with: 'Smith'.
					writer string: ', '.
					writer pi
						target: 'type';
						data: 'string'.
					writer
						comment: 'first name';
						string: 'John'];
				tag: 'age' with: [
					writer pi
						target: 'type';
						data: 'integer'.
					writer comment: 'not supplied'];
				tag: 'id' with: [
					writer
						string: '101';
						comment: ''];
				tag: 'contact' with: [
					writer
						tag: 'email';
						string: 'alternate']].

	self assert:
		writer contents =
			(self prettyPrintedLines: #(
				#(0 '<!--an example-->'
					'<example:user xmlns:example="urn://example">')
				#(1 '<username>')
				#(2 '<!--id-->jsmith</username>')
				#(1 '<real-name>')
				#(2 '<last-name>Smith</last-name>, <?type string?><!--first name-->John</real-name>')
				#(1 '<age>')
				#(2 '<?type integer?>'
					'<!--not supplied-->')
				#(1 '</age>'
					'<id>101<!----></id>'
					'<contact>')
				#(2 '<email/>alternate</contact>')
				#(0 '</example:user>'))).
]

{ #category : #tests }
XMLWriterTest >> testEnablePrettyPrintingDTD [
	| writer |

	(writer := XMLWriter new)
		enablePrettyPrinting;
		xml.
	writer doctype
		root: 'pretty';
		with: [
			writer comment: 'element'.
			writer elementDeclaration
				name: 'pretty';
				contentModel: 'EMPTY'.
			writer comment: 'entity'.
			writer entityDeclaration
				isParameter: true;
				name: 'comment';
				replacement: '<!--attribute-->'.
			writer % 'comment'.
			writer comment: 'attribute'.
			writer attributeDeclaration
				element: 'pretty';
				attribute: 'name';
				type: 'CDATA';
				defaultPragma: '#IMPLIED'.
			writer comment: 'notation'.
			writer notationDeclaration
				name: 'external';
				systemID: 'external.txt'.
			writer pi
				target: 'target';
				data: 'data'].

	self assert:
		writer contents =
			(self prettyPrintedLines: #(
				#(0 '<?xml version="1.0"?>'
					'<!DOCTYPE pretty [')
				#(1 '<!--element-->'
					'<!ELEMENT pretty EMPTY>'
					'<!--entity-->'
					'<!ENTITY % comment "<!--attribute-->">'
					'%comment;'
					'<!--attribute-->'
					'<!ATTLIST pretty name CDATA #IMPLIED>'
					'<!--notation-->'
					'<!NOTATION external SYSTEM "external.txt">'
					'<?target data?>')
				#(0 ']>'
					''))).
]

{ #category : #tests }
XMLWriterTest >> testEnablePrologPrettyPrinting [
	| writer |

	(writer := XMLWriter new)
		enablePrologPrettyPrinting;
		xml.
	writer doctype
		root: 'pretty';
		with: [
			writer comment: 'element'.
			writer elementDeclaration
				name: 'pretty';
				contentModel: 'ANY'.
			writer elementDeclaration
				name: 'ugly';
				contentModel: 'ANY'.
			writer comment: 'entity'.
			writer entityDeclaration
				isParameter: true;
				name: 'comment';
				replacement: '<!--attribute-->'.
			writer % 'comment'.
			writer comment: 'attribute'.
			writer attributeDeclaration
				element: 'pretty';
				attribute: 'name';
				type: 'CDATA';
				defaultPragma: '#IMPLIED'.
			writer comment: 'notation'.
			writer notationDeclaration
				name: 'external';
				systemID: 'external.txt'.
			writer pi
				target: 'target';
				data: 'data'].
	writer comment: 'before'.
	writer pi
		target: 'beforeTarget';
		data: 'beforeData'.
	"content should be unformatted"
	writer
		tag: 'pretty'
		with: [
			writer comment: 'ugly'.
			writer pi
				target: 'uglyTarget';
				data: 'uglyData'.
			writer
				tag: 'ugly'
				with: 'test'].
	writer comment: 'after'.
	writer pi
		target: 'afterTarget';
		data: 'afterData'.

	self assert:
		writer contents =
			(self prettyPrintedLines: #(
				#(0 '<?xml version="1.0"?>'
					'<!DOCTYPE pretty [')
				#(1 '<!--element-->'
					'<!ELEMENT pretty ANY>'
					'<!ELEMENT ugly ANY>'
					'<!--entity-->'
					'<!ENTITY % comment "<!--attribute-->">'
					'%comment;'
					'<!--attribute-->'
					'<!ATTLIST pretty name CDATA #IMPLIED>'
					'<!--notation-->'
					'<!NOTATION external SYSTEM "external.txt">'
					'<?target data?>')
				#(0 ']>'
					'<!--before-->'
					'<?beforeTarget beforeData?>'
					'<pretty><!--ugly--><?uglyTarget uglyData?><ugly>test</ugly></pretty>'
					'<!--after-->'
					'<?afterTarget afterData?>'))).
]

{ #category : #tests }
XMLWriterTest >> testEntityDeclaration [
	| writer |

	(writer := XMLWriter new)
		doctypeDeclaration
			root: 'test';
			with: [
				writer entityDeclaration
					name: 'internal';
					replacement: 'replacement'.
				writer entityDeclaration name: 'emptyInternal'.
				writer entityDeclaration
					name: 'publicExternal';
					publicID: 'publicID';
					systemID: 'systemID'.
				writer entityDeclaration
					name: 'publicExternal';
					publicID: 'publicID'.
				writer entityDeclaration
					name: 'systemExternal';
					systemID: 'systemID'.
				writer entityDeclaration
					name: 'unparsed';
					systemID: 'systemID';
					ndata: 'notation'].

	self assert:
		writer contents =
			('<!DOCTYPE test [',
				'<!ENTITY internal "replacement">',
				'<!ENTITY emptyInternal "">',
				'<!ENTITY publicExternal PUBLIC "publicID" "systemID">',
				'<!ENTITY publicExternal PUBLIC "publicID" "">',
				'<!ENTITY systemExternal SYSTEM "systemID">',
				'<!ENTITY unparsed SYSTEM "systemID" NDATA notation>',
				']>').
]

{ #category : #tests }
XMLWriterTest >> testEntityReference [
	| writer |

	(writer := XMLWriter new)
		tag: 'entities'
		with: [
			writer & 'one'.
			writer string: 'two'.
			writer & 'three'].

	self assert: writer contents = '<entities>&one;two&three;</entities>'.
]

{ #category : #tests }
XMLWriterTest >> testEntityValueEscaping [
	| writer |

	(writer := XMLWriter new)
		entityDeclaration
			name: 'test';
			replacement: '% " < >';
			write.
	self assert: writer contents = '<!ENTITY test "&#37; &#34; < >">'.

	((writer := XMLWriter new)
		isEscaping: false;
		entityDeclaration)
			name: 'test';
			replacement: '% " < >';
			write.
	self assert: writer contents = '<!ENTITY test "% " < >">'.

]

{ #category : #tests }
XMLWriterTest >> testEscapesContentEntityReferences [
	| writer |

	writer := XMLWriter new.
	self
		assert: (writer escapesContentEntityReferences: true) == writer;
		assert: writer escapesContentEntityReferences;
		assert: writer isEscaping;
		assert: writer contentEscapes = writer contentDefaultEscapes;
		assert: writer contentStringEscapes = writer contentStringDefaultEscapes.

	self
		assert: (writer escapesContentEntityReferences: false) == writer;
		deny: writer escapesContentEntityReferences;
		assert: writer isEscaping;
		assert: writer contentEscapes = writer contentNonEntityEscapes;
		assert: writer contentStringEscapes = writer contentStringNonEntityEscapes.

	writer isEscaping: false.
	self
		deny: writer escapesContentEntityReferences;
		assert: (writer escapesContentEntityReferences: true) == writer;
		assert: writer escapesContentEntityReferences;
		assert: writer isEscaping;
		assert: writer contentEscapes = writer contentDefaultEscapes;
		assert: writer contentStringEscapes = writer contentStringDefaultEscapes.
]

{ #category : #tests }
XMLWriterTest >> testFormatter [
	| writer formatter |

	writer := XMLWriter new.
	self assert: writer formatter isNil.

	formatter := XMLPrettyPrintingWriterFormatter new.
	self
		assert: (writer formatter: formatter) == writer;
		assert: writer formatter == formatter;
		assert: formatter writer == writer.

	self
		assert: (writer formatter: nil) == writer;
		assert: writer formatter isNil.
]

{ #category : #tests }
XMLWriterTest >> testFormattingAttributeDeclarations [
	| formatter writer doctypeWriter firstDeclarationWriter secondDeclarationWriter thirdDeclarationWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(doctypeWriter := writer doctype)
		root: 'one';
		with: [
			(firstDeclarationWriter := writer attributeDeclaration)
				element: 'one';
				attribute: 'one';
				type: 'CDATA';
				defaultPragma: '#FIXED';
				defaultValue: 'default'.
			(secondDeclarationWriter := writer attributeDeclaration)
				element: 'one';
				attribute: 'two';
				type: '(four | five)';
				defaultPragma: '#IMPLIED'.
			(thirdDeclarationWriter := writer attributeDeclaration)
				element: 'one';
				attribute: 'three';
				type: 'NOTATION (six | seven)';
				defaultPragma: '#IMPLIED'.].
	self assert:
		(formatter
			receivedNext: #formatBeforeDoctypeDeclaration:
			with: doctypeWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNext: #formatBeforeInternalSubset:
			with: doctypeWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: firstDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'default').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: firstDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: secondDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'two').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'four').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'five').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: secondDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: thirdDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'three').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'six').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'seven').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: thirdDeclarationWriter).

	self assert:
		(formatter
			receivedNextAll: #(formatAfterInternalSubset: formatAfterDoctypeDeclaration:)
			with: doctypeWriter).

	self assert:
		writer contents =
			('<!DOCTYPE one [',
					'<!ATTLIST one one CDATA #FIXED "default">',
					'<!ATTLIST one two (four | five) #IMPLIED>',
					'<!ATTLIST one three NOTATION (six | seven) #IMPLIED>',
				']>').
]

{ #category : #tests }
XMLWriterTest >> testFormattingContent [
	| formatter writer tagWriter commentWriter entityRefWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(tagWriter := writer tag: 'empty') write.
	self assert:
		(formatter
			receivedNext: #formatBeforeStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'empty').
	self assert:
		(formatter
			receivedNext: #formatAfterEndTag:
			with: tagWriter).

	(tagWriter := writer tag: 'not-empty')
		xmlns: 'defaultNS';
		attributeAt: 'name' put: 'value';
		with: [
			writer string: 'one'.
			(commentWriter := writer comment) string: 'two'.
			(entityRefWriter := writer entityRef) name: 'three'.
			writer string: 'four'].
	self assert:
		(formatter
			receivedNext: #formatBeforeStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'not-empty').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'xmlns').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'defaultNS').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'name').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'value').
	self assert:
		(formatter
			receivedNext: #formatAfterStartTag:
			with: tagWriter).

	self assert:
		(formatter
			receivedNextAll: #(formatBeforeComment: formatAfterComment:)
			with: commentWriter).

	self assert:
		(formatter
			receivedNextAll: #(formatBeforeEntityReference: formatAfterEntityReference:)
			with: entityRefWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeEndTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'not-empty').
	self assert:
		(formatter
			receivedNext: #formatAfterEndTag:
			with: tagWriter).

	writer outputsSelfClosingTags: false.
	(tagWriter := writer tag: 'empty') write.
	self assert:
		(formatter
			receivedNext: #formatBeforeStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'empty').
	self assert:
		(formatter
			receivedNext: #formatAfterStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNext: #formatBeforeEndTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'empty').
	self assert:
		(formatter
			receivedNext: #formatAfterEndTag:
			with: tagWriter).

	self assert:
		writer contents =
			('<empty/>',
				'<not-empty xmlns="defaultNS" name="value">',
					'one<!--two-->&three;four',
				'</not-empty>',
				'<empty></empty>').
]

{ #category : #tests }
XMLWriterTest >> testFormattingElementDeclarations [
	| formatter writer doctypeWriter firstDeclarationWriter secondDeclarationWriter thirdDeclarationWriter fourthDeclarationWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(doctypeWriter := writer doctype)
		root: 'one';
		with: [
			(firstDeclarationWriter := writer elementDeclaration)
				name: 'one';
				contentModel: '(two, three)'.
			(secondDeclarationWriter := writer elementDeclaration)
				name: 'two';
				contentModel: '(#PCDATA | four)*'.
			(thirdDeclarationWriter := writer elementDeclaration)
				name: 'three';
				contentModel: 'ANY'.
			(fourthDeclarationWriter := writer elementDeclaration)
				name: 'four';
				contentModel: 'EMPTY'].
	self assert:
		(formatter
			receivedNext: #formatBeforeDoctypeDeclaration:
			with: doctypeWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNext: #formatBeforeInternalSubset:
			with: doctypeWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: firstDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'two').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'three').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: firstDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: secondDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'two').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'four').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: secondDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: thirdDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'three').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: thirdDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: fourthDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'four').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: fourthDeclarationWriter).

	self assert:
		(formatter
			receivedNextAll: #(formatAfterInternalSubset: formatAfterDoctypeDeclaration:)
			with: doctypeWriter).

	self assert:
		writer contents =
			('<!DOCTYPE one [',
					'<!ELEMENT one (two, three)>',
					'<!ELEMENT two (#PCDATA | four)*>',
					'<!ELEMENT three ANY>',
					'<!ELEMENT four EMPTY>',
				']>').
]

{ #category : #tests }
XMLWriterTest >> testFormattingEntityDelcarations [
	| formatter writer xmlDeclarationWriter doctypeWriter firstDeclarationWriter secondDeclarationWriter thirdDeclarationWriter fourthDeclarationWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(doctypeWriter := writer doctype)
		root: 'test';
		with: [
			(firstDeclarationWriter := writer entityDeclaration)
				isParameter: true;
				name: 'one';
				replacement: 'replacement'.
			(secondDeclarationWriter := writer entityDeclaration)
				name: 'two';
				publicID: 'second';
				systemID: 'two.ent'.
			(thirdDeclarationWriter := writer entityDeclaration)
				name: 'three';
				systemID: 'three.ent'.
			(fourthDeclarationWriter := writer entityDeclaration)
				name: 'four';
				publicID: 'fourth';
				systemID: 'four.ent';
				ndata: 'notation'].
	self assert:
		(formatter
			receivedNext: #formatBeforeDoctypeDeclaration:
			with: doctypeWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'test').
	self assert:
		(formatter
			receivedNext: #formatBeforeInternalSubset:
			with: doctypeWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: firstDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'one').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'replacement').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: firstDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: secondDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'two').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'second').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'two.ent').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: secondDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: thirdDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'three').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'three.ent').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: thirdDeclarationWriter).

	self assert:
		(formatter
			receivedNext: #formatBeforeDeclaration:
			with: fourthDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'four').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'fourth').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'four.ent').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'notation').
	self assert:
		(formatter
			receivedNext: #formatAfterDeclaration:
			with: fourthDeclarationWriter).

	self assert:
		(formatter
			receivedNextAll: #(formatAfterInternalSubset: formatAfterDoctypeDeclaration:)
			with: doctypeWriter).

	self assert:
		writer contents =
			('<!DOCTYPE test [',
					'<!ENTITY % one "replacement">',
					'<!ENTITY two PUBLIC "second" "two.ent">',
					'<!ENTITY three SYSTEM "three.ent">',
					'<!ENTITY four PUBLIC "fourth" "four.ent" NDATA notation>',
				']>').
]

{ #category : #tests }
XMLWriterTest >> testFormattingPIs [
	| formatter writer piWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.

	(piWriter := writer pi)
		target: 'xml-xsl';
		data: 'type="text/xsl" href=''demo.xsl''';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforePI:
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'type').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'text/xsl').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'href').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'demo.xsl').
	self assert:
		(formatter
			receivedNext: #formatAfterPI:
			with: piWriter).

	(piWriter := writer pi)
		target: 'xml-xsl';
		data: 'type href';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforePI:
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'type').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'href').
	self assert:
		(formatter
			receivedNext: #formatAfterPI:
			with: piWriter).

	(piWriter := writer pi)
		target: 'xml-xsl';
		data: '"text/xsl" ''demo.xsl''';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforePI:
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'text/xsl').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'demo.xsl').
	self assert:
		(formatter
			receivedNext: #formatAfterPI:
			with: piWriter).

	(piWriter := writer pi)
		target: 'xml-xsl';
		data: '"text/xsl" "demo.xsl';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforePI:
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'text/xsl').
	self assert:
		(formatter
			receivedNext: #formatAfterPI:
			with: piWriter).

	(piWriter := writer pi)
		target: 'xml-xsl';
		data: '"text/xsl" ''demo.xsl';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforePI:
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'text/xsl').
	self assert:
		(formatter
			receivedNext: #formatAfterPI:
			with: piWriter).

	self assert:
		writer contents =
			('<?xml-xsl type="text/xsl" href=''demo.xsl''?>',
				'<?xml-xsl type href?>',
				'<?xml-xsl "text/xsl" ''demo.xsl''?>',
				'<?xml-xsl "text/xsl" "demo.xsl?>',
				'<?xml-xsl "text/xsl" ''demo.xsl?>').
]

{ #category : #tests }
XMLWriterTest >> testFormattingProlog [
	| formatter writer xmlDeclarationWriter doctypeWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(xmlDeclarationWriter := writer xml)
		version: '1.0';
		encoding: 'UTF-16';
		standalone: 'yes';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforeXMLDeclaration:
			with: xmlDeclarationWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'version').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: '1.0').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'encoding').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'UTF-16').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'standalone').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'yes').
	self assert:
		(formatter
			receivedNext: #formatAfterXMLDeclaration:
			with: xmlDeclarationWriter).

	(doctypeWriter := writer doctype)
		root: 'test';
		publicID: 'public';
		systemID: 'system';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforeDoctypeDeclaration:
			with: doctypeWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'test').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'public').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'system').
	self assert:
		(formatter
			receivedNext: #formatAfterDoctypeDeclaration:
			with: doctypeWriter).

	(doctypeWriter := writer doctype)
		root: 'test';
		systemID: 'system';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforeDoctypeDeclaration:
			with: doctypeWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'test').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'system').
	self assert:
		(formatter
			receivedNext: #formatAfterDoctypeDeclaration:
			with: doctypeWriter).

	self assert:
		writer contents =
			('<?xml version="1.0" encoding="UTF-16" standalone="yes"?>',
				'<!DOCTYPE test PUBLIC "public" "system">',
				'<!DOCTYPE test SYSTEM "system">').
]

{ #category : #tests }
XMLWriterTest >> testFormattingUnsafeTagWriters [
	| formatter writer tagWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(tagWriter := writer startTag: 'test')
		xmlns: 'defaultNS';
		attributeAt: 'name' put: 'value';
		write.
	self assert:
		(formatter
			receivedNext: #formatBeforeStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'test').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'xmlns').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'defaultNS').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringName: formatAfterQuotedStringName:)
			with: 'name').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'value').
	self assert:
		(formatter
			receivedNext: #formatAfterStartTag:
			with: tagWriter).

	(tagWriter := writer endTag: 'test') write.
	self assert:
		(formatter
			receivedNext: #formatBeforeEndTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeName: formatAfterName:)
			with: 'test').
	self assert:
		(formatter
			receivedNext: #formatAfterEndTag:
			with: tagWriter).

	self assert:
		writer contents =
			'<test xmlns="defaultNS" name="value"></test>'.
]

{ #category : #tests }
XMLWriterTest >> testHadActiveTagWriter [
	| writer tagWriter |

	writer := XMLWriter new.
	self deny: writer hadActiveTagWriter.

	writer xml.
	self deny: writer hadActiveTagWriter.

	tagWriter := writer tag: 'one'.
	self assert: writer hadActiveTagWriter.

	tagWriter write.
	self assert: writer hadActiveTagWriter.
]

{ #category : #tests }
XMLWriterTest >> testHasActiveTagWriter [
	| writer tagWriter |

	writer := XMLWriter new.
	self deny: writer hasActiveTagWriter.

	writer xml.
	self deny: writer hasActiveTagWriter.

	tagWriter := writer tag: 'one'.
	self assert: writer hasActiveTagWriter.

	tagWriter write.
	self deny: writer hasActiveTagWriter.

	tagWriter := writer startTag: 'two'.
	self assert: writer hasActiveTagWriter.

	tagWriter write.
	self deny: writer hasActiveTagWriter.

	tagWriter := writer endTag: 'two'.
	self assert: writer hasActiveTagWriter.

	tagWriter write.
	self deny: writer hasActiveTagWriter.
]

{ #category : #tests }
XMLWriterTest >> testHasFormatter [
	| writer |

	writer := XMLWriter new.
	self deny: writer hasFormatter.

	writer formatter: XMLPrettyPrintingWriterFormatter new.
	self assert: writer hasFormatter.

	writer formatter: nil.
	self deny: writer hasFormatter.
]

{ #category : #tests }
XMLWriterTest >> testIsCanonical [
	| writer |

	(writer := XMLWriter new)
		enablePrettyPrinting;
		lineBreak: Character cr;
		isEscaping: false;
		escapesContentEntityReferences: false;
		omitsRedundantXMLNSDeclarations: false.
	self
		assert: (writer isCanonical: false) == writer;
		assert: (writer formatter isKindOf: XMLPrettyPrintingWriterFormatter);
		assert: writer lineBreak = String cr;
		deny: writer isEscaping;
		deny: writer escapesContentEntityReferences;
		deny: writer omitsRedundantXMLNSDeclarations.

	self
		assert: (writer isCanonical: true) == writer;
		assert: (writer formatter isKindOf: XMLCanonicalWriterFormatter);
		assert: writer lineBreak = writer canonicalLineBreak;
		assert: writer contentEscapes = writer contentCanonicalEscapes;
		assert: writer contentStringEscapes = writer contentStringCanonicalEscapes;
		assert: writer isEscaping;
		assert: writer escapesContentEntityReferences;
		assert: writer omitsRedundantXMLNSDeclarations.

	self
		assert: (writer isCanonical: false) == writer;
		assert: writer formatter isNil;
		assert: writer lineBreak = writer defaultLineBreak;
		assert: writer contentEscapes = writer contentDefaultEscapes;
		assert: writer contentStringEscapes = writer contentStringDefaultEscapes;
		assert: writer isEscaping;
		assert: writer escapesContentEntityReferences;
		assert: writer omitsRedundantXMLNSDeclarations.
]

{ #category : #tests }
XMLWriterTest >> testLineBreak [
	(Array
		with: String crlf
		with: $N
		with: '')
		do: [:each | | writer |
			(writer := XMLWriter new)
				enablePrettyPrinting;
				lineBreak: each.
			writer
				xml;
				tag: 'test'.
			self assert:
				writer contents =
					(self
						onLineBreak: each
						join:
							#('<?xml version="1.0"?>'
								'<test/>'))]
]

{ #category : #tests }
XMLWriterTest >> testNonRedundantXMLNSDeclarations [
	| withBlock |

	withBlock := [:writer |
		(writer tag: 'one')
			xmlns: 'defaultNS';
			xmlnsAt: 'prefix' put: 'prefixNS';
			with: [
				(writer tag: 'two')
					xmlns: 'newDefaultNS';
					xmlnsAt: 'prefix' put: 'newPrefixNS';
					with: [
						"skip one tag"
						writer
							tag: 'three'
							with: [
								"then add more non-reundant xmlns declarations"
								(writer tag: 'four')
									xmlns: '';
									xmlnsAt: 'prefix' put: 'prefixNS']]]].
	self assert:
		(XMLWriter new
			writeWith: withBlock;
			contents) =
				('<one xmlns="defaultNS" xmlns:prefix="prefixNS">',
				'<two xmlns="newDefaultNS" xmlns:prefix="newPrefixNS">',
				'<three>',
				'<four xmlns="" xmlns:prefix="prefixNS"/>',
				'</three>',
				'</two>',
				'</one>').
]

{ #category : #tests }
XMLWriterTest >> testOmitsRedundantXMLNSDeclarations [
	| withBlock |

	withBlock := [:writer |
		(writer tag: 'one')
			xmlns: 'defaultNS';
			xmlnsAt: 'prefix' put: 'prefixNS';
			with: [
				(writer tag: 'two')
					xmlns: 'defaultNS';
					xmlnsAt: 'prefix' put: 'prefixNS';
					with: [
						"skip one tag"
						writer
							tag: 'three'
							with: [
								"then add more reundant xmlns declarations"
								(writer tag: 'four')
									xmlns: 'defaultNS';
									xmlnsAt: 'prefix' put: 'prefixNS']]]].
	self assert:
		(XMLWriter new
			writeWith: withBlock;
			contents) =
				('<one xmlns="defaultNS" xmlns:prefix="prefixNS">',
				'<two><three><four/></three></two>',
				'</one>').
	self assert:
		(XMLWriter new
			omitsRedundantXMLNSDeclarations: false;
			writeWith: withBlock;
			contents) =
			('<one xmlns="defaultNS" xmlns:prefix="prefixNS">',
			'<two xmlns="defaultNS" xmlns:prefix="prefixNS">',
			'<three>',
			'<four xmlns="defaultNS" xmlns:prefix="prefixNS"/>',
			'</three>',
			'</two>',
			'</one>').

	self assert:
		(XMLWriter writeWith: [:writer | (writer tag: 'empty') xmlns: '']) =
			'<empty/>'.

	self assert:
		(XMLWriter writeWith: [:writer |
			(writer
				omitsRedundantXMLNSDeclarations: false;
				tag: 'empty') xmlns: '']) =
			'<empty xmlns=""/>'.
]

{ #category : #tests }
XMLWriterTest >> testOnFormatter [
	| stream formatter writer |

	stream := String new writeStream.
	formatter := XMLWriterRecordingFormatterProxy new.
	writer := XMLWriter on: stream formatter: formatter.
	self
		assert: writer stream == stream;
		assert: writer formatter == formatter.
]

{ #category : #tests }
XMLWriterTest >> testOutputsSelfClosingTags [
	| writer |

	(writer := XMLWriter new)
		tag: 'tags' with: [
			writer
				tag: 'self-closing' with: nil;
				outputsSelfClosingTags: false;
				tag: 'not-self-closing' with: nil;
				outputsSelfClosingTags: true;
				tag: 'self-closing' with: nil].

	self assert:
		writer printString =
			'<tags><self-closing/><not-self-closing></not-self-closing><self-closing/></tags>'.
]

{ #category : #tests }
XMLWriterTest >> testPIsWithStringValues [
	| writer |

	writer := XMLWriter new.
	writer pi
		target: 'xml-xsl';
		data: 'type="text/xsl" href=''demo.xsl'''.
	writer pi
		target: 'xml-xsl';
		data: 'type="''text''/xsl" href=''"demo".xsl'''.
	writer pi
		target: 'xml-xsl';
		data: 'type="text/xsl" href=''demo.xsl'.
	writer pi
		target: 'xml-xsl';
		data: 'type="text/xsl" href="demo.xsl'.
	writer tag: 'test'.

	"it should print PI data as-is, preserving the quotes exactly"
	self assert:
		writer contents =
			('<?xml-xsl type="text/xsl" href=''demo.xsl''?>',
				'<?xml-xsl type="''text''/xsl" href=''"demo".xsl''?>',
				'<?xml-xsl type="text/xsl" href=''demo.xsl?>',
				'<?xml-xsl type="text/xsl" href="demo.xsl?>',
				'<test/>').
]

{ #category : #tests }
XMLWriterTest >> testRaw [
	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'test'
				with: [writer raw: '<raw name="&value;"/>']]) =
					'<test><raw name="&value;"/></test>'.
	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'test'
				with: [writer raw: '']]) = '<test/>'.
]

{ #category : #tests }
XMLWriterTest >> testRedundantWrites [
	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'report'
				with: [
					(writer tag: 'name')
						with: 'TestName - Report';
						write.
					writer write.
					writer writeWith: [:writer2 |
						(writer2 tag: 'finality')
							with: [
								writer2 comment
									string: 'status';
									write;
									write.
								writer2 string: 'succeed'];
							write.
						writer2 write].
					writer write].
				writer write]) =
			('<report>',
			'<name>TestName - Report</name>',
			'<finality><!--status-->succeed</finality>',
			'</report>')
]

{ #category : #tests }
XMLWriterTest >> testSimpleExample [

	| writer  |
	writer := XMLWriter new.
	writer tag
			name: 'emptyTag';
			attributeAt: 'a' put: 'one';
			write.
			
	self assert: writer contents = '<emptyTag a="one"/>'
]

{ #category : #tests }
XMLWriterTest >> testSimpleExampleWithWriteWith [
	| block contents |

	block :=
		[:writer |
			writer tag
				name: 'emptyTag';
				attributeAt: 'a' put: 'value'].
	contents := '<emptyTag a="value"/>'.
	self
		assert: (XMLWriter new writeWith: block) contents = contents;
		assert: (XMLWriter writeWith: block) = contents.
]

{ #category : #tests }
XMLWriterTest >> testStartingAndFinishing [
	| writer outer inner |

	writer := XMLWriter new.

	(outer := writer tag)
		name: 'outer';
		attributeAt: 'test' put: 'value';
		xmlns: 'default';
		startWriting.

	(inner := writer tag: 'inner')
		startWriting.
	writer string: 'test'.
	(writer tag: 'empty')
		startWriting;
		finishWriting.
	inner finishWriting.
	outer finishWriting.

	self assert:
		writer contents =
			'<outer xmlns="default" test="value"><inner>test<empty/></inner></outer>'.
]

{ #category : #tests }
XMLWriterTest >> testString [
	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'test'
				with: [writer string: '<escaped name="&value;"/>']]) =
					'<test>&lt;escaped name="&amp;value;"/&gt;</test>'.
	self assert:
		(XMLWriter writeWith: [:writer |
			writer
				tag: 'test'
				with: [writer string: '']]) = '<test/>'.
]

{ #category : #tests }
XMLWriterTest >> testSystemAndPublicIDs [
	| writer |

	(writer := XMLWriter new)
		doctype
			root: 'test';
			publicID: 'public"ID';
			systemID: 'system"ID'''. "contains double and single quote"

	"IDs are single quoted because they contain a double quote"
	self assert: writer contents = '<!DOCTYPE test PUBLIC ''public"ID'' ''system"ID''>'
]

{ #category : #tests }
XMLWriterTest >> testUnsafeTagWriters [
	self assert:
		(XMLWriter writeWith: [:writer |
			writer startTag name: 'one'.
			writer
				startTag: 'two'
				attributes: (Array with: 'name' -> 'value');
				startTag: 'three']) = '<one><two name="value"><three>'.

	self assert:
		(XMLWriter writeWith: [:writer |
			writer endTag name: 'three'.
			writer
				endTag: 'two';
				endTag: 'one']) = '</three></two></one>'.
]

{ #category : #tests }
XMLWriterTest >> testUnsafeTagWritersAttributes [
	| writer tag |

	writer := XMLWriter new.
	tag := writer  startTag: 'outer' attributes: (Array with: 'first' -> 'one').
	self
		assert: tag hasAttributes;
		assert: (tag attributeAt: 'first') = 'one';
		assert: (tag attributeAt: 'second' put: 'two') = 'two';
		assert: (tag attributeAt: 'third' ifAbsentPut: ['three']) = 'three';
		assert: (tag attributeAt: 'fourth' ifAbsent: [nil]) isNil;
		assert: (tag attributeAt: 'fourth') isEmpty;
		assert: (tag attributes at: 'fourth') isEmpty;
		deny: (tag includesAttribute: 'fourth').

	writer
		startTag: 'inner'
		attributes: (Dictionary with: 'fourth' -> 'four').
	self assert:
		writer contents =
			'<outer first="one" second="two" third="three"><inner fourth="four">'.
]

{ #category : #tests }
XMLWriterTest >> testUnsafeTagWritersXMLNSDeclarations [
	| writer tag |

	writer := XMLWriter new.
	tag := writer  startTag: 'test'.
	self
		deny: tag hasXMLNSDeclarations;
		deny: (tag includesXMLNS: '');
		deny: (tag includesXMLNS: 'ns1').

	tag xmlnsDeclarations: (Array with: '' -> 'default1' with: 'ns1' -> 'first').
	self
		assert: tag hasXMLNSDeclarations;
		assert: (tag includesXMLNS: '');
		assert: (tag includesXMLNS: 'ns1');
		assert: tag xmlns = 'default1';
		assert: (tag xmlnsAt: '') = 'default1';
		assert: (tag xmlns: 'default2') = tag;
		assert: tag xmlns = 'default2';
		assert: (tag xmlnsAt: 'ns1') = 'first';
		assert: (tag xmlnsAt: 'ns2' put: 'second') = 'second';
		assert: (tag xmlnsAt: 'ns3' ifAbsentPut: ['third']) = 'third';
		assert: (tag xmlnsAt: 'ns4' ifAbsent: [nil]) isNil;
		assert: (tag xmlnsAt: 'ns4') isEmpty;
		assert: (tag xmlnsDeclarations at: 'ns4') isEmpty.

	self assert:
		writer contents =
			'<test xmlns="default2" xmlns:ns1="first" xmlns:ns2="second" xmlns:ns3="third">'.
]

{ #category : #tests }
XMLWriterTest >> testWideStringContent [
	| wideStringContent writer |

	wideStringContent :=
		String
			with: 0 asCharacter "the low bound of the escape lookup tables"
			with: 255 asCharacter "the high bound of the escape lookup tables"
			with: 256 asCharacter
			with: 1000 asCharacter.

	writer := XMLWriter new.
	writer doctype
		root: 'test';
		with: [
			writer entityDeclaration
				name: 'test';
				replacement: wideStringContent].
	writer tag
		name: 'test';
		attributeAt: 'test' put: wideStringContent;
		with: wideStringContent.

	self assert:
		writer contents  =
			('<!DOCTYPE test [<!ENTITY test "{1}">]><test test="{1}">{1}</test>'
				format: (Array with: wideStringContent)).
]

{ #category : #tests }
XMLWriterTest >> testXMLDeclarations [
	| writer |

	(writer := XMLWriter new)
		xml.
	writer xml
		version: '1.0'.
	writer xml
		version: 1.0.
	writer xml
		version: '1.101';
		encoding: 'UTF-16';
		standalone: false.
	writer xml
		version: '1.01';
		standalone: true.
	writer xml
		version: 1.101;
		encoding: 'UTF-16LE';
		standalone: 'yes'.
	writer xml
		version: 1.01;
		standalone: 'no'.
	writer xml
		version: '';
		encoding: '';
		standalone: ''.

	self assert:
		writer printString =
			('<?xml version="1.0"?>',
			'<?xml version="1.0"?>',
			'<?xml version="1.0"?>',
			'<?xml version="1.1" encoding="UTF-16"?>',
			'<?xml version="1.0" standalone="yes"?>',
			'<?xml version="1.1" encoding="UTF-16LE" standalone="yes"?>',
			'<?xml version="1.0"?>',
			'<?xml version="1.0"?>').
]

{ #category : #tests }
XMLWriterTest >> testXMLNSDeclarations [
	| writer tag |

	writer := XMLWriter new.
	tag := writer  tag: 'test'.
	self
		deny: tag hasXMLNSDeclarations;
		deny: (tag includesXMLNS: '');
		deny: (tag includesXMLNS: 'ns1').

	tag xmlnsDeclarations: (Array with: '' -> 'default1' with: 'ns1' -> 'first').
	self
		assert: tag hasXMLNSDeclarations;
		assert: (tag includesXMLNS: '');
		assert: (tag includesXMLNS: 'ns1');
		assert: tag xmlns = 'default1';
		assert: (tag xmlnsAt: '') = 'default1';
		assert: (tag xmlns: 'default2') = tag;
		assert: tag xmlns = 'default2';
		assert: (tag xmlnsAt: 'ns1') = 'first';
		assert: (tag xmlnsAt: 'ns2' put: 'second') = 'second';
		assert: (tag xmlnsAt: 'ns3' ifAbsentPut: ['third']) = 'third';
		assert: (tag xmlnsAt: 'ns4' ifAbsent: [nil]) isNil;
		assert: (tag xmlnsAt: 'ns4') isEmpty;
		assert: (tag xmlnsDeclarations at: 'ns4') isEmpty.

	self assert:
		writer contents =
			'<test xmlns="default2" xmlns:ns1="first" xmlns:ns2="second" xmlns:ns3="third"/>'.
]
