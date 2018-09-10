Class {
	#name : #SAXHandlerTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
SAXHandlerTest >> configurationClass [
	^ XMLConfiguration
]

{ #category : #accessing }
SAXHandlerTest >> externalEntityResolverClass [
	^ DTDCachingExternalEntityResolver
]

{ #category : #source }
SAXHandlerTest >> generalEntityXMLSource [
	^ '
	<!DOCTYPE root [
		<!ENTITY % firstDeclaration "<!ENTITY first &#39; &second; &#39;>">
		%firstDeclaration;
		<!ENTITY second " replacement ">
	]>
	<root name="&second;">&first;</root>'
]

{ #category : #accessing }
SAXHandlerTest >> generalEntityXMLSourceSelectors [
	^ #(startDocument
			startDTD:publicID:systemID:
			parameterEntityDeclaration:replacement:
			generalEntityDeclaration:replacement: generalEntityDeclaration:replacement:
			endDTD
			startElement:prefix:uri:localName:attributes:
			startEntity: startEntity: endEntity: endEntity: characters:
			endElement:prefix:uri:localName:
			endDocument)
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLAttributes [
	^ (XMLNamespacedAttributeDictionary
		with: 'name' -> 'value'
		with: 'prefix:name' -> 'prefixValue')
			setNamespaceScope:
				(XMLNamespaceScope new
					defaultNamespace: 'defaultNS';
					mapPrefix: 'prefix' to: 'prefixNS')
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLAttributesNamespacesDisabled [
	^ XMLAttributeDictionary
		with: 'xmlns:prefix' -> 'prefixNS'
		with: 'xmlns' -> 'defaultNS'
		with: 'name' -> 'value'
		with: 'prefix:name' -> 'prefixValue'
]

{ #category : #source }
SAXHandlerTest >> prefixedXMLSource [
	^ '<prefix:test xmlns:prefix="prefixNS" xmlns="defaultNS" ',
		'name="value" prefix:name="prefixValue">',
		'test',
		'</prefix:test>'
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourcePrefixURILocalNameSelectors [
	^ #(startDocument
		startPrefixMapping:uri: startPrefixMapping:uri:
		startElement:prefix:uri:localName:attributes:
		characters:
		endElement:prefix:uri:localName:
		endPrefixMapping: endPrefixMapping:
		endDocument)
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourcePrefixURILocalNameSelectorsNamespacesDisabled [
	^ self removeNamespaceSelectorsFrom:
		self prefixedXMLSourcePrefixURILocalNameSelectors
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourcePrefixURISelectors [
	^ #(startDocument
		startPrefixMapping:uri: startPrefixMapping:uri:
		startElement:prefix:uri:attributes:
		characters:
		endElement:prefix:uri:
		endPrefixMapping: endPrefixMapping:
		endDocument)
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourcePrefixURISelectorsNamespacesDisabled [
	^ self removeNamespaceSelectorsFrom: self prefixedXMLSourcePrefixURISelectors

]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourceSelectors [
	^ #(startDocument
		startPrefixMapping:uri: startPrefixMapping:uri:
		startElement:attributes:
		characters:
		endElement:
		endPrefixMapping: endPrefixMapping:
		endDocument)
]

{ #category : #accessing }
SAXHandlerTest >> prefixedXMLSourceSelectorsNamespacesDisabled [
	^ self removeNamespaceSelectorsFrom: self prefixedXMLSourceSelectors

]

{ #category : #accessing }
SAXHandlerTest >> removeNamespaceSelectorsFrom: aSelectorCollection [
	^ aSelectorCollection reject: [:each |
		#(startPrefixMapping:uri: endPrefixMapping:) includes: each]

]

{ #category : #tests }
SAXHandlerTest >> testCharacters [
	| xml parser |

	xml :=
		'<test>one<non-empty>two</non-empty>three<!--comment-->',
		'four<empty></empty>five<?pi pi?>six</test>'.

	(parser := SAXRecordingHandler on: xml)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				startElement:attributes:
				characters:
				startElement:attributes:
				characters:
				endElement:
				characters:
				comment:
				characters:
				startElement:attributes:
				endElement:
				characters:
				processingInstruction:data:
				characters:
				endElement:
				endDocument)).

	(parser allSentMessagesNamed: #characters:)
		with:
			#(#('one')
				#('two')
				#('three')
				#('four')
				#('five')
				#('six'))
		do: [:message :arguments |
			self assert: message arguments = arguments].
]

{ #category : #tests }
SAXHandlerTest >> testComment [
	| xml parser |

	xml := '
		<!--before DTD-->
		<!DOCTYPE test [<!--in DTD-->]>
		<!--before element-->
		<test>
			<!--in element-->
		</test>
		<!--after element-->'.

	(parser := SAXRecordingHandler on: xml)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				comment:
				startDTD:publicID:systemID:
				comment:
				endDTD
				comment:
				startElement:attributes:
				characters:
				comment:
				characters:
				endElement:
				comment:
				endDocument)).

	(parser allSentMessagesNamed: #comment:)
		with:
			#(#('before DTD')
				#('in DTD')
				#('before element')
				#('in element')
				#('after element'))
		do: [:message :arguments |
			self assert: message arguments = arguments].
]

{ #category : #tests }
SAXHandlerTest >> testConfiguration [
	| parser oldConfiguration newConfiguration |

	parser := SAXHandler on: self prefixedXMLSource.
	oldConfiguration := parser configuration.
	self assert: oldConfiguration class == self configurationClass.

	newConfiguration := self configurationClass new.
	self
		assert: (parser configuration: newConfiguration) == parser;
		assert: parser configuration class == self configurationClass.
]

{ #category : #tests }
SAXHandlerTest >> testDecodesCharacters [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	self
		assert: parser decodesCharacters;
		assert: (parser decodesCharacters: false) == parser;
		deny: parser decodesCharacters;
		assert: (parser decodesCharacters: true) == parser;
		assert: parser decodesCharacters.
]

{ #category : #tests }
SAXHandlerTest >> testDocumentReadLimit [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	self
		assert: parser documentReadLimit = XMLParserLimits defaultDocumentReadLimit;
		assert: (parser documentReadLimit: 100000) == parser;
		assert: parser documentReadLimit = 100000;
		assert: (parser documentReadLimit: nil) == parser;
		assert: parser documentReadLimit isNil.
]

{ #category : #tests }
SAXHandlerTest >> testDocumentURI [
	| xml uri newURI parser |

	xml := self prefixedXMLSource.
	uri := 'test/test.xml'.
	newURI := 'new/new.xml'.
	parser :=
		SAXHandler
			on: xml
			documentURI: uri.
	self
		assert: parser documentURI = uri;
		assert: (parser documentURI: newURI) == parser;
		assert: parser documentURI = newURI.

	"reusing on: should clear it"
	self assert: (SAXHandler on: xml) documentURI = ''.
]

{ #category : #tests }
SAXHandlerTest >> testEndCData [
	| xml parser |

	xml := '<test>one<![CDATA[two]>]]]]>three</test>'.

	(parser := SAXRecordingHandler on: xml)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				startElement:attributes:
				characters:
				startCData
				characters:
				endCData
				characters:
				endElement:
				endDocument)).

	(parser allSentMessagesNamed: #characters:)
		with:
			#(#('one')
				#('two]>]]')
				#('three'))
		do: [:message :arguments |
			self assert: message arguments = arguments].
]

{ #category : #tests }
SAXHandlerTest >> testEndDTD [
	#('<!DOCTYPE test PUBLIC "publicID" "systemID" [<!--comment-->]><test/>'
		'<!DOCTYPE test SYSTEM "systemID" [<!--comment-->]><test/>'
		'<!DOCTYPE test [<!--comment-->]><test/>')
		do: [:xml | | parser |
			(parser := SAXRecordingHandler on: xml)
				parseDocument.
			self assert:
				(parser wasSentSelectors:
					#(startDocument
						startDTD:publicID:systemID:
						comment:
						endDTD
						startElement:attributes:
						endElement:
						endDocument))].
]

{ #category : #tests }
SAXHandlerTest >> testEndDocument [
	| saxHandler parser |

	saxHandler := SAXRecordingHandler on: '<test></test>'.
	parser := saxHandler parser.

	3 timesRepeat: [
		parser parseToken.
		self
			deny: (saxHandler wasSentSelector: #endDocument);
			deny: parser atEnd].

	parser parseToken.
	self
		assert: (saxHandler wasSentSelector: #endDocument);
		assert: parser atEnd.
]

{ #category : #tests }
SAXHandlerTest >> testEndElement [
	| parser |

	(parser := SAXRecordingHandler on: self prefixedXMLSource)
		parseDocument.
	self
		assert: (parser wasSentSelectors: self prefixedXMLSourceSelectors);
		assert: (parser argumentsSentWith: #endElement:) = #('prefix:test').

	(parser := SAXRecordingHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourceSelectorsNamespacesDisabled).
	self assert: (parser argumentsSentWith: #endElement:) = #('prefix:test').
]

{ #category : #tests }
SAXHandlerTest >> testEndElementPrefixURI [
	| parser |

	(parser := SAXRecordingPrefixURIHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors: self prefixedXMLSourcePrefixURISelectors).
	self assert:
		(parser argumentsSentWith: #endElement:prefix:uri:) =
			#('prefix:test' 'prefix' 'prefixNS').

	(parser := SAXRecordingPrefixURIHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURISelectorsNamespacesDisabled).
	self assert:
		(parser argumentsSentWith: #endElement:prefix:uri:) =
			#('prefix:test' 'prefix' '').
]

{ #category : #tests }
SAXHandlerTest >> testEndElementPrefixURILocalName [
	| parser |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectors).
	self assert:
		(parser argumentsSentWith: #endElement:prefix:uri:localName:) =
			#('prefix:test' 'prefix' 'prefixNS' 'test').

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectorsNamespacesDisabled).
	self assert:
		(parser argumentsSentWith: #endElement:prefix:uri:localName:) =
			#('prefix:test' 'prefix' '' 'test').
]

{ #category : #tests }
SAXHandlerTest >> testEndEntity [
	| parser messages |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self generalEntityXMLSource)
		parseDocument.
	self assert: (parser wasSentSelectors: self generalEntityXMLSourceSelectors).
	messages := parser allSentMessagesNamed: #endEntity:.
	self
		assert: messages first arguments = #('second');
		assert: messages second arguments = #('first').
]

{ #category : #tests }
SAXHandlerTest >> testEndPrefixMapping [
	| parser messages |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectors).
	messages := parser allSentMessagesNamed: #endPrefixMapping:.
	self
		assert: messages size = 2;
		assert: messages first arguments = #('prefix');
		assert: messages second arguments = #('').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns="defaultNS"><two xmlns="defaultNS"/></one>')
		parseDocument.
	messages := parser allSentMessagesNamed: #endPrefixMapping:.
	self
		assert: messages size = 1;
		assert: messages first arguments = #('').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns="defaultNS"><two xmlns="newDefaultNS"/></one>')
		parseDocument.
	messages := parser allSentMessagesNamed: #endPrefixMapping:.
	self
		assert: messages size = 2;
		assert: messages first arguments = #('');
		assert: messages second arguments = #('').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns:xml="', XMLNamespaceScope xmlNamespaceURI, '"/>')
		parseDocument.
	self assert:
		(parser allSentMessagesNamed: #endPrefixMapping:) isEmpty.
]

{ #category : #tests }
SAXHandlerTest >> testExternalEntityResolver [
	| parser oldResolver newResolver |

	parser := SAXHandler on: self prefixedXMLSource.
	oldResolver := parser externalEntityResolver.
	self assert: oldResolver class == self externalEntityResolverClass.

	newResolver := self externalEntityResolverClass new.
	self
		assert: (parser externalEntityResolver: newResolver) == parser;
		assert: parser externalEntityResolver == newResolver.
]

{ #category : #tests }
SAXHandlerTest >> testHasParser [
	| parser |

	parser := SAXTestingMessageRecordingHandler on: self prefixedXMLSource.
	self deny: parser hasParser.
	parser parseDocument.

	parser hasParserResults do: [:each |
		self assert: each].

	parser on: self prefixedXMLSource.
	self deny: parser hasParser.
]

{ #category : #tests }
SAXHandlerTest >> testIgnorableWhitespace [
	| dtd xml parser |

	dtd := '
		<!DOCTYPE one [ 
			<!ELEMENT one (two)>
			<!ELEMENT two (#PCDATA|three)*>
			<!ELEMENT three ANY>
		]>'.
	xml := '
		<one>
			<two>
				test
				<three>
					test
				</three>
				test
			</two>
		</one>
	'.

	(parser := SAXRecordingPrefixURILocalNameHandler on: dtd, xml) parseDocument.
	self assert:
		(parser wasSentSelectors: 
			#(startDocument
				startDTD:publicID:systemID:
				elementDeclaration:contentModel:
				elementDeclaration:contentModel:
				elementDeclaration:contentModel:
				endDTD
				startElement:prefix:uri:localName:attributes:
				ignorableWhitespace:
				startElement:prefix:uri:localName:attributes:
				characters:
				startElement:prefix:uri:localName:attributes:
				characters:
				endElement:prefix:uri:localName:
				characters:
				endElement:prefix:uri:localName:
				ignorableWhitespace:
				endElement:prefix:uri:localName:
				endDocument)).
	(parser allSentMessagesNamed: #ignorableWhitespace:) do: [:each |
		self assert: each arguments first isXMLWhitespace].

	(parser := SAXRecordingPrefixURILocalNameHandler on: xml) parseDocument.
	self assert:
		(parser wasSentSelectors: 
			#(startDocument
				startElement:prefix:uri:localName:attributes:
				characters:
				startElement:prefix:uri:localName:attributes:
				characters:
				startElement:prefix:uri:localName:attributes:
				characters:
				endElement:prefix:uri:localName:
				characters:
				endElement:prefix:uri:localName:
				characters:
				endElement:prefix:uri:localName:
				endDocument)).

	self assert:
		(parser allSentMessagesNamed: #characters:) first arguments first isXMLWhitespace.
	self assert:
		(parser allSentMessagesNamed: #characters:) last arguments first isXMLWhitespace.
]

{ #category : #tests }
SAXHandlerTest >> testInterruptParsing [
	| uniqueSelectors parser |

	uniqueSelectors := OrderedCollection new.
	self prefixedXMLSourcePrefixURILocalNameSelectors do: [:each |
		(uniqueSelectors includes: each)
			ifFalse: [uniqueSelectors addLast: each]].
	uniqueSelectors do: [:each |
		(parser :=
			SAXInterruptingRecordingPrefixURILocalNameHandler on:
				self prefixedXMLSource)
			interruptOn: each;
			parseDocument.
		self assert:
			(parser wasSentSelectors:
				((self prefixedXMLSourcePrefixURILocalNameSelectors copyUpTo: each) copyWith: each))].
]

{ #category : #tests }
SAXHandlerTest >> testIsInCDataSection [
	| xml parser |

	xml := '<test>one<![CDATA[two]]>three<![CDATA[four]]></test>'.
	parser := SAXTestingMessageRecordingHandler on: xml.
	self deny: parser isInCDataSection.
	parser parseDocument.

	parser allSentMessages
		with: parser isInCDataSectionResults
		do: [:message :result |
			((#(startCData #endCData) includes: message selector)
				or: [message selector == #characters:
					and: [#('two' 'four') includes: message arguments first]])
				ifTrue: [self assert: result]
				ifFalse: [self deny: result]].
	
	parser isInCDataSection: true.
	self assert: parser isInCDataSection.
	parser on: xml.
	self deny: parser isInCDataSection.
]

{ #category : #tests }
SAXHandlerTest >> testIsInContent [
	| xml parser seenElement |

	xml := '<?xml version="1.0"?>
	<!--comment-->
	<?target data?>',
	self generalEntityXMLSource,
	'<?target data?>
	<!--comment-->'.
	parser := SAXTestingMessageRecordingHandler on: xml.
	self deny: parser isInContent.
	parser parseDocument.

	seenElement := false.
	parser allSentSelectors
		with: parser isInContentResults
		do: [:selector :result |
			(seenElement
				or: [seenElement := selector asString beginsWith: 'startElement'])
				ifTrue: [self assert: result]
				ifFalse: [self deny: result]].
	
	self assert: parser isInContent.
	parser on: xml.
	self deny: parser isInContent.
]

{ #category : #tests }
SAXHandlerTest >> testIsValidating [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	self
		assert: parser isValidating;
		assert: (parser isValidating: false) == parser;
		deny: parser isValidating;
		assert: (parser isValidating: true) == parser;
		assert: parser isValidating.
]

{ #category : #tests }
SAXHandlerTest >> testMaxEntityReplacementDepth [
	| parser |

	parser := SAXHandler on: ''.
	self assert:
		parser maxEntityReplacementDepth =
			XMLParserLimits defaultMaxEntityReplacementDepth.
	self
		assert: (parser maxEntityReplacementDepth: 20) == parser;
		assert: parser maxEntityReplacementDepth = 20;
		assert: (parser maxEntityReplacementDepth: nil) == parser;
		assert: parser maxEntityReplacementDepth isNil.
]

{ #category : #tests }
SAXHandlerTest >> testNew [
	self
		should: [SAXHandler new]
		raise: Error
]

{ #category : #tests }
SAXHandlerTest >> testOn [
	| parser oldConfiguraiton |

	parser :=
		SAXHandler
			on: self prefixedXMLSource
			documentURI: 'oldURI'.
	oldConfiguraiton := parser configuration.
	parser parseDocument.
	self
		assert: (parser on: self generalEntityXMLSource) == parser;
		assert: parser input = self generalEntityXMLSource;
		deny: parser documentURI = 'oldURI';
		deny: parser configuration == oldConfiguraiton.
]

{ #category : #tests }
SAXHandlerTest >> testOptimizeForLargeDocuments [
	| parser |

	parser := SAXHandler on: ''.

	parser optimizeForLargeDocuments.
	self
		deny: parser isValidating;
		deny: parser usesNamespaces;
		assert: parser documentReadLimit isNil.
]

{ #category : #tests }
SAXHandlerTest >> testPreservesUndeclaredEntityReferences [
	| parser |

	parser := SAXHandler on: ''.
	self deny: parser preservesUndeclaredEntityReferences.

	"enabling should disable validation"
	self
		assert: (parser preservesUndeclaredEntityReferences: true) == parser;
		assert: parser preservesUndeclaredEntityReferences;
		deny: parser isValidating.

	self
		assert: (parser isValidating: true) == parser;
		assert: parser isValidating;
		deny: parser preservesUndeclaredEntityReferences.
]

{ #category : #tests }
SAXHandlerTest >> testProcessingInstructionData [
	| xml parser |

	xml := '
		<?before DTD?>
		<!DOCTYPE test [<?in DTD?>]>
		<?before element?>
		<test>
			<?in element?>
		</test>
		<?after element?>'.

	(parser := SAXRecordingHandler on: xml)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				processingInstruction:data:
				startDTD:publicID:systemID:
				processingInstruction:data:
				endDTD
				processingInstruction:data:
				startElement:attributes:
				characters:
				processingInstruction:data:
				characters:
				endElement:
				processingInstruction:data:
				endDocument)).

	(parser allSentMessagesNamed: #processingInstruction:data:)
		with:
			#(#('before' 'DTD')
				#('in' 'DTD')
				#('before' 'element')
				#('in' 'element')
				#('after' 'element'))
		do: [:message :arguments |
			self assert: message arguments = arguments].
]

{ #category : #tests }
SAXHandlerTest >> testRemoveLimits [
	| parser readLimit depthLimit |

	readLimit := 100.
	depthLimit := 5.
	(parser := SAXHandler on: '')
		documentReadLimit: readLimit;
		maxEntityReplacementDepth: depthLimit.
	self
		assert: parser documentReadLimit = readLimit;
		assert: parser maxEntityReplacementDepth = depthLimit.

	self
		assert: parser removeLimits == parser;
		assert: parser documentReadLimit isNil;
		assert: parser maxEntityReplacementDepth isNil.
]

{ #category : #tests }
SAXHandlerTest >> testReplacesContentEntityReferences [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	self
		assert: parser replacesContentEntityReferences;
		assert: (parser replacesContentEntityReferences: false) == parser;
		deny: parser replacesContentEntityReferences;
		assert: (parser replacesContentEntityReferences: true) == parser;
		assert: parser replacesContentEntityReferences.
]

{ #category : #tests }
SAXHandlerTest >> testRequiresSchema [
	| parser |

	(parser := SAXHandler on: '') isValidating: false.
	self deny: parser requiresSchema.

	"enabling should force validation"
	self
		assert: (parser requiresSchema: true) == parser;
		assert: parser requiresSchema;
		assert: parser isValidating.

	self
		assert: (parser isValidating: false) == parser;
		deny: parser isValidating;
		deny: parser requiresSchema.
]

{ #category : #tests }
SAXHandlerTest >> testResolvesExternalEntities [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	"should not resolve external entities by default for security"
	self
		deny: parser resolvesExternalEntities;
		assert: (parser resolvesExternalEntities: true) == parser;
		assert: parser resolvesExternalEntities;
		assert: (parser resolvesExternalEntities: false) == parser;
		deny: parser resolvesExternalEntities.
]

{ #category : #tests }
SAXHandlerTest >> testSkippedEntity [
	| xml parser |

	xml := '<!DOCTYPE root SYSTEM "extern.dtd"><root>&undeclared;</root>'.
	(parser := SAXRecordingPrefixURILocalNameHandler on: xml)
		isValidating: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors: 
			#(startDocument
				startDTD:publicID:systemID:
				endDTD
				startElement:prefix:uri:localName:attributes:
				skippedEntity:
				endElement:prefix:uri:localName:
				endDocument)).
	self assert: (parser argumentsSentWith: #skippedEntity:) = #('undeclared').
]

{ #category : #tests }
SAXHandlerTest >> testSkippedEntityUndeclaredPreserved [
	| xml parser |

	xml := '<!DOCTYPE root SYSTEM "extern.dtd"><root>&undeclared;</root>'.
	(parser := SAXRecordingPrefixURILocalNameHandler on: xml)
		isValidating: false;
		preservesUndeclaredEntityReferences: true;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				startDTD:publicID:systemID:
				endDTD
				startElement:prefix:uri:localName:attributes:
				skippedEntity:
				characters:
				endElement:prefix:uri:localName:
				endDocument)).
	self
		assert: (parser argumentsSentWith: #skippedEntity:) = #('undeclared');
		assert: (parser argumentsSentWith: #characters:) = #('&undeclared;').
]

{ #category : #tests }
SAXHandlerTest >> testSkippedEntityUnreplaced [
	| xml parser |

	xml := '<!DOCTYPE root [<!ENTITY declared "replacement">]><root>&declared;</root>'.
	(parser := SAXRecordingPrefixURILocalNameHandler on: xml)
		isValidating: true;
		replacesContentEntityReferences: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				startDTD:publicID:systemID:
				generalEntityDeclaration:replacement:
				endDTD
				startElement:prefix:uri:localName:attributes:
				skippedEntity:
				characters:
				endElement:prefix:uri:localName:
				endDocument)).
	self
		assert: (parser argumentsSentWith: #skippedEntity:) = #('declared');
		assert: (parser argumentsSentWith: #characters:) = #('&declared;').
]

{ #category : #tests }
SAXHandlerTest >> testStartCData [
	| xml parser |

	xml := '<test>one<![CDATA[<![CDATA[two]]>three</test>'.

	(parser := SAXRecordingHandler on: xml)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			#(startDocument
				startElement:attributes:
				characters:
				startCData
				characters:
				endCData
				characters:
				endElement:
				endDocument)).

	(parser allSentMessagesNamed: #characters:)
		with:
			#(#('one')
				#('<![CDATA[two')
				#('three'))
		do: [:message :arguments |
			self assert: message arguments = arguments].
]

{ #category : #tests }
SAXHandlerTest >> testStartDTDPublicIDSystemID [
	#('<!DOCTYPE test PUBLIC "publicID" "systemID"><test/>'
		'<!DOCTYPE test SYSTEM "systemID"><test/>'
		'<!DOCTYPE test><test/>')
		with:
			#(#('test' 'publicID' 'systemID')
				#('test' '' 'systemID')
				#('test' '' ''))
		do: [:xml :arguments | | parser |
			(parser := SAXRecordingHandler on: xml)
				parseDocument.
			self assert:
				(parser wasSentSelectors:
					#(startDocument
						startDTD:publicID:systemID:
						endDTD
						startElement:attributes:
						endElement:
						endDocument)).

			self assert:
				(parser argumentsSentWith: #startDTD:publicID:systemID:) =
					arguments].
]

{ #category : #tests }
SAXHandlerTest >> testStartDocument [
	| saxHandler parser |

	saxHandler := SAXRecordingHandler on: '<test></test>'.
	parser := saxHandler parser.
	self deny: (saxHandler wasSentSelector: #startDocument).
	parser parseToken.
	self assert: (saxHandler wasSentSelector: #startDocument).
]

{ #category : #tests }
SAXHandlerTest >> testStartElementAttributes [
	| parser arguments |

	(parser := SAXRecordingHandler on: self prefixedXMLSource)
		parseDocument.
	self assert: (parser wasSentSelectors: self prefixedXMLSourceSelectors).
	arguments := parser argumentsSentWith: #startElement:attributes:.
	self
		assert: arguments size = 2;
		assert: arguments first = 'prefix:test';
		assert: arguments second = self prefixedXMLAttributes.

	(parser := SAXRecordingHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourceSelectorsNamespacesDisabled).
	arguments := parser argumentsSentWith: #startElement:attributes:.
	self
		assert: arguments size = 2;
		assert: arguments first = 'prefix:test';
		assert: arguments second = self prefixedXMLAttributesNamespacesDisabled.
]

{ #category : #tests }
SAXHandlerTest >> testStartElementPrefixURIAttributes [
	| parser arguments |

	(parser := SAXRecordingPrefixURIHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors: self prefixedXMLSourcePrefixURISelectors).
	arguments := parser argumentsSentWith: #startElement:prefix:uri:attributes:.
	self
		assert: arguments size = 4;
		assert: arguments first = 'prefix:test';
		assert: arguments second = 'prefix';
		assert: arguments third = 'prefixNS';
		assert: arguments fourth = self prefixedXMLAttributes.

	(parser := SAXRecordingPrefixURIHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURISelectorsNamespacesDisabled).
	arguments := parser argumentsSentWith: #startElement:prefix:uri:attributes:.
	self
		assert: arguments size = 4;
		assert: arguments first = 'prefix:test';
		assert: arguments second = 'prefix';
		assert: arguments third = '';
		assert: arguments fourth = self prefixedXMLAttributesNamespacesDisabled.
]

{ #category : #tests }
SAXHandlerTest >> testStartElementPrefixURILocalNameAttributes [
	| parser arguments |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectors).
	arguments :=
		parser argumentsSentWith: #startElement:prefix:uri:localName:attributes:.
	self
		assert: arguments size = 5;
		assert: arguments first = 'prefix:test';
		assert: arguments second = 'prefix';
		assert: arguments third = 'prefixNS';
		assert: arguments fourth = 'test';
		assert: arguments fifth = self prefixedXMLAttributes.

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		usesNamespaces: false;
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectorsNamespacesDisabled).
	arguments :=
		parser argumentsSentWith: #startElement:prefix:uri:localName:attributes:.
	self
		assert: arguments size = 5;
		assert: arguments first = 'prefix:test';
		assert: arguments second = 'prefix';
		assert: arguments third = '';
		assert: arguments fourth = 'test';
		assert: arguments fifth = self prefixedXMLAttributesNamespacesDisabled.
]

{ #category : #tests }
SAXHandlerTest >> testStartEntity [
	| parser messages |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self generalEntityXMLSource)
		parseDocument.
	self assert: (parser wasSentSelectors: self generalEntityXMLSourceSelectors).
	messages := parser allSentMessagesNamed: #startEntity:.
	self
		assert: messages first arguments = #('first');
		assert: messages second arguments = #('second').
]

{ #category : #tests }
SAXHandlerTest >> testStartPrefixMappingURI [
	| parser messages |

	(parser := SAXRecordingPrefixURILocalNameHandler on: self prefixedXMLSource)
		parseDocument.
	self assert:
		(parser wasSentSelectors:
			self prefixedXMLSourcePrefixURILocalNameSelectors).
	messages := parser allSentMessagesNamed: #startPrefixMapping:uri:.
	self
		assert: messages size = 2;
		assert: messages first arguments = #('prefix' 'prefixNS');
		assert: messages second arguments = #('' 'defaultNS').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns="defaultNS"><two xmlns="defaultNS"/></one>')
		parseDocument.
	messages := parser allSentMessagesNamed: #startPrefixMapping:uri:.
	self
		assert: messages size = 1;
		assert: messages first arguments = #('' 'defaultNS').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns="defaultNS"><two xmlns="newDefaultNS"/></one>')
		parseDocument.
	messages := parser allSentMessagesNamed: #startPrefixMapping:uri:.
	self
		assert: messages size = 2;
		assert: messages first arguments = #('' 'defaultNS');
		assert: messages second arguments = #('' 'newDefaultNS').

	(parser :=
		SAXRecordingPrefixURILocalNameHandler on:
			'<one xmlns:xml="', XMLNamespaceScope xmlNamespaceURI, '"/>')
		parseDocument.
	self assert:
		(parser allSentMessagesNamed: #startPrefixMapping:uri:) isEmpty.
]

{ #category : #tests }
SAXHandlerTest >> testUsesNamespaces [
	| parser |

	parser := SAXHandler on: self prefixedXMLSource.
	self
		assert: parser usesNamespaces;
		assert: (parser usesNamespaces: false) == parser;
		deny: parser usesNamespaces;
		assert: (parser usesNamespaces: true) == parser;
		assert: parser usesNamespaces.
]

{ #category : #tests }
SAXHandlerTest >> testXMLVersionEncodingStandalone [
	| selectors |

	selectors :=
		#(startDocument
			xmlVersion:encoding:standalone:
			startElement:prefix:uri:localName:attributes:
			endElement:prefix:uri:localName:
			endDocument).
	#('<?xml version="1.0" encoding="UTF-8"?><test/>'
		'<?xml version="1.00" encoding="UTF-8"?><test/>'
		'<?xml version="1.000" encoding="UTF-8"?><test/>'
		'<?xml version="1.1" encoding="UTF-8"?><test/>'
		'<?xml version="1.10" encoding="UTF-8"?><test/>'
		'<?xml version="1.100" encoding="UTF-8"?><test/>'
		'<?xml version="1.0" encoding="UTF-16"?><test/>'
		'<?xml version="1.0" encoding="Latin-1"?><test/>'
		'<?xml version="1.0" encoding="UTF-8" standalone="no"?><test/>'
		'<?xml version="1.0" encoding="UTF-8" standalone="yes"?><test/>')
		with:
			#(#(1.0 'UTF-8' false)
				#(1.0 'UTF-8' false)
				#(1.0 'UTF-8' false)
				#(1.1 'UTF-8' false)
				#(1.1 'UTF-8' false)
				#(1.1 'UTF-8' false)
				#(1.0 'UTF-16' false)
				#(1.0 'Latin-1' false)
				#(1.0 'UTF-8' false)
				#(1.0 'UTF-8' true))
		do: [:source :arguments | | parser |
			(parser := SAXRecordingPrefixURILocalNameHandler on: source)
				parseDocument.
			self
				assert: (parser wasSentSelectors: selectors);
				assert:
					(parser argumentsSentWith: #xmlVersion:encoding:standalone:) =
						arguments].
]
