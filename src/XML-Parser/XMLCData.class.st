"
This class represents a preserved <![CDATA[...]]> section. By default these are handled as XMLString nodes and merged with adjacent string nodes during parsing.  To preserve CDATA nodes, use #preservesCDataNodes: with the DOM parser before parsing.
"
Class {
	#name : #XMLCData,
	#superclass : #XMLString,
	#category : #'XML-Parser-DOM'
}

{ #category : #visiting }
XMLCData >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitCData: self
]

{ #category : #testing }
XMLCData >> isCData [
	^ true
]

{ #category : #private }
XMLCData >> isCoalescingStringNode [
	"this returns false to stop preserved CDATA nodes from coalescing
	together or with ordinary string nodes"

	^ false
]

{ #category : #printing }
XMLCData >> writeXMLOn: aWriter [
	aWriter cdata: self string
]
