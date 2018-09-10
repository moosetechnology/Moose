"
A block-based pluggable attribute spec that evaluates blocks with the attribute dictionary to test matching.
"
Class {
	#name : #XMLPluggableAttributeSpec,
	#superclass : #XMLAttributeSpec,
	#instVars : [
		'block'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #generated }
XMLPluggableAttributeSpec class >> block: aOneArgumentBlock [
	^ self new block: aOneArgumentBlock
]

{ #category : #accessing }
XMLPluggableAttributeSpec >> block [
	^ block
]

{ #category : #accessing }
XMLPluggableAttributeSpec >> block: aOneArgumentBlock [
	block := aOneArgumentBlock
]

{ #category : #matching }
XMLPluggableAttributeSpec >> matchesAttributes: anAttributeDictionary [
	"if there's no block, then it automatically matches, similar to an
	XMLBasicAttributeSpec with no attributes"
	block
		ifNil: [^ true]
		ifNotNil: [^ block value: anAttributeDictionary]
]
