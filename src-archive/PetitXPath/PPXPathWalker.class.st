"
I'm a ""walker"" for visiting all nodes of a XPath expression and resolve an xml document with it. 
"
Class {
	#name : #PPXPathWalker,
	#superclass : #Object,
	#instVars : [
		'xmlElement'
	],
	#category : #'PetitXPath-Nodes'
}

{ #category : #'instance creation' }
PPXPathWalker class >> new [ 
	self error: 'Use #on:'
]

{ #category : #'instance creation' }
PPXPathWalker class >> on: anXmlElement [
	^ self basicNew 
		initialize: anXmlElement;
		yourself
]

{ #category : #private }
PPXPathWalker >> createXPathNodesFor: aString [
	^ PPXPathParser new 
		parse: aString
		onError: [ :e | PPXPathError signal: e asString ]
]

{ #category : #'as yet unclassified' }
PPXPathWalker >> find: aString [
	^ self 
		resolve: (self createXPathNodesFor: aString) 
		in: self xmlElement
]

{ #category : #initialization }
PPXPathWalker >> initialize: anXmlElement [
	xmlElement := anXmlElement.
	self initialize.
]

{ #category : #private }
PPXPathWalker >> resolve: node continueWith: remainingNodes [
	| result |
	
	result := node resolveOn: self xmlElement.

	^ remainingNodes 
		ifNotEmpty: [ 
			result isCollection
				ifTrue: [ 
					((result collect: [ :each | self resolve: remainingNodes in: each ]) deepFlatten 
						select: #notNil)
						ifEmpty: [ nil ] ]
				ifFalse: [ self resolve: remainingNodes in: result ] ]
		ifEmpty: [ result ].

]

{ #category : #private }
PPXPathWalker >> resolve: nodes in: xml [
	| oldXmlElement |
	
	oldXmlElement := xmlElement. 
	xmlElement := xml.
	[ ^ self 
		resolve: nodes first 
		continueWith: nodes allButFirst ]
	ensure: [ xmlElement := oldXmlElement ]
]

{ #category : #accessing }
PPXPathWalker >> xmlElement [
	^ xmlElement
]
