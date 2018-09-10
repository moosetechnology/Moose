"
An abstract XML data node.
"
Class {
	#name : #PPXmlData,
	#superclass : #PPXmlNode,
	#instVars : [
		'data'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlData class >> data: aString [
	^ self basicNew setData: aString
]

{ #category : #comparing }
PPXmlData >> = anXmlNode [
	self == anXmlNode
		ifTrue: [ ^ true ].
	self class = anXmlNode class
		ifFalse: [ ^ false ].
	^ self data = anXmlNode data
]

{ #category : #accessing }
PPXmlData >> data [
	^ data
]

{ #category : #comparing }
PPXmlData >> hash [
	^ self data hash
]

{ #category : #initialization }
PPXmlData >> setData: aString [
	data := aString
]
