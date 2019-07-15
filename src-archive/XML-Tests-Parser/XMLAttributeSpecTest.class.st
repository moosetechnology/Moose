Class {
	#name : #XMLAttributeSpecTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #testing }
XMLAttributeSpecTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLAttributeSpecTest >> attributeSpecClass [
	^ XMLAttributeSpec
]

{ #category : #'instance creation' }
XMLAttributeSpecTest >> newAttributeSpec [
	^ self attributeSpecClass new
]

{ #category : #tests }
XMLAttributeSpecTest >> testAsXMLAttributeSpec [
	| attributeSpec |

	attributeSpec := self newAttributeSpec.
	self assert: attributeSpec asXMLAttributeSpec == attributeSpec.
]
