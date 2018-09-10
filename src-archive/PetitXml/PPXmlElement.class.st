"
An XML element node.
"
Class {
	#name : #PPXmlElement,
	#superclass : #PPXmlParent,
	#instVars : [
		'name',
		'attributes'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlElement class >> name: anXmlName attributes: anAttributeArray children: aChildrenArray [
	^ self basicNew
		setName: anXmlName;
		setAttributes: anAttributeArray;
		setChildren: aChildrenArray;
		yourself
]

{ #category : #comparing }
PPXmlElement >> = anXmlNode [
	super = anXmlNode
		ifFalse: [ ^ false ].
	self name = anXmlNode name
		ifFalse: [ ^ false ].
	self attributes size = anXmlNode attributes size
		ifFalse: [ ^ false ].
	self attributes with: anXmlNode attributes do: [ :first :second |
		first = second 
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #'accessing-attributes' }
PPXmlElement >> attributeAt: aString [
	"Answer the attribute value by name, if the node does not exist answer nil."
	
	^ self attributeAt: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-attributes' }
PPXmlElement >> attributeAt: aString ifAbsent: aBlock [
	"Answer the attribute value by name, if the node does not exist evaluate aBlock."
	
	^ (self attributeNodeAt: aString ifAbsent: [ ^ aBlock value ]) value
]

{ #category : #'accessing-attributes' }
PPXmlElement >> attributeNodeAt: aString [
	"Answer the attribute node by name, if the node does not exist answer nil."
	
	^ self attributeNodeAt: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-attributes' }
PPXmlElement >> attributeNodeAt: aString ifAbsent: aBlock [
	"Answer the attribute node by name, if the node does not exist evaluate aBlock."
	
	^ self attributes
		detect: [ :each | each name localName = aString ]
		ifNone: aBlock
]

{ #category : #accessing }
PPXmlElement >> attributes [
	^ attributes
]

{ #category : #comparing }
PPXmlElement >> hash [
	^ super hash bitXor: self name hash
]

{ #category : #testing }
PPXmlElement >> isElement [
	^ true
]

{ #category : #accessing }
PPXmlElement >> name [
	^ name
]

{ #category : #copying }
PPXmlElement >> postCopy [
	super postCopy.
	self setAttributes: (self attributes
		collect: [ :each | each copy ])
]

{ #category : #printing }
PPXmlElement >> printXmlOn: aStream [
	aStream nextPut: $<.
	name printXmlOn: aStream.
	self attributes do: [ :each |
		aStream nextPut: $ .
		each printXmlOn: aStream ].
	self children isEmpty
		ifTrue: [ aStream nextPutAll: ' />' ]
		ifFalse: [
			aStream nextPut: $>.
			super printXmlOn: aStream.
			aStream nextPutAll: '</'.
			name printXmlOn: aStream.
			aStream nextPut: $> ]
]

{ #category : #initialization }
PPXmlElement >> setAttributes: aCollection [
	attributes := aCollection asArray
		collect: [ :each | each setParent: self ]
]

{ #category : #initialization }
PPXmlElement >> setName: anXmlName [
	name := anXmlName
]
