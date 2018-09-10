"
A validating node visitor that can validate DOM node trees using XMLDocumentValidators.
"
Class {
	#name : #XMLValidatingNodeVisitor,
	#superclass : #XMLNodeVisitor,
	#instVars : [
		'validator'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLValidatingNodeVisitor class >> validator: aValidator [
	^ self new validator: aValidator
]

{ #category : #accessing }
XMLValidatingNodeVisitor >> validator [
	^ validator
]

{ #category : #accessing }
XMLValidatingNodeVisitor >> validator: aValidator [
	validator := aValidator
]

{ #category : #visiting }
XMLValidatingNodeVisitor >> visitComment: aComment [
	self validator validateComment: aComment.
	^ aComment.
]

{ #category : #visiting }
XMLValidatingNodeVisitor >> visitDocument: aDocument [
	aDocument root
		ifNotNil: [:rootElement |
			self validator validateRootElement: rootElement name].
	super visitDocument: aDocument.
	self validator validateEndDocument.
	^ aDocument.
]

{ #category : #visiting }
XMLValidatingNodeVisitor >> visitElement: anElement [
	| attributeDictionary |

	attributeDictionary := 
		anElement hasAttributes
			ifTrue: [anElement attributeNodes asDictionary]
			ifFalse: [Dictionary new].

	self validator
		validateStartTag: anElement name
		attributes: attributeDictionary.
	"validation can change/add attribute values"
	anElement setAttributes: attributeDictionary.

	super visitElement: anElement.

	self validator validateEndTag: anElement name.
	^ anElement.
]

{ #category : #visiting }
XMLValidatingNodeVisitor >> visitPI: aPI [
	self validator
		validatePI: aPI target
		data: aPI data.
	^ aPI.
]

{ #category : #visiting }
XMLValidatingNodeVisitor >> visitStringNode: aStringNode [
	self validator validatePCData: aStringNode string.
	^ aStringNode.
]
