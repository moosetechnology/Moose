"
An XML root node.
"
Class {
	#name : #PPXmlDocument,
	#superclass : #PPXmlParent,
	#category : #'PetitXml-Nodes'
}

{ #category : #accessing }
PPXmlDocument >> document [
	^ self
]

{ #category : #testing }
PPXmlDocument >> isDocument [
	^ true
]

{ #category : #accessing }
PPXmlDocument >> rootElement [
	"Answer the root element of the receiving document."
	
	^ self children 
		detect: [ :each | each isElement ]
		ifNone: [ nil ]
]
