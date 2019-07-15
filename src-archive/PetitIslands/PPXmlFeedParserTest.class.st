Class {
	#name : #PPXmlFeedParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitIslands-Examples'
}

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> feed01 [
^'
<shoplist>
<name>ABC Shop</name>
<address>Here and there 123, 123 45 Somewhere</address>
<item>
  <name>socks</name>
  <price>123</price>
  <availability>1</availability>
</item>
</shoplist>
'
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> feed02 [
^'
<shoplist>
<name>ABC Shop</name>
<address>Here and there 123, 123 45 Somewhere</address>
<item>
  <name>socks</name>
  <price>123</price>
  <availability>1</availability>
</item>


<item>
  <name> shoes </name>
  <price>2345</price>
  <availability>1</availability>
</item>

</shoplist>
'
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> feed03 [
^'
<shoplist>
<name>ABC Shop</name>
<address>Here and there 123, 123 45 Somewhere</address>
<item>
  <name>socks</name>
  <price>123</price>
  <availability>1</availability>
</item>


<item>
  <name> shoes </name>
  <price>2345</price>
  <!-- this one is malformed -->
  <availability>1 </
</item>

<item>
  <name> shoes </name>
  <price>3456</price>
  <availability>0</availability>
</item>


</shoplist>
'
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> parse: aString rule: aSymbol to: anObject [
	| production |
	production := self parserInstanceFor: aSymbol.
	result := production end parse: aString.
	self
		deny: result isPetitFailure
		description: 'Unable to parse ' , aString printString.
	self assert: result = anObject.
	
	^ result
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> parserClass [
	^ PPXmlFeedParser
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testItem01 [
	self parse: '
	<item>
		<name>abc</name>
	</item>
	' rule: #item.
	
	self assert: (result at: #name) = 'abc'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testItem02 [
	self parse: '
	<item>
		<name>abc</name>
		<price>123</price>
	</item>
	' rule: #item.
	
	self assert: (result at: #name) = 'abc'.
	self assert: (result at: #price) = '123'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testItem03 [
	self parse: '
	<item>
		<price>123</price>
		<name>abc</name>
	</item>
	' rule: #item.
	
	self assert: (result at: #name) = 'abc'.
	self assert: (result at: #price) = '123'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testShoplist [
	self testShoplist01.
	self testShoplist02.
	self testShoplist03.
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testShoplist01 [
	self parse: '
<shoplist>
	<item>
		<name>abc</name>
	</item>
</shoplist>
	' rule: #shoplist.
	
	self assert: result size = 1.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testShoplist02 [
	self parse: '
<shoplist>
	<name>xyz</name>
	<item>
		<name>abc</name>
		<price>123</price>
	</item>
</shoplist>
	' rule: #shoplist.
	
	self assert: result size = 1.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testShoplist03 [
	self parse: '
<shoplist>
	<name>xyz</name>
	<item>
		<name>abc</name>
		<price>123</price>
	</item>
	<item>
		<name>cde</name>
		<price>345</price>
	</item>
</shoplist>
	' rule: #shoplist.
	
	self assert: result size = 2.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testSimpleElement [
	self parse: '<a>b</a>' rule: #simpleElement to: #('a' 'b').	
	self parse: '<abc> def </ abc>' rule: #simpleElement to: #('abc' 'def').	
		
	self fail: '<a>b</b>' rule: #simpleElement.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testStringValue [
	self parse: 'abc' rule: #stringValue to: 'abc'.	
	self parse: ' def ' rule: #stringValue to: 'def'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testXmlFeed01 [
	self parse: self feed01.
	
	self assert: result size = 1.
	self assert: (result first at:#name) = 'socks'.
	self assert: (result first at:#price) = '123'.
	self assert: (result first at:#availability) = '1'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testXmlFeed02 [
	self parse: self feed02.
	
	self assert: result size = 2.
	self assert: (result first at:#name) = 'socks'.
	self assert: (result first at:#price) = '123'.
	self assert: (result first at:#availability) = '1'.

	self assert: (result second at:#name) = 'shoes'.
	self assert: (result second at:#price) = '2345'.
	self assert: (result second at:#availability) = '1'.
	
]

{ #category : #'as yet unclassified' }
PPXmlFeedParserTest >> testXmlFeed03 [
	self parse: self feed03.
	
	self assert: result size = 2.
	self assert: (result first at:#name) = 'socks'.
	self assert: (result first at:#price) = '123'.
	self assert: (result first at:#availability) = '1'.

	self assert: (result second at:#name) = 'shoes'.
	self assert: (result second at:#price) = '3456'.
	self assert: (result second at:#availability) = '0'.
	
]
