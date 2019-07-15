Class {
	#name : #XMLPluggableAttributeSpecTest,
	#superclass : #XMLAttributeSpecTest,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #accessing }
XMLPluggableAttributeSpecTest >> attributeSpecClass [
	^ XMLPluggableAttributeSpec
]

{ #category : #tests }
XMLPluggableAttributeSpecTest >> testMatchesAttributes [
	| attributeSpec |

	attributeSpec := self newAttributeSpec.
	self assert: (attributeSpec matchesAttributes: XMLAttributeDictionary new).
	self assert:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name' -> 'value')).

	attributeSpec block: [:attributes |
		(attributes at: 'name') = 'value'].
	self deny: (attributeSpec matchesAttributes: XMLAttributeDictionary new).
	self deny:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name' -> 'value2')).
	self deny:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name2' -> 'value')).
	self assert:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name' -> 'value')).

	attributeSpec block: [:attributes |
		(attributes at: 'name') = 'value'
			and: [attributes includesKey: 'name2']].
	self deny: (attributeSpec matchesAttributes: XMLAttributeDictionary new).
	self deny:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name' -> 'value2')).
	self deny:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary with: 'name2' -> 'value')).
	self deny:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary
				with: 'name' -> 'value2'
				with: 'name2' -> 'value')).
	self assert:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary
				with: 'name' -> 'value'
				with: 'name2' -> 'value2')).
	self assert:
		(attributeSpec matchesAttributes:
			(XMLAttributeDictionary
				with: 'name' -> 'value'
				with: 'name2' -> 'value2'
				with: 'name3' -> 'value3')).
]
