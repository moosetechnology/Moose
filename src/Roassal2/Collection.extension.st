Extension { #name : #Collection }

{ #category : #'*Roassal2' }
Collection >> asGroup [
	^ RTGroup withAll: self
]

{ #category : #'*Roassal2' }
Collection >> asIdentityGroup [
	^ RTIdentityGroup withAll: self
	

]

{ #category : #'*Roassal2' }
Collection >> maxFor: aSymbolOrBlock [ 
	"Return one of the elements which has the minimum value returned by aSymbolOrBlock"
	
	"
	#(5 6 2 1 4) max
	#(5 6 2 1 4) maxFor: #negated
	"
	^self 
		inject: self anyOne 
		into: [ :max :each | 
			(aSymbolOrBlock value: each) > (aSymbolOrBlock value: max)
				ifTrue: [ each ]
				ifFalse: [ max ] ]
]

{ #category : #'*Roassal2' }
Collection >> maxValue: aBlock [
	^ self inject: (aBlock value: self anyOne) into: [ :max :each | max max: (aBlock value: each) ]
]

{ #category : #'*Roassal2' }
Collection >> minFor: aSymbolOrBlock [ 
	"Return one of the elements which has the minimum value returned by aSymbolOrBlock"
	
	"
	#(5 6 2 1 4) min
	#(5 6 2 1 4) minFor: #negated
	"
	^self 
		inject: self anyOne 
		into: [ :min :each | 
			(aSymbolOrBlock value: each) < (aSymbolOrBlock value: min)
				ifTrue: [ each ]
				ifFalse: [ min ] ]
]

{ #category : #'*Roassal2' }
Collection >> minValue: aBlock [
	^ self inject: (aBlock value: self anyOne) into: [ :min :each | min min: (aBlock value: each) ]
]

{ #category : #'*Roassal2' }
Collection >> reverseSortedAs: aSortBlockOrSymbol [
	^ (self sortedAs: aSortBlockOrSymbol) reverse
]

{ #category : #'*Roassal2' }
Collection >> sortedAs: aSortBlockOrSymbol [
	"Answer a SortedCollection whose elements are the elements of the 
	receiver. The sort order is defined by the argument, aSortBlock."
	"Return a new collection. This method does not do a side effect"

	| aSortedCollection aSortBlock |
	aSortedCollection := SortedCollection new: self size.
	aSortBlock := 
		aSortBlockOrSymbol isSymbol 
			ifTrue: [ [:a :b | |t1 t2|
							t1 := (a perform: aSortBlockOrSymbol).
							t2 := (b perform: aSortBlockOrSymbol).
							((t1 isKindOf: Boolean) and: [t2 isKindOf: Boolean])
								ifTrue: [ t1 ]
								ifFalse: [ t1 < t2 ] ] ]
			ifFalse: [ 
				(aSortBlockOrSymbol numArgs = 1)
					ifTrue: [ [ :v1 :v2 | (aSortBlockOrSymbol value: v1) < (aSortBlockOrSymbol value: v2) ] ]
					ifFalse: [ aSortBlockOrSymbol ] ].
	aSortedCollection sortBlock: aSortBlock.
	aSortedCollection addAll: self.
	^ aSortedCollection
]
