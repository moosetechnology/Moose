Extension { #name : #Collection }

{ #category : #'*magritte-model' }
Collection >> asMultilineString [
	^ String streamContents: [ :stream |
		self
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: Character cr ] ]
]

{ #category : #'*magritte-model' }
Collection >> copyWithAll: aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #'*magritte-model' }
Collection >> copyWithoutFirst: anObject [
	| done |
	done := false.
	^ self reject: [ :each |
		(each = anObject
			and: [ done not ])
				and: [ done := true ] ]
]

{ #category : #'*magritte-model' }
Collection >> copyWithoutFirstOccurrenceOf: anObject [
	| done |
	done := false.
	^ self reject: [ :each |
		each = anObject
			and: [ done not
			and: [ done := true ] ] ]
]
