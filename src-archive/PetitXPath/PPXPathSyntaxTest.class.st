Class {
	#name : #PPXPathSyntaxTest,
	#superclass : #TestCase,
	#instVars : [
		'xml'
	],
	#category : #'PetitXPath-Tests'
}

{ #category : #'as yet unclassified' }
PPXPathSyntaxTest class >> exampleXml [ 
	^ '<?xml version="1.0" encoding="ISO-8859-1"?>

<bookstore>

<book>
  <title lang="eng">Harry Potter</title>
  <price>29.99</price>
</book>

<book>
  <title lang="eng">Learning XML</title>
  <title lang="esp">Aprendiendo XML</title>
  <price>39.95</price>
</book>

</bookstore>'
]

{ #category : #running }
PPXPathSyntaxTest >> setUp [ 	
	xml := self xmlDocument.
]

{ #category : #tests }
PPXPathSyntaxTest >> testAttributeNotFound [
	| result |
	
	result := xml findXPath: 'bookstore/book/title[ @doesNotExist ]'.
	self assert: result isNil.
	
	result := xml findXPath: 'bookstore/book/title[ @lang = "doesNotExist" ]'.
	self assert: result isNil.
	
]

{ #category : #tests }
PPXPathSyntaxTest >> testNodeNotFound [
	| result |
	
	result := xml findXPath: '/DoesNotExists'.
	self assert: result isNil.
	
	result := xml findXPath: 'bookstore/DoesNotExists'.
	self assert: result isNil.	
	
	result := xml findXPath: 'bookstore/book/DoesNotExists'.
	self assert: result isNil.
	
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectAttribute [
	| result |
	
	result := xml findXPath: 'bookstore/book/title[ @lang="eng" ]'.
	
	self assert: result notNil.
	self assert: result size = 2.
	self assert: result first name localName = 'title'.
	self assert: result first contentText = 'Harry Potter'.
	self assert: result second name localName = 'title'.
	self assert: result second contentText = 'Learning XML'.
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectDeepInnerNode [
	| result |
	
	result := xml findXPath: 'bookstore/book/price'.
	
	self assert: result notNil.
	self assert: result isCollection.
	self assert: result size = 2.
	self assert: result first name localName = 'price'.
	self assert: result first contentText = '29.99'.
	self assert: result second name localName = 'price'.
	self assert: result second contentText = '39.95'.
	
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectIndexNode [
	| result |
	
	result := xml findXPath: 'bookstore/book[2]'.
	
	self assert: result notNil.
	self assert: result name localName = 'book'.
	
	result := xml findXPath: 'bookstore/book[2]/title[2]'.
	
	self assert: result name localName = 'title'.
	self assert: result contentText = 'Aprendiendo XML'.

]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectInnerNode [
	| result |
	
	result := xml findXPath: 'bookstore/book'.
	
	self assert: result notNil.
	self assert: result isCollection.
	self assert: result size = 2.
	self assert: result first name localName = 'book'.
	self assert: result second name localName = 'book'.
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectInnerNodeFromRoot [
	| result |
	
	result := xml findXPath: '/bookstore/book'.
	
	self assert: result notNil.
	self assert: result isCollection.
	self assert: result size = 2.
	self assert: result first name localName = 'book'.
	self assert: result second name localName = 'book'.
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectNode [
	| result |
	
	result := xml findXPath: 'bookstore'.
	
	self assert: result notNil.
	self assert: result name localName = 'bookstore'.
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectPresentAttribute [
	| result |
	
	result := xml findXPath: 'bookstore/book/title[@lang]'.
	
	self assert: result notNil.
	self assert: result isCollection.
	self assert: result size = 3.
	self assert: result first name localName = 'title'.
	self assert: (result first attributeAt: 'lang') = 'eng'.
	self assert: result first contentText = 'Harry Potter'.
	self assert: result second name localName = 'title'.
	self assert: (result second attributeAt: 'lang') = 'eng'.
	self assert: result second contentText = 'Learning XML'.	
	self assert: result third name localName = 'title'.
	self assert: (result third attributeAt: 'lang') = 'esp'.
	self assert: result third contentText = 'Aprendiendo XML'.	
	
]

{ #category : #tests }
PPXPathSyntaxTest >> testSelectRootNode [
	| result |
	
	result := xml findXPath: '/bookstore'.
	
	self assert: result notNil.
	self assert: result name localName = 'bookstore'.
]

{ #category : #accessing }
PPXPathSyntaxTest >> xmlDocument [
	^  PPXmlParser parse: self class exampleXml
]
