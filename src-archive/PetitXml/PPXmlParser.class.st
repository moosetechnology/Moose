Class {
	#name : #PPXmlParser,
	#superclass : #PPXmlGrammar,
	#category : #'PetitXml-Core'
}

{ #category : #grammar }
PPXmlParser >> attribute [
	^ super attribute ==> [ :nodes | PPXmlAttribute name: nodes first value: nodes second ]
]

{ #category : #grammar }
PPXmlParser >> attributes [
	^ super attributes ==> [ :nodes | 
		nodes 
			inject: OrderedCollection new
			into: [ :result :each | result addLast: each; yourself ] ]
]

{ #category : #'grammar-character' }
PPXmlParser >> characterData [
	^ super characterData ==> [ :nodes | PPXmlText data: nodes ]
]

{ #category : #grammar }
PPXmlParser >> comment [
	"[15]   	Comment	   ::=   	'<!--' ((Char - '-') | ('-' (Char - '-')))* '-->'"

	^ super comment ==> [ :node | PPXmlComment data: node ]
]

{ #category : #grammar }
PPXmlParser >> doctype [
	^ super doctype ==> [ :node | PPXmlDoctype data: node ]
]

{ #category : #grammar }
PPXmlParser >> document [
	^ super document ==> [ :nodes | PPXmlDocument children: (nodes reject: [ :each | each isNil ]) ]
]

{ #category : #grammar }
PPXmlParser >> element [
	^ super element ==> [ :nodes | PPXmlElement name: nodes first attributes: nodes second children: nodes third ]
]

{ #category : #grammar }
PPXmlParser >> processing [
	^ super processing ==> [ :nodes | PPXmlProcessing target: nodes first data: nodes second ]
]

{ #category : #grammar }
PPXmlParser >> qualified [
	^ super qualified ==> [ :token | PPXmlName name: token ]
]
