"
XPath id() function to select elements from the document of the context node by ID.
"
Class {
	#name : #XPathIDFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathIDFunction class >> prototypeSource [
	^ 'node-set id(object)'
]

{ #category : #invoking }
XPathIDFunction >> addElement: anElement withUndeclaredIDs: anIDSet to: aNodeSet [
	"just look for an 'xml:id' attribute if there were no declarations"
	anIDSet
		remove:
			(anElement
				attributeAt: 'xml:id'
				ifAbsent: [^ self])
		ifAbsent: [^ self].
	aNodeSet addLast: anElement.
]

{ #category : #invoking }
XPathIDFunction >> addElement: anElement withUndeclaredOrDeclaredIDs: anIDSet to: aNodeSet declaredWith: anAttributeValidatorDictionary [
	anElement attributeNodesDo: [:each |
		((anAttributeValidatorDictionary
			at: each name
			ifAbsent: [nil])
				ifNil: [each name = 'xml:id']
				ifNotNil: [:attributeValidator | attributeValidator isID])
			ifTrue: [
				(anIDSet
					remove: each value
					ifAbsent: [nil])
					ifNotNil: [
						aNodeSet addLast: anElement.
						^ self]]]
]

{ #category : #invoking }
XPathIDFunction >> addElementsWithUndeclaredIDs: anIDSet in: aRootNode to: aNodeSet [
	aRootNode allElementsDo: [:each |
		each hasAttributes
			ifTrue: [
				self
					addElement: each
					withUndeclaredIDs: anIDSet
					to: aNodeSet.
				anIDSet isEmpty
					ifTrue: [^ self]]]
]

{ #category : #invoking }
XPathIDFunction >> addElementsWithUndeclaredOrDeclaredIDs: anIDSet in: aRootNode to: aNodeSet declaredWith: aDoctypeDefinition [
	aRootNode allElementsDo: [:each |
		each hasAttributes
			ifTrue: [
				(aDoctypeDefinition attributeValidatorsAt: each name)
					ifNil: [
						self
							addElement: each
							withUndeclaredIDs: anIDSet
							to: aNodeSet]
					ifNotNil: [:attributeValidators |
						self
							addElement: each
							withUndeclaredOrDeclaredIDs: anIDSet
							to: aNodeSet
							declaredWith: attributeValidators].
				anIDSet isEmpty
					ifTrue: [^ self]]]
]

{ #category : #implementing }
XPathIDFunction >> function [
	| object ids nodeSet |

	object := self firstArgument.
	ids := Set new.
	object isXPathNodeSet
		ifTrue: [
			object do: [:each |
				self
					splitSpaceSeparatedIDs: each stringValue
					into: ids]]
		ifFalse: [
			self
				splitSpaceSeparatedIDs: object asXPathString
				into: ids].

	nodeSet := self newNodeSet.
	(ids notEmpty
		and: [self contextNode notNil])
		ifTrue: [| root doctypeDefinition |
			((root := self contextNode documentRoot) isDocument
				and: [(doctypeDefinition := root doctypeDefinition) notNil
					and: [doctypeDefinition hasAttributeValidators]])
				ifTrue: [
					self
						addElementsWithUndeclaredOrDeclaredIDs: ids
						in: root
						to: nodeSet
						declaredWith: doctypeDefinition]
				ifFalse: [
					self
						addElementsWithUndeclaredIDs: ids
						in: root
						to: nodeSet]].

	"the elements matching the IDs are enumerated in document order, so the
	resulting node set is in document order too"
	^ nodeSet sortOrder: XPathDocumentSortOrder new.
]

{ #category : #private }
XPathIDFunction >> splitSpaceSeparatedIDs: anIDString into: anIDSet [
	| startIndex|

	1 to: anIDString size do: [:i | | nextChar |
		(nextChar := anIDString at: i) isXMLSeparator
			ifTrue: [
				startIndex
					ifNotNil: [
						anIDSet add: (anIDString copyFrom: startIndex to: i - 1).
						startIndex := nil]]
			ifFalse: [
				startIndex
					ifNil: [startIndex := i]]].
	startIndex
		ifNotNil: [
			anIDSet add:
				(anIDString copyFrom: startIndex to: anIDString size)].
]
