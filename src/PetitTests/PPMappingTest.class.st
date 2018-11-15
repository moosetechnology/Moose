Class {
	#name : #PPMappingTest,
	#superclass : #PPAbstractParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #'as yet unclassified' }
PPMappingTest >> testFoldLeft2 [
	| parser |
	parser := #any asParser star 
		foldLeft: [ :a :b | Array with: a with: b ].

	self assert: parser parse: #(a) to: #a.
	self assert: parser parse: #(a b) to: #(a b).
	self assert: parser parse: #(a b c) to: #((a b) c).
	self assert: parser parse: #(a b c d) to: #(((a b) c) d).
	self assert: parser parse: #(a b c d e) to: #((((a b) c) d) e)

]

{ #category : #'as yet unclassified' }
PPMappingTest >> testFoldLeft3 [
	| parser |
	parser := #any asParser star 
		foldLeft: [ :a :b :c | Array with: a with: b with: c ].

	self assert: parser parse: #(a) to: #a.
	self assert: parser parse: #(a b c) to: #(a b c).
	self assert: parser parse: #(a b c d e) to: #((a b c) d e)

]

{ #category : #'as yet unclassified' }
PPMappingTest >> testFoldRight2 [
	| parser |
	parser := #any asParser star 
		foldRight: [ :a :b | Array with: a with: b ].

	self assert: parser parse: #(a) to: #a.
	self assert: parser parse: #(a b) to: #(a b).
	self assert: parser parse: #(a b c) to: #(a (b c)).
	self assert: parser parse: #(a b c d) to: #(a (b (c d))).
	self assert: parser parse: #(a b c d e) to: #(a (b (c (d e))))
]

{ #category : #'as yet unclassified' }
PPMappingTest >> testFoldRight3 [
	| parser |
	parser := #any asParser star 
		foldRight: [ :a :b :c | Array with: a with: b with: c ].

	self assert: parser parse: #(a) to: #a.
	self assert: parser parse: #(a b c) to: #(a b c).
	self assert: parser parse: #(a b c d e) to: #(a b (c d e))
]

{ #category : #'as yet unclassified' }
PPMappingTest >> testMap1 [
	| parser |
	parser := #any asParser 
		map: [ :a | Array with: a ].

	self assert: parser parse: #(a) to: #(a)
]

{ #category : #'as yet unclassified' }
PPMappingTest >> testMap2 [
	| parser |
	parser := (#any asParser , #any asParser) 
		map: [ :a :b | Array with: b with: a ].

	self assert: parser parse: #(a b) to: #(b a)
]

{ #category : #'as yet unclassified' }
PPMappingTest >> testMap3 [
	| parser |
	parser := (#any asParser , #any asParser , #any asParser)
		map: [ :a :b :c | Array with: c with: b with: a ].

	self assert: parser parse: #(a b c) to: #(c b a)

]
