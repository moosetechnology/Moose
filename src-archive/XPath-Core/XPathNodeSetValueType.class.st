"
This is an XPath type class for XPathNodeSet values.
"
Class {
	#name : #XPathNodeSetValueType,
	#superclass : #XPathValueType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathNodeSetValueType >> isNodeSetValueType [
	^ true
]

{ #category : #accessing }
XPathNodeSetValueType >> name [
	^ 'node-set'
]

{ #category : #'instance creation' }
XPathNodeSetValueType >> newFrom: anObject [
	^ anObject asXPathNodeSet
]
