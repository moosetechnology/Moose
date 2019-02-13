Class {
	#name : #RTTextTest,
	#superclass : #RTTest,
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #'as yet unclassified' }
RTTextTest >> testHeight [
	| els |
	els := RTText new elementsOn: #('hello' 'HELLO').
	self assert: els first height equals: els second height
]

{ #category : #'as yet unclassified' }
RTTextTest >> testHeightTriple [
	| els |
	els := RTText new
		elementsOn:
			#('hello' 'hello
world
!').
	self assert: els first height * 3 equals: els second height
]

{ #category : #'as yet unclassified' }
RTTextTest >> testText [
	| els |
	els := RTText new elementsOn: #('hello' 'world').
	self assert: els first trachelShape text equals: 'hello'.
	self assert: els second trachelShape text equals: 'world'
]
