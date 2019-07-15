Extension { #name : #PPSequenceParser }

{ #category : #'*petitislands' }
PPSequenceParser >> acceptsEpsilonOpenSet: set [
	set add: self.
	^ self children allSatisfy: [:e | e acceptsEpsilonOpenSet: set ]
]

{ #category : #'*petitislands' }
PPSequenceParser >> isIslandBorderOpenSet: set [
	set add: self.
	^ self children anySatisfy: [:e | e isIslandBorderOpenSet: set ]
]

{ #category : #'*petitislands' }
PPSequenceParser >> nextSets: aNextDictionary into: aSet [
	| change tally tmp childSet |
	
	change := false.

	self children keysAndValuesDo: [ :index :child |
		childSet := (aNextDictionary at: child). 
		tally :=  childSet size.

		index = parsers size ifTrue: [ 
			childSet addAll: aSet.
		] ifFalse: [  
			tmp := self subsequenceFrom: index + 1 to: parsers size.
			childSet add: tmp.
			tmp isIslandBorder ifFalse: [ 
				childSet addAll: aSet.
			]
		].
		change := change or: [ (aNextDictionary at: child) size ~= tally ]
 	].

	^ change
]

{ #category : #'*petitislands' }
PPSequenceParser >> subsequenceFrom: from to: to [
	| interval dict |
	
	interval := from to: to.
	dict := self propertyAt: #subsequenceCache ifAbsentPut: [ Dictionary new ].
	^ dict at: interval ifAbsentPut: [
		(from = to) 
			ifTrue: [ parsers at: from ] 
			ifFalse: [ self class withAll: (parsers copyFrom: from to: to) ]
	].
]
