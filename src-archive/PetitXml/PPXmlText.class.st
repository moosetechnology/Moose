"
An XML text node.
"
Class {
	#name : #PPXmlText,
	#superclass : #PPXmlData,
	#category : #'PetitXml-Nodes'
}

{ #category : #testing }
PPXmlText >> isText [
	^ true
]

{ #category : #printing }
PPXmlText >> printXmlOn: aStream [
	aStream nextPutAll: data
]
