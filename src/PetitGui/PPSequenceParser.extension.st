Extension { #name : #PPSequenceParser }

{ #category : #'*PetitGui' }
PPSequenceParser >> exampleOn: aStream [
	parsers do: [ :each | each exampleOn: aStream ]
]

{ #category : #'*PetitGui' }
PPSequenceParser >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		self children
			inject: self newRowMorph
			into: [ :result :each | 
				result 
					addMorphBack: (cc value: each);
					yourself ] ]
]

{ #category : #'*PetitGui' }
PPSequenceParser >> visualizationGraphType [
	^ ','
]
