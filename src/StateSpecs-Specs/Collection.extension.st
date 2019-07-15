Extension { #name : #Collection }

{ #category : #'*StateSpecs-Specs' }
Collection >> checkStateSpecsEqualityTo: anotherCollection [

	(anotherCollection isKindOf: Collection) ifFalse: [^false].
	
	self size = anotherCollection size ifFalse: [ ^false ].
	
	self do: [ :myEach |
		(anotherCollection anySatisfy: [ :anotherEach | 
			myEach checkStateSpecsEqualityTo: anotherEach]) ifFalse: [ ^false ]
	].

	^true
]

{ #category : #'*StateSpecs-Specs' }
Collection >> checkStateSpecsOrderedEqualityTo: anotherCollection [

	(anotherCollection isKindOf: Collection) ifFalse: [^false].
	
	self size = anotherCollection size ifFalse: [ ^false ].
	
	self with: anotherCollection do: [ :myEach :anotherEach |
		(myEach checkStateSpecsEqualityTo: anotherEach) ifFalse: [ ^false ]
	].

	^true
]

{ #category : #'*StateSpecs-Specs' }
Collection >> stringForSpecTitle [
	^String streamContents: [:s | 
		
		self printNameOn: s.
		s nextPut: ${.
		self do: [:element | s << element stringForSpecTitle << '. '].
		self ifNotEmpty: [s skip: -2].
		s nextPut: $}
	]
]
