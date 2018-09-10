"
I'm an XPath expresion node. 
I'm conformed for two attributes, a tag, who defines the xml element in which I'm applied and a filter, who defines how I will be selected (for example, an attribute, an index, etc.)

"
Class {
	#name : #PPXPathNode,
	#superclass : #Object,
	#instVars : [
		'tag',
		'filter'
	],
	#category : #'PetitXPath-Nodes'
}

{ #category : #'instance creation' }
PPXPathNode class >> new [ 
	self error: 'Use #tag:qualifier:'
]

{ #category : #'instance creation' }
PPXPathNode class >> withTag: aString filter: anObject [
	^self basicNew 
		initializeTag: aString filter: anObject;
		yourself
]

{ #category : #accessing }
PPXPathNode >> filter [ 
	^ filter ifNil: [ filter := PPXPathMultipleFilter new ]
]

{ #category : #initialization }
PPXPathNode >> initializeTag: aString filter: anObject [
	tag := aString.
	filter := anObject.
	self initialize.
]

{ #category : #printing }
PPXPathNode >> printOn: aStream [ 
	aStream 
		nextPutAll: self tag;
		nextPutAll: self filter asString.  

]

{ #category : #'as yet unclassified' }
PPXPathNode >> resolveOn: anXmlElement [
	| matchingChildren |
	
	matchingChildren := anXmlElement childNodes 
		select: [ :each | each isElement and: [ each name localName = self tag ] ].
	
	matchingChildren ifEmpty: [ ^ nil ].
	^ self filter resolveOn: matchingChildren  
]

{ #category : #accessing }
PPXPathNode >> tag [
	^ tag
]
