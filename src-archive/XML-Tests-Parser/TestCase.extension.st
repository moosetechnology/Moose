Extension { #name : #TestCase }

{ #category : #'*XML-Tests-Parser' }
TestCase >> xmlShould: aBlock enumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated add: each].
	self assert: enumerated = aCollection asOrderedCollection.
]

{ #category : #'*XML-Tests-Parser' }
TestCase >> xmlShould: aBlock enumerate: aFirstCollection and: aSecondCollection [
	| firstEnumerated secondEnumerated |

	firstEnumerated := OrderedCollection new.
	secondEnumerated := OrderedCollection new.
	aBlock value: [:first :second |
		firstEnumerated addLast: first.
		secondEnumerated addLast: second].
	self
		assert: firstEnumerated = aFirstCollection asOrderedCollection;
		assert: secondEnumerated = aSecondCollection asOrderedCollection.
]

{ #category : #'*XML-Tests-Parser' }
TestCase >> xmlShould: aBlock unorderedEnumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated add: each].
	self assert: enumerated sorted = aCollection asOrderedCollection sorted.
]

{ #category : #'*XML-Tests-Parser' }
TestCase >> xmlShould: aBlock unorderedEnumerate: aFirstCollection and: aSecondCollection [
	| firstEnumerated secondEnumerated |

	firstEnumerated := OrderedCollection new.
	secondEnumerated := OrderedCollection new.
	aBlock value: [:first :second |
		firstEnumerated addLast: first.
		secondEnumerated addLast: second].
	self assert:
		firstEnumerated sorted =
			aFirstCollection asOrderedCollection sorted.
	self assert:
		secondEnumerated sorted =
			aSecondCollection asOrderedCollection sorted.
]
