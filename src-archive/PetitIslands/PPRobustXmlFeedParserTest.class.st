Class {
	#name : #PPRobustXmlFeedParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitIslands-Examples'
}

{ #category : #'as yet unclassified' }
PPRobustXmlFeedParserTest >> feed03 [
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
PPRobustXmlFeedParserTest >> parserClass [
	^ PPRobustXmlFeedParser 
]

{ #category : #'as yet unclassified' }
PPRobustXmlFeedParserTest >> testXmlFeed03 [
	self parse: self feed03.
	
	self assert: result size = 3.
	self assert: (result first at:#name) = 'socks'.
	self assert: (result first at:#price) = '123'.
	self assert: (result first at:#availability) = '1'.

	self assert: (result second at:#name) = 'shoes'.
	self assert: (result second at:#price) = '2345'.
	
	self assert: (result third at:#name) = 'shoes'.
	self assert: (result third at:#price) = '3456'.
	self assert: (result third at:#availability) = '0'.

]
