Extension { #name : #PPRepeatingParser }

{ #category : #'*petitislands' }
PPRepeatingParser >> acceptsEpsilon [
	^ min == 0
]

{ #category : #'*petitislands' }
PPRepeatingParser >> isIslandBorder [
	^ min > 0
]

{ #category : #'*petitislands' }
PPRepeatingParser >> isIslandBorderOpenSet: set [
	^ min > 0
]

{ #category : #'*petitislands' }
PPRepeatingParser >> nextSets: aNextDictionary into: aSet [
	| tally childSet change |

	change := super nextSets: aNextDictionary  into: aSet.

	childSet := aNextDictionary at: parser.
	tally := aSet size.
	childSet add: parser.
	^ change or: [ tally ~= aSet size ].
]
