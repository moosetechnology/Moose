"
An XML comment node.
"
Class {
	#name : #PPXmlComment,
	#superclass : #PPXmlData,
	#category : #'PetitXml-Nodes'
}

{ #category : #testing }
PPXmlComment >> isComment [
	^ true
]

{ #category : #printing }
PPXmlComment >> printXmlOn: aStream [
	aStream nextPutAll: '<!--'; nextPutAll: data; nextPutAll: '-->'
]
