"
An abstract XML node.
"
Class {
	#name : #PPXmlNode,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlNode class >> new [
	self error: 'Use a constructor method to instantiate ' , self name
]

{ #category : #accessing }
PPXmlNode >> attributes [
	"Answer the attribute nodes of the receiver."
	
	^ #()
]

{ #category : #'accessing-dom' }
PPXmlNode >> childNodes [
	"Answer the child nodes of the receiver or nil."

	^ self children
]

{ #category : #accessing }
PPXmlNode >> children [
	"Answer the child nodes of the receiver."
	
	^ #()
]

{ #category : #accessing }
PPXmlNode >> document [
	"Answer the document that contains this node, or nil if this node is not currently part of a document."
	
	^ parent isNil ifFalse: [ parent document ]
]

{ #category : #'accessing-dom' }
PPXmlNode >> firstChild [
	"Answer the first child of the receiver or nil."

	^ self childNodes isEmpty ifFalse: [ self childNodes first ]
]

{ #category : #testing }
PPXmlNode >> isAttribute [
	^ false
]

{ #category : #testing }
PPXmlNode >> isComment [
	^ false
]

{ #category : #testing }
PPXmlNode >> isDoctype [
	^ false
]

{ #category : #testing }
PPXmlNode >> isDocument [
	^ false
]

{ #category : #testing }
PPXmlNode >> isElement [
	^ false
]

{ #category : #testing }
PPXmlNode >> isProcessing [
	^ false
]

{ #category : #testing }
PPXmlNode >> isText [
	^ false
]

{ #category : #'accessing-dom' }
PPXmlNode >> lastChild [
	"Answer the first child of the receiver or nil."

	^ self childNodes isEmpty ifFalse: [ self childNodes last ]
]

{ #category : #'accessing-dom' }
PPXmlNode >> nextSibling [
	"Answer the next sibling of the receiver or nil."

	| index children |
	self parentNode isNil ifTrue: [ ^ nil ].
	children := self parentNode childNodes.
	index := children identityIndexOf: self ifAbsent: [ ^ nil ].
	^ children at: index + 1 ifAbsent: [ nil ]
]

{ #category : #enumerating }
PPXmlNode >> nodesDo: aBlock [
	"Recursively enumerate over the receiver, all arguments and children."

	aBlock value: self.
	self attributes
		do: [ :each | each nodesDo: aBlock ].
	self children
		do: [ :each | each nodesDo: aBlock ]
]

{ #category : #accessing }
PPXmlNode >> parent [
	"Answer the parent node of the receiver or nil if there is none."
	
	^ parent
]

{ #category : #'accessing-dom' }
PPXmlNode >> parentNode [
	"Answer the parent node of the receiver or nil."

	^ self parent
]

{ #category : #copying }
PPXmlNode >> postCopy [
	super postCopy.
	self setParent: nil
]

{ #category : #'accessing-dom' }
PPXmlNode >> previousSibling [
	"Answer the previous sibling of the receiver or nil."

	| index children |
	self parentNode isNil ifTrue: [ ^ nil ].
	children := self parentNode childNodes.
	index := children identityIndexOf: self ifAbsent: [ ^ nil ].
	^ children at: index - 1 ifAbsent: [ nil ]
]

{ #category : #printing }
PPXmlNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' ('.
	self printXmlOn: aStream.
	aStream nextPut: $)
]

{ #category : #printing }
PPXmlNode >> printXmlOn: aStream [
	self subclassResponsibility
]

{ #category : #accessing }
PPXmlNode >> root [
	"Answer the root of the subtree in which this node is found, whether that's a document or an element."
	
	^ parent isNil 
		ifTrue: [ self ]
		ifFalse: [ parent root ]
]

{ #category : #initialization }
PPXmlNode >> setParent: aNode [
	parent := aNode
]
