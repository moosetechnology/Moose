Class {
	#name : #XMLElementClassMapperTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #acccessing }
XMLElementClassMapperTest >> attributes [
	^ XMLAttributeDictionary
		with: 'name' -> 'value'
		with: 'name2' -> 'value2'
]

{ #category : #acccessing }
XMLElementClassMapperTest >> elementClass [
	^ XMLElement
]

{ #category : #acccessing }
XMLElementClassMapperTest >> mapperClass [
	^ XMLElementClassMapper 
]

{ #category : #'instance creation' }
XMLElementClassMapperTest >> newMapper [
	^ self mapperClass new
]

{ #category : #'instance creation' }
XMLElementClassMapperTest >> newMapperWithMappings [
	| mapper |

	mapper := XMLBasicElementClassMapper new.
	mapper
		mapElement: 'test'
		toClass: self elementClass.
	mapper
		mapElement: 'test'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		toClass: self elementClass.
	mapper
		mapElement: 'test'
		namespaceURI: 'testNS'
		attributeSpec: self attributes asXMLAttributeSpec
		toClass: self elementClass.
	^ mapper.
]

{ #category : #acccessing }
XMLElementClassMapperTest >> otherElementClass [
	^ XMLFElement
]

{ #category : #tests }
XMLElementClassMapperTest >> testCamelCasedNameFromClassNameSegments [
	| mapper |

	mapper := self newMapper.
	#(#('ONE' 'Two' 'Three')
		#('One' 'Two' 'Three')
		#('A' 'Bc' 'D')
		#('Ab' 'Cd')
		#('Ab')
		#('AB')
		#('a' 'B')
		#('a' 'Ba'))
		with:
			#('oneTwoThree'
				'oneTwoThree'
				'aBcD'
				'abCd'
				'ab'
				'ab'
				'aB'
				'aBa')
		do: [:segments :name |
			self assert:
				(mapper camelCasedNameFromClassNameSegments: segments) =
					name].
]

{ #category : #tests }
XMLElementClassMapperTest >> testClassNameSegmentsFrom [
	| mapper |

	mapper := self newMapper.
	#('ONETwoThree'
		'OneTwoThree'
		'ABcD'
		'AbCd'
		'Ab'
		'AB'
		'aB'
		'aBa')
		with:
			#(#('ONE' 'Two' 'Three')
				#('One' 'Two' 'Three')
				#('A' 'Bc' 'D')
				#('Ab' 'Cd')
				#('Ab')
				#('AB')
				#('a' 'B')
				#('a' 'Ba'))
		do: [:string :segments |
			self assert:
				(mapper classNameSegmentsFrom: string) =
					segments asOrderedCollection].
]

{ #category : #tests }
XMLElementClassMapperTest >> testHyphenatedNameFromClassNameSegments [
	| mapper |

	mapper := self newMapper.
	#(#('ONE' 'Two' 'Three')
		#('One' 'Two' 'Three')
		#('A' 'Bc' 'D')
		#('Ab' 'Cd')
		#('Ab')
		#('AB')
		#('a' 'B')
		#('a' 'Ba'))
		with:
			#('one-two-three'
				'one-two-three'
				'a-bc-d'
				'ab-cd'
				'ab'
				'ab'
				'a-b'
				'a-ba')
		do: [:segments :name |
			self assert:
				(mapper hyphenatedNameFromClassNameSegments: segments) =
					name].
]

{ #category : #tests }
XMLElementClassMapperTest >> testNameFromClassNameSegments [
	| mapper |

	mapper := self newMapper.
	#(#('ONE' 'Two' 'Three')
		#('One' 'Two' 'Three')
		#('A' 'Bc' 'D')
		#('Ab' 'Cd')
		#('Ab')
		#('AB')
		#('a' 'B')
		#('a' 'Ba'))
		with:
			#('ONETwoThree'
				'OneTwoThree'
				'ABcD'
				'AbCd'
				'Ab'
				'AB'
				'aB'
				'aBa')
		do: [:segments :name |
			self assert:
				(mapper nameFromClassNameSegments: segments) =
					name].
]

{ #category : #tests }
XMLElementClassMapperTest >> testUnderscoredNameFromClassNameSegments [
	| mapper |

	mapper := self newMapper.
	#(#('ONE' 'Two' 'Three')
		#('One' 'Two' 'Three')
		#('A' 'Bc' 'D')
		#('Ab' 'Cd')
		#('Ab')
		#('AB')
		#('a' 'B')
		#('a' 'Ba'))
		with:
			#('one_two_three'
				'one_two_three'
				'a_bc_d'
				'ab_cd'
				'ab'
				'ab'
				'a_b'
				'a_ba')
		do: [:segments :name |
			self assert:
				(mapper underscoredNameFromClassNameSegments: segments) =
					name].
]
