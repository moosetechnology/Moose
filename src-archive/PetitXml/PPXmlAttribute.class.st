Class {
	#name : #PPXmlAttribute,
	#superclass : #PPXmlNode,
	#instVars : [
		'name',
		'value'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlAttribute class >> name: anXmlName value: aString [
	^ self basicNew
		setName: anXmlName;
		setValue: aString;
		yourself
]

{ #category : #comparing }
PPXmlAttribute >> = anXmlNode [
	self == anXmlNode
		ifTrue: [ ^ true ].
	self class = anXmlNode class
		ifFalse: [ ^ false ].
	^ self name = anXmlNode name
		and: [ self value = anXmlNode value ]
]

{ #category : #comparing }
PPXmlAttribute >> hash [
	^ self name hash bitXor: self value hash
]

{ #category : #testing }
PPXmlAttribute >> isAttribute [
	^ true
]

{ #category : #accessing }
PPXmlAttribute >> name [
	^ name
]

{ #category : #printing }
PPXmlAttribute >> printXmlOn: aStream [
	name printXmlOn: aStream.
	aStream nextPutAll: '="'; nextPutAll: value; nextPut: $"
]

{ #category : #initialization }
PPXmlAttribute >> setName: anXmlName [
	name := anXmlName
]

{ #category : #initialization }
PPXmlAttribute >> setValue: aString [
	value := aString
]

{ #category : #accessing }
PPXmlAttribute >> value [
	^ value
]
