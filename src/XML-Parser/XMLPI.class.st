"
This class represents a processing instruction node.
"
Class {
	#name : #XMLPI,
	#superclass : #XMLNode,
	#instVars : [
		'target',
		'data'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLPI class >> target: aTargetString data: aDataString [
	^ self new
		target: aTargetString;
		data: aDataString
]

{ #category : #visiting }
XMLPI >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPI: self
]

{ #category : #accessing }
XMLPI >> data [
	^ data ifNil: [data := '']
]

{ #category : #accessing }
XMLPI >> data: aString [
	data := aString
]

{ #category : #testing }
XMLPI >> hasData [
	^ self data notEmpty
]

{ #category : #testing }
XMLPI >> isPI [
	^ true
]

{ #category : #accessing }
XMLPI >> sortKey [
	^ self target
]

{ #category : #accessing }
XMLPI >> target [
	^ target ifNil: [target := '']
]

{ #category : #accessing }
XMLPI >> target: aString [
	target := aString
]

{ #category : #printing }
XMLPI >> writeXMLOn: aWriter [
	aWriter pi
		target: self target;
		data: self data;
		write
]
