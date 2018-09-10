Class {
	#name : #XMLParserTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #source }
XMLParserTest class >> addressBookNamespacePrefixedXML [
	"
	| xmlWithPrefixes |

	xmlWithPrefixes := self addressBookNamespacedXML.
	#('<addressbook' '</addressbook' '<person' '</person' 'family-name=' 'first-name=')
		with: #('<book:addressbook' '</book:addressbook' '<ps:person' '</ps:person' 'ps:family-name=' 'ps:first-name=')
		do: [:source :replacement |
			xmlWithPrefixes := xmlWithPrefixes copyReplaceAll: source with: replacement].
	^ xmlWithPrefixes.
	"

	^  '<book:addressbook xmlns=''defaultNS'' xmlns:book=''bookNS'' xmlns:ps=''personNS''>
  <ps:person employee-number="A0000" ps:family-name="Gates" ps:first-name="Bob">
    <contact-info><!--Confidential--></contact-info>
    <address city="Los Angeles" number="1239" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Manager"/>
    <manager employee-number="A0000"/>
  </ps:person>
  <ps:person employee-number="A7000" ps:family-name="Brown"
    ps:first-name="Robert" middle-initial="L.">
    <contact-info>
      <email address="robb@iro.ibm.com"/>
      <home-phone number="03-3987873"/>
    </contact-info>
    <address city="New York" number="344" state="NY" street="118 St."/>
    <job-info employee-type="Full-Time" is-manager="yes" job-description="Group Leader"/>
    <manager employee-number="A0000"/>
  </ps:person>
  <ps:person employee-number="A7890" ps:family-name="DePaiva"
    ps:first-name="Kassie" middle-initial="W.">
    <contact-info><!-- Kassie''s agent phone: 03-987654 --></contact-info>
    <address city="Los Angeles" number="1234" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Actor"/>
    <manager employee-number="A0000"/>
    <misc-info>One of the most talented actresses on Daytime. Kassie
      plays the devious and beautiful Blair Cramer on ABC&apos;s
      &quot;One Life To Live.&quot;</misc-info>
  </ps:person>
  <ps:person employee-number="A7987" ps:family-name="Smith" ps:first-name="Joe">
    <contact-info>
      <email address="joes@iro.ibm.com"/>
      <mobile-phone number="888-7657765"/>
      <home-phone number="03-8767898"/>
      <home-phone number="03-8767871"/>
    </contact-info>
    <address city="New York" number="12789" state="NY" street="W. 15th Ave."/>
    <job-info employee-type="Part-Time" is-manager="no" job-description="Hacker"/>
    <manager employee-number="A7000"/>
  </ps:person>
</book:addressbook>
'
]

{ #category : #source }
XMLParserTest class >> addressBookNamespacedXML [
	"
	^ '<addressbook xmlns=''defaultNS'' xmlns:book=''bookNS'' xmlns:ps=''personNS''>',
		(self addressBookXML copyAfter: $>)
	"

	^ '<addressbook xmlns=''defaultNS'' xmlns:book=''bookNS'' xmlns:ps=''personNS''>
  <person employee-number="A0000" family-name="Gates" first-name="Bob">
    <contact-info><!--Confidential--></contact-info>
    <address city="Los Angeles" number="1239" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Manager"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7000" family-name="Brown"
    first-name="Robert" middle-initial="L.">
    <contact-info>
      <email address="robb@iro.ibm.com"/>
      <home-phone number="03-3987873"/>
    </contact-info>
    <address city="New York" number="344" state="NY" street="118 St."/>
    <job-info employee-type="Full-Time" is-manager="yes" job-description="Group Leader"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7890" family-name="DePaiva"
    first-name="Kassie" middle-initial="W.">
    <contact-info><!-- Kassie''s agent phone: 03-987654 --></contact-info>
    <address city="Los Angeles" number="1234" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Actor"/>
    <manager employee-number="A0000"/>
    <misc-info>One of the most talented actresses on Daytime. Kassie
      plays the devious and beautiful Blair Cramer on ABC&apos;s
      &quot;One Life To Live.&quot;</misc-info>
  </person>
  <person employee-number="A7987" family-name="Smith" first-name="Joe">
    <contact-info>
      <email address="joes@iro.ibm.com"/>
      <mobile-phone number="888-7657765"/>
      <home-phone number="03-8767898"/>
      <home-phone number="03-8767871"/>
    </contact-info>
    <address city="New York" number="12789" state="NY" street="W. 15th Ave."/>
    <job-info employee-type="Part-Time" is-manager="no" job-description="Hacker"/>
    <manager employee-number="A7000"/>
  </person>
</addressbook>
'
]

{ #category : #source }
XMLParserTest class >> addressBookXML [
	^'<addressbook>
  <person employee-number="A0000" family-name="Gates" first-name="Bob">
    <contact-info><!--Confidential--></contact-info>
    <address city="Los Angeles" number="1239" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Manager"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7000" family-name="Brown"
    first-name="Robert" middle-initial="L.">
    <contact-info>
      <email address="robb@iro.ibm.com"/>
      <home-phone number="03-3987873"/>
    </contact-info>
    <address city="New York" number="344" state="NY" street="118 St."/>
    <job-info employee-type="Full-Time" is-manager="yes" job-description="Group Leader"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7890" family-name="DePaiva"
    first-name="Kassie" middle-initial="W.">
    <contact-info><!-- Kassie''s agent phone: 03-987654 --></contact-info>
    <address city="Los Angeles" number="1234" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Actor"/>
    <manager employee-number="A0000"/>
    <misc-info>One of the most talented actresses on Daytime. Kassie
      plays the devious and beautiful Blair Cramer on ABC&apos;s
      &quot;One Life To Live.&quot;</misc-info>
  </person>
  <person employee-number="A7987" family-name="Smith" first-name="Joe">
    <contact-info>
      <email address="joes@iro.ibm.com"/>
      <mobile-phone number="888-7657765"/>
      <home-phone number="03-8767898"/>
      <home-phone number="03-8767871"/>
    </contact-info>
    <address city="New York" number="12789" state="NY" street="W. 15th Ave."/>
    <job-info employee-type="Part-Time" is-manager="no" job-description="Hacker"/>
    <manager employee-number="A7000"/>
  </person>
</addressbook>
'
]

{ #category : #source }
XMLParserTest class >> addressBookXMLWithDTD [
	^'<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE addressbook SYSTEM "addressbook.dtd">
<?xml-stylesheet type="text/xsl" href="demo.xsl"?>
<addressbook>
  <person employee-number="A0000" family-name="Gates" first-name="Bob">
    <contact-info><!--Confidential--></contact-info>
    <address city="Los Angeles" number="1239" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Manager"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7000" family-name="Brown"
    first-name="Robert" middle-initial="L.">
    <contact-info>
      <email address="robb@iro.ibm.com"/>
      <home-phone number="03-3987873"/>
    </contact-info>
    <address city="New York" number="344" state="NY" street="118 St."/>
    <job-info employee-type="Full-Time" is-manager="yes" job-description="Group Leader"/>
    <manager employee-number="A0000"/>
  </person>
  <person employee-number="A7890" family-name="DePaiva"
    first-name="Kassie" middle-initial="W.">
    <contact-info><!-- Kassie''s agent phone: 03-987654 --></contact-info>
    <address city="Los Angeles" number="1234" state="CA" street="Pine Rd."/>
    <job-info employee-type="Full-Time" is-manager="no" job-description="Actor"/>
    <manager employee-number="A0000"/>
    <misc-info>One of the most talented actresses on Daytime. Kassie
      plays the devious and beautiful Blair Cramer on ABC&apos;s
      &quot;One Life To Live.&quot;</misc-info>
  </person>
  <person employee-number="A7987" family-name="Smith" first-name="Joe">
    <contact-info>
      <email address="joes@iro.ibm.com"/>
      <mobile-phone number="888-7657765"/>
      <home-phone number="03-8767898"/>
      <home-phone number="03-8767871"/>
    </contact-info>
    <address city="New York" number="12789" state="NY" street="W. 15th Ave."/>
    <job-info employee-type="Part-Time" is-manager="no" job-description="Hacker"/>
    <manager employee-number="A7000"/>
  </person>
</addressbook>
'
]

{ #category : #source }
XMLParserTest class >> internalSubsetXMLWithDeclarations [
	^ '<!DOCTYPE root PUBLIC "pubid" "external.dtd" [
			<!ELEMENT root ( #PCDATA | one | two)* >
			<!ATTLIST root
						name CDATA #IMPLIED
						number ( one | two | three ) "three">
			<!ENTITY general "replacement">
			<!ENTITY externalGeneral PUBLIC "pubid2" "external1.dtd">
			<!ENTITY % parameter "replacement">
			<!ENTITY % externalParameter SYSTEM "external2.dtd">
			<!NOTATION notation SYSTEM "note.doc">
		]>
		<root>test</root>'
]

{ #category : #source }
XMLParserTest >> addressBookNamespacePrefixedXML [
	^ self class addressBookNamespacePrefixedXML
]

{ #category : #source }
XMLParserTest >> addressBookNamespacedXML [
	^ self class addressBookNamespacedXML
]

{ #category : #source }
XMLParserTest >> addressBookXML [
	^ self class addressBookXML
]

{ #category : #source }
XMLParserTest >> addressBookXMLWithDTD [
	^ self class addressBookXMLWithDTD
]

{ #category : #accessing }
XMLParserTest >> badNameAttributeListValues [
	^ self badNameAttributeValues reject: [:badNameAttributeValue |
		badNameAttributeValue allSatisfy: [:each | each isXMLWhitespace]]
]

{ #category : #accessing }
XMLParserTest >> badNameAttributeValues [
	^ self badNames reject: [:badName |
		(badName includes: $<)
			or: [badName anySatisfy: [:each | each isXMLChar not]]]
]

{ #category : #accessing }
XMLParserTest >> badNames [
	^ XMLStringMethodsTest badNames
]

{ #category : #accessing }
XMLParserTest >> badNmtokenAttributeListValues [
	^ self badNmtokenAttributeValues reject: [:badNmtokenAttributeValue |
		badNmtokenAttributeValue allSatisfy: [:each | each isXMLWhitespace]]
]

{ #category : #accessing }
XMLParserTest >> badNmtokenAttributeValues [
	^ self badNmtokens reject: [:badName |
		(badName includes: $<)
			or: [badName anySatisfy: [:each | each isXMLChar not]]]
]

{ #category : #accessing }
XMLParserTest >> badNmtokens [
	^ XMLStringMethodsTest badNmtokens
]

{ #category : #benchmark }
XMLParserTest >> benchmark1 [
	"
	XMLParserTest new benchmark1
	600 timesRepeat => 2131 (Alexandre Bergel 3/29/2010 09:09)
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [SAXHandler parse: self addressBookXML]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark2 [
	"
	XMLParserTest new benchmark2
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [XMLDOMParser parse: self addressBookXML]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark3 [
	"
	XMLParserTest new benchmark3
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [XMLDOMParser parse: self addressBookXMLWithDTD]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark4 [
	| doc |
	"
	XMLParserTest new benchmark4
	"
	doc := XMLDOMParser
		parse: self addressBookXML readStream
		usingNamespaces: false.
	^ [500000 timesRepeat: [
		doc root firstElement
			elementAt: 'contact-info';
			elementAt: 'address';
			elementAt: 'job-info';
			elementAt: 'manager']] timeToRun.
]

{ #category : #benchmark }
XMLParserTest >> benchmark5 [
	"
	XMLParserTest new benchmark5
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [XMLDOMParser parse: self addressBookNamespacedXML]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark6 [
	"
	XMLParserTest new benchmark6
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [XMLDOMParser parse: self addressBookNamespacePrefixedXML]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark7 [
	"
	XMLParserTest new benchmark7
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [SAX2Parser parse: self addressBookXML]] timeToRun
]

{ #category : #benchmark }
XMLParserTest >> benchmark8 [
	"
	XMLParserTest new benchmark8
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [SAX2ElementParser parse: self addressBookXML]] timeToRun
]

{ #category : #source }
XMLParserTest >> elementDeclarationsNamed: aNameCollection [
	| stream |

	stream := String new writeStream.
	aNameCollection do: [:each |
		stream
			nextPutAll: '<!ELEMENT ';
			nextPutAll: each;
			nextPutAll: ' EMPTY>';
			cr].
	^ stream contents.
]

{ #category : #source }
XMLParserTest >> internalSubsetXMLWithDeclarations [
	^ self class internalSubsetXMLWithDeclarations
]

{ #category : #accessing }
XMLParserTest >> nonChars [
	^ XMLCharacterMethodsTest nonChars
]

{ #category : #tests }
XMLParserTest >> testAttributeBadName [
	self badNames do: [:each |
		self
			should: [SAXHandler parse: '<test ', each, '="value"/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationEntities [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!NOTATION first SYSTEM "first.txt">
			<!NOTATION second SYSTEM "second.txt">
			<!ENTITY firstEntity SYSTEM "first.txt" NDATA first>
			<!ENTITY secondEntity SYSTEM "second.txt" NDATA second>
			<!ELEMENT root EMPTY>
			<!ATTLIST root unparsedEntities ENTITIES #IMPLIED>
		]>'.
	#('<root unparsedEntities="firstEntity" />'
		'<root unparsedEntities=" secondEntity " />'
		'<root unparsedEntities="firstEntity secondEntity" />'
		'<root unparsedEntities=" firstEntity secondEntity " />')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root unparsedEntities="firstEntity secondEntity thirdEntity" />'
		'<root unparsedEntities="thirdEntity" />'
		'<root unparsedEntities="" />')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationEntity [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!NOTATION first SYSTEM "first.txt">
			<!NOTATION second SYSTEM "second.txt">
			<!ENTITY firstEntity SYSTEM "first.txt" NDATA first>
			<!ENTITY secondEntity SYSTEM "second.txt" NDATA second>
			<!ELEMENT root EMPTY>
			<!ATTLIST root unparsedEntity ENTITY #IMPLIED>
		]>'.
	#('<root unparsedEntity="firstEntity" />'
		'<root unparsedEntity=" secondEntity " />')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root unparsedEntity="thirdEntity" />'
		'<root unparsedEntity="" />')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationEnumeration [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root ANY>
			<!ATTLIST root number ( one | two | three) #IMPLIED>
		]>'.
	#('one'
		'two'
		'three'
		'  one  '
		'		two 	'
		'
		three
		') do: [:each |
		self
			shouldnt: [SAXHandler parse: dtd, '<root number="', each, '"/>']
			raise: XMLValidationException].

	#('<root number="four"/>'
		'<root number=""/>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationEnumerationValueRedundance [
	| xml |

	xml := '
		<!DOCTYPE root [
			<!ELEMENT root ANY>
			<!ATTLIST root number ( one | two | one ) #IMPLIED>
		]><root/>'.
	self
		should: [SAXHandler parse: xml]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationID [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root (unique|unique2)+>
			<!ELEMENT unique EMPTY>
			<!ELEMENT unique2 EMPTY>
			<!ATTLIST unique id ID #REQUIRED>
			<!ATTLIST unique2 id ID #IMPLIED>
		]>'.
	self
		shouldnt: [
			SAXHandler parse:
				dtd,
				'<root>
					<unique id=" one "/><unique id="two"/>
					<unique2 id="three"/>
				</root>']
		raise: XMLValidationException.

	#('<root><unique id="one"/><unique id=" one "/><unique2 id="three"/></root>'
		'<root><unique id="one"/><unique id="two"/><unique2 id=" one "/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].

	"ID attributes can't have defaults values or #FIXED defaults
	and must be #REQUIRED or #IMPLIED"
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ELEMENT root ANY>
					<!ELEMENT unique EMPTY>
					<!ATTLIST unique id ID #FIXED "one">]>
					<root/>']
		raise: XMLValidationException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ELEMENT root ANY>
					<!ELEMENT unique EMPTY>
					<!ATTLIST unique id ID "one">]>
					<root/>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationIDRef [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root (unique|ref)+>
			<!ELEMENT unique EMPTY>
			<!ELEMENT ref EMPTY>
			<!ELEMENT refs EMPTY>
			<!ATTLIST unique id ID #REQUIRED>
			<!ATTLIST ref idref IDREF #REQUIRED>
		]>'.
	self
		shouldnt: [
			SAXHandler parse:
				dtd, '
				<root>
					<unique id=" one "/><ref idref="one"/>
					<ref idref=" two "/><unique id="two"/>
				</root>']
		raise: XMLValidationException.

	#('<root><unique id="one"/><ref idref="two"/></root>'
		'<root><ref idref="one"/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationIDRefs [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root (unique|ref)+>
			<!ELEMENT unique EMPTY>
			<!ELEMENT ref EMPTY>
			<!ELEMENT refs EMPTY>
			<!ATTLIST unique id ID #REQUIRED>
			<!ATTLIST ref idrefs IDREFS #REQUIRED>
		]>'.
	self
		shouldnt: [
			SAXHandler parse:
				dtd, '
				<root>
					<unique id=" one "/><ref idrefs="one"/>
					<ref idrefs=" two "/><ref idrefs="one two"/>
					<ref idrefs=" two one "/><unique id="two"/>
				</root>']
		raise: XMLValidationException.

	#('<root><unique id="one"/><ref idrefs="one two"/></root>'
		'<root><ref idrefs="one"/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNmtoken [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root ANY>
			<!ATTLIST root name NMTOKEN #IMPLIED>
		]>'.
	#('<root name="one"/>'
		'<root name=" two "/>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root name="one two three"/>'
		'<root name="one#"/>'
		'<root name="#"/>'
		'<root name=""/>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNmtokens [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root ANY>
			<!ATTLIST root names NMTOKENS #IMPLIED>
		]>'.
	#('<root names="one"/>'
		'<root names="one two three"/>'
		'<root names=" one "/>'
		'<root names=" one two three "/>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root names="one two three#"/>'
		'<root names="one#"/>'
		'<root names="#"/>'
		'<root names=""/>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNotation [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!NOTATION txtFile PUBLIC "//file.txt//">
			<!NOTATION confFile PUBLIC "//file.conf//">
			<!ELEMENT root ANY>
			<!ATTLIST root note NOTATION (txtFile | confFile ) #IMPLIED>
		]>'.
	#('txtFile' 'confFile' ' 	txtFile ' '
		confFile 	')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, '<root note="', each, '"/>']
				raise: XMLValidationException].

	#('<root note="htmlFile" />'
		'<root note="" />')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNotationDeclared [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!NOTATION txtFile PUBLIC "//file.txt//">
			<!NOTATION confFile PUBLIC "//file.conf//">
			<!ELEMENT root ANY>
			<!ATTLIST root note NOTATION {1} #IMPLIED>
		]><root note="txtFile"/>'.

	"event if the value used in the attribute is declared, all values
	in the NOTATION enumeration list must be declared too"
	#('(txtFile | htmlFile)' '(zipFile)' '(htmlFile | confFile)')
		do: [:each | | xml |
			xml := xmlTemplate format: (Array with: each).
			self
				should: [SAXHandler parse: xml]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNotationRedundance [
	"only one notation attribute is allowed per element"
	| xml |

	xml := '
		<!DOCTYPE root [
			<!NOTATION txtFile PUBLIC "//file.txt//">
			<!NOTATION confFile PUBLIC "//file.conf//">
			<!NOTATION txtFile2 PUBLIC "//file.txt//">
			<!NOTATION confFile2 PUBLIC "//file.conf//">
			<!ELEMENT root ANY>
			<!ATTLIST root
				note NOTATION (txtFile | confFile) #IMPLIED
				note2 NOTATION (txtFile2 | confFile2) #IMPLIED>
		]><root/>'.
	self
		should: [SAXHandler parse: xml]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationNotationValueRedundance [
	| xml |

	xml := '
		<!DOCTYPE root [
			<!NOTATION txtFile PUBLIC "//file.txt//">
			<!NOTATION confFile PUBLIC "//file.conf//">
			<!ELEMENT root ANY>
			<!ATTLIST root
				note NOTATION (txtFile | confFile | txtFile) #IMPLIED>
		]><root/>'.
	self
		should: [SAXHandler parse: xml]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationPrefixed [
	| dtd |

	dtd := '<!DOCTYPE root [
		<!ELEMENT root EMPTY>
		<!ATTLIST root
			xmlns:prefix CDATA #IMPLIED
			prefix:name CDATA #IMPLIED
			unprefixed CDATA #IMPLIED>
		]>'.

	#('<root xmlns:prefix="prefixNS" prefix:name="value" unprefixed="value"/>'
		'<root xmlns:prefix="prefixNS" prefix:name="value" />'
		'<root unprefixed="value" />'
		'<root/>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	"valid, but a namespace exception"
	self
		should: [SAXHandler parse: dtd, '<root prefix:name="value"/>']
		raise: XMLNamespaceException.
	self
		shouldnt: [
			(SAXHandler on: dtd, '<root prefix:name="value"/>')
				usesNamespaces: false;
				parseDocument]
		raise: XMLNamespaceException.

	#('<root xmlns:prefix="prefixNS" prefix:name="value" prefix:unprefixed="value"/>'
		'<root name="value" unprefixed="value" />')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationPrefixedDefault [
	| dtd |

	dtd := '<!DOCTYPE root [
		<!ELEMENT root EMPTY>
		<!ATTLIST root
			xmlns:prefix CDATA #FIXED "prefixNS"
			prefix:name CDATA "value"
			unprefixed CDATA "value">
		]>'.

	#('<root xmlns:prefix="prefixNS" prefix:name="value" unprefixed="value"/>'
		'<root prefix:name="value" unprefixed="value"/>'
		'<root xmlns:prefix="prefixNS" />'
		'<root prefix:name="value"/>'
		'<root unprefixed="value"/>'
		'<root/>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root name="value" />'
		'<root xmlns:prefix="newPrefixNS" />'
		'<root prefix:unprefixed="value" />')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationRedundance [
	"additional declarations for the same attribute are ignored"

	| dtd resolver |

	dtd := '
		<!DOCTYPE root SYSTEM "extern.dtd" [
			<!ELEMENT root EMPTY>
			<!ATTLIST root redundant CDATA #IMPLIED>
			<!ATTLIST root redundant IDREF #FIXED "two">
		]>'.
	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'extern.dtd'
		put: '<!ATTLIST root redundant ENTITY #REQUIRED>'.
	#('<root redundant="one"/>'
		'<root/>')
		do: [:each |
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						externalEntityResolver: resolver;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDeclarationWhitespace [
	#('<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLISTtest name (value) #FIXED "value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name(value) #FIXED "value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name (value)#FIXED "value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name (value) #FIXED"value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name (value) #FIXED "value"name2
			(value) #FIXED "value">]>')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
	#('<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST   test   name  ( value )  #FIXED  "value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test
				name (value) #FIXED "value"
				name2 (value) #FIXED "value">]>'
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST   test   >]>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultFixedValue [
	| dtd document root |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				one CDATA #FIXED "fixedDefault"
				one CDATA #FIXED "redundant"
				two IDREF #FIXED "fixedDefaultTwo"
				three CDATA #FIXED ""
				four ID #REQUIRED >
		]>'.

	#(true false) do: [:isValidating |
		document :=
			(XMLDOMParser on:
				dtd,
				'<root ',
				'	one=''fixedDefault'' ',
				'	two=" fixedDefaultTwo  " ',
				'	three="" ',
				'four="fixedDefaultTwo"/>')
				isValidating: isValidating;
				parseDocument.
		root := document root.
		self
			assert: (root attributeAt: 'one') = 'fixedDefault';
			assert: (root attributeAt: 'two') = 'fixedDefaultTwo';
			assert: (root includesAttribute: 'three');
			assert: (root attributeAt: 'three') = '';
			assert: (root attributeAt: 'four') = 'fixedDefaultTwo'.

		"attributes with fixed defaults are set automatically if not present"
		document :=
			(XMLDOMParser on: dtd, '<root four="fixedDefaultTwo"/>')
				isValidating: isValidating;
				parseDocument.
		root := document root.
		self
			assert: (root attributeAt: 'one') = 'fixedDefault';
			assert: (root attributeAt: 'two') = 'fixedDefaultTwo';
			assert: (root includesAttribute: 'three');
			assert: (root attributeAt: 'three') = ''].

	"but if present cannot have non-default values"
	#('one' 'two' 'three')
		with: #('fixedDefault' 'fixedDefaultTwo' '')
		do: [:name :fixedDefault | | xml |
			xml := dtd, '<root ', name, '="nonDefault"/>'.
			self
				should: [SAXHandler parse: xml]
				raise: XMLValidationException.
			self
				shouldnt: [
					document :=
						(XMLDOMParser on: xml)
							isValidating: false;
							parseDocument]
				raise: XMLValidationException.
			root := document root.
			self
				assert: (root attributeAt: 'one') = 'fixedDefault';
				assert: (root attributeAt: 'two') = 'fixedDefaultTwo';
				assert: (root includesAttribute: 'three');
				assert: (root attributeAt: 'three') = ''].
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultFixedValueEntityReference [
	"tests that general entities referenced in attribute declaration #FIXED
	default values were declared before the declaration is parsed"

	#('<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one CDATA #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		"no ID test because they can't have default values, but IDREF/IDREFS can"
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one IDREF #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two ID #REQUIRED>'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one IDREFS #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two ID #REQUIRED>'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION note PUBLIC "note.txt">
			<!ENTITY value PUBLIC "note.txt" "note.txt" NDATA note>
			<!ATTLIST one one ENTITY #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION note PUBLIC "note.txt">
			<!ENTITY value PUBLIC "note.txt" "note.txt" NDATA note>
			<!ATTLIST one one ENTITIES #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one NMTOKEN #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one NMTOKENS #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one (value) #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION value PUBLIC "note.txt">
			<!ATTLIST one one NOTATION (value) #FIXED "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">')
	do: [:each | | badSubset goodSubset badContent goodContent document|
		"the 'undeclared' entity declaration must come before
		the rest of the subset for it to be OK"
		badSubset := each, '<!ENTITY undeclared "value">'.
		goodSubset := '<!ENTITY undeclared "value">', each.
		badContent :=
			'<root>
				<one one="otherValue"/><!--override the #FIXED default value-->
				<two two="value"/><!--don''t override the #FIXED default value-->
			</root>'.
		goodContent :=
			'<root>
				<one/><!--inherit the #FIXED default value-->
				<two two="value"/><!--don''t override the #FIXED default value-->
			</root>'.

		self
			should: [
				SAXHandler parse: '<!DOCTYPE root [', badSubset, ']>', goodContent]
			raise: XMLWellFormednessException.
		self
			should: [
				(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd">', goodContent)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(Array with: 'extern.dtd' -> badSubset));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLValidationException.

		self
			shouldnt: [
				document :=
					(XMLDOMParser on:
						'<!DOCTYPE root SYSTEM "extern.dtd">', goodContent)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> badSubset));
						resolvesExternalEntities: true;
						isValidating: false;
						parseDocument]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = '';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value'.

		self
			shouldnt: [
				document :=
					XMLDOMParser parse:
						'<!DOCTYPE root [', goodSubset, ']>', goodContent]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = 'value';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value'.

		self
			shouldnt: [
				document :=
					(XMLDOMParser on:
						'<!DOCTYPE root SYSTEM "extern.dtd">', goodContent)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> goodSubset));
						resolvesExternalEntities: true;
						parseDocument]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = 'value';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value'.

		"#FIXED default values cannot be changed"
		self
			should: [SAXHandler parse: '<!DOCTYPE root [', goodSubset, ']>', badContent]
			raise: XMLValidationException.
		self
			should: [
				(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd">', badContent)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(Array with: 'extern.dtd' -> goodSubset));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLValidationException.

		"...unless validation is off"
		self
			shouldnt: [
				(SAXHandler on: '<!DOCTYPE root [', goodSubset, ']>', badContent)
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd">', badContent)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(Array with: 'extern.dtd' -> goodSubset));
					resolvesExternalEntities: true;
					isValidating: false;
					parseDocument]
			raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultImplied [
	| dtd document root |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				one CDATA #IMPLIED
				one CDATA #REQUIRED
				two CDATA #IMPLIED >
		]>'.

	document :=
		XMLDOMParser parse:
			dtd, '<root one=''nonDefault'' two="nonDefaultTwo" />'.
	root := document root.
	self
		assert: (root attributeAt: 'one') = 'nonDefault';
		assert: (root attributeAt: 'two') = 'nonDefaultTwo'.

	document := XMLDOMParser parse: dtd, '<root one='''' two="" />'.
	root := document root.
	self
		assert: (root includesAttribute: 'one');
		assert: (root attributeAt: 'one') = '';
		assert: (root includesAttribute: 'two');
		assert: (root attributeAt: 'two') = ''.

	"implied makes them optional"
	document := XMLDOMParser parse: dtd, '<root />'.
	root := document root.
	self
		deny: (root includesAttribute: 'one');
		deny: (root includesAttribute: 'two').
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultRequired [
	| dtd document root |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				one CDATA #REQUIRED
				one CDATA #IMPLIED
				two CDATA #REQUIRED >
		]>'.

	document :=
		XMLDOMParser parse:
			dtd, '<root one=''nonDefault'' two="nonDefaultTwo" />'.
	root := document root.
	self
		assert: (root attributeAt: 'one') = 'nonDefault';
		assert: (root attributeAt: 'two') = 'nonDefaultTwo'.

	"empty values still count as being present"
	document := XMLDOMParser parse: dtd, '<root one='''' two="" />'.
	root := document root.
	self
		assert: (root includesAttribute: 'one');
		assert: (root attributeAt: 'one') = '';
		assert: (root includesAttribute: 'two');
		assert: (root attributeAt: 'two') = ''.

	"all required attributes must be present"
	#('<root one="nonDefault" />'
		'<root two="nonDefault" />') do: [:each |
		self
			should: [SAXHandler parse: dtd, each]
			raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValue [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				one CDATA "default"
				one CDATA "redundant"
				two CDATA ""
				three NMTOKEN " defaultThree " >
		]>'.

	#(true false) do: [:isValidating | | document root |
		document :=
			(XMLDOMParser on:
				dtd,
				'<root ',
				'	one=''nonDefault'' ',
				'	two="nonDefaultTwo" ',
				'	three="nonDefaultThree"/>')
				isValidating: isValidating;
				parseDocument.
		root := document root.
		self
			assert: (root attributeAt: 'one') = 'nonDefault';
			assert: (root attributeAt: 'two') = 'nonDefaultTwo';
			assert: (root attributeAt: 'three') = 'nonDefaultThree'.

		"empty but present attributes shouldn't get the default value"
		document := XMLDOMParser parse: dtd, '<root one='''' two=""/>'.
		root := document root.
			self
				assert: (root includesAttribute: 'one');
				assert: (root attributeAt: 'one') = '';
				assert: (root includesAttribute: 'two');
				assert: (root attributeAt: 'two') = '';
				assert: (root attributeAt: 'three') = 'defaultThree'.

		"attributes with defaults are set automatically if not present"
		document := XMLDOMParser parse: dtd, '<root />'.
		root := document root.
		self
			assert: (root attributeAt: 'one') = 'default';
			assert: (root includesAttribute: 'two');
			assert: (root attributeAt: 'two') = '';
			assert: (root attributeAt: 'three') = 'defaultThree'].
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueEntities [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!NOTATION note PUBLIC "note">
			<!ENTITY one PUBLIC "one" "" NDATA note>
			<!ATTLIST root entity ENTITIES " one {1} ">
		]><root entity="one" />'.

	self badNameAttributeListValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'two'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueEntity [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!NOTATION note PUBLIC "note">
			<!ENTITY one PUBLIC "one" "" NDATA note>
			<!ATTLIST root entity ENTITY "{1}">
		]><root entity="one" />'.

	self badNameAttributeValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'one'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueEntityReference [
	"tests that general entities referenced in attribute declaration default
	values were declared before the declaration is parsed"

	#('<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one CDATA "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">'
		"no ID test because they can't have default values, but IDREF/IDREFS can"
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one IDREF "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two ID #REQUIRED>'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one IDREFS "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two ID #REQUIRED>'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION note PUBLIC "note.txt">
			<!ENTITY value PUBLIC "note.txt" "note.txt" NDATA note>
			<!ATTLIST one one ENTITY "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION note PUBLIC "note.txt">
			<!ENTITY value PUBLIC "note.txt" "note.txt" NDATA note>
			<!ATTLIST one one ENTITIES "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one NMTOKEN "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA #FIXED "value">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one NMTOKENS "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!ATTLIST one one (value) "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">'
		'<!ELEMENT root (one,two)>
			<!ELEMENT one EMPTY>
			<!NOTATION value PUBLIC "note.txt">
			<!ATTLIST one one NOTATION (value) "&undeclared;">
			<!ELEMENT two EMPTY>
			<!ATTLIST two two CDATA "otherValue">')
	do: [:each | | badSubset goodSubset content document|
		"the 'undeclared' entity declaration must come before
		the rest of the subset for it to be OK"
		badSubset := each, '<!ENTITY undeclared "value">'.
		goodSubset := '<!ENTITY undeclared "value">', each.
		content :=
			'<root>
				<one/><!--inherit the default value-->
				<two two="value"/><!--override the default value-->
			</root>'.

		self
			should: [SAXHandler parse: '<!DOCTYPE root [', badSubset, ']>', content]
			raise: XMLWellFormednessException.
		self
			should: [
				(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd">', content)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(Array with: 'extern.dtd' -> badSubset));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLValidationException.

		self
			shouldnt: [
				document :=
					(XMLDOMParser on: '<!DOCTYPE root SYSTEM "extern.dtd">', content)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> badSubset));
						resolvesExternalEntities: true;
						isValidating: false;
						parseDocument]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = '';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value'.

		self
			shouldnt: [
				document :=
					XMLDOMParser parse: '<!DOCTYPE root [', goodSubset, ']>', content]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = 'value';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value'.

		self
			shouldnt: [
				document :=
					(XMLDOMParser on: '<!DOCTYPE root SYSTEM "extern.dtd">', content)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> goodSubset));
						resolvesExternalEntities: true;
						parseDocument]
			raise: XMLValidationException.
		self
			assert: ((document root elementAt: 'one') attributeAt: 'one') = 'value';
			assert: ((document root elementAt: 'two') attributeAt: 'two') = 'value']
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueEnumeration [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root name (one|two|three) " {1} ">
		]><root name="one" />'.

	self
		should: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'four'))]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on:
				(xmlTemplate format: (Array with: 'four')))
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'one'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueIDRef [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				id ID #REQUIRED
				idref IDREF "{1}">
		]><root id="one" idref="one" />'.

	self badNameAttributeValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'one'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueIDRefs [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root
				id ID #REQUIRED
				idref IDREFS " one {1} ">
		]><root id="one" idref="one" />'.

	self badNameAttributeListValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'two'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueNmtoken [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root name NMTOKEN "{1}">
		]><root name="one" />'.

	self badNmtokenAttributeValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'one'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueNmtokens [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root name NMTOKENS " one {1} ">
		]><root name="one" />'.

	self badNmtokenAttributeListValues do: [:each |
		self
			should: [		
				SAXHandler parse:
					(xmlTemplate format: (Array with: each))]
			raise: XMLValidationException.
		self
			shouldnt: [
				(SAXHandler on:
					(xmlTemplate format: (Array with: each)))
					isValidating: false;
					parseDocument]
			raise: XMLValidationException.].
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'two'))]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueNonProcessing [
	| dtd document root |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root one CDATA "default">
			%undeclared;
			<!ATTLIST root two CDATA "defaultTwo">
		]>'.

	document :=
		(XMLDOMParser on: dtd, '<root />')
			isValidating: false;
			parseDocument.
	root := document root.
	self
		assert: root attributeNodes size = 1;
		assert: (root attributeAt: 'one') = 'default'.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueNonProcessingStandalone [
	| dtd document root |

	dtd := '<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ATTLIST root one CDATA "default">
			%undeclared;
			<!ATTLIST root two CDATA "defaultTwo">
		]>'.

	document :=
		(XMLDOMParser on: dtd, '<root />')
			isValidating: false;
			parseDocument.
	root := document root.
	self
		assert: root attributeNodes size = 2;
		assert: (root attributeAt: 'one') = 'default';
		assert: (root attributeAt: 'two') = 'defaultTwo'.
]

{ #category : #tests }
XMLParserTest >> testAttributeDefaultValueNotation [
	| xmlTemplate |

	xmlTemplate := '
		<!DOCTYPE root [
			<!NOTATION one PUBLIC "one.note">
			<!NOTATION two PUBLIC "two.note">
			<!NOTATION three PUBLIC "three.note">
			<!ELEMENT root EMPTY>
			<!ATTLIST root note NOTATION (one|two|three) " {1} ">
		]><root note="one" />'.

	self
		should: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'four'))]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				(xmlTemplate format: (Array with: 'one'))]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on:
				(xmlTemplate format: (Array with: 'four')))
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeRedundance [
	#('<test name="value" newName="newValue" name="value" />'
		'<test name="value" newName="newValue" name="newValue" />'
		'<test xml:lang="en" name="value" xml:lang="de" />')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testAttributeUndeclared [
	self
		shouldnt: [
			SAXHandler
				parse: '<!DOCTYPE root [<!ENTITY ignored "ignored">]><root name="value"/>'
				usingNamespaces:true
				validation: true]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ELEMENT root ANY>
					<!ATTLIST root name CDATA #IMPLIED>]><root name="value"></root>']
		raise: XMLValidationException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [<!ELEMENT root ANY>]><root name="value"></root>']
		raise: XMLValidationException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ELEMENT root ANY>
					<!ATTLIST root name CDATA #IMPLIED>]><root newName="value"></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeValueBadChar [
	self nonChars do: [:each |
		self
			should: [SAXHandler parse: '<test name="', each asString, '"/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testAttributeValueExternalEntityReference [
	| xmlTemplate entities xml |
	
	xmlTemplate := '
		<!DOCTYPE test [
			<!ENTITY internal "value">
			<!ENTITY external SYSTEM  "extern.ent">
			<!ENTITY interalReferencingExternal "&external;">
			<!ENTITY
				interalReferencinginteralReferencingExternal
				"&interalReferencingExternal;">
		]>
		<test name="&{1};"/>'.
	entities := Array with: 'extern.ent' -> 'value'.

	self
		shouldnt: [
			xml := xmlTemplate format: (Array with: 'internal').
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.

	#('external' 'interalReferencingExternal'
		'interalReferencinginteralReferencingExternal')
		do: [:each |
			xml := xmlTemplate format: (Array with: each).
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities: entities);
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testAttributeValueNormalization [
	| separators unnormalized normalized document |

	separators :=
		String
			with: Character space
			with: Character tab
			with: Character lf.
	unnormalized := separators, 'nonspace', separators.
	normalized := '   nonspace   '.
	document :=
		(XMLDOMParser parse:
			'<root name="', unnormalized,'">', unnormalized, '</root>').
	self
		assert: (document root attributeAt: 'name') = normalized;
		assert: (document root contentString) = unnormalized.
]

{ #category : #tests }
XMLParserTest >> testAttributeValueWithAngleBrackets [
	self
		should: [SAXHandler parse: '<test name="<test name=''value''/>"/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [SAXHandler parse: '<test name="&lt;test name=''value''/>"/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [SAXHandler parse: '<test name=''&lt;test name="value"/>''/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLBase [
	| document |

	document :=
		XMLDOMParser parse: '
			<one xml:base="a/b">
				<two xml:base="c/d">
					<three xml:base="/e/f">test</three>
					<four xml:base=""><!--resolved as inherited base--> 
						<five/><!--no base attribute-->
					</four>
				</two>
			</one>'.
	self assert:
		(document allElementsCollect: [:each | each attributeAt: 'xml:base']) asArray =
			#('a/b' 'a/c/d' '/e/f' 'a/c/d' '').

	"resolution should not cause decoding/encoding"
	document :=
		XMLDOMParser parse: '
			<one xml:base="[%61]/{%62}">
				<two xml:base="{%63}/(%64)">
					<three xml:base="/!%65!/|%66|">test</three>
				</two>
			</one>'.
	self assert:
		(document allElementsCollect: [:each | each attributeAt: 'xml:base']) asArray =
			#('[%61]/{%62}' '[%61]/{%63}/(%64)' '/!%65!/|%66|').

	document :=
		XMLDOMParser
			parse:
				'<one xml:base=""><!--resolved as inherited base-->
					<two/><!--no base attribute-->
				</one>'
			documentURI: 'doc.xml'.
	self assert: (document root attributeAt: 'xml:base') = 'doc.xml'.
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLIDDTDValidation [
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE one [
					<!ELEMENT one ANY>
					<!ELEMENT two ANY>
					<!ATTLIST one xml:id ID #IMPLIED>
					<!ATTLIST two xml:id ID #IMPLIED>]>
				<one xml:id="validOne">
					<two xml:id="validTwo"/>
				</one>']
		raise: XMLValidationException.

	#('<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ATTLIST one xml:id CDATA #IMPLIED>]>
		<one/>'
		'<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ATTLIST one
				xml:id ID #IMPLIED
				id ID #IMPLIED>]>
		<one/>'
		'<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ATTLIST one
				id ID #IMPLIED
				xml:id ID #IMPLIED>]>
		<one/>'
		'<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ATTLIST one xml:id ID #IMPLIED>]>
		<one xml:id="invalid:id"/>'
		'<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ELEMENT two ANY>
			<!ATTLIST one xml:id ID #IMPLIED>
			<!ATTLIST two xml:id ID #IMPLIED>]>
		<one xml:id="duplicate">
			<two xml:id="duplicate"/>
		</one>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLIDValidation [
	| xml xmlWithDuplicateID |

	xml := '<a xml:id="one"><b xml:id="two"/></a>'.
	xmlWithDuplicateID := '<a xml:id="one"><b xml:id="one"/></a>'.
	self
		shouldnt: [SAXHandler parse: xml]
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: xmlWithDuplicateID]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: xmlWithDuplicateID)
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLReserved [
	| xml document element |

	xml := '<a xml="one" xmll="two" xml:="three" xmlnss="four"></a>'.
	document := XMLDOMParser parse: xml usingNamespaces: true.
	element := document root.
	self
		assert: element attributes size = 4;
		assert: (element attributeAt: 'xml') = 'one';
		assert: (element attributeAt: 'xmll') = 'two';
		assert: (element attributeAt: 'xml:') = 'three';
		assert: (element attributeAt: 'xmlnss') = 'four'.
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLReservedNamespaces [
	| xml xmlWithDuplicateID document element |

	xml :=
		'<test
			xml:id="test"
			xmlns="defaultNS"
			xmlns:test="testNS"
			xname="xvalue"/>'.
	document := XMLDOMParser parse: xml.
	element := document root.
	self
		assert: element namespaceScope mappedPrefixes size = 2;
		assert: element namespaceURI = 'defaultNS';
		assert: (element declaresPrefix: '' uri: 'defaultNS');
		assert: (element declaresPrefix: 'test' uri: 'testNS');
		assert: element attributes size = 2;
		assert: (element attributeAt: 'xml:id') = 'test';
		assert: (element attributeAt: 'xname') = 'xvalue'.

	document :=
		XMLDOMParser
			parse: xml
			usingNamespaces: false.
	element := document root.
	self
		deny: element hasNamespaces;
		assert: element attributes size = 4;
		assert: (element attributeAt: 'xml:id') = 'test';
		assert: (element attributeAt: 'xmlns') = 'defaultNS';
		assert: (element attributeAt: 'xmlns:test') = 'testNS';
		assert: (element attributeAt: 'xname') = 'xvalue'.

	"test that reserved attributes are still processed when namespaces
	are present by triggering an xml:id duplicate validation exception"
	xmlWithDuplicateID := '<test xml:id="test">', xml, '<test/>'.
	self
		should: [SAXHandler parse: xmlWithDuplicateID]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testAttributeXMLSpaceValidation [
	"xml:space must be declared an enumeration type with only 'default' and
	'preserve' as allowed values"
	| xmlTemplate xml |

	xmlTemplate := '
		<!DOCTYPE whitespace [
			<!ELEMENT whitespace EMPTY>
			<!ATTLIST whitespace xml:space {1} #IMPLIED>
		]>
		<whitespace></whitespace>'.
	#('CDATA'
		'ID'
		'IDREF'
		'IDREFS'
		'ENTITY'
		'ENTITIES'
		'(default|preserve|other)'
		'(default|preserve|default)'
		'NOTATION (default|preserve)')
		do: [:each |
			xml := xmlTemplate format: (Array with: each).
			self
				should: [SAXHandler parse: xml]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].

	#('(default|preserve)' '(preserve|default)' '(default)' '(preserve)')
		do: [:each |
			xml := xmlTemplate format: (Array with: each).
			self
				shouldnt: [SAXHandler parse: xml]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testCDataBadChar [
	self nonChars do: [:each |
		self
			should: [SAXHandler parse: '<test><![CDATA[', each asString, ']]>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testCDataOutsideElement [
	#('<!DOCTYPE test [ <![CDATA[test]]> ]><test/>'
		'<![CDATA[test]]><test/>'
		'	<![CDATA[test]]><test/>'
		'<test/><![CDATA[test]]>'
		'<test/>	<![CDATA[test]]>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testCDataSectionUnterminated [
	#('<test><!['
		'<test><![</test>'
		'<test><![CDATA['
		'<test><![CDATA[</test>'
		'<test><![CDATA[ test'
		'<test><![CDATA[ test</test>'
		'<test><![CDATA[ test ]'
		'<test><![CDATA[ test ]</test>'
		'<test><![CDATA[ test ]]'
		'<test><![CDATA[ test ]]</test>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testCharacterReferenceUnexpected [
	#('<!DOCTYPE test [&#32;]><test/>'
		'&#32;<test/>'
		'<test/>&#32;')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [
					(SAXHandler on: each)
						replacesContentEntityReferences: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testCharacterReferenceUnterminated [
	#('<test>&#'
		'<test>&#</test>'
		'<test>&#x'
		'<test>&#x</test>'
		'<test>&#34'
		'<test>&#34</test>'
		'<test>&#x22'
		'<test>&#x22</test>'
		'<test>&#;'
		'<test>&#;</test>'
		'<test>&#x;'
		'<test>&#x;</test>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [
					(SAXHandler on: each)
						replacesContentEntityReferences: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testComment [
	self
		shouldnt: [SAXHandler parse: '<test><!-- <comment/> - - --></test>']
		raise: XMLWellFormednessException.
	"can't contain --"
	self
		should: [SAXHandler parse: '<test><!-- <comment/> -- --></test>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testCommentBadChar [
	self nonChars do: [:each |
		self
			should: [SAXHandler parse: '<!--', each asString, '-->']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testCommentUnterminated [
	#('<!--' '<!-- comment' '<!-- comment -' '<!-- comment --')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: '<test/>', each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: '<test>', each, '<test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionInInternalSubset [
	#('<![INCLUDE[ <!-- comment --> ]]>'
		'<![IGNORE[ <!-- comment --> ]]>'
		'<!ENTITY % include "INCLUDE"> <![%include;[ <!-- comment --> ]]>'
		'<!ENTITY % ignore "IGNORE"> <![%ignore;[ <!-- comment --> ]]>'
		) do: [:each |
			self
				should: [SAXHandler parse:'<!DOCTYPE test [', each, ']><test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionInInternalSubsetExternallyDefined [
	| conditionalSections |

	conditionalSections := '
		<![INCLUDE[<!ELEMENT test ANY>]]>
		<![IGNORE[<!ELEMENT test EMPTY>]]>'.
	self
		shouldnt: [
			"the rule against internal subset include/ignore sections
			shouldn't apply to external entities included in the subset"
			(SAXHandler on: '
				<!DOCTYPE test [
					<!ENTITY % extern SYSTEM "extern.ent">
					%extern;
					<!ATTLIST test name CDATA #IMPLIED>
				]>
				<test name="value">test</test>')
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.ent' -> conditionalSections));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
	self
		should: [| entityReplacementMixedSections |
			"the rule against internal subset include/ignore sections
			should apply to internal entities included in the subset
			if they're internal even to an external entity"
			entityReplacementMixedSections :=
				'<!ENTITY % extern2 "', conditionalSections, '">'.
			(SAXHandler on: '
				<!DOCTYPE test [
					<!ENTITY % extern SYSTEM "extern.ent">
					%extern;
					%extern2;
					<!ATTLIST test name CDATA #IMPLIED>
				]>
				<test name="value">test</test>')
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.ent' -> entityReplacementMixedSections));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionLabelReplacementIgnore [
	| xml dtd |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	#('<!ENTITY % label "{1}"> <![%label;[ <malformed-xml/> ]]>'
		'<!ENTITY % label "{1}"> <![ %label; [ <malformed-xml/> ]]>')
		do: [:each |
			self
				should: [
					dtd := each format: (Array with: 'INCLUDE').
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> dtd));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException.
			self
				shouldnt: [
					dtd := each format: (Array with: 'IGNORE').
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> dtd));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionLabelReplacementInclude [
	| xml dtd |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	#('<!ENTITY % label "{1}">
		<![%label;[
			<!ENTITY % comment "<!--comment-->">
		]]> %comment;'
		'<!ENTITY % label "{1}">
		<![ %label; [
			<!ENTITY % comment "<!--comment-->">
		]]> %comment;')
		do: [:each |
			self
				shouldnt: [
					dtd := each format: (Array with: 'INCLUDE').
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> dtd));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				should: [
					dtd := each format: (Array with: 'IGNORE').
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> dtd));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionMixedIncludeIgnore [
	| xml dtd |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	dtd := '
		<![INCLUDE[
			<![IGNORE[ %comment; ]]>
			<!ENTITY % comment "<!--comment]]>-->">
			<![INCLUDE[
				<![IGNORE[ %commentTwo; ]]>
				<!ENTITY % commentTwo "<!--comment]]>-->">
				%commentTwo;
			]]>
			%comment;
			%commentTwo;
		]]>
		%comment;
		%commentTwo;'.
	self
		shouldnt: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionNestedIgnore [
	| xml dtdTemplate dtd |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	dtdTemplate := '
		<![ IGNORE [
			<!--ignored terminator {1} -->
			<![ INCLUDE [
				<!ENTITY % comment "<!--ignored terminator {1} -->">
				%comment;
			]]>
			%comment;
		]]>'.
	self
		shouldnt: [
			dtd := dtdTemplate format: (Array with: ']]').
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
	self
		should: [
			dtd := dtdTemplate format: (Array with: ']]>').
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionNestedInclude [
	| xml dtd |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	dtd := '
		<![ INCLUDE [
			<!--ignored terminator ]]> -->
			<![ INCLUDE [
				<!ENTITY % comment "<!--ignored terminator ]]> -->">
				%comment;
			]]>
			%comment;
		]]>
		%comment;'.
	self
		shouldnt: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionUnterminatedIgnore [
	| xml |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	#('<![IGNORE['
		'<![IGNORE[<!--comment-->'
		'<![IGNORE[<!--comment--><![IGNORE['
		'<![IGNORE[<!--comment--><![IGNORE[ ]]>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testConditionalSectionUnterminatedInclude [
	| xml |

	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.
	#('<![INCLUDE['
		'<![INCLUDE[<!--comment-->'
		'<![INCLUDE[<!--comment--><![INCLUDE['
		'<![INCLUDE[<!--comment--><![INCLUDE[ ]]>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testContentlessDocument [
	#(''
		' 	'
		'<?xml version="1.0"?>'
		'	<!DOCTYPE test>'
		'	<!DOCTYPE test [<!--comment-->]>'
		'	<!--comment-->'
		'	<?target data?>'
		'<?xml version="1.0"?><!DOCTYPE test>'
		'<?xml version="1.0"?><!DOCTYPE test><!--comment-->'
		'<?xml version="1.0"?><!DOCTYPE test><!--comment--><?pi data?>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				shouldnt: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testContentlessSubset [
	#(''
		'<?xml encoding="UTF-8"?>'
		'<!--comment-->'
		'<?target data?>'
		'<?xml encoding="UTF-8"?><!--comment-->'
		'<?xml encoding="UTF-8"?><!--comment--><?target data?>')
		do: [:each |
			self
				shouldnt: [
					((SAXHandler on: '') parser driver
						externalSubsetParserOn: each
						documentURI: 'extern.dtd') parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationBadPublicIDChar [
	| validChars |

	validChars :=
		'!#$%''()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz',
		(Character xmlSeparators copyWithout: Character tab).
	0 to: 255 do: [:each | | char charString |
		char := each asCharacter.
		(validChars includes: char)
			ifFalse: [
				charString := char asString.
				self
					should: [
						SAXHandler parse:
							'<!DOCTYPE test PUBLIC "//public//', charString, '" "external.dtd"><test/>']
					raise: XMLWellFormednessException]].
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test PUBLIC "//public//', validChars, '" "external.dtd"><test/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationInContent [
	self
		should: [SAXHandler parse: '<test><!DOCTYPE test></test>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [SAXHandler parse: '<!DOCTYPE test><test></test>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationRedundance [
	#('<!DOCTYPE test><!DOCTYPE test>'
		'<!DOCTYPE test><!--comment--><!DOCTYPE test>'
		'<!DOCTYPE test><!pi data?><!DOCTYPE test>'
		'<!DOCTYPE test [<!DOCTYPE test>]>'
		'<test><!DOCTYPE test></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationRoot [
	| xmlWithInvalidRoot xmlWithValidRoot |

	xmlWithInvalidRoot := '<!DOCTYPE root><invalidRoot/>'.
	xmlWithValidRoot := '<!DOCTYPE root><root/>'.
	self
		should: [SAXHandler parse: xmlWithInvalidRoot]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler
				parse: xmlWithInvalidRoot
				usingNamespaces: false
				validation: false]
		raise: XMLValidationException.
	self
		shouldnt: [SAXHandler parse: xmlWithValidRoot]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationUnterminated [
	#('<!DOCTYPE'
		'<!DOCTYPE >'
		'<!DOCTYPE test'
		'<!DOCTYPE test PUBLIC'
		'<!DOCTYPE test PUBLIC>'
		'<!DOCTYPE test PUBLIC "'
		'<!DOCTYPE test PUBLIC ">'
		'<!DOCTYPE test PUBLIC "publicid'
		'<!DOCTYPE test PUBLIC "publicid"'
		'<!DOCTYPE test PUBLIC "publicid">'
		'<!DOCTYPE test PUBLIC '''
		'<!DOCTYPE test PUBLIC ''>'
		'<!DOCTYPE test PUBLIC ''publicid'
		'<!DOCTYPE test PUBLIC ''publicid'''
		'<!DOCTYPE test PUBLIC "publicid">'
		'<!DOCTYPE test PUBLIC "publicid" "'
		'<!DOCTYPE test PUBLIC "publicid" ">'
		'<!DOCTYPE test PUBLIC "publicid" "systemid'
		'<!DOCTYPE test PUBLIC "publicid" "systemid"'
		'<!DOCTYPE test PUBLIC "publicid" '''
		'<!DOCTYPE test PUBLIC "publicid" ''>'
		'<!DOCTYPE test PUBLIC "publicid" ''systemid'
		'<!DOCTYPE test PUBLIC "publicid" ''systemid'''
		'<!DOCTYPE test PUBLIC "publicid" "systemid''>'
		'<!DOCTYPE test PUBLIC "publicid" ''systemid">'
		'<!DOCTYPE test PUBLIC "publicid" "systemid" ['
		'<!DOCTYPE test PUBLIC "publicid" "systemid" [>'
		'<!DOCTYPE test PUBLIC "publicid" "systemid" []'
		'<!DOCTYPE test SYSTEM'
		'<!DOCTYPE test SYSTEM>'
		'<!DOCTYPE test SYSTEM "'
		'<!DOCTYPE test SYSTEM ">'
		'<!DOCTYPE test SYSTEM "systemid'
		'<!DOCTYPE test SYSTEM "systemid"'
		'<!DOCTYPE test SYSTEM '''
		'<!DOCTYPE test SYSTEM ''>'
		'<!DOCTYPE test SYSTEM ''systemid'
		'<!DOCTYPE test SYSTEM ''systemid'''
		'<!DOCTYPE test SYSTEM "systemid''>'
		'<!DOCTYPE test SYSTEM ''systemid">'
		'<!DOCTYPE test SYSTEM "systemid" ['
		'<!DOCTYPE test SYSTEM "systemid" [>'
		'<!DOCTYPE test SYSTEM "systemid" []'
		'<!DOCTYPE test ['
		'<!DOCTYPE test [>'
		'<!DOCTYPE test []')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testDoctypeDeclarationWhitespace [
	"whitespace is mandatory after the 'DOCTYPE', before and within any external id,
	but is optional before the '[' and after the ']' of the interal subset"
	#('<!DOCTYPEtest>'
		'<!DOCTYPE testPUBLIC "publicid" "systemid">'
		'<!DOCTYPE test PUBLIC"publicid" "systemid">'
		'<!DOCTYPE test PUBLIC "publicid""systemid">'
		'<!DOCTYPE testSYSTEM "systemid">'
		'<!DOCTYPE test SYSTEM"systemid">')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].

	#('<!DOCTYPE
			test
			PUBLIC
			   "publicid"
			   "systemid"
		 >'
		'<!DOCTYPE
			test
			SYSTEM
			   "systemid"
		>'
		'<!DOCTYPE
			test
			PUBLIC
			   "publicid"
			   "systemid"
			[
			]
		 >'
		'<!DOCTYPE
			test
			SYSTEM
			   "systemid"
			[
			]
		>'
		'<!DOCTYPE test PUBLIC "publicid" "systemid"[]>'
		'<!DOCTYPE test SYSTEM "systemid"[]>'
		'<!DOCTYPE test[]>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testElementAnyDeclaration [
	self
		shouldnt: [
			SAXHandler parse: 
				'<!DOCTYPE one [
					<!ELEMENT one ANY>
					<!ELEMENT two ANY>]>
				<one>one<two><![CDATA[two]]><two /></two>three</one>']
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse: 
				'<!DOCTYPE root [
					<!ELEMENT root ANY>
					<!ELEMENT two ANY>]>
				<root><two></two></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementBadName [
	self badNames do: [:each |
		self
			should: [SAXHandler parse: '<', each, '/>']
			raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testElementContentModelBadBinaryOperator [
	#('<!DOCTYPE a [<!ELEMENT a (,b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b,)>]>'
		'<!DOCTYPE a [<!ELEMENT a (,b c)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b c,)>]>'
		'<!DOCTYPE a [<!ELEMENT a (|b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b|)>]>'
		'<!DOCTYPE a [<!ELEMENT a (|b c)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b c|)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b, c | d)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b | c, d)>]>')
		do: [:each |
			self
				should: [
					(SAXHandler on: each, '<a></a>')
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementContentModelBadParenthesis [
	#('<!DOCTYPE a [<!ELEMENT a b>]>'
		'<!DOCTYPE a [<!ELEMENT a (b>]>'
		'<!DOCTYPE a [<!ELEMENT a b)>]>'
		'<!DOCTYPE a [<!ELEMENT a ((b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b))>]>')
		do: [:each |
			self
				should: [
					(SAXHandler on: each, '<a></a>')
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementContentModelBadUnaryOperator [
	#('<!DOCTYPE a [<!ELEMENT a (?b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (*b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (+b)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b??)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b**)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b++)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b?*)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b?+)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b*?)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b*+)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b+?)>]>'
		'<!DOCTYPE a [<!ELEMENT a (b+*)>]>')
		do: [:each |
			self
				should: [
					(SAXHandler on: each, '<a></a>')
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementContentModelBranching [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three' 'four' 'five')),
		'<!ELEMENT root ((one|two),(three|four|five))>]>'.

	#('<root><one/><three/></root>'
		'<root><one/><four/></root>'
		'<root><one/><five/></root>'
		'<root><two/><three/></root>'
		'<root><two/><four/></root>'
		'<root><two/><five/></root>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root><one/><two/><three/></root>'
		'<root><one/><three/><four/><five/></root>'
		'<root><one/></root>'
		'<root><four/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementContentModelCycles [
	| dtd |

	"this content model produces an NFA with cycles, to ensure
	they're handled correctly"
	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three')),
		'<!ELEMENT root (one*,two?)+>]>'.

	#('<root><one/><two/></root>'
		'<root><one/><two/><one/><two/></root>'
		'<root><one/><two/><two/><one/></root>'
		'<root><two/><one/><one/><two/></root>'
		'<root><one/></root>'
		'<root><two/></root>'
		'<root></root>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root><one/><two/><three/></root>'
		'<root><one/><three/><two/></root>'
		'<root><three/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementContentModelManyBranches [
	| dtd names |

	names := (1 to: 50) collect: [:each | 'element', each printString].
	dtd := String streamContents: [:stream |
		stream
			nextPutAll: '<!DOCTYPE root [';
			nextPutAll: (self elementDeclarationsNamed: names);
			nextPutAll: '<!ELEMENT root ('.
		names
			do: [:each | stream nextPutAll: each]
			separatedBy: [stream nextPut: $|].
		stream nextPutAll: ')>]>'].

	names do: [:each |
		self
			shouldnt: [SAXHandler parse: dtd, '<root><', each, '/></root>']
			raise: XMLValidationException].
	self
		should: [
			SAXHandler parse:
				dtd, '<root><element', (names size + 1) printString, '/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentModelNonDeterministic [
	| template |
	
	template :=
		'<!DOCTYPE a [
			<!ELEMENT a {1}>
			<!ELEMENT b EMPTY>
			<!ELEMENT c EMPTY>
			<!ELEMENT d EMPTY>
		]>{2}'.

	#(#('((b,c)|(b,d))' '(b,(c|d))' '<a><b/><c/></a>')
		#('(b?,b*)' '(b,b*)' '<a><b/></a>')
		#('(b+,b?)' '(b,b+)' '<a><b/><b/></a>')
		) do: [:each | | nonDeterministic deterministic source |
		nonDeterministic := each first.
		deterministic := each second.
		source := each third.
		self
			should: [
				SAXHandler parse:
					(template format: (Array with: nonDeterministic with: source))]
			raise: XMLValidationException.
		self
			shouldnt: [
				SAXHandler parse:
					(template format: (Array with: deterministic with: source))]
			raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementContentModelOptional [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three' 'four' 'five')),
		'<!ELEMENT root (one?,two,three?,(four?, five)?)>]>'.

	#('<root><one/><two/><three/><four/><five/></root>'
		'<root><two/><three/></root>'
		'<root><one/><two/><three/><five/></root>'
		'<root><two/></root>'
		'<root><one/><two/></root>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	#('<root><one/><three/><four/><five/></root>'
		'<root><one/><two/><three/><four/></root>'
		'<root><one/><two/><three/><five/><four/></root>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementContentModelOptionalBranching [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three' 'four' 'five' 'six')),
		'<!ELEMENT root (((one,two)|(three,four)),five?)>]>'.

	self
		shouldnt: [
			SAXHandler
				parse: dtd, '<root><one/><two/><five/></root>';
				parse: dtd, '<root><three/><four/><five/></root>';
				parse: dtd, '<root><one/><two/></root>';
				parse: dtd, '<root><three/><four/></root>']
		raise: XMLValidationException.

	self
		should: [SAXHandler parse: dtd, '<root><three/><five/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><one/><five/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><five/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentModelOptionalEmpty [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three')),
		'<!ELEMENT root (one?,two)?>]>'.

	self
		shouldnt: [
			SAXHandler
				parse: dtd, '<root><one/><two/></root>';
				parse: dtd, '<root><two/></root>';
				parse: dtd, '<root></root>']
		raise: XMLValidationException.

	self
		should: [SAXHandler parse: dtd, '<root><one/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><three/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><one/><one/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentModelPlus [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three' 'four' 'five')),
		'<!ELEMENT root ((one?,two)+,three,four+,five)>]>'.

	self
		shouldnt: [
			SAXHandler
				parse: dtd, '<root><one/><two/><three/><four/><five/></root>';
				parse: dtd, '<root><two/><one/><two/><two/><three/><four/><five/></root>';
				parse: dtd, '<root><two/><three/><four/><four/><five/></root>';
				parse: dtd, '<root><two/><three/><four/><five/></root>']
		raise: XMLValidationException.

	self
		should: [SAXHandler parse: dtd, '<root><three/><four/><five/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><one/><two/><four/><four/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><one/><two/><three/><five/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentModelStar [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three' 'four' 'five')),
		'<!ELEMENT root ((one?,two)*,(three)*,four,five*)>]>'.

	self
		shouldnt: [
			SAXHandler
				parse: dtd, '<root><one/><two/><three/><four/><five/></root>';
				parse: dtd, '<root><two/><one/><two/><three/><four/><five/></root>';
				parse: dtd, '<root><three/><three/><four/><five/></root>';
				parse: dtd, '<root><four/><five/><five/></root>';
				parse: dtd, '<root><four/></root>']
		raise: XMLValidationException.

	self
		should: [SAXHandler parse: dtd, '<root><three/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentModelStarEmpty [
	| dtd |

	dtd := '<!DOCTYPE root [',
		(self elementDeclarationsNamed: #('one' 'two' 'three')),
		'<!ELEMENT root (one*,two)*>]>'.

	self
		shouldnt: [
			SAXHandler
				parse: dtd, '<root><one/><one/><two/><two/></root>';
				parse: dtd, '<root><two/><one/><two/></root>';
				parse: dtd, '<root><two/><two/></root>';
				parse: dtd, '<root></root>']
		raise: XMLValidationException.

	self
		should: [SAXHandler parse: dtd, '<root><one/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><three/></root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementContentWhitespace [
	| xmlTemplate |

	"LibXML2 and Xerces allow general entity refs with empty and whitespace
	replacements and char refs to whitespace chars inbetween elements in
	elements with DTD-valited 'element content'. This tests for that behavior."
	xmlTemplate := '
		<!DOCTYPE element-content [
			<!ELEMENT element-content (one, two)>
			<!ELEMENT one EMPTY>
			<!ELEMENT two EMPTY>
			<!ENTITY empty ''''>
			<!ENTITY non-empty "non empty">
			<!ENTITY whitespace " 	
				">
		]>
		<element-content>{1}<one/>{1}<two/>{1}</element-content>'.
	(Array
		with: (String withAll: Character xmlSeparators)
		with: '&empty;'
		with: '&whitespace;'
		with: '')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: (xmlTemplate format: (Array with: each))]
				raise: XMLValidationException].
	Character xmlSeparators do: [:each |
		self
			shouldnt: [
				SAXHandler parse:
					(xmlTemplate format:
						(Array with: '&#', each asciiValue asString, ';'))]
			raise: XMLValidationException].

	(Array
		with: 'one'
		with: '2'
		with: '&non-empty;'
		with: '&#34;')
		do: [:each | | xml |
			xml := xmlTemplate format: (Array with: each).
			self
				should: [SAXHandler parse: xml]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementDeclarationMixedContent [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root (#PCDATA | one | two | three)*>
			<!ELEMENT one EMPTY>
			<!ELEMENT two (#PCDATA)>
			<!ELEMENT three (#PCDATA)*>
			<!ELEMENT four EMPTY>]>'.
	self
		shouldnt: [
			SAXHandler parse:
				dtd, '<root>text<one/><two><![CDATA[text]]></two></root>']
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				dtd, '<root><three>text<!--comment--></three></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><four/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><two><three/></two></root>']
		raise: XMLValidationException.
	self
		should: [
			SAXHandler parse: "missing *"
				'<!DOCTYPE root [<!ELEMENT root (#PCDATA|one)>]><root/>']
		raise: XMLWellFormednessException.
	'+*?,' do: [:each |
		self
			should: [
				SAXHandler parse:
					'<!DOCTYPE root [<!ELEMENT two (#PCDATA', each asString, ')>]><root/>']
			raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testElementDeclarationMixedContentRedundance [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!ELEMENT root EMPTY>
			<!ELEMENT one (#PCDATA | one | two | one)*>
		]>'.
	self
		should: [SAXHandler parse: dtd, '<root/>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementDeclarationPrefixed [
	| dtd |

	dtd := '<!DOCTYPE prefix:root [
		<!ELEMENT prefix:root ANY>
		<!ATTLIST prefix:root xmlns:prefix CDATA #IMPLIED>
		<!ELEMENT unprefixed EMPTY>]>'.
	self
		shouldnt: [SAXHandler parse: dtd, '<prefix:root xmlns:prefix="ns"><unprefixed/></prefix:root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root><unprefixed/></root>']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<prefix:root xmlns:prefix="ns"><prefix:unprefixed/></prefix:root>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testElementDeclarationRedundance [
	#('<!DOCTYPE test [<!ELEMENT test EMPTY><!ELEMENT test EMPTY>]><test/>'
		'<!DOCTYPE test [<!ELEMENT test EMPTY><!ELEMENT test ANY>]><test/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLValidationException]
]

{ #category : #tests }
XMLParserTest >> testElementDeclarationWhitespace [
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE test [<!ELEMENTtest (#PCDATA)>]><test/>']
		raise: XMLWellFormednessException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE test [<!ELEMENT test(#PCDATA)>]><test/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test [<!ELEMENT test (	#PCDATA	)   >]><test/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testElementEmptyDeclaration [
	| dtd |

	dtd := '<!DOCTYPE empty [<!ELEMENT empty EMPTY>]>'.

	#('<empty/>'
		'<empty></empty>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: dtd, each]
				raise: XMLValidationException].

	"the spec says EMPTY elements can't have any content, even whitespace,
	comments or PIs"
	#('<empty><empty/></empty>'
		'<empty>non-empty</empty>'
		'<empty> </empty>'
		'<empty>	</empty>'
		'<empty>
</empty>'
		'<empty>&#32;</empty>' "Character space asciiValue"
		'<empty>&#9;</empty>' "Character tab asciiValue"
		'<empty>&#10;</empty>' "Character lf asciiValue"
		'<empty>&#13;</empty>' "Character cr asciiValue"
		'<empty><![CDATA[non-empty]]></empty>'
		'<empty><!--non-empty--></empty>'
		'<empty><?non empty?></empty>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: dtd, each)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testElementNesting [
	#('<unclosed>'
		'</unopened>'
		'<root></unopened></root>'
		'<root><unclosed></root>'
		'<root><first><second></first></second></root>'
		'<root><first><second></second></root></first>'
		'<root><first><second></root></second></first>'
		'<root/><secondRoot/>'
		'<root><first/></root><secondRoot/>'
		'<root><first/></root><secondRoot><second/></secondRoot>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementUnmatchedEndTag [
	#('<test></t>'
		'<test></te>'
		'<test></tes>'
		'<test></testing>'
		'<test></Test>'
		'<test></TEST>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementUnterminatedEndTag [
	#('<test><'
		'<test><test><</test>'
		'<test></'
		'<test><test></</test>'
		'<test></test'
		'<test><test></test</test>'
		'<test></ test'
		'<test><test></ test</test>'
		'<test></ test>'
		'<test><test></ test></test>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementUnterminatedStartTag [
	#('<'
		'<></>'
		'</>'
		'<test'
		'<test</test>'
		'<test/'
		'<test name'
		'<test name></test>'
		'<test name/>'
		'<test name='
		'<test name=></test>'
		'<test name=/>'
		'<test name="'
		'<test name="></test>'
		'<test name="/>'
		'<test name="value'
		'<test name="value"'
		'<test name="value"</test>'
		'<test name="value"/'
		'<test name='''
		'<test name=''></test>'
		'<test name=''/>'
		'<test name=''value'
		'<test name=''value'''
		'<test name=''value''</test>'
		'<test name=''value''/'
		'<test name="value''></test>'
		'<test name=''value"></test>'
		'<test name="value''/>'
		'<test name=''value"/>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testElementWhitespace [
	self
		should: [SAXHandler parse: '<root name1="value1"name2="value2"/>']
		raise: XMLWellFormednessException.
	self
		should: [SAXHandler parse: '<root name1=''value1''name2="value2"/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [SAXHandler parse: '<root name1="value1" name2="value2"/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			SAXHandler parse: '
				<root
					name1
					   =
					"value1"
					name2
					   =
					"value2"
				/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testElementsUndeclared [
	self
		shouldnt: [
			"entity and notation declarations aren't enough to trigger
			DTD validation; at least one element or attlist declaration
			is needed"
			SAXHandler
				parse: '
					<!DOCTYPE root [
						<!ENTITY ignored "">
						<!NOTATION ignored2 PUBLIC "ignored2">
					]>
					<root/>'
				usingNamespaces:true
				validation: true]
		raise:XMLValidationException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [<!ELEMENT root ANY>]><root><undeclared/></root>']
		raise: XMLValidationException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [<!ATTLIST root name CDATA #IMPLIED>]><root/>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testEntityDeclarationBadName [
	self badNames do: [:each |
		self
			should: [
				SAXHandler parse:
					'<!DOCTYPE test [
						<!ENTITY ', each, ' "value">
					]><test/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testEntityDeclarationUnterminated [
	#('<!ENTITY'
		'<!ENTITY>'
		'<!ENTITY name'
		'<!ENTITY name>'
		'<!ENTITY name "'
		'<!ENTITY name ">'
		'<!ENTITY name "value'
		'<!ENTITY name "value"'
		'<!ENTITY name '''
		'<!ENTITY name ''>'
		'<!ENTITY name ''value'
		'<!ENTITY name ''value'''
		'<!ENTITY name "value''>'
		'<!ENTITY name ''value">'
		'<!ENTITY name PUBLIC'
		'<!ENTITY name PUBLIC>'
		'<!ENTITY name PUBLIC "'
		'<!ENTITY name PUBLIC ">'
		'<!ENTITY name PUBLIC "publicid"'
		'<!ENTITY name PUBLIC "publicid">'
		'<!ENTITY name PUBLIC '''
		'<!ENTITY name PUBLIC ''>'
		'<!ENTITY name PUBLIC ''publicid'''
		'<!ENTITY name PUBLIC ''publicid''>'
		'<!ENTITY name PUBLIC "publicid''>'
		'<!ENTITY name PUBLIC ''publicid">'
		'<!ENTITY name PUBLIC "publicid" "'
		'<!ENTITY name PUBLIC "publicid" ">'
		'<!ENTITY name PUBLIC "publicid" "systemid'
		'<!ENTITY name PUBLIC "publicid" "systemid"'
		'<!ENTITY name PUBLIC "publicid" '''
		'<!ENTITY name PUBLIC "publicid" ''>'
		'<!ENTITY name PUBLIC "publicid" ''systemid'
		'<!ENTITY name PUBLIC "publicid" ''systemid'''
		'<!ENTITY name PUBLIC "publicid" "systemid''>'
		'<!ENTITY name PUBLIC "publicid" ''systemid">'
		'<!ENTITY name SYSTEM'
		'<!ENTITY name SYSTEM>'
		'<!ENTITY name SYSTEM "'
		'<!ENTITY name SYSTEM ">'
		'<!ENTITY name SYSTEM "systemid'
		'<!ENTITY name SYSTEM "systemid"'
		'<!ENTITY name SYSTEM '''
		'<!ENTITY name SYSTEM ''>'
		'<!ENTITY name SYSTEM ''systemid'
		'<!ENTITY name SYSTEM ''systemid'''
		'<!ENTITY name SYSTEM "systemid''>'
		'<!ENTITY name SYSTEM ''systemid">'
		'<!ENTITY name SYSTEM "systemid''>'
		'<!ENTITY name SYSTEM ''systemid">')
		do: [:each |
			self
				should: [
					SAXHandler parse:
						'<!DOCTYPE test [
							<!NOTATION gif SYSTEM "file.gif">',
							each]
				raise: XMLWellFormednessException.
			self
				should: [
					SAXHandler parse:
						'<!DOCTYPE test [
							<!NOTATION gif SYSTEM "file.gif">',
							each,
						']><test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityDeclarationValueBadChar [
	self nonChars do: [:each |
		self
			should: [
				SAXHandler parse:
					'<!DOCTYPE test [
						<!ENTITY name "', each asString, '">
					]><test/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testEntityDeclarationWhitespace [
	#('<!ENTITYname "value">'
		'<!ENTITY name"value">'
		'<!ENTITY name PUBLIC"publicid" "systemid">'
		'<!ENTITY name PUBLIC "publicid""systemid">'
		'<!ENTITY name SYSTEM"systemid">'
		'<!ENTITY name PUBLIC "publicid" "systemid"NDATA GIF>'
		'<!ENTITY name SYSTEM "systemid"NDATA GIF>'
		'<!ENTITY% name "value">'
		'<!ENTITY %name "value">')
		do: [:each |
			self
				should: [SAXHandler parse: '<!DOCTYPE test [', each, ']><test/>']
				raise: XMLWellFormednessException].

	#('<!ENTITY  name 	"value"   >'
		'<!ENTITY   % 	 name "value"	>'
		'<!ENTITY   name   PUBLIC   "publicid"    "systemid"   >'
		'<!ENTITY   name   SYSTEM    "systemid"   >')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: '<!DOCTYPE test [', each, ']><test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityExternalResolutionGeneral [
	| xml entities document |

	xml := '
		<!DOCTYPE test [
			<!ENTITY extern SYSTEM "/base/extern.ent">
			<!ENTITY extern2 SYSTEM "/base/extern2.ent">
			<!ENTITY extern3 SYSTEM "/base/extern3.ent">
		]>
		<test>&extern;&extern2;&extern3;</test>'.
	entities :=
		Array
			with:
				'/base/extern.ent' ->
					'<?xml version="1.0" encoding="UTF-8"?>one'
			with:
				'/base/extern2.ent' ->
					'<?xml encoding="UTF-8"?>two'
			with: '/base/extern3.ent' -> 'three'.
	1 to: entities size - 1 do: [:i |
		self
			should: [
				(SAXHandler on: xml)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(entities copyFrom: 1 to: i));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLParserException].
	self
		should: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: false;
				parseDocument]
		raise: XMLParserException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: xml)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities: entities);
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLParserException.
	self assert: document root contentString = 'onetwothree'.
]

{ #category : #tests }
XMLParserTest >> testEntityExternalResolutionParameter [
	| xml entities document |

	xml := '
		<!DOCTYPE test [
			<!ENTITY % extern SYSTEM "/base/extern.ent">
			%extern;
			%extern2;
			%extern3;
		]>
		<test>&extern4;</test>'.
	entities :=
		Array
			with:
				'/base/extern.ent' ->
					'<?xml version="1.0" encoding="UTF-8"?>
					<!ENTITY % extern2 SYSTEM "sub/extern2.ent">'
			with:
				'/base/sub/extern2.ent' ->
					'<?xml encoding="UTF-8"?>
					<!ENTITY % extern3 SYSTEM "./extern3.ent">'
			with:
				'/base/sub/extern3.ent' ->
					'<!ENTITY % extern5 SYSTEM "./extern5.ent">
					<!ENTITY extern4 "%extern5;">'
			with:
				'/base/sub/extern5.ent' ->
					'<?xml encoding="UTF-8"?>test'.
	1 to: entities size - 1 do: [:i |
		self
			should: [
				(SAXHandler on: xml)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(entities copyFrom: 1 to: i));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLParserException].
	self
		should: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: false;
				parseDocument]
		raise: XMLParserException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: false;
				isValidating: false;
				parseDocument]
		raise: XMLParserException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: xml)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities: entities);
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLParserException.
	self assert: document root contentString = 'test'.
]

{ #category : #tests }
XMLParserTest >> testEntityExternalResolutionParameterInDeclaration [
	"test the handling of external parameter entity references in declarations"
	| invalidXML validXML resolver |

	invalidXML := '
		<!DOCTYPE one SYSTEM "extern.dtd">
		<one><two/><four/></one>'.
	validXML := '
		<!DOCTYPE one SYSTEM "extern.dtd">
		<one><two/><three/><four/></one>'.
	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'extern.dtd'
		put:
			'<!ENTITY % two SYSTEM "two.ent">
			<!ENTITY % three SYSTEM "three.ent">
			<!ENTITY % four SYSTEM "four.ent">
			<!ELEMENT one (%two; , %three; , %four;)>
			<!ELEMENT two EMPTY>
			<!ELEMENT three EMPTY>
			<!ELEMENT four EMPTY>'.
	resolver
		externalEntityAtURI: 'two.ent'
		put:
			'<?xml encoding="UTF-8"?>
			two'.
	resolver
		externalEntityAtURI: 'three.ent'
		put: 'three'.
	resolver
		externalEntityAtURI: 'four.ent'
		put: '<?xml encoding="UTF-8"?>four'.
	self
		should: [
			(SAXHandler on: invalidXML)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: validXML)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testEntityExternalSubsetResolution [
	| xml entities |

	xml := '<!DOCTYPE test SYSTEM "/base/extern.ent"><test>&extern4;</test>'.
	entities :=
		Array
			with:
				'/base/extern.ent' ->
					'<!ENTITY % extern2 SYSTEM "sub/extern2.ent">
					%extern2;
					%extern3;'
			with: '/base/sub/extern2.ent' -> '<!ENTITY % extern3 SYSTEM "./extern3.ent">'
			with: '/base/sub/extern3.ent' -> '<!ENTITY extern4 "test">'.
	1 to: entities size - 1 do: [:i |
		self
			should: [
				(SAXHandler on: xml)
					externalEntityResolver:
						(DTDStaticExternalEntityResolver externalEntities:
							(entities copyFrom: 1 to: i));
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLParserException].
	self
		should: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: false;
				parseDocument]
		raise: XMLParserException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities: entities);
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLParserTest >> testEntityLiteralContextNesting [
	| xml inner outer document |

	xml := '<?xml version="1.0"?>
	<!DOCTYPE entities [
		<!ENTITY % inner " <!ENTITY inner  &#34; '' inner &#39; &#34;>">
		%inner;
		<!ENTITY outer '' &#39; " &inner; &#39; " ''>
	]>
	<entities one="&outer;" two="&inner;" three=''&outer;'' four=''&inner;''>&outer;&inner;</entities>'.
	inner := ' '' inner '' '.
	outer := ' '' " ', inner, ' '' " '.

	self
		shouldnt: [document := XMLDOMParser parse: xml]
		raise: XMLWellFormednessException.
	self
		assert: (document root attributeAt: 'one') = outer;
		assert: (document root attributeAt: 'two') = inner;
		assert: (document root attributeAt: 'three') = outer;
		assert: (document root attributeAt: 'four') = inner;
		assert: (document root contentString) = (outer, inner).
]

{ #category : #tests }
XMLParserTest >> testEntityNestingAttributeDeclaration [
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded with
	spaces which interrupt the '<!ATTLIST' sequence"
	#('<!ELEMENT test EMPTY>
		<!ENTITY % partial "<">
		%partial;!ATTLIST test name CDATA #IMPLIED>'
		'<!ELEMENT test EMPTY>
		<!ENTITY % partial "<!">
		%partial;ATTLIST test name CDATA #IMPLIED')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	"these are validity exceptions"
	#('<!ELEMENT test EMPTY>
			<!ENTITY % partial "<!ATTLIST">
			%partial; test name CDATA #IMPLIED>'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "<!ATTLIST test">
			%partial; name CDATA #IMPLIED>'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "<!ATTLIST test name">
			%partial; CDATA #IMPLIED>'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "<!ATTLIST test name CDATA">
			%partial; #IMPLIED>'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "<!ATTLIST test name CDATA #IMPLIED">
			%partial;>'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial ">">
			<!ATTLIST test name CDATA #IMPLIED %partial;'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "#IMPLIED>">
			<!ATTLIST test name CDATA %partial;'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "CDATA #IMPLIED>">
			<!ATTLIST test name %partial;'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "name CDATA #IMPLIED>">
			<!ATTLIST test %partial;'
		'<!ELEMENT test EMPTY>
			<!ENTITY % partial "test name CDATA #IMPLIED>">
			<!ATTLIST %partial;')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
	self
		shouldnt: [| dtd |
			dtd := '
				<!ELEMENT test EMPTY>
				<!ENTITY % total "<!ATTLIST test name CDATA #IMPLIED>">
				%total;'.
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingCharacterReference [
	"even though general entity refs are bypassed in entity values, they are still
	checked for well formedness (they must be complete), so the only way to have an
	entity value containing part of a general ref is to use a char escape for the &"
	#('<!DOCTYPE test [
				<!ENTITY partial "&#38;">
			]><test>&partial;#64;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial "&#38;#">
			]><test>&partial;64;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial "&#38;#64">
			]><test>&partial;;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial "#64;">
			]><test>&&partial;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial "64;">
			]><test>&#&partial;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial ";">
			]><test>&#64&partial;</test>'
		'<!DOCTYPE test [
				<!ENTITY partial "&#38;">
			]><test name="&partial;#64;"></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "&#38;#">
			]><test name="&partial;64;"></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "&#38;#64">
			]><test name="&partial;;"></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "#64;">
			]><test name="&&partial;"></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "64;">
			]><test name="&#&partial;"></test>'
		'<!DOCTYPE test [
				<!ENTITY partial ";">
			]><test name="&#64&partial;"></test>')
		do: [:each |
			self
				should: [
					(SAXHandler on: each)
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException].
	self
		shouldnt: [
			(SAXHandler on:
				'<!DOCTYPE test [
					<!ENTITY total "&#38;#64;">
				]><test name="&total;">&total;</test>')
				isValidating: false;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingComment [
	#('<!DOCTYPE test [
				<!ENTITY partial "<">
			]><test>&partial;!--ignored--></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!">
			]><test>&partial;--ignored--></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!-">
			]><test>&partial;-ignored--></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!--">
			]><test>&partial;ignored--></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!--ignored">
			]><test>&partial;--></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!--ignored-">
			]><test>&partial;-></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<!--ignored--">
			]><test>&partial;></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].

	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test [
						<!ENTITY total "<?name value?>">
					]><test>&total;</test>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingElement [
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test [
					<!ENTITY total1 "<a name=''value''/>">
					<!ENTITY total2 "<b>&total1;</b>">
					<!ENTITY total3 "<c>&total1;&total2;</c>">
				]><test>&total1;&total2;&total3;</test>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingElementDeclaration [
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded
	with spaces which interrupt the '<!ELEMENT' sequence"
	#('<!ENTITY % partial "<">%partial;!ELEMENT test EMPTY>'
		'<!ENTITY % partial "<!">%partial;ELEMENT test EMPTY')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	"these are validity exceptions"
	#('<!ENTITY % partial "<!ELEMENT">%partial;test EMPTY>'
		'<!ENTITY % partial "<!ELEMENT test">%partial;EMPTY>'
		'<!ENTITY % partial "<!ELEMENT test EMPTY">%partial;>'
		'<!ENTITY % partial ">"><!ELEMENT test EMPTY%partial;'
		'<!ENTITY % partial "EMPTY>"><!ELEMENT test %partial;'
		'<!ENTITY % partial "test EMPTY>"><!ELEMENT %partial;'
		'<!ENTITY % partial "("><!ELEMENT test %partial; #PCDATA)>'
		'<!ENTITY % partial ")"><!ELEMENT test (#PCDATA %partial;>'
		'<!ENTITY % partial "(#PCDATA"><!ELEMENT test %partial;)>'
		'<!ENTITY % partial "#PCDATA)"><!ELEMENT test (%partial;>'
		'<!ENTITY % partial "("><!ELEMENT test %partial; a?)>'
		'<!ENTITY % partial ")"><!ELEMENT test (a? %partial;>'
		'<!ENTITY % partial "(a?"><!ELEMENT test %partial;)>'
		'<!ENTITY % partial "a?)"><!ELEMENT test (%partial;>'
		'<!ENTITY % partial "(a|b"><!ELEMENT test (%partial;))?>'
		'<!ENTITY % partial "a|b)"><!ELEMENT test ((%partial;)?>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].

	#('<!ENTITY % partial1 "(a|b)">
			<!ENTITY % partial2 "(c,d)">
			<!ENTITY % partial3 "(%partial1;, %partial2;)?">
			<!ENTITY % total "<!ELEMENT test %partial3;>">
			%total;'
		'<!ENTITY % partial1 "a">
			<!ENTITY % partial2 "b">
			<!ENTITY % partial3 "(#PCDATA | %partial1; | %partial2;)*">
			<!ENTITY % total "<!ELEMENT test %partial3;>">
			%total;')
		do: [:each |
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
]

{ #category : #tests }
XMLParserTest >> testEntityNestingElementPartialEndTag [
	#('<!DOCTYPE test [
				<!ENTITY partial "<">
			]><test><a name=''value''>&partial;/a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "</">
			]><test><a name=''value''>&partial;a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "</a">
			]><test><a name=''value''>&partial;></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "</a>">
			]><test><a name=''value''>&partial;</test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityNestingElementPartialSelfClosingTag [
	#('<!DOCTYPE test [
				<!ENTITY partial "<">
			]><test>&partial;a name=''value''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a">
			]><test>&partial;name=''value''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name">
			]><test>&partial;=''value''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=">
			]><test>&partial;''value''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''">
			]><test>&partial;value''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value">
			]><test>&partial;''/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value''">
			]><test>&partial;/></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value''/">
			]><test>&partial;></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityNestingElementPartialStartTag [
	#('<!DOCTYPE test [
				<!ENTITY partial "<">
			]><test>&partial;a name=''value''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a">
			]><test>&partial;name=''value''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name">
			]><test>&partial;=''value''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=">
			]><test>&partial;''value''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''">
			]><test>&partial;value''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value">
			]><test>&partial;''></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value''">
			]><test>&partial;></a></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<a name=''value''>">
			]><test>&partial;</a></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityNestingGeneralEntityReference [
	"even though general entity refs are bypassed in entity values, they are still
	checked for well formedness (they must be complete), so the only way to declare
	an entity with a replacement containing a '&' is to escape it as char ref"
	#('<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "&#38;">
		]><test>&partial;name;</test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "&#38;name">
		]><test>&partial;;</test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "name;">
		]><test>&&partial;</test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "name;">
		]><test>&name&partial;</test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "&#38;">
		]><test name="&partial;name;"></test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "&#38;name">
		]><test name="&partial;;"></test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "name;">
		]><test name="&&partial;"></test>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY partial "name;">
		]><test name="&name&partial;"></test>')
		do: [:each |
			self
				should: [
					(SAXHandler on: each)
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException].
	self
		shouldnt: [
			(SAXHandler on:
				'<!DOCTYPE test [
					<!ENTITY name "value">
					<!ENTITY total "&name;">
				]><test name="&total;">&total;</test>')
				isValidating: false;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingIgnoreSection [
	"If any of the '<![', '[', or ']]>' of a conditional section is contained
	in the replacement text for a parameter-entity reference, all of them
	MUST be contained in the same replacement text."
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded
	with spaces which interrupt the '<![' and ']]>' sequences"
	#('<!ENTITY % partial "<">%partial;![IGNORE[<!--ignore-->]]>'
		'<!ENTITY % partial "<!">%partial;[IGNORE[<!--ignore-->]]>'
		'<!ENTITY % partial "<![IGNORE[<!--ignore-->]">%partial;]>'
		'<!ENTITY % partial "<![IGNORE[<!--ignore-->]]">%partial;>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	"these are validity exceptions"
	#('<!ENTITY % partial "<![">%partial;IGNORE[<!--ignore-->]]>'
		'<!ENTITY % partial "<![IGNORE">%partial;[<!--ignore-->]]>'
		'<!ENTITY % partial "<![IGNORE[">%partial;<!--ignore-->]]>'
		'<!ENTITY % partial "<![IGNORE[<!--ignore-->">%partial;]]>'
		'<!ENTITY % partial "IGNORE["><![%partial;<!--ignore-->]]>'
		'<!ENTITY % partial "IGNORE[<!--ignore-->"><![%partial;]]>'
		'<!ENTITY % partial "IGNORE[<!--ignore-->]]>"><![%partial;')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
	self
		shouldnt: [| dtd |
			dtd := '
				<!ENTITY % partial "IGNORE">
				<!ENTITY % total "<![%partial;[<!--ignore-->]]]]]>">
				%total;'.
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingIncludeSection [
	"If any of the '<![', '[', or ']]>' of a conditional section is contained
	in the replacement text for a parameter-entity reference, all of them
	MUST be contained in the same replacement text."
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded
	with spaces which interrupt the '<![' and ']]>' sequences"
	#('<!ENTITY % partial "<">%partial;![INCLUDE[<!--ignore-->]]>'
		'<!ENTITY % partial "<!">%partial;[INCLUDE[<!--ignore-->]]>'
		'<!ENTITY % partial "<![INCLUDE[<!--ignore-->]">%partial;]>'
		'<!ENTITY % partial "<![INCLUDE[<!--ignore-->]]">%partial;>'
		'<!ENTITY % partial "]"<![INCLUDE[<!--ignore-->%partial;]>'
		'<!ENTITY % partial "]]"><![INCLUDE[<!--ignore-->%partial;>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	"these are validity exceptions"
	#('<!ENTITY % partial "<![">%partial;INCLUDE[<!--ignore-->]]>'
		'<!ENTITY % partial "<![INCLUDE">%partial;[<!--ignore-->]]>'
		'<!ENTITY % partial "<![INCLUDE[">%partial;<!--ignore-->]]>'
		'<!ENTITY % partial "<![INCLUDE[<!--ignore-->">%partial;]]>'
		'<!ENTITY % partial "INCLUDE["><![%partial;<!--ignore-->]]>'
		'<!ENTITY % partial "INCLUDE[<!--ignore-->"><![%partial;]]>'
		'<!ENTITY % partial "INCLUDE[<!--ignore-->]]>"><![%partial;'
		'<!ENTITY % partial "]]>"><![INCLUDE[<!--ignore-->%partial;')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
	self
		shouldnt: [| dtd |
			dtd := '
				<!ENTITY % partial1 "INCLUDE">
				<!ENTITY % partial2 "<!--ignore-->">
				<!ENTITY % total "<![%partial1;[%partial2;]]>">
				%total;'.
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingProcessingInstruction [
	#('<!DOCTYPE test [
				<!ENTITY partial "<">
			]><test>&partial;?name value?></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<?">
			]><test>&partial;name value?></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<?name">
			]><test>&partial; value?></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<?name value">
			]><test>&partial;?></test>'
		'<!DOCTYPE test [
				<!ENTITY partial "<?name value?">
			]><test>&partial;></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].

	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test [
						<!ENTITY total "<?name value?>">
					]><test>&total;</test>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingSubsetComment [
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded
	with spaces which interrupt the '<!--' and '-->' sequences"
	#('<!ENTITY % partial "<">%partial;!--ignore-->'
		'<!ENTITY % partial "<!">%partial;--ignore-->'
		'<!ENTITY % partial "<!-">%partial;-ignore-->'
		'<!ENTITY % partial "<!--ignore-">%partial;->'
		'<!ENTITY % partial "<!--ignore--">%partial;>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	#('<!ENTITY % partial "<!--">%partial;ignore-->'
		'<!ENTITY % partial "<!--ignore">%partial;-->')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
	self
		shouldnt: [| dtd |
			dtd := '
				<!ENTITY % total "<!--ignore-->">
				%total;'.
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testEntityNestingSubsetProcessingInstruction [
	| xml |
	
	xml := '<!DOCTYPE test SYSTEM "extern.dtd"><test/>'.

	"these are wellformedness exceptions because the replacement is surrounded
	with spaces which interrupt the '<?name' and '?>' sequences"
	#('<!ENTITY % partial "<">%partial;?name value?>'
		'<!ENTITY % partial "<?">%partial;name value?>'
		'<!ENTITY % partial "<?name value?">%partial;>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLWellFormednessException].

	#('<!ENTITY % partial "<?name">%partial; value?>'
		'<!ENTITY % partial "<?name value">%partial;?>')
		do: [:each |
			self
				should: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: xml)
						externalEntityResolver:
							(DTDStaticExternalEntityResolver externalEntities:
								(Array with: 'extern.dtd' -> each));
						isValidating: false;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLException].
	self
		shouldnt: [| dtd |
			dtd := '
				<!ENTITY % total "<?name value?>">
				%total;'.
			(SAXHandler on: xml)
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.dtd' -> dtd));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceInternalDeclaration [
	#('<!DOCTYPE root [
			<!ENTITY % name "root">
			<!ENTITY % contentModel "EMPTY">
			<!ELEMENT %name; %contentModel;>
		]><root/>'
		'<!DOCTYPE root [
			<!ENTITY % name "value">
			<!ENTITY % name2 "%name;">
		]><root/>'
		'<!DOCTYPE root [
			<!ENTITY % name "value">
			<!ENTITY name2 "%name;">
		]><root/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY % element "<!ELEMENT root EMPTY>">
					%element;
				]><root/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceInternalDeclarationExternallyDefined [
	| declarations |

	self
		shouldnt: [
			"the rule against param entity refs in internal declarations
			shouldn't apply to declarations in external entities included
			in the subset"
			declarations := '
				<!ENTITY % name "test">
				<!ENTITY % contentModel "(#PCDATA)">
				<!ELEMENT %name; %contentModel;>'.
			(SAXHandler on: '
				<!DOCTYPE test [
					<!ENTITY % extern SYSTEM "extern.ent">
					%extern;
					<!ATTLIST test name CDATA #IMPLIED>
				]>
				<test name="value">test</test>')
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.ent' -> declarations));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
	self
		should: [
			"the rule against param entity refs in internal declarations
			should apply to declarations in internal entities included
			in the subset even if they're internal to an external entity"
			declarations :=
				'<!ENTITY % extern2 "
					<!ENTITY &#37; name &#34;test&#34;>
					<!ENTITY &#37; contentModel &#34;(#PCDATA)&#34;>
					<!ELEMENT &#37;name; &#37;contentModel;>
				">'.
			(SAXHandler on: '
				<!DOCTYPE test [
					<!ENTITY % extern SYSTEM "extern.ent">
					%extern;
					%extern2;
					<!ATTLIST test name CDATA #IMPLIED>
				]>
				<test name="value">test</test>')
				externalEntityResolver:
					(DTDStaticExternalEntityResolver externalEntities:
						(Array with: 'extern.ent' -> declarations));
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReferencePredefined [
	| document references replacements |

	references := String new writeStream.
	replacements := String new writeStream.
	XMLWellFormedParserTokenizer predefinedEntities keysAndValuesDo: [:name :char |
		references
			nextPut: $&;
			nextPutAll: name;
			nextPut: $;.
		replacements nextPut: char].

	document :=
		XMLDOMParser parse:
			('<!DOCTYPE root [
				<!ENTITY nonRecursive "&amp;nonRecursive;">]>
			<root name=''{1}''>
				<one>{1}</one>
				<two>&nonRecursive;</two>
			</root>' format: (Array with: references contents)).
	self
		assert: (document root attributeAt: 'name') = replacements contents;
		assert: (document root contentStringAt: 'one') = replacements contents;
		assert: (document root contentStringAt: 'two') = '&nonRecursive;'.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUndeclared [
	"it's a WFC if there's no DTD or an internal-only DTD that
	contains no param entity refs or if it's standalone"
	#('<test>&undeclared;</test>'
		'<test name="&undeclared;"/>'
		'<DOCTYPE test [
			<!ELMENT test EMPTY>
		]>
		<test>&undeclared;</test>'
		'<DOCTYPE test [
			<!ELMENT test EMPTY>
			<!ATTLIST test name CDATA #IMPLIED>
		]>
		<test name="&undeclared;"/>'
		'<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE test SYSTEM "extern.dtd">
		<test>&undeclared;</test>'
		'<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE test SYSTEM "extern.dtd">
		<test name="&undeclared;"/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].

	"otherwise it's a validity constraint only"
	#('<!DOCTYPE test SYSTEM "extern.dtd">
		<test>&undeclared;</test>'
		'<!DOCTYPE test SYSTEM "extern.dtd">
		<test name="&undeclared;"/>'
		'<!DOCTYPE test [
			%undeclared;
		]>
		<test>&undeclared;</test>'
		'<!DOCTYPE test [
			%undeclared;
		]>
		<test name="&undeclared;"/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: each)
						isValidating: false;
						parseDocument]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUndeclaredInEntityValue [
	| resolver |

	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'extern.dtd'
		put: '<!ENTITY unreferenced "%undeclared;">'.
	self
		should: [
			(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd"><root/>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on: '<!DOCTYPE root SYSTEM "extern.dtd"><root/>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLWellFormednessException.

	"the spec only requires general entity refs in replacements to be
	well-formed, not declared, unless it's referenced too"
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY unreferenced "&undeclared;">
				]><root/>']
		raise: XMLWellFormednessException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY unreferenced "&undeclared;">
				]><root>&unreferenced;</root>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUndeclaredPreserved [
	| xml parser document |

	xml := '
		<!DOCTYPE root PUBLIC "extern" "extern.dtd" [
			<!ENTITY unreferenced "&undeclaredOne;">
			%undeclaredOne;
		]>
		<root name="&#34;&undeclaredOne;&#34;">&lt;&undeclaredTwo;&gt;</root>'.
	(parser := XMLDOMParser on: xml)
		isValidating: false;
		preservesUndeclaredEntityReferences: true.
	document := parser parseDocument.

	self
		assert: document doctypeDeclaration nodes size = 1;
		assert: document doctypeDeclaration firstNode replacement = '&undeclaredOne;';
		assert: (document root attributeAt: 'name') = '"&undeclaredOne;"';
		assert: (document root contentString) = '<&undeclaredTwo;>'.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnexpected [
	#('<!DOCTYPE test [
			<!ENTITY entity "<!--comment-->">
			&entity;]>
		<test/>'
		'<!DOCTYPE test [
			<!ENTITY entity "<!--comment-->">
			]>
		&entity;
		<test/>'
		'<!DOCTYPE test [
			<!ENTITY entity "<!--comment-->">
			]>
		<test/>
		&entity;')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			"should still raise errors even when replacement is disabled"
			self
				should: [
					(SAXHandler on: each)
						replacesContentEntityReferences: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnreplaced [
	| beforeSubset subset afterSubset xml document |

	beforeSubset := '<?xml version="1.1"?> <!DOCTYPE entity ['.
	subset :=
		'<!ENTITY % first "<!ENTITY second &#34;replacement&#34;>">
		%first;'.
	afterSubset := ']><entity>&second;</entity>'.
	xml := beforeSubset, subset, afterSubset.
	self assert: (XMLDOMParser parse: xml) root contentString = 'replacement'.
	
	document :=
		(XMLDOMParser on: xml)
			replacesContentEntityReferences: false;
			parseDocument.
	self assert: document root contentString = '&second;'.
	self
		should: [
			(SAXHandler on: (beforeSubset, '%first;]>'))
				replacesContentEntityReferences: false;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnreplacedInContent [
	| xml document |

	xml := '
		<!DOCTYPE one [<!ENTITY declared "replacement">]>
		<one two="&quot;&declared;&quot;">&#60;&declared;&#x2F;&#x3e;</one>'.
	document :=
		(XMLDOMParser on: xml)
			replacesContentEntityReferences: false;
			parseDocument.
	self
		assert: (document root attributeAt: 'two') = '&quot;&declared;&quot;';
		assert: document root contentString = '&#60;&declared;&#x2F;&#x3e;'.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnreplacedInContentUndeclared [
	| xml document |

	xml := '
		<!DOCTYPE one SYSTEM "extern.dtd" [
			<!ENTITY declared "replacement">
		]>
		<one two="&quot;&undeclared;&quot;">&#60;&undeclared;&#62;</one>'.
	self
		should: [
			(SAXHandler on: xml)
				replacesContentEntityReferences: false;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: xml)
					replacesContentEntityReferences: false;
					isValidating: false;
					parseDocument]
		raise: XMLValidationException.
	self
		assert: (document root attributeAt: 'two') = '&quot;&undeclared;&quot;';
		assert: document root contentString = '&#60;&undeclared;&#62;'.
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnterminated [
	#('<!DOCTYPE test [
			<!ENTITY % entity "<!ELEMENT test EMPTY>">
			%]><test/>'
		'<!DOCTYPE test [
			<!ENTITY % entity "<!ELEMENT test EMPTY>">
			%;]><test/>'
		'<!DOCTYPE test [
			<!ENTITY % entity "<!ELEMENT test EMPTY>">
			%entity]><test/>'
		'<test>&'
		'<test>&</test>'
		'<test>&amp'
		'<test>&amp</test>'
		'<test>&;'
		'<test>&;</test>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			"should still raise errors even when replacement is disabled"
			self
				should: [
					(SAXHandler on: each)
						replacesContentEntityReferences: false;
						parseDocument]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testEntityReferenceUnterminatedInEntityValue [
	#('<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY param "&">
		]><test/>'
		'<!DOCTYPE test [
			<!ENTITY name "value">
			<!ENTITY param "&name">
		]><test/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].

	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test [
					<!ENTITY name "value">
					<!ENTITY param "&name;">
				]><test/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReplacement [
	| document |

	document := XMLDOMParser parse: '
		<!DOCTYPE root [
			<!ENTITY % name1Declaration "<!ENTITY name1 &#39;replacement1&#x27;>">
			%name1Declaration;
			<!ENTITY name2 "replacement2 &name1;" >
			<!ENTITY name3 "replacement3 &name2;" >
			<!ENTITY quotes "&#x27;quoted &#x22;value&#34;&#39;">
		]>
		<root name="&quotes;">&name1; &name2; &name3; ',
		'%name1Declaration;</root>'.
	self assert:
		document root contentString =
			('replacement1 ',
			'replacement2 replacement1 ',
			'replacement3 replacement2 replacement1 ',
			'%name1Declaration;').
	self assert:
		(document root attributeAt: 'name') =
			(('quoted "value"' copyWithFirst: $') copyWith: $').
]

{ #category : #tests }
XMLParserTest >> testEntityReplacementEmpty [
	| xml document |

	xml := '<?xml version="1.0"?>
	<!DOCTYPE entities [
		<!ENTITY % inner "">
		%inner;
		<!ENTITY inner  ""> 
		<!ENTITY outer ''&inner;''>]>
	<entities one="&outer;" two="&inner;" three=''&outer;'' four=''&inner;''>&outer;&inner;</entities>'.

	self
		shouldnt: [document := XMLDOMParser parse: xml]
		raise: XMLWellFormednessException.
	self
		assert: (document root attributeAt: 'one') = '';
		assert: (document root attributeAt: 'two') = '';
		assert: (document root attributeAt: 'three') = '';
		assert: (document root attributeAt: 'four') = '';
		assert: document root contentString = ''.
]

{ #category : #tests }
XMLParserTest >> testEntityReplacementSelfReferential [
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [<!ENTITY first "&first;">]><root>&first;</root>']
		raise: XMLWellFormednessException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [<!ENTITY % first "&#37;first;">%first;]><root/>']
		raise: XMLWellFormednessException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY first "&second;">
					<!ENTITY second "&first;">]><root>&first;</root>']
		raise: XMLWellFormednessException.
	self
		should: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY % first "&#37;second;">
					<!ENTITY % second "&#37;first;">
					%first;]><root/>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY first "&second;">
					<!ENTITY second "<!--replacement-->">]><root>&first;</root>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE root [
					<!ENTITY % first "&#37;second;">
					<!ENTITY % second "<!--replacement-->">
					%first;]><root/>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReplacementStandard [
	"this test comes from the XML spec"
	| dtd xml doc |

	dtd := '
		<!ENTITY % pub    "&#xc9;ditions Gallimard" >
		<!ENTITY   rights "All rights reserved" >
		<!ENTITY   book   "La Peste: Albert Camus, &#xA9; 1947 %pub;. &rights;" >'.
	xml := '
		<!DOCTYPE test SYSTEM ''extern.dtd''>
		<test>&book;</test>'.
	doc :=
		(XMLDOMParser on: xml)
			externalEntityResolver:
				(DTDStaticExternalEntityResolver externalEntities:
					(Array with: 'extern.dtd' -> dtd));
			resolvesExternalEntities: true;
			parseDocument.
	self assert:
		doc root contentString =
			('La Peste: Albert Camus, ', 16rA9 asCharacter asString, ' 1947 ',
				16rC9 asCharacter asString, 'ditions Gallimard. All rights reserved').
]

{ #category : #tests }
XMLParserTest >> testEntityReplacementStandardLiteral [
	"this test comes from the XML spec"
	| dtd xml resolver doc |

	dtd := '
		<!ENTITY % YN ''"Yes"'' >
		<!ENTITY WhatHeSaid "He said %YN;" >'.
	xml := '
		<!DOCTYPE element SYSTEM ''extern.dtd''>
		<element attribute="&WhatHeSaid;"></element>'.
	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'extern.dtd'
		put: dtd.
	doc :=
		(XMLDOMParser on: xml)
			externalEntityResolver: resolver;
			resolvesExternalEntities: true;
			parseDocument.
	self assert: (doc root attributeAt: 'attribute') = 'He said "Yes"'.

	dtd := '<!ENTITY EndAttr "27''" >'.
	xml := '
		<!DOCTYPE element SYSTEM ''extern.dtd''>
		<element attribute=''a-&EndAttr;></element>'.
	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'extern.dtd'
		put: dtd.
	self
		should: [
			(SAXHandler on: xml)
				externalEntityResolver: resolver;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testEntityReplacementTerminatingInternalSubset [
	#('<!DOCTYPE root [<!ENTITY % end "]>">%end;'
		'<!DOCTYPE root [<!ENTITY % end "]">%end;>')
		do: [:each |
			self
				should: [SAXHandler parse: each,  '<root/>']
				raise: XMLWellFormednessException].
	#('<!DOCTYPE root [<!ENTITY % end "">%end;]>'
		'<!DOCTYPE root [<!ENTITY % end "<!--]>-->">%end;]>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: each,  '<root/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testEntityURIInheritance [
	| xml parser driver |

	xml := '<!DOCTYPE root [%first;]><root xml:base="/new/xml">&second;</root>'.
	parser :=
		(SAXHandler
			on: xml
			documentURI: 'test.xml') parser.
	(driver := parser driver)
		doctypeDefinition parameterEntities
			at: 'first'
			put:
				((DTDExternalParameterParsedEntity name: 'first')
					resolvedReplacement:
						(DTDDecodedResolvedExternalParsedEntityReplacement contents:
							'<!ENTITY second "<!--comment-->">');
					uri: 'test.ent').

	self assert: driver baseURI = 'test.xml'.

	3 timesRepeat: [parser parseToken].
	self assert: driver baseURI = 'test.ent'.

	2 timesRepeat: [parser parseToken].
	self assert: driver baseURI = 'test.xml'.
	
	"internal entities (declared in the internal subset or in an external DTD)
	can't change abase URI according to the xml:base spec"
	2 timesRepeat: [parser parseToken].
	self assert: driver baseURI = '/new/xml'.

	3 timesRepeat: [parser parseToken].
	self
		assert: driver baseURI = 'test.xml';
		assert: parser atEnd.
]

{ #category : #tests }
XMLParserTest >> testIsInContent [
	| xml handler parser |

	xml := '<?xml version="1.0"?>
			<!--comment-->
			<?target data?>
			<!DOCTYPE root [<!ELEMENT root EMPTY>]>
			<!--comment-->
			<?target data?>
			<root/>'.
	handler := SAXHandler on: xml.
	parser := handler parser.
	9 timesRepeat: [
		parser parseToken.
		self deny: handler isInContent].
	parser parseToken.
	self assert: handler isInContent.
]

{ #category : #tests }
XMLParserTest >> testLineEndingsDoNotMatter [
	| source docFromSourceWithCRs docFromSourceWithLFs docFromSourceWithCRLFs |

	source := '<root>{1}one{1}two{1}</root>'.
	docFromSourceWithCRs := XMLDOMParser parse: (source format: (Array with: String cr)).
	docFromSourceWithLFs := XMLDOMParser parse: (source format: (Array with: String lf)).
	docFromSourceWithCRLFs := XMLDOMParser parse: (source format: (Array with: String crlf)).
	self
		assert: (docFromSourceWithCRs root contentString) = (docFromSourceWithLFs root contentString);
		assert: (docFromSourceWithLFs root contentString) = (docFromSourceWithCRLFs root contentString).
]

{ #category : #tests }
XMLParserTest >> testNamespaceAttributePrefixAliasing [
	| xmlns |

	xmlns := 'xmlns:prefix1="ns" xmlns:prefix2="ns"'.
	self
		shouldnt: [
			SAXHandler
				parse: '<test ', xmlns, ' prefix1:name1="value" prefix2:name2="value2"/>'
				usingNamespaces: true]
		raise: XMLNamespaceException.

	(Array
		with: '<test ', xmlns, ' prefix1:aliased="value" prefix2:aliased="value2"/>'
		with: "ensure it checks inherited namespaces"
			'<test ', xmlns, '>
				<test2 prefix1:aliased="value" prefix2:aliased="value2"/>
			</test>'
		with: "and default attributes"
			'<!DOCTYPE test [
				<!ELEMENT test (test2)>
				<!ATTLIST test
					xmlns:prefix1 CDATA #IMPLIED
					xmlns:prefix2 CDATA #IMPLIED>
				<!ELEMENT test2 EMPTY>
				<!ATTLIST test2
					prefix1:aliased CDATA "value"
					prefix2:aliased CDATA "value2">
			]>
			<test ', xmlns, '>
				<test2/>
			</test>')
		do: [:each |
			self
				should: [
					SAXHandler
						parse: each
						usingNamespaces: true]
				raise: XMLNamespaceException.
			self
				shouldnt: [
					SAXHandler
						parse: each
						usingNamespaces: false]
				raise: XMLNamespaceException].
]

{ #category : #tests }
XMLParserTest >> testNamespaceDeclaration [
	self
		shouldnt: [SAXHandler parse: '<prefix:root prefix:name="test" xmlns:prefix="NS"/>']
		raise: XMLNamespaceException.
	self
		shouldnt: [SAXHandler parse: '<root xmlns="defaultNS"/>']
		raise: XMLNamespaceException.
	self
		shouldnt: [SAXHandler parse: '<root xmlns=""/>' usingNamespaces: true]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLParserTest >> testNamespaceDeclarationBadPrefix [
	self
		should: [SAXHandler parse: '<root xmlns:invalid:prefix="invalidNS"/>']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root xmlns::invalidprefix="invalidNS"/>']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root xmlns:invalidprefix:="invalidNS"/>']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<:invalidname />']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<invalidname: />']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root :invalidname="test" />']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root invalidname:="test" />']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLParserTest >> testNamespaceDeclarationBadURI [
	self
		should: [SAXHandler parse: '<root xmlns:empty=""/>' usingNamespaces: true]
		raise: XMLNamespaceException.

	"Cannot change xmlns or xml prefixes"
	self
		should: [SAXHandler parse: '<root xmlns:xmlns="newNS"/>' usingNamespaces: true]
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root xmlns:xml="newNS" />' usingNamespaces: true]
		raise: XMLNamespaceException.

	"Redundant xml prefix mapping is ok, but xmlns is not"
	self
		shouldnt: [
			SAXHandler
				parse: '<root xmlns:xml="', XMLNamespaceScope xmlNamespaceURI, '"/>'
				usingNamespaces: true]
		raise: XMLNamespaceException.
	self
		should: [
			SAXHandler
				parse: '<root xmlns:xmlns="', XMLNamespaceScope xmlnsNamespaceURI, '"/>'
				usingNamespaces: true]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLParserTest >> testNamespaceDeclarationRedundance [
	#('<test xmlns:prefix="prefixNS" xmlns:prefixTwo="prefixTwoNS" xmlns:prefix="prefixNS" />'
		'<test xmlns:prefix="prefixNS" xmlns:prefixTwo="prefixTwoNS" xmlns:prefix="prefixTwoNS" />'
		'<test xmlns="defaultNS" xmlns:prefix="prefixNS" xmlns="defaultNS" />'
		'<test xmlns="defaultNS" xmlns:prefix="prefixNS" xmlns="defaultTwoNS" />')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testNamespaceParsing [
	self
		shouldnt: [SAXHandler parse: self addressBookNamespacedXML]
		raise: XMLException.
	self
		shouldnt: [
			SAXHandler
				parse: self addressBookNamespacedXML
				usingNamespaces: false]
		raise: XMLException.

	self
		shouldnt: [SAXHandler parse: self addressBookNamespacePrefixedXML]
		raise: XMLException.
	self
		shouldnt: [
			SAXHandler
				parse: self addressBookNamespacePrefixedXML
				usingNamespaces: false]
		raise: XMLException.
]

{ #category : #tests }
XMLParserTest >> testNamespacePrefixInheritance [
	self
		shouldnt: [
			SAXHandler
				parse:
					'<one xmlns:prefix1="ns">
						<prefix1:two xmlns:prefix2="ns2">
							<prefix2:three><prefix1:four /></prefix2:three>
						</prefix1:two>
					</one>'
				usingNamespaces: true]
		raise: XMLNamespaceException.
	
	#('<one xmlns:prefix1="ns">
			<prefix1:two xmlns:prefix2="ns2" />
			<prefix2:three />
		</one>'
		'<one xmlns:prefix1="ns">
			<prefix1:two xmlns:prefix2="ns2">
				<prefix2:three xmlns:prefix3="ns3" />
			</prefix1:two>
			<prefix3:four />
		</one>')
		do: [:each |
			self
				should: [
					SAXHandler
						parse: each
						usingNamespaces: true]
				raise: XMLNamespaceException.
			self
				shouldnt: [
					SAXHandler
						parse: each
						usingNamespaces: false]
				raise: XMLNamespaceException].
]

{ #category : #tests }
XMLParserTest >> testNamespaceUndeclared [
	self
		shouldnt: [SAXHandler parse: '<prefix:root prefix:name="test"/>' usingNamespaces: false]
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<prefix:root/>']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<root prefix:name="test"/>']
		raise: XMLNamespaceException.

	"xml is OK as a prefix, xmlns is not"
	self
		shouldnt: [SAXHandler parse: '<xml:root xml:name="test"/>']
		raise: XMLNamespaceException.
	self
		should: [SAXHandler parse: '<xmlns:root />']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLParserTest >> testNotationDeclarationRedundance [
	#('<!DOCTYPE test [
			<!NOTATION name PUBLIC "note">
			<!NOTATION name PUBLIC "newnote">
		]>'
		'<!DOCTYPE test [
			<!NOTATION name PUBLIC "note">
			<!NOTATION name PUBLIC "note">
		]>'
		'<!DOCTYPE test [
			<!NOTATION name PUBLIC "note">
			<!NOTATION name SYSTEM "newnote">
		]>')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: each, '<test/>')
						isValidating: false;
						parseDocument]
				raise: XMLValidationException]
]

{ #category : #tests }
XMLParserTest >> testNotationDeclarationUnterminated [
	#('<!NOTATION'
		'<!NOTATION>'
		'<!NOTATION name'
		'<!NOTATION name>'
		'<!NOTATION name PUBLIC'
		'<!NOTATION name PUBLIC>'
		'<!NOTATION name PUBLIC "'
		'<!NOTATION name PUBLIC ">'
		'<!NOTATION name PUBLIC "pubicid"'
		'<!NOTATION name PUBLIC '''
		'<!NOTATION name PUBLIC ''>'
		'<!NOTATION name PUBLIC ''pubicid'''
		'<!NOTATION name PUBLIC "pubicid''>'
		'<!NOTATION name PUBLIC ''pubicid">'
		'<!NOTATION name SYSTEM'
		'<!NOTATION name SYSTEM>'
		'<!NOTATION name SYSTEM "'
		'<!NOTATION name SYSTEM ">'
		'<!NOTATION name SYSTEM "systemid"'
		'<!NOTATION name SYSTEM '''
		'<!NOTATION name SYSTEM ''>'
		'<!NOTATION name SYSTEM ''systemid'''
		'<!NOTATION name SYSTEM "systemid''>'
		'<!NOTATION name SYSTEM ''systemid">')
		do: [:each |
			self
				should: [SAXHandler parse: '<!DOCTYPE test [', each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: '<!DOCTYPE test [', each, ']><test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testNotationDeclarationWhitespace [
	#('<!DOCTYPE test [<!NOTATIONname PUBLIC "publicid">]>'
		'<!DOCTYPE test [<!NOTATION name PUBLIC"publicid">]>'
		'<!DOCTYPE test [<!NOTATION name PUBLIC "publicid""systemid">]>'
		'<!DOCTYPE test [<!NOTATION name SYSTEM"systemid">]>')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].

	#('<!DOCTYPE test [<!NOTATION     name  PUBLIC  "publicid"   >]>'
		'<!DOCTYPE test [<!NOTATION name PUBLIC        "publicid"   "systemid"   >]>'
		'<!DOCTYPE test [<!NOTATION name SYSTEM        "systemid"		>]>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testPCDataBadChar [
	self nonChars do: [:each |
		self
			should: [SAXHandler parse: '<test>', each asString, '</test>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testPCDataOutsideElement [
	#('<!DOCTYPE test [ test ]><test/>'
		'test<test/>'
		'	test<test/>'
		'<test/>test'
		'<test/>	test')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testPCDataWithCDataTerminator [
	self
		should: [SAXHandler parse: '<test>test]]>test</test>']
		raise: XMLWellFormednessException.

	#('<test>test]] >test</test>'
		'<test>test] ]>test</test>'
		'<test>test ] ] > test</test>'
		'<test name="test]]>test]] >test] ]>test ] ] > test"/>')
		do: [:each | 
			self
				shouldnt: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testParserLittleDocument [

	| doc |
	doc := XMLDOMParser parse: 
'<?xml version="1.0" encoding="UTF-8"?>
<!--an example-->
<example:user xmlns:example="urn://example">
    <username>jsmith</username>
    <real-name>John Smith</real-name>
    <age>25</age>
    <id>101</id>
</example:user>' readStream.
]

{ #category : #tests }
XMLParserTest >> testProcessingInstructionBadChar [
	self nonChars do: [:each |
		self
			should: [SAXHandler parse: '<?pi ', each asString, '?><test/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testProcessingInstructionBadTarget [
	self badNames, #('xml' 'XML' 'Xml' 'xML' 'XMl' 'xmL' 'XmL' 'xMl')
		do: [:each |
			self
				should: [SAXHandler parse: '<?', each, ' value?><test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testProcessingInstructionUnterminated [
	#('<?'
		'<??'
		'<??>'
		'<?name'
		'<?name?'
		'<?name value'
		'<?name value?'
		'<?name value>')
		do: [:each | 
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: '<test/>', each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: '<test/>', each, '<test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testProcessingInstructionWhitespace [
	self
		should: [SAXHandler parse: '<pi><?target?data?></pi>']
		raise: XMLWellFormednessException.
	self
		shouldnt: [SAXHandler parse: '<pi><?target ?data  ?></pi>']
		raise: XMLWellFormednessException.
]

{ #category : #tests }
XMLParserTest >> testSchemaRequired [
	self
		shouldnt: [
			(SAXHandler on: '<!DOCTYPE root [<!ELEMENT root EMPTY>]><root/>')
				requiresSchema: true;
				parseDocument]
		raise: XMLValidationException.
	self
		should: [
			(SAXHandler on: '<root/>')
				requiresSchema: true;
				parseDocument]
		raise: XMLValidationException.
	self
		should: [
			(SAXHandler on: '
				<!DOCTYPE root [
					<!ENTITY one "two">
					<!ENTITY % three "four">
					<!NOTATION five PUBLIC "six">
					<!--seven-->]>
				<root/>')
				requiresSchema: true;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testStandalone [
	| xmlWithDTD standaloneXMLWithDTD resolver |

	xmlWithDTD := self addressBookXMLWithDTD.
	standaloneXMLWithDTD :=
		xmlWithDTD
			copyReplaceAll: '?>'
			with: ' standalone="yes" ?>'.
	"an empty static resolver that won't be able to resolve the DTD system ID"
	resolver := DTDStaticExternalEntityResolver new.
	self
		shouldnt: [
			(SAXHandler on: xmlWithDTD)
				externalEntityResolver: resolver copy;
				parseDocument]
		raise: XMLParserException.
	self
		should: [
			(SAXHandler on: xmlWithDTD)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLParserException.
	self
		should: [
			(SAXHandler on: xmlWithDTD)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLParserException.

	self
		shouldnt: [
			(SAXHandler on: standaloneXMLWithDTD)
				externalEntityResolver: resolver copy;
				parseDocument]
		raise: XMLParserException.
	"with validation, standlone external subsets must be retrieved"
	self
		should: [
			(SAXHandler on: standaloneXMLWithDTD)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLParserException.
	"but without validation, they are ignored"
	self
		shouldnt: [
			(SAXHandler on: standaloneXMLWithDTD)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalAttributeDefaultValue [
	| standalone notStandalone dtdTemplate defaultValueStandaloneContent nonDefaultValueStandaloneContent |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtdTemplate := '
		<!DOCTYPE test [
			<!ELEMENT test (one,two)>
			<!ELEMENT one EMPTY>
			<!ELEMENT two EMPTY>
			<!ENTITY % extern ''{1}''>
			%extern;
			{2}
		]>'.
	"the attributes defined internally can rely on default values, but
	the standalone externally defined ones can't"
	defaultValueStandaloneContent :=
		'<test><one/><two one="one" two="two" three="one"/></test>'.
	nonDefaultValueStandaloneContent :=
		'<test><one one="one"/><two one="one"/></test>'.
	#(
		#('<!ATTLIST one one CDATA "one">'
				'<!ATTLIST two one CDATA "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three CDATA "one">')
		"ID attributes cannot have default values so are not tested"
		#('<!ATTLIST one one IDREF "one">'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three IDREF "one">')
		#('<!ATTLIST one one IDREFS "one">'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three IDREFS "one">')
		#('<!ATTLIST one one ENTITY "one">'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITY "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three ENTITY "one">')
		#('<!ATTLIST one one ENTITIES "one">'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITIES "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three ENTITIES "one">')
		#('<!ATTLIST one one NMTOKEN "one">'
				'<!ATTLIST two one NMTOKEN "one">
				<!ATTLIST two two NMTOKEN "two">
				<!ATTLIST two three NMTOKEN "one">')
		#('<!ATTLIST one one NMTOKENS "one">'
				'<!ATTLIST two one NMTOKENS "one">
				<!ATTLIST two two NMTOKENS "two">
				<!ATTLIST two three NMTOKENS "one">')
		#('<!ATTLIST one one (one) "one">'
				'<!ATTLIST two one (one) "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three (one) "one">')
		#('<!ATTLIST one one NOTATION (one) "one">'
				'<!NOTATION one PUBLIC "note.txt">
				<!ATTLIST two one NOTATION (one) "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three CDATA "one">'))
		do: [:each | | dtd |
			dtd := dtdTemplate format: each.
			self
				should: [SAXHandler parse: standalone, dtd, defaultValueStandaloneContent]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, defaultValueStandaloneContent)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [SAXHandler parse: standalone, dtd, nonDefaultValueStandaloneContent]
				raise: XMLValidationException.

			self
				shouldnt: [SAXHandler parse: notStandalone, dtd, defaultValueStandaloneContent]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalAttributeDefaultValueExternalSubset [
	| standalone notStandalone dtdTemplate defaultValueStandaloneContent nonDefaultValueStandaloneContent |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtdTemplate :=
		'<!DOCTYPE test SYSTEM "extern.dtd" [
			<!ELEMENT test (one,two)>
			<!ELEMENT one EMPTY>
			<!ELEMENT two EMPTY>
			{1}
		]>'.
	"the attributes defined internally can rely on default values, but
	the standalone externally defined ones can't"
	defaultValueStandaloneContent :=
		'<test><one/><two one="one" two="two" three="one"/></test>'.
	nonDefaultValueStandaloneContent :=
		'<test><one one="one"/><two one="one"/></test>'.
	#(
		#('<!ATTLIST one one CDATA "one">'
				'<!ATTLIST two one CDATA "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three CDATA "one">')
		"ID attributes cannot have default values so are not tested"
		#('<!ATTLIST one one IDREF "one">'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three IDREF "one">')
		#('<!ATTLIST one one IDREFS "one">'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three IDREFS "one">')
		#('<!ATTLIST one one ENTITY "one">'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITY "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three ENTITY "one">')
		#('<!ATTLIST one one ENTITIES "one">'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITIES "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three ENTITIES "one">')
		#('<!ATTLIST one one NMTOKEN "one">'
				'<!ATTLIST two one NMTOKEN "one">
				<!ATTLIST two two NMTOKEN "two">
				<!ATTLIST two three NMTOKEN "one">')
		#('<!ATTLIST one one NMTOKENS "one">'
				'<!ATTLIST two one NMTOKENS "one">
				<!ATTLIST two two NMTOKENS "two">
				<!ATTLIST two three NMTOKENS "one">')
		#('<!ATTLIST one one (one) "one">'
				'<!ATTLIST two one (one) "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three (one) "one">')
		#('<!ATTLIST one one NOTATION (one) "one">'
				'<!NOTATION one PUBLIC "note.txt">
				<!ATTLIST two one NOTATION (one) "one">
				<!ATTLIST two two CDATA "two">
				<!ATTLIST two three CDATA "one">'))
		do: [:each | | resolver dtd |
			(resolver := DTDStaticExternalEntityResolver new)
				externalEntityAtURI: 'extern.dtd'
				put: each first.
			dtd := dtdTemplate format: (Array with: each second).
			self
				should: [
					(SAXHandler on: standalone, dtd, defaultValueStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, defaultValueStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						isValidating: false;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, nonDefaultValueStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.

			self
				shouldnt: [
					(SAXHandler on: notStandalone, dtd, defaultValueStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException].
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalAttributeNormalization [
	| standalone notStandalone dtdTemplate dtd unnormalizedStandaloneContent normalizedStandaloneContent |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtdTemplate := '
		<!DOCTYPE test [
			<!ELEMENT test (one,two)>
			<!ELEMENT one EMPTY>
			<!ELEMENT two EMPTY>
			<!ENTITY % extern "{1}">
			%extern;
			{2}
		]>'.
	"the attributes defined internally can require further normalization, but
	the standalone externally defined ones can't"
	unnormalizedStandaloneContent :=
		'<test><one one=" one "/><two one="one" two="two" three="one"/></test>'.
	normalizedStandaloneContent :=
		'<test><one one="one"/><two one=" one " two=" two " three=" one "/></test>'.
	#(
		#('<!ATTLIST one one ID #IMPLIED>'
				'<!ATTLIST two one CDATA #IMPLIED>
				<!ATTLIST two two ID #IMPLIED>
				<!ATTLIST two three CDATA #IMPLIED>')
		#('<!ATTLIST one one IDREF #IMPLIED>'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three IDREF #IMPLIED>')
		#('<!ATTLIST one one IDREFS #IMPLIED>'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three IDREFS #IMPLIED>')
		#('<!ATTLIST one one ENTITY #IMPLIED>'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITY #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three ENTITY #IMPLIED>')
		#('<!ATTLIST one one ENTITIES #IMPLIED>'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITIES #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three ENTITIES #IMPLIED>')
		#('<!ATTLIST one one NMTOKEN #IMPLIED>'
				'<!ATTLIST two one NMTOKEN #IMPLIED>
				<!ATTLIST two two NMTOKEN #IMPLIED>
				<!ATTLIST two three NMTOKEN #IMPLIED>')
		#('<!ATTLIST one one NMTOKENS #IMPLIED>'
				'<!ATTLIST two one NMTOKENS #IMPLIED>
				<!ATTLIST two two NMTOKENS #IMPLIED>
				<!ATTLIST two three NMTOKENS #IMPLIED>')
		#('<!ATTLIST one one (one) #IMPLIED>'
				'<!ATTLIST two one (one) #IMPLIED>
				<!ATTLIST two two (two) #IMPLIED>
				<!ATTLIST two three (one) #IMPLIED>')
		#('<!ATTLIST one one NOTATION (one) #IMPLIED>'
				'<!NOTATION one PUBLIC "note.txt">
				<!ATTLIST two one NOTATION (one) #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three CDATA #IMPLIED>'))
		do: [:each |
			dtd := dtdTemplate format: each.
			self
				should: [SAXHandler parse: standalone, dtd, unnormalizedStandaloneContent]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, unnormalizedStandaloneContent)
						isValidating: false;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [SAXHandler parse: standalone, dtd, normalizedStandaloneContent]
				raise: XMLValidationException.

			self
				shouldnt: [SAXHandler parse: notStandalone, dtd, unnormalizedStandaloneContent]
				raise: XMLValidationException].

	"CDATA is never further normalized, so standalone external doesn't affect it"
	dtd :=
		dtdTemplate format:
			#('<!ATTLIST one one CDATA #IMPLIED>'
					'<!ATTLIST two one CDATA #IMPLIED>
					<!ATTLIST two two CDATA #IMPLIED>
					<!ATTLIST two three CDATA #IMPLIED>').
	self
		shouldnt: [SAXHandler parse: standalone, dtd, unnormalizedStandaloneContent]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalAttributeNormalizationExternalSubset [
	| standalone notStandalone dtdTemplate dtd unnormalizedStandaloneContent normalizedStandaloneContent resolver |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtdTemplate := '
		<!DOCTYPE test SYSTEM "extern.dtd" [
			<!ELEMENT test (one,two)>
			<!ELEMENT one EMPTY>
			<!ELEMENT two EMPTY>
			{1}
		]>'.
	"the attributes defined internally can require further normalization, but
	the standalone externally defined ones can't"
	unnormalizedStandaloneContent :=
		'<test><one one=" one "/><two one="one" two="two" three="one"/></test>'.
	normalizedStandaloneContent :=
		'<test><one one="one"/><two one=" one " two=" two " three=" one "/></test>'.
	resolver := DTDStaticExternalEntityResolver new.
	#(
		#('<!ATTLIST one one ID #IMPLIED>'
				'<!ATTLIST two one CDATA #IMPLIED>
				<!ATTLIST two two ID #IMPLIED>
				<!ATTLIST two three CDATA #IMPLIED>')
		#('<!ATTLIST one one IDREF #IMPLIED>'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three IDREF #IMPLIED>')
		#('<!ATTLIST one one IDREFS #IMPLIED>'
				'<!ATTLIST two one ID #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three IDREFS #IMPLIED>')
		#('<!ATTLIST one one ENTITY #IMPLIED>'
				'<!NOTATION note PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA note>
				<!ATTLIST two one ENTITY #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three ENTITY #IMPLIED>')
		#('<!ATTLIST one one ENTITIES #IMPLIED>'
				'<!NOTATION one PUBLIC "note.txt">
				<!ENTITY one PUBLIC "note.txt" "note.txt" NDATA one>
				<!ATTLIST two one ENTITIES #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three ENTITIES #IMPLIED>')
		#('<!ATTLIST one one NMTOKEN #IMPLIED>'
				'<!ATTLIST two one NMTOKEN #IMPLIED>
				<!ATTLIST two two NMTOKEN #IMPLIED>
				<!ATTLIST two three NMTOKEN #IMPLIED>')
		#('<!ATTLIST one one NMTOKENS #IMPLIED>'
				'<!ATTLIST two one NMTOKENS #IMPLIED>
				<!ATTLIST two two NMTOKENS #IMPLIED>
				<!ATTLIST two three NMTOKENS #IMPLIED>')
		#('<!ATTLIST one one (one) #IMPLIED>'
				'<!ATTLIST two one (one) #IMPLIED>
				<!ATTLIST two two (two) #IMPLIED>
				<!ATTLIST two three (one) #IMPLIED>')
		#('<!ATTLIST one one NOTATION (one) #IMPLIED>'
				'<!NOTATION one PUBLIC "note.txt">
				<!ATTLIST two one NOTATION (one) #IMPLIED>
				<!ATTLIST two two CDATA #IMPLIED>
				<!ATTLIST two three CDATA #IMPLIED>'))
		do: [:each |
			(resolver := resolver copy)
				externalEntityAtURI: 'extern.dtd'
				put: each first.
			dtd := dtdTemplate format: (Array with: each second).
			self
				should: [
					(SAXHandler on: standalone, dtd, unnormalizedStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, unnormalizedStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						isValidating: false;
						parseDocument]
				raise: XMLValidationException.
			self
				shouldnt: [
					(SAXHandler on: standalone, dtd, normalizedStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException.

			self
				shouldnt: [
					(SAXHandler on: notStandalone, dtd, unnormalizedStandaloneContent)
						externalEntityResolver: resolver copy;
						resolvesExternalEntities: true;
						parseDocument]
				raise: XMLValidationException].

	"CDATA is never further normalized, so standalone external doesn't affect it"
	(resolver := resolver copy)
		externalEntityAtURI: 'extern.dtd'
		put:
			'<!ATTLIST two one CDATA #IMPLIED>
			<!ATTLIST two two CDATA #IMPLIED>
			<!ATTLIST two three CDATA #IMPLIED>'.
	dtd := dtdTemplate format: #('<!ATTLIST one one CDATA #IMPLIED>').
	self
		shouldnt: [
			(SAXHandler on: standalone, dtd, unnormalizedStandaloneContent)
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalElementDeclarartion [
	| standalone notStandalone dtd |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '
		<!DOCTYPE test [
			<!ELEMENT test (elementContent)>
			<!ENTITY % extern "<!ELEMENT elementContent (elementContent*)>">
			%extern;
		]>'.
	"the externally defined element can't have whitespace around its element 
	ontent, but the internally defined one (test) can"
	self
		should: [
			SAXHandler parse:
				standalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>']
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on:
				standalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>')
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				standalone, dtd, '<test> <elementContent><elementContent/></elementContent> </test>']
		raise: XMLValidationException.

	self
		shouldnt: [
			SAXHandler parse:
				notStandalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalElementDeclarartionExternalSubset [
	| standalone notStandalone dtd resolver |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '
		<!DOCTYPE test SYSTEM "extern.dtd" [
			<!ELEMENT test (elementContent)>
		]>'.
	resolver :=
		DTDStaticExternalEntityResolver externalEntities:
			(Array with: 'extern.dtd' -> '<!ELEMENT elementContent (elementContent*)>').
	"the externally defined element can't have whitespace around its element 
	ontent, but the internally defined one (test) can"
	self
		should: [
			(SAXHandler on:
				standalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on:
				standalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			(SAXHandler on:
				standalone, dtd, '<test> <elementContent><elementContent/></elementContent> </test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.

	self
		shouldnt: [
			(SAXHandler on:
				notStandalone, dtd, '<test><elementContent> <elementContent/> </elementContent></test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalExternalEntity [
	| standalone notStandalone dtd resolver document |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '
		<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ENTITY % extern SYSTEM "extern.ent">
			%extern;
			<!ENTITY otherName SYSTEM "otherName.ent">
		]>'.
	resolver :=
		DTDStaticExternalEntityResolver externalEntities:
			(Array
				with: 'extern.ent' -> '<!ENTITY name SYSTEM "name.ent">'
				with: 'name.ent' -> 'value'
				with: 'otherName.ent' -> 'otherValue').
	self
		should: [
			(SAXHandler on: standalone, dtd, '<test>&name;</test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standalone, dtd, '<test>&name;</test>')
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					isValidating: false;
					parseDocument]
		raise: XMLParserException.
	self assert: document contentString = 'value'.
	"external entities only count as 'external markup declarations' in standalone
	docs if they were defined in the external DTD subset or in a parameter entity"
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standalone, dtd, '<test>&otherName;</test>')
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'otherValue'.

	self
		shouldnt: [
			document :=
				(XMLDOMParser on: notStandalone, dtd, '<test>&name;</test>')
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalExternalEntityExternalSubset [
	| standalone notStandalone dtd subset resolver document |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '
		<!DOCTYPE test SYSTEM "extern.dtd" [
			<!ENTITY otherName SYSTEM "otherName.ent">
		]>'.
	subset := '
		<!ELEMENT test ANY>
		<!ATTLIST test name CDATA #IMPLIED>
		<!ENTITY name SYSTEM "name.ent">'.
	resolver :=
		DTDStaticExternalEntityResolver externalEntities:
			(Array
				with: 'extern.dtd' -> subset
				with: 'name.ent' -> 'value'
				with: 'otherName.ent' -> 'otherValue').
	self
		should: [
			(SAXHandler on: standalone, dtd, '<test>&name;</test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		should: [
			(SAXHandler on: standalone, dtd, '<test>&name;</test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			(SAXHandler on: standalone, dtd, '<test/>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.

	self
		shouldnt: [
			document :=
				(XMLDOMParser on: notStandalone, dtd, '<test>&name;</test>')
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalExternalEntityRedundance [
	| standaloneXML resolver document |

	standaloneXML :=
		'<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name CDATA #IMPLIED>
			<!ENTITY name "value">
			<!ENTITY % extern SYSTEM "extern.ent">
			%extern;
		]>
		<test>&name;</test>'.
	resolver :=
		DTDStaticExternalEntityResolver externalEntities:
			(Array
				with: 'extern.ent' -> '<!ENTITY name SYSTEM "name.ent">'
				with: 'name.ent' -> 'otherValue').
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standaloneXML)
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalInternalEntity [
	| standalone notStandalone dtd document |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '
		<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ENTITY % entity ''<!ENTITY name "value">''>
			%entity;
			<!ENTITY otherName "otherValue">
		]>'.
	self
		should: [SAXHandler parse: standalone, dtd, '<test>&name;</test>']
		raise: XMLValidationException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standalone, dtd, '<test>&name;</test>')
					isValidating: false;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
	self
		shouldnt: [SAXHandler parse: standalone, dtd, '<test>&otherName;</test>']
		raise: XMLValidationException.

	self
		shouldnt: [
			document :=
				XMLDOMParser parse: notStandalone, dtd, '<test>&name;</test>']
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalInternalEntityAttributeDefaultValue [
	| standaloneDTD document |

	standaloneDTD :=
		'<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ENTITY % entity ''<!ENTITY name "value">''>
			%entity;
			<!ATTLIST test name CDATA "&name;">
			<!ENTITY otherName "otherValue">
		]>'.
	self
		should: [SAXHandler parse: standaloneDTD, '<test name="&name;"/>']
		raise: XMLValidationException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standaloneDTD, '<test name="&name;"/>')
					isValidating: false;
					parseDocument]
		raise: XMLValidationException.
	self assert: (document root attributeAt: 'name') = 'value'.

	"Xerces doesn't flag this because the reference is only in the default
	value declaration, but it probably should count because it's still an
	internal (to the document) reference to an external standalone entity"
	self
		should: [XMLDOMParser parse: standaloneDTD, '<test/>']
		raise: XMLValidationException.
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: standaloneDTD, '<test/>')
					isValidating: false;
					parseDocument]
		raise: XMLValidationException.
	self assert: (document root attributeAt: 'name') = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalInternalEntityExternalSubset [
	| standalone notStandalone dtd subset resolver document |

	standalone := '<?xml version="1.0" standalone="yes"?>'.
	notStandalone := '<?xml version="1.0" standalone="no"?>'.
	dtd := '<!DOCTYPE test SYSTEM "extern.dtd">'.
	subset := '
		<!ELEMENT test ANY>
		<!ATTLIST test name CDATA #IMPLIED>
		<!ENTITY name "value">'.
	resolver :=
		DTDStaticExternalEntityResolver externalEntities:
			(Array with: 'extern.dtd' -> subset).
	self
		should: [
			(SAXHandler on: standalone, dtd, '<test>&name;</test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	self
		should: [
			(SAXHandler on: standalone, dtd, '<test>&name;</test>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				isValidating: false;
				parseDocument]
		raise: XMLWellFormednessException.
	self
		shouldnt: [
			(SAXHandler on: standalone, dtd, '<test/>')
				externalEntityResolver: resolver copy;
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLValidationException.
	
	self
		shouldnt: [
			document :=
				(XMLDOMParser on: notStandalone, dtd, '<test>&name;</test>')
					externalEntityResolver: resolver copy;
					resolvesExternalEntities: true;
					parseDocument]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testStandaloneExternalInternalEntityRedundance [
	| standaloneXML document |

	standaloneXML :=
		'<?xml version="1.0" standalone="yes"?>
		<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test name CDATA #IMPLIED>
			<!ENTITY name "value">
			<!ENTITY % entity ''<!ENTITY name "otherValue">''>
			%entity;
		]>
		<test>&name;</test>'.
	self
		shouldnt: [document := XMLDOMParser parse: standaloneXML]
		raise: XMLValidationException.
	self assert: document contentString = 'value'.
]

{ #category : #tests }
XMLParserTest >> testSystemIDBadChar [
	self nonChars do: [:each |
		self
			should: [
				SAXHandler parse:
					'<!DOCTYPE test SYSTEM "', each asString, '"><test/>']
			raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testSystemIDFragment [
	#('<!DOCTYPE test [
			<!ENTITY one SYSTEM "test#one">
		]><test/>'
		'<!DOCTYPE test [
			<!ENTITY % one SYSTEM "test#one">
		]><test/>'
		'<!DOCTYPE test [
			<!NOTATION note SYSTEM "two">
			<!ENTITY two SYSTEM "test#two" NDATA note>
		]><test/>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLParserException].

	"DOCTYPE and NOTATION system IDs with fragments are OK"
	self
		shouldnt: [
			SAXHandler parse:
				'<!DOCTYPE test SYSTEM "test#one" [
					<!NOTATION note SYSTEM "test#two">
					<!ENTITY one SYSTEM "test">
					<!ENTITY % two SYSTEM "test">
					<!ENTITY three SYSTEM "test" NDATA note>
				]><test/>']		
		raise: XMLParserException.
]

{ #category : #tests }
XMLParserTest >> testUnparsedEntity [
	| dtd |

	dtd := '
		<!DOCTYPE root [
			<!NOTATION note PUBLIC "-//ext//note//EN">
			<!ENTITY unparsedEntity SYSTEM "note.txt" NDATA note>
			<!ELEMENT root EMPTY>
			<!ATTLIST root notation ENTITY #REQUIRED>
		]>'.
	self
		shouldnt: [SAXHandler parse: dtd, '<root notation="unparsedEntity" />']
		raise: XMLValidationException.
	self
		should: [SAXHandler parse: dtd, '<root notation="undeclaredUnparsedEntity" />']
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testUnparsedEntityDeclarationRedundance [
	| dtd |

	dtd :=
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test
				name CDATA #IMPIED>
			<!NOTATION external-note SYSTEM "external.txt">
			<!ENTITY external-ent SYSTEM "external.txt" NDATA external-note>
			<!ENTITY external-ent "value">
		]>'.
	#('<test>&external-ent;</test>' '<test name="&external-ent;"></test>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testUnparsedEntityDeclarationUnterminated [
	#('<!ENTITY name PUBLIC "publicid" "systemid" NDATA'
		'<!ENTITY name PUBLIC "publicid" "systemid" NDATA>'
		'<!ENTITY name PUBLIC "publicid" "systemid" NDATA gif'
		'<!ENTITY name SYSTEM "systemid" NDATA'
		'<!ENTITY name SYSTEM "systemid" NDATA>'
		'<!ENTITY name SYSTEM "systemid" NDATA gif')
		do: [:each |
			self
				should: [
					SAXHandler parse:
						'<!DOCTYPE test [
							<!NOTATION gif SYSTEM "file.gif">',
							each]
				raise: XMLWellFormednessException.
			self
				should: [
					SAXHandler parse:
						'<!DOCTYPE test [
							<!NOTATION gif SYSTEM "file.gif">',
							each,
						']><test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testUnparsedEntityReference [
	| dtd |

	dtd :=
		'<!DOCTYPE test [
			<!ELEMENT test ANY>
			<!ATTLIST test
				name CDATA #IMPIED>
			<!NOTATION external-note SYSTEM "external.txt">
			<!ENTITY external-ent SYSTEM "external.txt" NDATA external-note>
		]>'.
	#('<test>&external-ent;</test>' '<test name="&external-ent;"></test>')
		do: [:each |
			self
				should: [SAXHandler parse: dtd, each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testUnparsedEntityUndeclaredNotations [
	| beforeNotation afterNotation |

	beforeNotation := '
		<!DOCTYPE test [
			<!ELEMENT test EMPTY>
			<!ENTITY notationEntity SYSTEM "note.txt" NDATA note>'.
	afterNotation := ']><test/>'.
	self
		should: [SAXHandler parse: beforeNotation, afterNotation]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler
				parse: beforeNotation, afterNotation
				usingNamespaces: true
				validation: false]
		raise: XMLValidationException.
	self
		shouldnt: [
			SAXHandler parse:
				beforeNotation, '<!NOTATION note SYSTEM "note.txt">', afterNotation]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationEncodingNameBadChar [
	| validChars |

	validChars := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_.-'.
	0 to: 255 do: [:each | | char charString |
		char := each asCharacter.
		(validChars includes: char)
			ifFalse: [
				charString := char asString.
				self
					should: [SAXHandler parse: '<?xml version="1.0" encoding="ISO', charString, '"?>']
					raise: XMLWellFormednessException]].
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationRedundance [
	#('
<?xml version="1.0"?><test/>'
		' <?xml version="1.0"?><test/>'
		'	<?xml version="1.0"?><test/>'
		'<?xml version="1.0"?><?xml version="1.0"?><test/>'
		'<?xml version="1.0"?><!--comment--><?xml version="1.0"?><test/>'
		'<?xml version="1.0"?><!DOCTYPE test [<?xml version="1.0"?>]><test/>'
		'<?xml version="1.0"?><test><?xml version="1.0"?></test>'
		'<test><?xml version="1.0"?></test>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationStandaloneAttribute [
	#('<?xml version="1.0" standalone=""?>'
		'<?xml version="1.0" standalone="YES"?>'
		'<?xml version="1.0" standalone="Yes"?>'
		'<?xml version="1.0" standalone=" yes "?>'
		'<?xml version="1.0" standalone="NO"?>'
		'<?xml version="1.0" standalone="No"?>'
		'<?xml version="1.0" standalone=" no "?>')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].

	#('<?xml version="1.0" standalone="no"?>'
		'<?xml version="1.0" standalone="yes"?>')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationUnterminated [
	#('<?xml'
		'<?xml ?'
		'<?xml ?>'
		'<?xml version'
		'<?xml version?'
		'<?xml version?>'
		'<?xml version='
		'<?xml version=?'
		'<?xml version=?>'
		'<?xml version="'
		'<?xml version="?'
		'<?xml version="?>'
		'<?xml version="1.0'
		'<?xml version="1.0"'
		'<?xml version="1.0"?'
		'<?xml version=''1.0'
		'<?xml version=''1.0'''
		'<?xml version=''1.0''?'
		'<?xml version="1.0''?>'
		'<?xml version=''1.0"?>'
		'<?xml version="1.0" encoding'
		'<?xml version="1.0" encoding?'
		'<?xml version="1.0" encoding?>'
		'<?xml version="1.0" encoding='
		'<?xml version="1.0" encoding=?'
		'<?xml version="1.0" encoding=?>'
		'<?xml version="1.0" encoding="'
		'<?xml version="1.0" encoding="?'
		'<?xml version="1.0" encoding="?>'
		'<?xml version="1.0" encoding="UTF-8'
		'<?xml version="1.0" encoding="UTF-8"'
		'<?xml version="1.0" encoding="UTF-8"?'
		'<?xml version="1.0" encoding=''UTF-8'
		'<?xml version="1.0" encoding=''UTF-8'''
		'<?xml version="1.0" encoding=''UTF-8''?'
		'<?xml version="1.0" encoding="UTF-8''?>'
		'<?xml version="1.0" encoding=''UTF-8"?>'
		'<?xml version="1.0" encoding="UTF-8" standalone'
		'<?xml version="1.0" encoding="UTF-8" standalone?'
		'<?xml version="1.0" encoding="UTF-8" standalone?>'
		'<?xml version="1.0" encoding="UTF-8" standalone='
		'<?xml version="1.0" encoding="UTF-8" standalone=?'
		'<?xml version="1.0" encoding="UTF-8" standalone=?>'
		'<?xml version="1.0" encoding="UTF-8" standalone="'
		'<?xml version="1.0" encoding="UTF-8" standalone="?'
		'<?xml version="1.0" encoding="UTF-8" standalone="?>'
		'<?xml version="1.0" encoding="UTF-8" standalone="yes'
		'<?xml version="1.0" encoding="UTF-8" standalone="yes"'
		'<?xml version="1.0" encoding="UTF-8" standalone="yes"?'
		'<?xml version="1.0" encoding="UTF-8" standalone=''yes'
		'<?xml version="1.0" encoding="UTF-8" standalone=''yes'''
		'<?xml version="1.0" encoding="UTF-8" standalone=''yes''?'
		'<?xml version="1.0" encoding="UTF-8" standalone="yes''?>'
		'<?xml version="1.0" encoding="UTF-8" standalone=''yes"?>')
		do: [:each |
			self
				should: [SAXHandler parse: each]
				raise: XMLWellFormednessException.
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException]
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationVersionAttribute [
	#(''
		'1'
		'1.'
		'1.0.'
		'1.0.1'
		'1..'
		'1..0'
		'1..0..'
		'1..0..1'
		'.1'
		'.1.'
		'.1.0'
		'.1.0.'
		'.1.0.1'
		' 1 '
		' 1. '
		' 1.0 '
		' 1.0. '
		' 1.0.1 '
		'10'
		'10.'
		'10.00'
		'10.00.'
		'10.00.10'
		'one'
		'one.'
		'one.zero'
		'one.zero.'
		'one.zero.one')
		do: [:each |
			self
				should: [SAXHandler parse: '<?xml version="', each, '"?><test/>']
				raise: XMLWellFormednessException].

	#('1.0'
		'1.1'
		'1.00'
		'1.10'
		'1.000'
		'1.100')
		do: [:each |
			self
				shouldnt: [SAXHandler parse: '<?xml version="', each, '"?><test/>']
				raise: XMLWellFormednessException].
]

{ #category : #tests }
XMLParserTest >> testXMLDeclarationWhitespace [
	#('<? xml version="1.0" encoding="UTF-8" standalone="yes"?>'
		'<?xml version="1.0"standalone="yes"?>'
		'<?xml version="1.0"encoding="UTF-8" standalone="yes"?>'
		'<?xml version="1.0" encoding="UTF-8"standalone="yes"?>')
		do: [:each |
			self
				should: [SAXHandler parse: each, '<test/>']
				raise: XMLWellFormednessException].
	self
		shouldnt: [
			SAXHandler parse:
				'<?xml
					version
					 =
					 "1.0"
					encoding
					 =
					 "UTF-8"	
					standalone
					 =
					 "yes"
					?>
				<test/>']
		raise: XMLWellFormednessException.
]
