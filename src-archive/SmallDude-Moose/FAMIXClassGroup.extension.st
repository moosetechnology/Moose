Extension { #name : #FAMIXClassGroup }

{ #category : #'*SmallDude-Moose-ui' }
FAMIXClassGroup >> computeDuplication [
	<menuItem: 'Compute duplication' category: 'Utilities'>
	super computeDuplication
]

{ #category : #'*SmallDude-Moose-ui' }
FAMIXClassGroup >> innerDuplications [ 
	 
	^self mooseModel allDuplications 
		select: 
			[:each |  
			(self includes: each duplicatingEntity) 
				and: [self includes: each referenceEntity]]
]

{ #category : #'*SmallDude-Moose-ui' }
FAMIXClassGroup >> innerMultiplications [ 
	 
	^self mooseModel allMultiplications 
		select: [:each | each isMultiplicationOfTwoOf: self]
]

{ #category : #'*SmallDude-Moose-ui' }
FAMIXClassGroup >> viewSideBySideDuplicationsOn: view [ 
	| name1 name2 grouped left right key orderedLeft orderedRight |

	left := IdentityDictionary new.
	right := IdentityDictionary new.
	grouped := self innerDuplications groupedBy: [:each | 
		name1 := each referenceCode entity mooseName.
		name2 := each duplicateCode entity mooseName.
		key := name1 > name2
			ifTrue: [(name1, name2) asSymbol]
			ifFalse: [(name2, name1) asSymbol].
		left at: each referenceCode entity ifAbsentPut: [each referenceCode entity -> 1].
		left at: each duplicateCode entity ifAbsentPut: [each duplicateCode entity -> 1].
		right at: each referenceCode entity ifAbsentPut: [each referenceCode entity -> 2].
		right at: each duplicateCode entity ifAbsentPut: [each duplicateCode entity -> 2].
		key
	].
	orderedLeft := (self select: [:each | left keys includes: each]) collect: [:each | left at: each].
	orderedRight := (self select: [:each | right keys includes: each]) collect: [:each | right at: each].

	view shape rectangle borderWidth: 0.
	view node: left forIt: [
		view shape label text: [:assoc | assoc key mooseName].
		view nodes: orderedLeft.
		view verticalLineLayout.
	].
	view shape rectangle borderWidth: 0.
	view node: right forIt: [
		view shape label text: [:assoc | assoc key mooseName].
		view nodes: orderedRight.
		view verticalLineLayout.
	].
	view horizontalLineLayout horizontalGap: 50.
	view shape line 
		color: Color red; 
		width: [:each | each size ].
	view 
		edges: grouped
		from: [:each | left at: each first referenceCode entity]
		to: [:each | right at: each first duplicateCode entity].
]
