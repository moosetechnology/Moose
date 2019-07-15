Class {
	#name : #PPXmlParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitXml-Tests'
}

{ #category : #accessing }
PPXmlParserTest class >> bench [
	| parser input |
	parser := PPXmlParser new.
	input := '<?xml version="1.0"?><catalog>   <book id="bk101">      <author>Gambardella, Matthew</author>      <title>XML Developer''s Guide</title>      <genre>Computer</genre>      <price>44.95</price>      <publish_date>2000-10-01</publish_date>      <description>An in-depth look at creating applications       with XML.</description>   </book>   <book id="bk102">      <author>Ralls, Kim</author>      <title>Midnight Rain</title>      <genre>Fantasy</genre>      <price>5.95</price>      <publish_date>2000-12-16</publish_date>      <description>A former architect battles corporate zombies,       an evil sorceress, and her own childhood to become queen       of the world.</description>   </book>   <book id="bk103">      <author>Corets, Eva</author>      <title>Maeve Ascendant</title>      <genre>Fantasy</genre>      <price>5.95</price>      <publish_date>2000-11-17</publish_date>      <description>After the collapse of a nanotechnology       society in England, the young survivors lay the       foundation for a new society.</description>   </book>   <book id="bk104">      <author>Corets, Eva</author>      <title>Oberon''s Legacy</title>      <genre>Fantasy</genre>      <price>5.95</price>      <publish_date>2001-03-10</publish_date>      <description>In post-apocalypse England, the mysterious       agent known only as Oberon helps to create a new life       for the inhabitants of London. Sequel to Maeve       Ascendant.</description>   </book>   <book id="bk105">      <author>Corets, Eva</author>      <title>The Sundered Grail</title>      <genre>Fantasy</genre>      <price>5.95</price>      <publish_date>2001-09-10</publish_date>      <description>The two daughters of Maeve, half-sisters,       battle one another for control of England. Sequel to       Oberon''s Legacy.</description>   </book>   <book id="bk106">      <author>Randall, Cynthia</author>      <title>Lover Birds</title>      <genre>Romance</genre>      <price>4.95</price>      <publish_date>2000-09-02</publish_date>      <description>When Carla meets Paul at an ornithology       conference, tempers fly as feathers get ruffled.</description>   </book>   <book id="bk107">      <author>Thurman, Paula</author>      <title>Splish Splash</title>      <genre>Romance</genre>      <price>4.95</price>      <publish_date>2000-11-02</publish_date>      <description>A deep sea diver finds true love twenty       thousand leagues beneath the sea.</description>   </book>   <book id="bk108">      <author>Knorr, Stefan</author>      <title>Creepy Crawlies</title>      <genre>Horror</genre>      <price>4.95</price>      <publish_date>2000-12-06</publish_date>      <description>An anthology of horror stories about roaches,      centipedes, scorpions  and other insects.</description>   </book>   <book id="bk109">      <author>Kress, Peter</author>      <title>Paradox Lost</title>      <genre>Science Fiction</genre>      <price>6.95</price>      <publish_date>2000-11-02</publish_date>      <description>After an inadvertant trip through a Heisenberg      Uncertainty Device, James Salway discovers the problems       of being quantum.</description>   </book>   <book id="bk110">      <author>O''Brien, Tim</author>      <title>Microsoft .NET: The Programming Bible</title>      <genre>Computer</genre>      <price>36.95</price>      <publish_date>2000-12-09</publish_date>      <description>Microsoft''s .NET initiative is explored in       detail in this deep programmer''s reference.</description>   </book>   <book id="bk111">      <author>O''Brien, Tim</author>      <title>MSXML3: A Comprehensive Guide</title>      <genre>Computer</genre>      <price>36.95</price>      <publish_date>2000-12-01</publish_date>      <description>The Microsoft MSXML3 parser is covered in       detail, with attention to XML DOM interfaces, XSLT processing,       SAX and more.</description>   </book>   <book id="bk112">      <author>Galos, Mike</author>      <title>Visual Studio 7: A Comprehensive Guide</title>      <genre>Computer</genre>      <price>49.95</price>      <publish_date>2001-04-16</publish_date>      <description>Microsoft Visual Studio 7 is explored in depth,      looking at how Visual Basic, Visual C++, C#, and ASP+ are       integrated into a comprehensive development       environment.</description>   </book></catalog>'.
	^ [ 1 to: 2000 do: [ :i | parser parse: input ] ] timeToRun

]

{ #category : #accessing }
PPXmlParserTest class >> packageNamesUnderTest [
	^ #('PetitXml')
]

{ #category : #accessing }
PPXmlParserTest class >> resources [
	^ Array with: PPXmlResource
]

{ #category : #utilities }
PPXmlParserTest >> assertAttributeInvariant: aNode [
	"Assert that the attributes can be properly accessed."
	
	aNode nodesDo: [ :node |
		node isElement ifTrue: [
			node attributes do: [ :attr |
				self assert: (node attributeAt: attr name localName) = attr value.
				self assert: (node attributeNodeAt: attr name localName) = attr ].
			node attributes isEmpty ifTrue: [ 
				self assert: (node attributeAt: 'foo') isNil.
				self assert: (node attributeNodeAt: 'foo') isNil ] ] ]
]

{ #category : #utilities }
PPXmlParserTest >> assertCopyInvariant: aNode [
	"Assert that the copy is equivalent to the original."
	
	| copy |
	copy := aNode copy.
	self deny: aNode == copy.
	self assert: aNode = copy.
	self assert: copy = aNode
]

{ #category : #utilities }
PPXmlParserTest >> assertEquivalentInvariant: aNode [
	"Assert that each node is equivalent to itself."
	
	aNode nodesDo: [ :node | 
		self assert: node = node.
		self assert: node hash = node hash ]
]

{ #category : #utilities }
PPXmlParserTest >> assertInvariants: aDocumentNode [
	"Assert that anXmlNode is properly setup.."
	
	self assertCopyInvariant: aDocumentNode.
	self assertEquivalentInvariant: aDocumentNode.
	self assertRootInvariant: aDocumentNode.
	self assertParentInvariant: aDocumentNode.
	self assertNavigationInvariant: aDocumentNode.
	self assertAttributeInvariant: aDocumentNode.
	self assertTypeInvariant: aDocumentNode
]

{ #category : #utilities }
PPXmlParserTest >> assertNameInvariant: aXmlName [
	"Assert the name invariants."
	
	self assert: (aXmlName localName notNil and: [ aXmlName localName notEmpty and: [ aXmlName qualifiedName endsWith: aXmlName localName ] ]).
	self assert: (aXmlName namespacePrefix isNil or: [ aXmlName namespacePrefix notEmpty and: [ aXmlName qualifiedName beginsWith: aXmlName namespacePrefix ] ]).
	self assert: (aXmlName uri isNil or: [ aXmlName uri notEmpty ]).
	
	self assert: aXmlName = aXmlName.
	self assert: aXmlName copy = aXmlName.
	self assert: aXmlName = aXmlName copy.
	
	self assert: aXmlName printString isString
	
]

{ #category : #utilities }
PPXmlParserTest >> assertNavigationInvariant: aXmlNode [
	"Assert that the firstChild, lastChild, previousSibling, nextSibling are properly setup."

	| current children |
	aXmlNode nodesDo: [ :node |

		" forward "
		current := node firstChild.
		children := OrderedCollection withAll: node children.
		[ current isNil ] whileFalse: [
			self assert: children notEmpty.
			self assert: children removeFirst == current.
			current := current nextSibling ].
		self assert: children isEmpty.
		
		" backward "
		current := node lastChild.
		children := OrderedCollection withAll: node childNodes.
		[ current isNil ] whileFalse: [
			self assert: children notEmpty.
			self assert: children removeLast == current.
			current := current previousSibling ].
		self assert: children isEmpty ]
]

{ #category : #utilities }
PPXmlParserTest >> assertParentInvariant: anXmlNode [
	"Assert that the children-parent relationship is properly set."
	
	anXmlNode nodesDo: [ :node |
		node children 
			do: [ :child | self assert: child parent == node ].
		node attributes
			do: [ :child | self assert: child parent == node ].
		node isDocument 
			ifTrue: [ self assert: node parent isNil ] ]
]

{ #category : #utilities }
PPXmlParserTest >> assertParseInvariant: aString [
	"Assert that aString can be parsed, serialized and parsed again to the same tree."

	| tree stream string |
	tree := self parse: aString.
	self
		deny: tree isPetitFailure
		description: tree printString.
	stream := WriteStream on: String new.
	tree printXmlOn: stream.
	string := stream contents.
	self
		assert: (self parse: string) = tree
		description: 'Parse invariant not satisifed'.
	self assertInvariants: tree
]

{ #category : #utilities }
PPXmlParserTest >> assertRootInvariant: aDocumentNode [
	"Assert that anXmlNode is the root of the tree."
	
	self assert: (aDocumentNode childNodes includes: aDocumentNode rootElement).
	aDocumentNode nodesDo: [ :node |
		self assert: node root == aDocumentNode.
		self assert: node document == aDocumentNode ]
]

{ #category : #utilities }
PPXmlParserTest >> assertTypeInvariant: aNode [
	"Assert that each node is one of the standard types."
	
	| types |
	aNode nodesDo: [ :node |
		types := Set new.
		#(isAttribute isComment isDoctype isDocument isElement isProcessing isText) do: [ :each |
			(node perform: each)
				ifTrue: [ types add: each ] ].
		self assert: types size = 1.
		(node isElement or: [ node isAttribute ])
			ifTrue: [ self assertNameInvariant: node name ] ]
]

{ #category : #accessing }
PPXmlParserTest >> parserClass [
	^ PPXmlParser
]

{ #category : #accessing }
PPXmlParserTest >> resource [
	^ PPXmlResource current
]

{ #category : #'testing-other' }
PPXmlParserTest >> testInstantiation [
	self should: [ PPXmlAttribute new ] raise: Error.
	self should: [ PPXmlComment new ] raise: Error.
	self should: [ PPXmlDoctype new ] raise: Error.
	self should: [ PPXmlProcessing new ] raise: Error.
	self should: [ PPXmlText new ] raise: Error.
	self should: [ PPXmlDocument new ] raise: Error.
	self should: [ PPXmlElement new ] raise: Error
]

{ #category : #testing }
PPXmlParserTest >> testParseAllXml [
	self resource allXmlDefinitions 
		do: [ :each | self assertParseInvariant: each ]
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseComment [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema><!-- comment --></schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseCommentWithXml [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema><!-- <foo></foo> --></schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseComplicated [
	self assertParseInvariant: '<?xml foo?>
<foo>
	<bar a="fasdfasdf">
		<zork/>
		<zonk/>
	</bar>
	<!-- with comment -->
</foo>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseDoctype [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE freaking <schema> [ <!-- schema --> ]  >
	<schema></schema>'
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseEmptyElement [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema/>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseNamespace [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><xs:schema></xs:schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseSimple [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema></schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseSimpleAttribute [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema foo="bar"></schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseSimpleAttributeWithSingleQuote [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?><schema foo=''bar''></schema>' 
]

{ #category : #'testing-parsing' }
PPXmlParserTest >> testParseWithWhitsepaceAfterProlog [
	self assertParseInvariant: '<?xml version="1.0" encoding="UTF-8"?>
	<schema></schema>
' 
]

{ #category : #'testing-other' }
PPXmlParserTest >> testQualifiedName [
	| name |
	name := PPXmlName name: 'prefix:tag'.
	self assertNameInvariant: name.
	self assert: name localName = 'tag'.
	self assert: name namespacePrefix = 'prefix'.
	self assert: name qualifiedName = 'prefix:tag'.
	self assert: name uri isNil
]

{ #category : #'testing-other' }
PPXmlParserTest >> testUnqualifiedName [
	| name |
	name := PPXmlName name: 'tag'.
	self assert: name localName = 'tag'.
	self assert: name namespacePrefix isNil.
	self assert: name qualifiedName = 'tag'.
	self assert: name uri isNil
]

{ #category : #'testing-other' }
PPXmlParserTest >> testUriName [
	| name |
	name := PPXmlName name: 'prefix:tag' uri: 'http://www.lukas-renggli.ch/'.
	self assertNameInvariant: name.
	self assert: name localName = 'tag'.
	self assert: name namespacePrefix = 'prefix'.
	self assert: name qualifiedName = 'prefix:tag'.
	self assert: name uri = 'http://www.lukas-renggli.ch/'
]
