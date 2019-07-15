"
A XmlFeedParser is Parser of a fake shop feed. Shop feed is a XML file with information about shop products. Shop feed can be malformed (for any reason) the parser will recover from malformed item (see rule shoplistContent) and will continue on the next valid item.

Instance Variables
	closeItem:		<Object>
	closeName:		<Object>
	closeShoplist:		<Object>
	item:		<Object>
	itemContent:		<Object>
	name:		<Object>
	nameContent:		<Object>
	openItem:		<Object>
	openName:		<Object>
	openShoplist:		<Object>
	shoplist:		<Object>
	shoplistContent:		<Object>
	simpleElement:		<Object>
	stringValue:		<Object>

closeItem
	- xxxxx

closeName
	- xxxxx

closeShoplist
	- xxxxx

item
	- xxxxx

itemContent
	- xxxxx

name
	- xxxxx

nameContent
	- xxxxx

openItem
	- xxxxx

openName
	- xxxxx

openShoplist
	- xxxxx

shoplist
	- xxxxx

shoplistContent
	- xxxxx

simpleElement
	- xxxxx

stringValue
	- xxxxx

"
Class {
	#name : #PPXmlFeedParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'item',
		'openItem',
		'itemContent',
		'closeItem',
		'openShoplist',
		'shoplistContent',
		'closeShoplist',
		'shoplist',
		'simpleElement',
		'stringValue'
	],
	#category : #'PetitIslands-Examples'
}

{ #category : #tags }
PPXmlFeedParser >> closeItem [
	^ '</' asParser, 'item' asParser trim, '>' asParser
]

{ #category : #tags }
PPXmlFeedParser >> closeShoplist [
	^ '</' asParser, 'shoplist' asParser trim, '>' asParser
]

{ #category : #xmlSupport }
PPXmlFeedParser >> elementsToDictionaryBlock [
 	^ [ :elements | | d | 
		d := Dictionary new.
		elements do: [ :e | d at: e first asSymbol put: e second ].
		d
	]
]

{ #category : #grammar }
PPXmlFeedParser >> item [
	^ (openItem, itemContent trim, closeItem) trim ==> #second
]

{ #category : #grammar }
PPXmlFeedParser >> itemContent [
	^ (simpleElement trim star) ==> self elementsToDictionaryBlock
]

{ #category : #tags }
PPXmlFeedParser >> openItem [
	^ '<' asParser, 'item' asParser trim, '>' asParser
]

{ #category : #tags }
PPXmlFeedParser >> openShoplist [
	^ '<' asParser, 'shoplist' asParser trim, '>' asParser
]

{ #category : #grammar }
PPXmlFeedParser >> shoplist [
	^ (openShoplist, shoplistContent, closeShoplist) trim ==> #second
]

{ #category : #grammar }
PPXmlFeedParser >> shoplistContent [
	^ (item sea ==> #second) star
]

{ #category : #xmlSupport }
PPXmlFeedParser >> simpleElement [
	^ (
		(('<' asParser, stringValue trim, '>' asParser) ==> #second),
		stringValue,
		(('</' asParser, stringValue trim, '>' asParser) ==> #second)
	) ==> [ :elements |
		(elements first = elements third) 
		ifTrue: [ Array with: elements first with: elements second ]
		ifFalse: [ PPFailure message: 'malformed element' ]
 	]
]

{ #category : #grammar }
PPXmlFeedParser >> start [
	^ shoplist
]

{ #category : #grammar }
PPXmlFeedParser >> stringValue [
	^ (#letter asParser / #digit asParser) star flatten trim
]
