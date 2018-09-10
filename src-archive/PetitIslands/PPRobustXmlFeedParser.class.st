"
A RobustXmlFeedParser is XmlFeedParser, that can handle error within an xml Item element. This is thanks to the fact, that elements in item are defined as islands (see rule itemContent).

"
Class {
	#name : #PPRobustXmlFeedParser,
	#superclass : #PPXmlFeedParser,
	#category : #'PetitIslands-Examples'
}

{ #category : #'as yet unclassified' }
PPRobustXmlFeedParser >> itemContent [
	^ ((simpleElement sea ==> #second) star) ==> self elementsToDictionaryBlock
]
